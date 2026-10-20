+++
title = "VolumeSnapshotContent"
summary = "The actual snapshot in the storage system"
aka = ["snapshot.storage.k8s.io/v1 VolumeSnapshotContent"]
kind = "sig-crd"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: snapshot.storage.k8s.io/v1`, `kind: VolumeSnapshotContent`, cluster-wide.

Usually created by the snapshot controller for each VolumeSnapshot.
