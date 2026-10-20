+++
title = "ClusterSecretStore"
summary = "How the whole cluster reaches an outside secret store"
aka = ["external-secrets.io/v1 ClusterSecretStore", "css"]
kind = "crd"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: external-secrets.io/v1`, `kind: ClusterSecretStore`, cluster-wide.

Without a template it picks up the shared namespace.
