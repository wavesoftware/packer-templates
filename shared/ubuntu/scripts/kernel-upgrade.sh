#!/bin/bash

set -e
set -x

apt-get -y purge linux-firmware linux-headers-$(uname -r)