+++
title = "StatefulSet"
summary = "Pods with stable names and their own storage"
aka = ["apps/v1 StatefulSet", "sts"]
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

[[feature]]
id = "volume-claim-templates"
title = "volumeClaimTemplates_ keyed by metadata.name"
status = "done"

[[needs]]
on = "/lib/pod-template"
why = "Its pods get the shared overlays"
+++

`apiVersion: apps/v1`, `kind: StatefulSet`.

`serviceName` is optional (documented so since Kubernetes v1.33), so the template doesn't require it.
