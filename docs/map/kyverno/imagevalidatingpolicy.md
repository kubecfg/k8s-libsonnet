+++
title = "ImageValidatingPolicy"
summary = "Checks image signatures and attestations"
aka = ["policies.kyverno.io/v1 ImageValidatingPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: policies.kyverno.io/v1`, `kind: ImageValidatingPolicy`, cluster-wide.
