# k8s-libsonnet
Helpers for creating k8s resources without abuse of constructor functions

## Features

* exposes k8s "named arrays" as objects that can be more easily overriden (`env_+:{BAR: {value:'override'}}`)
* allows to apply overrides on all objects of a given type, e.g. all Objects (e.g. namespace), all PodSpecs (e.g. labels)

## Example:

```jsonnet
(import '../k8s.libsonnet').RootComponent {
  configmap: $.k8s.v1.ConfigMap {
    metadata+: { name: 'foo' },
    data: { bar: 'baz' },
  },

  deployment: $.k8s.apps.v1.Deployment {
    metadata+: { name: 'nginx' },
    spec: {
      replicas: 2,
      selector: { matchLabels: { app: 'nginx' } },
      template: {
        metadata: { labels: { app: 'nginx' } },
        spec: {
          containers+: {
            nginx: {
              image: 'nginx:1.14.2',
              env_+: {
                BAR: { valueFrom: { configMapKeyRef: {
                  name: $.configmap.metadata.name,
                  key: 'bar',
                } } },
              },
              ports_+: {
                http: { containerPort: 80 },
              },
            },
          },
        },
      },
    },
  },

  service: $.k8s.v1.Service {
    metadata+: { name: 'nginx' },
    spec+: {
      selector: $.deployment.spec.selector.matchLabels,
      ports_+: {
        http: { port: 80, targetPort: 'http' },
      },
    },
  },

}
```