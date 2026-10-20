+++
title = "CiliumIdentity"
summary = "A security identity"
aka = ["cilium.io/v2 CiliumIdentity"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumIdentity`, cluster-wide.

Written by Cilium.
