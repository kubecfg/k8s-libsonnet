(import '../k8s.libsonnet').RootComponent {
  k8s+: {
    ObjectMeta: {
      namespace: 'myns',
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
--- examples/adopt.yaml	2023-11-29 14:56:10.368934322 +0100
+++ /dev/fd/11	2023-11-29 17:28:39.665967467 +0100
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
@@ -17,6 +19,8 @@
       app: nginx
   template:
     metadata:
+      annotations:
+        kubectl.kubernetes.io/default-container: nginx
       labels:
         app: nginx
     spec:
@@ -40,6 +44,7 @@
 kind: Service
 metadata:
   name: nginx
+  namespace: myns
 spec:
   ports:
   - name: http
```

*/
