+++
title = "WorkloadPriorityClass"
summary = "A priority for queued jobs"
aka = ["kueue.x-k8s.io/v1beta2 WorkloadPriorityClass"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kueue.x-k8s.io/v1beta2`, `kind: WorkloadPriorityClass`, cluster-wide.
