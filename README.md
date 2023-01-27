# 自作鯖の検証環境のやること等々

## VMたち

- 検証用のKubernetesClusterを作る
    - 10.89.0.0/16
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

## メモ

- 今後導入したいやつ
    - flannel -> calico
