+++
title = "Karpenter"
band = "official"
summary = "karpenter.sh: node autoscaling"
+++

No templates in `k8s.libsonnet` yet. Kinds without a template still work through `k8s.Object { apiVersion, kind }`.

Checked against the AWS provider v1.15.0: https://github.com/aws/karpenter-provider-aws/tree/v1.15.0/pkg/apis/crds. karpenter.sh comes from kubernetes-sigs/karpenter; EC2NodeClass is AWS-specific, and other clouds have their own node class.
