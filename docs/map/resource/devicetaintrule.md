+++
title = "DeviceTaintRule"
summary = "Taints devices so pods avoid them"
aka = ["resource.k8s.io/v1 DeviceTaintRule"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: resource.k8s.io/v1`, `kind: DeviceTaintRule`, cluster-wide.
