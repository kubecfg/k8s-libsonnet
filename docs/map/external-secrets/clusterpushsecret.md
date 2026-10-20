+++
title = "ClusterPushSecret"
summary = "A PushSecret for many namespaces"
aka = ["external-secrets.io/v1alpha1 ClusterPushSecret"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: external-secrets.io/v1alpha1`, `kind: ClusterPushSecret`, cluster-wide.
