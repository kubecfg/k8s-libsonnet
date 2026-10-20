+++
title = "ClusterIssuer"
summary = "Where the whole cluster gets its certificates from"
aka = ["cert-manager.io/v1 ClusterIssuer"]
kind = "crd"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cert-manager.io/v1`, `kind: ClusterIssuer`, cluster-wide.

Without a template it picks up the shared namespace.
