+++
title = "CiliumClusterwideNetworkPolicy"
summary = "A CiliumNetworkPolicy for the whole cluster"
aka = ["cilium.io/v2 CiliumClusterwideNetworkPolicy", "ccnp"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumClusterwideNetworkPolicy`, cluster-wide.
