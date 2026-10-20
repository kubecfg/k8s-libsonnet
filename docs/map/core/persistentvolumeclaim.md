+++
title = "PersistentVolumeClaim"
summary = "A request for storage"
aka = ["v1 PersistentVolumeClaim", "pvc"]
kind = "builtin"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "in-statefulset"
title = "Inside StatefulSet volumeClaimTemplates_, keyed by metadata.name"
status = "done"

[[feature]]
id = "template"
title = "Standalone template"
status = "todo"
milestone = "m1"
+++

`apiVersion: v1`, `kind: PersistentVolumeClaim`.

Today a PVC only gets help inside a StatefulSet. A standalone template would let a PVC share the same overlays.
