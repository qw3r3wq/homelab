#!/bin/bash

source /home/stack/stackrc
# cd /home/stack
#
#openstack overcloud deploy \
#  --templates \
#  -r /home/stack/overcloud/aio_roles_data.yaml \
#  -n /home/stack/overcloud/network_data_empty.yaml \
#  -e /usr/share/openstack-tripleo-heat-templates/environments/enable-swap.yaml \
#  -e /home/stack/overcloud/nodes.yaml
  
_THT="/usr/share/openstack-tripleo-heat-templates"
_LTHT="$(pwd)"

#time openstack overcloud deploy \
#time openstack --debug overcloud deploy \
time openstack --verbose overcloud deploy \
    --force-postconfig \
    --templates \
    --stack boobs \
    -r ${_LTHT}/roles_data.yaml \
    -n ${_LTHT}/network_data.yaml \
    -e ${_LTHT}/node-info.yaml \
    -e ${_LTHT}/private.yaml \
    -e ${_LTHT}/containers-prepare-parameter.yaml \
    -e ${_LTHT}/overcloud_images.yaml \
    -e ${_THT}/environments/disable-telemetry.yaml \
    -e ${_THT}/environments/host-config-and-reboot.yaml \
    --ntp-server pool.debian.org


