+++
title = "CiliumEgressGatewayPolicy"
summary = "Sends outgoing traffic through chosen nodes"
aka = ["cilium.io/v2 CiliumEgressGatewayPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumEgressGatewayPolicy`, cluster-wide.
