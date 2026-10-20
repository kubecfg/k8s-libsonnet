+++
title = "CiliumPodIPPool"
summary = "An IP pool pods can get addresses from"
aka = ["cilium.io/v2alpha1 CiliumPodIPPool"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2alpha1`, `kind: CiliumPodIPPool`, cluster-wide.
