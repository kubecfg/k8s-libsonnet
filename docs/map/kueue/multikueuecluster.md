+++
title = "MultiKueueCluster"
summary = "One worker cluster for MultiKueue"
aka = ["kueue.x-k8s.io/v1beta2 MultiKueueCluster"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kueue.x-k8s.io/v1beta2`, `kind: MultiKueueCluster`, cluster-wide.
