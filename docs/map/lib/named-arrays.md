+++
title = "Named arrays"
summary = "Write Kubernetes arrays as objects keyed by name, so overlays can reach one item"
kind = "lib"
intent = "induced"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "by-name"
title = "asNamedArray and typedNamedArrays: foo_ objects become foo arrays keyed by .name"
status = "done"
+++

Some arrays use another key: StatefulSet `volumeClaimTemplates_` (`metadata.name`), ServiceMonitor `endpoints_` and PodMonitor `podMetricsEndpoints_` (`port`), VaultSecret `secrets_` (`path`). Those are written out by hand in each template; a TODO in the code asks whether to make one helper for all of them.
