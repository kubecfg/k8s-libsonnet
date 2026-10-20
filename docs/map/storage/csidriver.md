+++
title = "CSIDriver"
summary = "Settings for a CSI storage driver"
aka = ["storage.k8s.io/v1 CSIDriver"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: storage.k8s.io/v1`, `kind: CSIDriver`, cluster-wide.

Ships with storage drivers.
