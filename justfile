#!/usr/bin/env just --justfile

export KUBECFG_ALPHA := "true"

test:
    @ find . -name "*.jsonnet" -exec just assert {} \;
    @ find . -name "*.golden" -exec just golden {} \;

golden FILE:
    #!/bin/bash
    golden={{FILE}}
    jsonnet=${golden%%.golden}.jsonnet
    diff "${golden}" <(kubecfg show "${jsonnet}")

assert FILE:
    #!/bin/bash
    kubecfg eval {{FILE}} >/dev/null