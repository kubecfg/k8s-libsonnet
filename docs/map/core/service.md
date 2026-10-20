+++
title = "Service"
summary = "A stable address in front of pods"
aka = ["v1 Service", "svc"]
kind = "builtin"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "template"
title = "Template with apiVersion and kind"
status = "done"

[[feature]]
id = "named-ports"
title = "ports_ keyed by name"
status = "done"

[[needs]]
on = "/lib/named-arrays"
why = "Its arrays are keyed by name"
+++

`apiVersion: v1`, `kind: Service`.

Write ports as `ports_+: { http: { port: 80 } }` so overlays can change one port by name.
