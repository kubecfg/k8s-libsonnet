+++
title = "Namespace"
summary = "A namespace"
aka = ["v1 Namespace", "ns"]
kind = "builtin"
intent = "goal"
research = "done"
status = "done"
refs = ["k8s.libsonnet"]

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: v1`, `kind: Namespace`, cluster-wide.

Does not pick up the namespace set on the shared `ObjectMeta`.
