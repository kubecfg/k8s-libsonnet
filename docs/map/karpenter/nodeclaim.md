+++
title = "NodeClaim"
summary = "One node Karpenter is creating"
aka = ["karpenter.sh/v1 NodeClaim"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: karpenter.sh/v1`, `kind: NodeClaim`, cluster-wide.

Created by Karpenter.
