+++
title = "PodMonitor"
summary = "Tells Prometheus to scrape pods"
aka = ["monitoring.coreos.com/v1 PodMonitor"]
kind = "crd"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "template"
title = "Template with apiVersion and kind"
status = "done"

[[feature]]
id = "pod-metrics-endpoints"
title = "podMetricsEndpoints_ keyed by port"
status = "done"

[[feature]]
id = "selector"
title = "selector.matchExpressions_ keyed by key"
status = "done"
+++

`apiVersion: monitoring.coreos.com/v1`, `kind: PodMonitor`.
