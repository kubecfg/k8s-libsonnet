+++
title = "PriorityLevelConfiguration"
summary = "How much API server capacity a priority level gets"
aka = ["flowcontrol.apiserver.k8s.io/v1 PriorityLevelConfiguration"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: flowcontrol.apiserver.k8s.io/v1`, `kind: PriorityLevelConfiguration`, cluster-wide.
