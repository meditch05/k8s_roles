#!/bin/bash

# 1.host name & ansible hosts
echo "1. host name & ansible hosts"
echo "1-1. Main host name"
echo `hostname`
echo ""

echo "1-2. ansible hosts file"
ansible_path=`find / -name "accordion-installer"`
cat $ansible_path/hosts

# 2.product version
accordion_version=`accordion -v`
docker_version=`rpm -qa |grep docker`
kube_version=`rpm -qa | grep kube`

echo "2. Product version"
echo "2-1. accordion"
echo $accordion_version
echo ""

echo "2-2. docker"
echo $docker_version
echo ""

echo "2-3. kubernetes"
echo $kube_version
echo ""

# 3. CPU Usage
cpu_core=`grep -c processor /proc/cpuinfo`
CPU_USAGE=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f%%\n",
prefix, 100 - v }')
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "3.CPU"
echo "3-1. CPU Core"
echo core count : $cpu_core
echo ""

echo "3-2. CPU Usage"
echo "$DATE,$CPU_USAGE"
echo ""

#4. Memory Usage
echo "4 Memory"
echo "4-1. Memory info "
cat /proc/meminfo | grep Mem
echo ""

echo "4-2. Process Memory info "
#ps -eo user,pid,rss,size,pmem,pcpu,time,comm --sort -rss | head -n 21
echo ""

#5. OS info
echo "5. OS info "
echo -n "-OS
"
rpm -qa *-release
uname -a
echo -n "-kernel
"
rpm -qa | grep kernel
echo ""

#6. HDD Usage
echo "6. HDD Usage"
df -h | sed -n 1,10p
echo ""


