+++
title = "NetworkPolicy"
summary = "Which pods may talk to which"
aka = ["networking.k8s.io/v1 NetworkPolicy", "netpol"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m1"
+++

`apiVersion: networking.k8s.io/v1`, `kind: NetworkPolicy`.

Common in namespaced apps. The ingress and egress rules are plain arrays.
