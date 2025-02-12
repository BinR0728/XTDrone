#!/bin/bash

function usage()
{
cat << EOF
usage: hardLeft.sh -r PUBRATE -n NAMESPACE

PUBRATE is the rate at which to publish the bagy file. Default is 100. If you 
   want to run a simulation at 0.1 of real time, set this to 10, for example.
NAMESPACE is the robot name. Default is catvehicle
EOF
}

NS=/ugv_0
PUBRATE=100

while getopts n:r: flag; do
  case $flag in
    n)
      NS=/$OPTARG
      ;;
    r)
      PUBRATE=$OPTARG
      ;;
    ?)
      usage;
      exit;
      ;;
  esac
done

echo "Car $NS receiving inputs with latched rate"
rostopic pub -r ${PUBRATE} -f hardLeft.bagy $NS/cmd_vel_safe geometry_msgs/Twist

