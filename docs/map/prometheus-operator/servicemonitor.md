+++
title = "ServiceMonitor"
summary = "Tells Prometheus to scrape a Service"
aka = ["monitoring.coreos.com/v1 ServiceMonitor"]
kind = "crd"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "template"
title = "Template with apiVersion and kind"
status = "done"

[[feature]]
id = "endpoints"
title = "endpoints_ keyed by port"
status = "done"

[[feature]]
id = "selector"
title = "selector.matchExpressions_ keyed by key"
status = "done"
+++

`apiVersion: monitoring.coreos.com/v1`, `kind: ServiceMonitor`.
