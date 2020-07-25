# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

stty erase "^H" kill "^U" intr "^C" eof "^D"
export PS1='\u@\h:$(pwd) # '
export LANG=en_US.utf8
set -o vi
umask 026

export PATH=${PATH}:.
export PATH=${PATH}:/usr/local/go/bin

####################################
# Bridge Set ( Flannel, Calico, etc ... )
####################################
modprobe br_netfilter
# echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
# echo '1' > /proc/sys/net/bridge/bridge-nf-call-ip6tables
# echo "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.conf
# echo "net.bridge.bridge-nf-call-iptables = 1"  >> /etc/sysctl.conf
# sysctl -a | grep bridge-nf-call-ip
# lsmod | grep net_filter
####################################
# yum -y install net-utils bind-utils
# hostnamectl set-hostname vm-master1
# timedatectl set-timezone Asia/Seoul
####################################


####################################
# Alias
####################################
alias syslog="tail -f  /var/log/messages"
alias cdnet="cd /etc/sysconfig/network-scripts; ll"
alias cdrepo="cd /etc/yum.repos.d; ll"
alias cdaddon="cd /etc/kubernetes/addon; ll"

alias dls='docker images'
alias dll='   curl -s --insecure -X GET https://myregistry.mwportal.com:30001/v2/_catalog?n=10    | jq'
alias dlltag='curl -s --insecure -X GET https://myregistry.mwportal.com:30001/v2/${pkg}/tags/list | jq'

alias k='kubectl'
alias kinfo='kubectl get svc,po,pvc -o wide --all-namespaces'
alias kdev=' kubectl get ing,svc,deploy,po -o wide -n mwportal-dev --show-labels'
alias kmon=' kubectl get svc,deploy,po -o wide -n monitoring'

alias klog-api=" kubectl logs -f pod/`kubectl get pod -n kube-system | grep kube-apiserver          | awk '{print $1}'` -n kube-system --tail=10"
alias klog-sch=" kubectl logs -f pod/`kubectl get pod -n kube-system | grep kube-scheduler          | awk '{print $1}'` -n kube-system --tail=10"
alias klog-ctm=" kubectl logs -f pod/`kubectl get pod -n kube-system | grep kube-controller-manager | awk '{print $1}'` -n kube-system --tail=10"
alias klog-etcd="kubectl logs -f pod/`kubectl get pod -n kube-system | grep etcd                    | awk '{print $1}'` -n kube-system --tail=10"
alias klog-kube="journalctl -xeu kubelet"
alias dlog="     journalctl -xeu docker"
