+++
title = "CiliumBGPAdvertisement"
summary = "Which routes BGP announces"
aka = ["cilium.io/v2 CiliumBGPAdvertisement"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2`, `kind: CiliumBGPAdvertisement`, cluster-wide.
