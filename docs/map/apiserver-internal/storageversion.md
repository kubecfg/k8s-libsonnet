+++
title = "StorageVersion"
summary = "Which version each API server stores"
aka = ["internal.apiserver.k8s.io/v1alpha1 StorageVersion"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: internal.apiserver.k8s.io/v1alpha1`, `kind: StorageVersion`, cluster-wide.

Alpha, and written by API servers.
