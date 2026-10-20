+++
title = "CiliumBGPNodeConfig"
summary = "BGP settings Cilium works out for one node"
aka = ["cilium.io/v2 CiliumBGPNodeConfig"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumBGPNodeConfig`, cluster-wide.

Generated from CiliumBGPClusterConfig.
