+++
title = "Cohort"
summary = "ClusterQueues that can borrow quota from each other"
aka = ["kueue.x-k8s.io/v1beta2 Cohort"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kueue.x-k8s.io/v1beta2`, `kind: Cohort`, cluster-wide.
