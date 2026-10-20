+++
title = "CiliumBGPClusterConfig"
summary = "Which nodes run BGP, and with whom"
aka = ["cilium.io/v2 CiliumBGPClusterConfig"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumBGPClusterConfig`, cluster-wide.
