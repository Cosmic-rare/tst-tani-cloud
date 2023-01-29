- master
    - tst-k8s-master
    - 4vCPU
    - 4GB
    - 25GB
    - 192.168.3.190
- worker
    - tst-k8s-worker
    - 4vCPU
    - 6GB
    - 20GB
    - 192.168.3.191
- nfs
    - tst-k8s-nfs
    - 1vCPU
    - 1GB
    - 30GB
    - 192.168.3.192
- gateway
    - tst-k8s-gateway
    - 1vCPU
    - 1GB
    - 20GB
    - 192.168.3.193

```bash
qm clone 9000 300 --name tst-k8s-master --full true
qm set 300 --cores 4 --memory 4096
qm resize 300 scsi0 25G
qm clone 9000 301 --name tst-k8s-worker --full true
qm set 301 --cores 4 --memory 6144
qm resize 301 scsi0 20G
qm clone 9000 302 --name tst-k8s-nfs --full true
qm set 302 --cores 1 --memory 1024
qm resize 302 scsi0 30G
qm clone 9000 303 --name tst-k8s-gateway --full true
qm set 303 --cores 1 --memory 1024
qm resize 303 scsi0 20G
```