+++
title = "CiliumDatapathPlugin"
summary = "Plugs extra programs into the datapath"
aka = ["cilium.io/v2alpha1 CiliumDatapathPlugin"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2alpha1`, `kind: CiliumDatapathPlugin`, cluster-wide.
