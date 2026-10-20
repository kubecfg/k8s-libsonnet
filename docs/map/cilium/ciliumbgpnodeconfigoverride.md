+++
title = "CiliumBGPNodeConfigOverride"
summary = "BGP settings for one node"
aka = ["cilium.io/v2 CiliumBGPNodeConfigOverride"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumBGPNodeConfigOverride`, cluster-wide.
