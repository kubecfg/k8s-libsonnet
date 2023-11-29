# k8s-libsonnet
Helpers for creating k8s resources without abuse of constructor functions.

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

## Example: define namespace for all objects

```jsonnet
(import 'simple.jsonnet') {
  k8s+: {
    ObjectMeta+: {
      namespace: 'my-ns',
    },
  },
}
```

## Example: add annotations to all resources including pods

Everything you add under `ObjectMeta` will be inherited by all objects you define in your templates.

A `Deployment` or a `StatefulSet` object will thus include the provided metadata in its own resource metadata.
When the `Deployment` or `StatefulSet` (or `Job`, `CronJob`, ...) create pods they do so using a `template` defined
in their spec. That template can contain a metadata object that will govern which metadata the "pod" resource will have.

If you want to add a metadata field that will appear in all resources, including those generated at runtime by resources such
as `Deployment` or `StatefulSet`, you can override the `ObjectTemplateMeta` field:


```jsonnet
(import 'simple.jsonnet') {
  k8s+: {
    ObjectTemplateMeta+: {
      annotations+: {
        'app.kubernetes.io/name': 'foo',
      }
    }
  }
}
```

## Example: add annotations to a specific kind

```jsonnet
(import 'simple.jsonnet') {
  k8s+: {
    v1+: {
      Service+: {
        annotations+: {
          'traefik.ingress.kubernetes.io/service.sticky.cookie.name': 'foobar',
        }
      }
    }
  }
}
```

## Example: overlay any pod template

There are many resource types that can create Pod (`Deployment`, `StatefulSet`, `Job`, ...).
All of them have a common way to express pod parameters, called a [`PodTemplateSpec`](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#podtemplatespec-v1-core).

All the resource type templates defined in `k8s-libsonnet` that include a `PodTemplateSpec` share the same `k8s.PodTemplateSpec` template.
This means you can just extend that template and include overlays which will be shared by all pods.

A common use case are node selectors and tolerations:

```jsonnet
(import 'complex-app.jsonnet') {
  k8s+: {
    v1+: {
      PodTemplateSpec+: {
        metadata+: {
          annotations+: {
            'cluster-autoscaler.kubernetes.io/safe-to-evict': 'true'
          }
        },
        spec+: {
          nodeSelector+: {
            'kubernetes.io/os': 'linux',
          }
        }
      }
    }
  }
}
```

Note that with `PodTemplateSpec` you can add annotations that will only appear in pod template specs and not in the resource metadata on the root.
If you define metadata fields in the `ObjectTemplateMeta`, they will appear both here and in the root resource metadata.
