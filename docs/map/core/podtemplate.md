+++
title = "PodTemplate"
summary = "A stored pod template"
aka = ["v1 PodTemplate"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/pod-template"
why = "Its pods get the shared overlays"
+++

`apiVersion: v1`, `kind: PodTemplate`.

Rarely written by hand. If added, it should use the shared `PodTemplateSpec`.
