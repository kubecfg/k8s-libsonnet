+++
title = "ExtensionConfig"
summary = "Registers a runtime extension server"
aka = ["runtime.cluster.x-k8s.io/v1beta2 ExtensionConfig"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: runtime.cluster.x-k8s.io/v1beta2`, `kind: ExtensionConfig`, cluster-wide.
