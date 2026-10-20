+++
title = "StorageVersionMigration"
summary = "Rewrites stored objects in a newer version"
aka = ["storagemigration.k8s.io/v1 StorageVersionMigration"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: storagemigration.k8s.io/v1`, `kind: StorageVersionMigration`, cluster-wide.

Run by cluster admins and tools.
