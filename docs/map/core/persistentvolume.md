+++
title = "PersistentVolume"
summary = "A piece of storage in the cluster"
aka = ["v1 PersistentVolume", "pv"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m2"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: v1`, `kind: PersistentVolume`, cluster-wide.

Without a template it picks up the shared namespace.
