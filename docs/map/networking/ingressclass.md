+++
title = "IngressClass"
summary = "Which controller handles an Ingress"
aka = ["networking.k8s.io/v1 IngressClass"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: networking.k8s.io/v1`, `kind: IngressClass`, cluster-wide.

Without a template it picks up the shared namespace.
