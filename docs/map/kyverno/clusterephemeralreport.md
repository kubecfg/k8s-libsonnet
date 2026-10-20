+++
title = "ClusterEphemeralReport"
summary = "A short-lived policy result for cluster-wide objects"
aka = ["reports.kyverno.io/v1 ClusterEphemeralReport"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: reports.kyverno.io/v1`, `kind: ClusterEphemeralReport`, cluster-wide.

Written by Kyverno.
