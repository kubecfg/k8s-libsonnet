+++
title = "ClusterImageCatalog"
summary = "PostgreSQL images to pick from, for the whole cluster"
aka = ["postgresql.cnpg.io/v1 ClusterImageCatalog"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: postgresql.cnpg.io/v1`, `kind: ClusterImageCatalog`, cluster-wide.
