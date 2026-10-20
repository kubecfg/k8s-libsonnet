+++
title = "CustomResourceDefinition"
summary = "Adds a new kind to the API"
aka = ["apiextensions.k8s.io/v1 CustomResourceDefinition", "crd"]
kind = "builtin"
intent = "goal"
research = "done"
status = "done"
refs = ["k8s.libsonnet"]

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: apiextensions.k8s.io/v1`, `kind: CustomResourceDefinition`, cluster-wide.

Template only.
