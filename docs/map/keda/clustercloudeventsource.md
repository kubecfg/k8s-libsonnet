+++
title = "ClusterCloudEventSource"
summary = "A CloudEventSource for the whole cluster"
aka = ["eventing.keda.sh/v1alpha1 ClusterCloudEventSource"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: eventing.keda.sh/v1alpha1`, `kind: ClusterCloudEventSource`, cluster-wide.
