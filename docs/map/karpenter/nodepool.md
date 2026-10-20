+++
title = "NodePool"
summary = "What kind of nodes Karpenter may create, and limits"
aka = ["karpenter.sh/v1 NodePool"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: karpenter.sh/v1`, `kind: NodePool`, cluster-wide.
