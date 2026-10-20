+++
title = "HorizontalPodAutoscaler"
summary = "Scales a workload by CPU, memory or custom metrics"
aka = ["autoscaling/v2 HorizontalPodAutoscaler", "hpa"]
kind = "builtin"
intent = "goal"
research = "done"
status = "todo"
milestone = "m1"
+++

`apiVersion: autoscaling/v2`, `kind: HorizontalPodAutoscaler`.

Sits next to almost every Deployment. Use `autoscaling/v2`; v1 only knows CPU.
