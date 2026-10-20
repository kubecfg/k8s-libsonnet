+++
title = "ClusterRole"
summary = "Permissions across the cluster"
aka = ["rbac.authorization.k8s.io/v1 ClusterRole"]
kind = "builtin"
intent = "goal"
research = "done"
status = "done"
refs = ["k8s.libsonnet"]

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: rbac.authorization.k8s.io/v1`, `kind: ClusterRole`, cluster-wide.

Template with an empty `rules` list.
