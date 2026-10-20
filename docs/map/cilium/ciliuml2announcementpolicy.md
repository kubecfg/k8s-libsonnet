+++
title = "CiliumL2AnnouncementPolicy"
summary = "Which nodes answer ARP for service IPs"
aka = ["cilium.io/v2alpha1 CiliumL2AnnouncementPolicy"]
kind = "crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: cilium.io/v2alpha1`, `kind: CiliumL2AnnouncementPolicy`, cluster-wide.
