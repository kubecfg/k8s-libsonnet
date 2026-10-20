+++
title = "ClusterPolicyReport"
summary = "Policy results for cluster-wide objects"
aka = ["wgpolicyk8s.io/v1alpha2 ClusterPolicyReport", "cpolr"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: wgpolicyk8s.io/v1alpha2`, `kind: ClusterPolicyReport`, cluster-wide.

Written by Kyverno.
