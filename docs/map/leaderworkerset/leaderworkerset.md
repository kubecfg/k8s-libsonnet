+++
title = "LeaderWorkerSet"
summary = "Replicated groups of one leader pod and N worker pods"
aka = ["leaderworkerset.x-k8s.io/v1 LeaderWorkerSet", "lws"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/pod-template"
why = "Its pods get the shared overlays"
+++

`apiVersion: leaderworkerset.x-k8s.io/v1`, `kind: LeaderWorkerSet`.
