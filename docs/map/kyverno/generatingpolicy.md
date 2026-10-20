+++
title = "GeneratingPolicy"
summary = "Creates objects when others appear"
aka = ["policies.kyverno.io/v1 GeneratingPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: policies.kyverno.io/v1`, `kind: GeneratingPolicy`, cluster-wide.
