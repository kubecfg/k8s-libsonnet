+++
title = "CiliumEndpointSlice"
summary = "Groups CiliumEndpoints"
aka = ["cilium.io/v2alpha1 CiliumEndpointSlice"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2alpha1`, `kind: CiliumEndpointSlice`, cluster-wide.

Written by the Cilium operator.
