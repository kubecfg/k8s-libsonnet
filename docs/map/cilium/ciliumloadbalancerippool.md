+++
title = "CiliumLoadBalancerIPPool"
summary = "IPs that LoadBalancer services may get"
aka = ["cilium.io/v2 CiliumLoadBalancerIPPool"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumLoadBalancerIPPool`, cluster-wide.
