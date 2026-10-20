+++
title = "DestinationRule"
summary = "Istio traffic policy for a destination"
aka = ["networking.istio.io/v1 DestinationRule", "dr"]
kind = "crd"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "v1beta1"
title = "networking.istio.io/v1beta1 template"
status = "done"

[[feature]]
id = "v1"
title = "networking.istio.io/v1 template"
status = "todo"
milestone = "m3"
note = "v1 since Istio 1.22"
+++

`apiVersion: networking.istio.io/v1`, `kind: DestinationRule`.
