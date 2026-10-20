+++
title = "EC2NodeClass"
summary = "AWS settings for Karpenter nodes"
aka = ["karpenter.k8s.aws/v1 EC2NodeClass"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: karpenter.k8s.aws/v1`, `kind: EC2NodeClass`, cluster-wide.
