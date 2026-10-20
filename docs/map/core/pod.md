+++
title = "Pod"
summary = "A bare pod, with the same overlays as every pod template"
aka = ["v1 Pod", "po"]
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

`apiVersion: v1`, `kind: Pod`.

Uses the same `PodTemplateSpec` as the workload kinds, so overlays on it reach bare pods too.
