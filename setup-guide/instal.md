[参考にしたサイト](https://4mo.co/k8s-setup-home-cluster/)

## OS

Ubuntu	20.04.3

## Setup

```bash
$ sudo su -
$ swapoff -a
$ free -h
$ vi /etc/fstab
$ vi /etc/hosts

# Settings for Kubernetes
192.168.3.180 k8s-master
192.168.3.181 k8s-worker-01
192.168.3.182 k8s-worker-02

$ cat > /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
$ modprobe overlay
$ modprobe br_netfilter
$ cat > /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
$ sysctl --system
$ apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
$ add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
$ apt-get update && apt-get install -y containerd.io
$ mkdir -p /etc/containerd
$ containerd config default | sudo tee /etc/containerd/config.toml
$ systemctl restart containerd
$ systemctl status containerd
$ apt-get update && apt-get install -y apt-transport-https curl
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
$ cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
$ apt-get update && apt-get install -y kubelet kubeadm kubectl
$ sudo apt-mark hold kubelet kubeadm kubectl
$ apt install -y nfs-common
```

## MasterNode

```bash
$ kubeadm init --control-plane-endpoint=192.168.3.190:6443 --pod-network-cidr=10.89.0.0/16
$ exit
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
$ kubectl apply -f kube-flannel.yml
```

## WorkerNode

```bash
$ kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
```


## Token to join

```bash
$ kubeadm token list
$ kubeadm token create
```

## Hash to join

```bash
$ openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //'
```
