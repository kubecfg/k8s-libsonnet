+++
title = "CiliumClusterwideEnvoyConfig"
summary = "Envoy settings for the whole cluster"
aka = ["cilium.io/v2 CiliumClusterwideEnvoyConfig", "ccec"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumClusterwideEnvoyConfig`, cluster-wide.
