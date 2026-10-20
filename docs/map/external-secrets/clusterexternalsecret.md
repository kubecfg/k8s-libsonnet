+++
title = "ClusterExternalSecret"
summary = "Creates the same ExternalSecret in many namespaces"
aka = ["external-secrets.io/v1 ClusterExternalSecret", "ces"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: external-secrets.io/v1`, `kind: ClusterExternalSecret`, cluster-wide.
