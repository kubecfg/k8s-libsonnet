+++
title = "VolumeSnapshotClass"
summary = "How snapshots are taken, per CSI driver"
aka = ["snapshot.storage.k8s.io/v1 VolumeSnapshotClass"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "todo"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: snapshot.storage.k8s.io/v1`, `kind: VolumeSnapshotClass`, cluster-wide.
