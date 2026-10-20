+++
title = "VolumeAttachment"
summary = "A volume attached to a node"
aka = ["storage.k8s.io/v1 VolumeAttachment"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: storage.k8s.io/v1`, `kind: VolumeAttachment`, cluster-wide.

Created by the cluster or by API calls, not written by hand, so a template would add little.
