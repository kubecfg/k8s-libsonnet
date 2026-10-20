+++
title = "GraphRevision"
summary = "A saved revision of a ResourceGraphDefinition"
aka = ["internal.kro.run/v1alpha1 GraphRevision"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: internal.kro.run/v1alpha1`, `kind: GraphRevision`, cluster-wide.

Written by kro.
