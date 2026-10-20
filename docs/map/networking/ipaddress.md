+++
title = "IPAddress"
summary = "One allocated Service IP"
aka = ["networking.k8s.io/v1 IPAddress"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: networking.k8s.io/v1`, `kind: IPAddress`, cluster-wide.

Allocated by the API server.
