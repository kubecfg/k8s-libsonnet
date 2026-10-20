+++
title = "ClusterPolicy"
summary = "How the GPU Operator sets up GPU nodes"
aka = ["nvidia.com/v1 ClusterPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: nvidia.com/v1`, `kind: ClusterPolicy`, cluster-wide.
