+++
title = "GatewayClass"
summary = "Which controller runs a Gateway"
aka = ["gateway.networking.k8s.io/v1 GatewayClass"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: gateway.networking.k8s.io/v1`, `kind: GatewayClass`, cluster-wide.
