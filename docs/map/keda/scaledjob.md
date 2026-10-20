+++
title = "ScaledJob"
summary = "Starts Jobs on events"
aka = ["keda.sh/v1alpha1 ScaledJob", "sj"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/pod-template"
why = "Its pods get the shared overlays"
+++

`apiVersion: keda.sh/v1alpha1`, `kind: ScaledJob`.
