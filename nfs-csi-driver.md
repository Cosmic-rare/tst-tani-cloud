# Install NFS CSI driver v4.1.0 version on a kubernetes cluster

## Install with kubectl
 - Option#1. remote install
```bash
$ curl -skSL https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/v4.1.0/deploy/install-driver.sh | bash -s v4.1.0 --
```

- check pods status:
```bash
$ kubectl -n kube-system get pod -o wide -l app=csi-nfs-controller
$ kubectl -n kube-system get pod -o wide -l app=csi-nfs-node

---

NAME                                       READY   STATUS    RESTARTS   AGE     IP             NODE
csi-nfs-controller-56bfddd689-dh5tk       4/4     Running   0          35s     10.240.0.19    k8s-agentpool-22533604-0
csi-nfs-node-cvgbs                        3/3     Running   0          35s     10.240.0.35    k8s-agentpool-22533604-1
csi-nfs-node-dr4s4                        3/3     Running   0          35s     10.240.0.4     k8s-agentpool-22533604-0
```

### clean up NFS CSI driver
```bash
$ curl -skSL https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/v4.1.0/deploy/uninstall-driver.sh | bash -s v4.1.0 --
```
