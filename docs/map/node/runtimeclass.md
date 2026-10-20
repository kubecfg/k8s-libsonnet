+++
title = "RuntimeClass"
summary = "A container runtime pods can choose"
aka = ["node.k8s.io/v1 RuntimeClass"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: node.k8s.io/v1`, `kind: RuntimeClass`, cluster-wide.
