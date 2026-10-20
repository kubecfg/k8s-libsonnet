+++
title = "ServiceAccount"
summary = "An identity for pods"
aka = ["v1 ServiceAccount", "sa"]
kind = "builtin"
intent = "goal"
research = "done"
status = "done"
refs = ["k8s.libsonnet"]
+++

`apiVersion: v1`, `kind: ServiceAccount`.

Template only. RBAC bindings can point at one with `ServiceAccountRef`.
