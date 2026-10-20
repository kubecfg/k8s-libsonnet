+++
title = "NVIDIADriver"
summary = "Which GPU driver to run on which nodes"
aka = ["nvidia.com/v1alpha1 NVIDIADriver"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: nvidia.com/v1alpha1`, `kind: NVIDIADriver`, cluster-wide.
