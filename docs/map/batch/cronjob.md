+++
title = "CronJob"
summary = "A Job on a schedule"
aka = ["batch/v1 CronJob", "cj"]
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

`apiVersion: batch/v1`, `kind: CronJob`.

The pod template inside `jobTemplate` gets the shared overlays.
