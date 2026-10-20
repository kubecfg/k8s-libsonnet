+++
title = "PriorityClass"
summary = "A scheduling priority pods can ask for"
aka = ["scheduling.k8s.io/v1 PriorityClass", "pc"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: scheduling.k8s.io/v1`, `kind: PriorityClass`, cluster-wide.

Without a template it picks up the shared namespace.
