+++
title = "Deployment"
summary = "Keeps a set of identical pods running"
aka = ["apps/v1 Deployment", "deploy"]
kind = "builtin"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "template"
title = "Template with apiVersion and kind"
status = "done"

[[feature]]
id = "pod-overlays"
title = "Pod template gets the shared PodTemplateSpec overlays"
status = "done"

[[needs]]
on = "/lib/pod-template"
why = "Its pods get the shared overlays"
+++

`apiVersion: apps/v1`, `kind: Deployment`.

The main workload kind.
