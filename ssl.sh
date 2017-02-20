#!/bin/bash

domains=(`cat domains.txt`)
domainargs=("${domains[@]/#/-d }")

echo stopped `docker stop neonorbstack_httpd_1`
if [ -n "${renew+1}" ]; then
  echo renewing
fi
letsencrypt $renew certonly ${domainargs[@]}

echo started `docker start neonorbstack_httpd_1`
