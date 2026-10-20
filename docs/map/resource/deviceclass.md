+++
title = "DeviceClass"
summary = "A kind of device that claims can ask for"
aka = ["resource.k8s.io/v1 DeviceClass"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: resource.k8s.io/v1`, `kind: DeviceClass`, cluster-wide.

Usually ships with a device driver.
