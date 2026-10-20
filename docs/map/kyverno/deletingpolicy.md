+++
title = "DeletingPolicy"
summary = "Deletes matching objects on a schedule"
aka = ["policies.kyverno.io/v1 DeletingPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: policies.kyverno.io/v1`, `kind: DeletingPolicy`, cluster-wide.
