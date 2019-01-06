#!/bin/bash
if [[ -n "$1" ]]; then
    kubectl create secret generic rails-master-key --from-literal="value=$1"
else
    echo "Please enter the master key."
fi
