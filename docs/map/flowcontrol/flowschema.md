+++
title = "FlowSchema"
summary = "Sorts API requests into priority levels"
aka = ["flowcontrol.apiserver.k8s.io/v1 FlowSchema"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: flowcontrol.apiserver.k8s.io/v1`, `kind: FlowSchema`, cluster-wide.
