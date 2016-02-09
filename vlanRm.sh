#!/bin/bash

# 09/fev/2016
# test on debian
# chmod +x vlanConfig.sh

# check if script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "You must be root ! sorry ..." 2>&1
  exit 1
fi

# help function
function _help {
  echo "Options :"
  echo "./vlanConfig [Interface] [vlan id]"
  echo "Exemple :" 
  echo "./vlanconfig.sh eth0 20"
  interfaces=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d')
  echo "interfaces available :" 
  echo "$interfaces"
}

# checkif vlan package is installed
function checkPkg {
 pkg=$1
 PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $pkg | grep "install ok installed")
 if [ "" == "$PKG_OK" ]; then
   echo "No $pkg package . Setting up $pkg"
   sudo apt-get --force-yes --yes install $pkg
 else
   echo "$pkg package OK"
 fi
}

if [ "$#" -ne 2 ]; then
    _help
    exit 1
fi

interface=$1
vlan=$2

# checking for module 8021q
modinfo 8021q &>/dev/null
if [ $? -eq 1 ]; then
  echo "No kernel module 8021q actived. Setting up now"
  modprobe 8021q
else
  echo "module 8021q loaded"
fi

# check if vlan/vconfig and install if not
checkPkg vlan

# remove vlan
vconfig rem ${interface}.${vlan}
