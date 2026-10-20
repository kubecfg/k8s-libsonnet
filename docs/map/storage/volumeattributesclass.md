+++
title = "VolumeAttributesClass"
summary = "Changeable volume settings such as IOPS"
aka = ["storage.k8s.io/v1 VolumeAttributesClass", "vac"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: storage.k8s.io/v1`, `kind: VolumeAttributesClass`, cluster-wide.
