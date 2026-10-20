+++
title = "ProvisioningRequestConfig"
summary = "Settings for asking the cluster autoscaler for capacity"
aka = ["kueue.x-k8s.io/v1beta2 ProvisioningRequestConfig"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kueue.x-k8s.io/v1beta2`, `kind: ProvisioningRequestConfig`, cluster-wide.
