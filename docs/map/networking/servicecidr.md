+++
title = "ServiceCIDR"
summary = "An IP range for Services"
aka = ["networking.k8s.io/v1 ServiceCIDR"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: networking.k8s.io/v1`, `kind: ServiceCIDR`, cluster-wide.

Cluster setup; rarely in app manifests.
