+++
title = "ClusterTrustBundle"
summary = "CA certificates pods can mount"
aka = ["certificates.k8s.io/v1 ClusterTrustBundle"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: certificates.k8s.io/v1`, `kind: ClusterTrustBundle`, cluster-wide.
