+++
title = "CiliumBGPPeerConfig"
summary = "Settings for a BGP peer"
aka = ["cilium.io/v2 CiliumBGPPeerConfig"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumBGPPeerConfig`, cluster-wide.
