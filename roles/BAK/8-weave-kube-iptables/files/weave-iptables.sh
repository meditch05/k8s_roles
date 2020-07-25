#!/bin/bash

#weave bridge iptables
/sbin/iptables -D WEAVE-NPC -m physdev --physdev-out vethwe-bridge -j ACCEPT
/sbin/iptables -A WEAVE-NPC -m physdev --physdev-is-bridged --physdev-out vethwe-bridge -j ACCEPT
