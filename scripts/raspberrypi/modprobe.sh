#!/bin/bash

sudo modprobe -v libiscsi
sudo modprobe -v scsi_transport_iscsi
sudo modprobe -v iscsi_tcp
sudo modprobe -v libiscsi_tcp
