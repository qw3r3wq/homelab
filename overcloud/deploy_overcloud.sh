#!/bin/bash

source ~/stackrc

_THT="/usr/share/openstack-tripleo-heat-templates"
_LTHT="$(pwd)"

#time openstack overcloud deploy \
#time openstack --debug overcloud deploy \
time openstack --verbose overcloud deploy \
    --force-postconfig \
    --templates \
    --stack rem0te \
    -r ${_LTHT}/roles_data.yaml \
    -n ${_LTHT}/network_data.yaml \
    -e ${_LTHT}/node-info.yaml \
    -e ${_LTHT}/containers-prepare-parameter.yaml \
    -e ${_LTHT}/overcloud_images.yaml \
    -e ${_LTHT}/private_small.yaml \
    -e ${_THT}/environments/disable-telemetry.yaml \
    --ntp-server tss.vu.lt

#    -e ${_LTHT}/node-info.yaml \
#    -e ${_LTHT}/private.yaml \
#    -e ${_LTHT}/containers-prepare-parameter.yaml \
#    -e ${_LTHT}/overcloud_images.yaml \
#    -e ${_THT}/environments/host-config-and-reboot.yaml \
