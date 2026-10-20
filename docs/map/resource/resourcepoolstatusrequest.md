+++
title = "ResourcePoolStatusRequest"
summary = "Asks the cluster for a one-time report on device pools"
aka = ["resource.k8s.io/v1alpha3 ResourcePoolStatusRequest"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: resource.k8s.io/v1alpha3`, `kind: ResourcePoolStatusRequest`, cluster-wide.

Alpha. A query that tools create and delete, not something kept in manifests.
