+++
title = "PodDisruptionBudget"
summary = "How many pods may be down during voluntary disruptions"
aka = ["policy/v1 PodDisruptionBudget", "pdb"]
kind = "builtin"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "v1"
title = "policy/v1 template"
status = "done"

[[feature]]
id = "v1beta1"
title = "policy/v1beta1 template"
status = "done"
note = "Removed in Kubernetes 1.25; kept on purpose for old clusters"
+++

`apiVersion: policy/v1`, `kind: PodDisruptionBudget`.
