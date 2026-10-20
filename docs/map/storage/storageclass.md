+++
title = "StorageClass"
summary = "A kind of storage that PVCs can ask for"
aka = ["storage.k8s.io/v1 StorageClass", "sc"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: storage.k8s.io/v1`, `kind: StorageClass`, cluster-wide.

Without a template it picks up the shared namespace.
