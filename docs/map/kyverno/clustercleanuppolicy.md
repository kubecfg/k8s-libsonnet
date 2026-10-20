+++
title = "ClusterCleanupPolicy"
summary = "The older cluster-wide cleanup policy"
aka = ["kyverno.io/v2 ClusterCleanupPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kyverno.io/v2`, `kind: ClusterCleanupPolicy`, cluster-wide.

Deprecated in favour of DeletingPolicy.
