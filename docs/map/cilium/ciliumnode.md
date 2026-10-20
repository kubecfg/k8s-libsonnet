+++
title = "CiliumNode"
summary = "A node as Cilium sees it"
aka = ["cilium.io/v2 CiliumNode", "cn"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumNode`, cluster-wide.

Written by the Cilium agent.
