(import '../k8s.libsonnet').Component {
  k8s+: {
    ObjectMeta: {
      namespace: 'myns',
    },
    v1+: {
      PodSpec+: {
        foo: 42,
        containers_+: {
          side+: {
            image: 'my.dummy/sidecar',
            env_+: {
              FOO: { value: 'bar' },
            },
          },
        },
      },
      Container+: {
        env_+: {
          COMMON_ENV+: { value: 'example common env' },
        },
      },
    },
  },

  upstream: $.k8s.adopt(std.parseYaml(importstr 'adopt.yaml')),
}

/*
You can compare the rendered version of this file with the `adopt.yaml` "upstream" version:

```bash
diff -u examples/adopt.yaml <(kubecfg show examples/adopt.jsonnet)
```


```diff
--- examples/adopt.yaml
+++ /dev/fd/11
@@ -5,11 +5,13 @@
 kind: ConfigMap
 metadata:
   name: foo
+  namespace: myns
 ---
 apiVersion: apps/v1
 kind: Deployment
 metadata:
   name: nginx
+  namespace: myns
 spec:
   replicas: 2
   selector:
@@ -27,12 +29,24 @@
             configMapKeyRef:
               key: bar
               name: foo
+        - name: COMMON_ENV
+          value: example common env
         image: nginx:1.14.2
         name: nginx
         ports:
         - containerPort: 80
           name: http
         volumeMounts: []
+      - env:
+        - name: COMMON_ENV
+          value: example common env
+        - name: FOO
+          value: bar
+        image: my.dummy/sidecar
+        name: side
+        ports: []
+        volumeMounts: []
+      foo: 42
       initContainers: []
       volumes: []
 ---
@@ -40,6 +54,7 @@
 kind: Service
 metadata:
   name: nginx
+  namespace: myns
 spec:
   ports:
   - name: http
```

*/
