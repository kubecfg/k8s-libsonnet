+++
title = "ResourceFlavor"
summary = "A kind of node, such as a GPU model, that quota is counted in"
aka = ["kueue.x-k8s.io/v1beta2 ResourceFlavor"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kueue.x-k8s.io/v1beta2`, `kind: ResourceFlavor`, cluster-wide.
