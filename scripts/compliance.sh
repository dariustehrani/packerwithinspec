#!/bin/bash
AZ_REPO=$(lsb_release -cs)
DEBIAN_FRONTEND=noninteractive

# https://docs.chef.io/inspec/install/
curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
inspec --chef-license=accept-silent
inspec exec https://github.com/dev-sec/linux-baseline --reporter html2  | tee out.json

