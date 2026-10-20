+++
title = "ClusterPolicy"
summary = "The older cluster-wide policy kind"
aka = ["kyverno.io/v1 ClusterPolicy", "cpol"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kyverno.io/v1`, `kind: ClusterPolicy`, cluster-wide.

Deprecated in favour of the policies.kyverno.io kinds, but still common.
