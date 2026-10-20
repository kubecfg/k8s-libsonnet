+++
title = "MultiKueueConfig"
summary = "Which clusters MultiKueue may dispatch jobs to"
aka = ["kueue.x-k8s.io/v1beta2 MultiKueueConfig"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kueue.x-k8s.io/v1beta2`, `kind: MultiKueueConfig`, cluster-wide.
