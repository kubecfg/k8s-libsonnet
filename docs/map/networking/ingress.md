+++
title = "Ingress"
summary = "HTTP routing into the cluster"
aka = ["networking.k8s.io/v1 Ingress", "ing"]
kind = "builtin"
intent = "goal"
research = "done"
status = "done"
refs = ["k8s.libsonnet"]
+++

`apiVersion: networking.k8s.io/v1`, `kind: Ingress`.

Template only. Ingress gets no new features upstream; Gateway API (t8y:/gateway-api/httproute) is the successor.
