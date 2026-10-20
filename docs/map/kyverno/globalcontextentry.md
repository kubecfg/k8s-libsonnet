+++
title = "GlobalContextEntry"
summary = "Data that every policy can read"
aka = ["kyverno.io/v2 GlobalContextEntry"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kyverno.io/v2`, `kind: GlobalContextEntry`, cluster-wide.
