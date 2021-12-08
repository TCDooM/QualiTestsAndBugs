#!/bin/bash

# configure dsyslog to send to logz.io
curl -sL https://qsdevops.s3-eu-west-1.amazonaws.com/rsyslog_install.sh | /bin/bash -s no-config-script-app;

python3 -m http.server 3000
