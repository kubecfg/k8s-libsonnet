+++
title = "APIService"
summary = "Plugs an extra API server into the main one"
aka = ["apiregistration.k8s.io/v1 APIService"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: apiregistration.k8s.io/v1`, `kind: APIService`, cluster-wide.

Ships with metrics-server and similar.
