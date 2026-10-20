+++
title = "ValidatingPolicy"
summary = "Rejects objects that break CEL rules"
aka = ["policies.kyverno.io/v1 ValidatingPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: policies.kyverno.io/v1`, `kind: ValidatingPolicy`, cluster-wide.
