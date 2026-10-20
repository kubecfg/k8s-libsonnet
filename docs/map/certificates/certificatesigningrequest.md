+++
title = "CertificateSigningRequest"
summary = "A request to sign a certificate"
aka = ["certificates.k8s.io/v1 CertificateSigningRequest", "csr"]
kind = "builtin"
intent = "aspiration"
research = "done"
status = "dropped"

[[needs]]
on = "/lib/cluster-scoped"
why = "Cluster-wide: must not pick up the shared namespace"
+++

`apiVersion: certificates.k8s.io/v1`, `kind: CertificateSigningRequest`, cluster-wide.

Created by clients and kubelets.
