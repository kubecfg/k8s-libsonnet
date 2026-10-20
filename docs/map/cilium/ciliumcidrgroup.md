+++
title = "CiliumCIDRGroup"
summary = "A named list of IP ranges for policies"
aka = ["cilium.io/v2 CiliumCIDRGroup"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumCIDRGroup`, cluster-wide.
