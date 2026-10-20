+++
title = "ClusterTriggerAuthentication"
summary = "Credentials for KEDA triggers, for the whole cluster"
aka = ["keda.sh/v1alpha1 ClusterTriggerAuthentication", "cta"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: keda.sh/v1alpha1`, `kind: ClusterTriggerAuthentication`, cluster-wide.
