+++
title = "ResourceGraphDefinition"
summary = "Defines a new API and the resources each instance creates"
aka = ["kro.run/v1alpha1 ResourceGraphDefinition", "rgd"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: kro.run/v1alpha1`, `kind: ResourceGraphDefinition`, cluster-wide.
