#!/usr/bin/env just --justfile

export KUBECFG_ALPHA := "true"

test:
    @ find . -name "*.jsonnet" -print0 | xargs -0 -n1 just assert
    @ find . -name "*.golden" -print0 | xargs -0 -n1 just golden

golden FILE:
    #!/bin/bash
    golden={{FILE}}
    jsonnet=${golden%%.golden}.jsonnet
    diff "${golden}" <(kubecfg show "${jsonnet}")

assert FILE:
    #!/bin/bash
    kubecfg eval {{FILE}} >/dev/null
