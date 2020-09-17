#!/bin/bash

#
# NOTE: On macOS with XQuartz, you will need to allow network connections to X11
#
if [ $(uname) = Darwin ]; then
   ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}') && echo "IP: $ip" > /dev/null 2>&1
   export DISPLAY=${ip}:0 > /dev/null 2>&1
   /opt/X11/bin/xhost +  > /dev/null 2>&1
   /opt/X11/bin/xhost + ${ip} > /dev/null 2>&1

   if [ $? -eq 1 ]; then
      # error connecting to x11 host
      echo -e 'Error:\tYou must first install XQuartz'
      echo -e '\tAllow connections from network clients under XQuartz Preferences > Security'
      echo -e '\tAnd have XQuartz running currently'
   else
      docker run -d -ti --rm \
         -e DISPLAY=${ip}:0 \
         -v ~/Downloads/massif-files:/home/massif/test \
         aeppert/massif-visualizer
   fi
else
   ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}') && echo "IP: $ip"
   xhost + ${ip}

   docker run -d -ti --rm \
      -e DISPLAY=${ip}:0 \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /tmp/massif-tests:/home/massif/test \
      aeppert/massif-visualizer
fi

