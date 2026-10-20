+++
title = "NodeOverlay"
summary = "Adjusts what Karpenter assumes about instance types"
aka = ["karpenter.sh/v1alpha1 NodeOverlay"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: karpenter.sh/v1alpha1`, `kind: NodeOverlay`, cluster-wide.
