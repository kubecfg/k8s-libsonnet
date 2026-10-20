+++
title = "EnvoyFilter"
summary = "Low-level Envoy configuration patches"
aka = ["networking.istio.io/v1alpha3 EnvoyFilter"]
kind = "crd"
intent = "goal"
research = "done"
refs = ["k8s.libsonnet"]

[[feature]]
id = "v1beta1"
title = "networking.istio.io/v1beta1 template"
status = "done"
note = "Istio rejects it; kept so existing configs still evaluate"

[[feature]]
id = "v1alpha3"
title = "networking.istio.io/v1alpha3 template"
status = "done"
note = "The only version Istio serves"
+++

`apiVersion: networking.istio.io/v1alpha3`, `kind: EnvoyFilter`.

Use `v1alpha3.EnvoyFilter`.
