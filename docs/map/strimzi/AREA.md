+++
title = "Strimzi"
band = "addons"
summary = "kafka.strimzi.io: Kafka on Kubernetes"
+++

Templates live in `k8s.libsonnet` under `k8s['kafka.strimzi.io'].v1` and `.v1beta2`.

Checked against Strimzi 1.3.0: https://github.com/strimzi/strimzi-kafka-operator/tree/1.3.0/packaging/install/cluster-operator. Strimzi 1.0 removed every version older than v1.
