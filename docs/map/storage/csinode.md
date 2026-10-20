+++
title = "CSINode"
summary = "CSI drivers on one node"
aka = ["storage.k8s.io/v1 CSINode"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: storage.k8s.io/v1`, `kind: CSINode`, cluster-wide.

Registered by the kubelet.
