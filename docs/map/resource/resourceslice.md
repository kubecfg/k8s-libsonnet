+++
title = "ResourceSlice"
summary = "Devices a driver has found"
aka = ["resource.k8s.io/v1 ResourceSlice"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: resource.k8s.io/v1`, `kind: ResourceSlice`, cluster-wide.

Published by device drivers.
