#!/bin/bash -x
cd $(git rev-parse --show-toplevel)
ansible-playbook default.yml
