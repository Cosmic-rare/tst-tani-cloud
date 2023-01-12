# 自作鯖の検証環境のやること等々

## 参考にしたサイトたち

[ArgoCD](https://tech.drecom.co.jp/gitops-withargocd/)

[公開](https://blog.ebiiim.com/posts/homelab-kubernetes/)

## やること

### 事前準備

- 今あるk8sクラスタをぶっこわす
- proxmox-web-guiのipの割り振りメモを修正しておく

### VMのセットアップ

- 検証用のKubernetesClusterを作る
    - 10.89.0.0/26
    - master
        - tst-k8s-master
        - 4vCPU
        - 3GB
        - 25GB
        - 192.168.3.190
    - worker
        - tst-k8s-worker
        - 4vCPU
        - 4GB
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
    - nfs-proxy
        - tst-k8s-nfs-proxy
        - 1vCPU
        - 1G
        - 10G
        - 192.168.3.194

# nfs鯖のセットアップ

- /export/k8sに共有をかける

# nfs-proxy鯖のセットアップ

- /export/k8sにnfs鯖をマウント
- /export/k8sに共有をかける

### クラスタのセットアップ

- ArgoCDをインストール
- kubernetesにいろいろ入れる
    - ArgoCDを使って流し込む
    - metallb
        - ingress用のipを設定する
        - 192.168.3.194/32
    - ingress
        - metallbのipをdefaultからさっき設定したものに変える
    - pvを作る(nfs)
    - nginxをインストール
    - hello taniを作る
    - ingressをloadbalancerにする
        - ExternalIPで接続できることを確認する

### DDNS-NOWのセットアップ

- Domainを追加
    - tani-exe.f5.si

### VPSのセットアップ

- VPSをついか
- VPSのセットアップ
    - DNSをいい感じにする
    - wireguardをVPSとgatewayに入れる
- VPSのnginxの設定
    - 標準で待ち受けるportを変更する
        - 81?
    - 80と443をgatewayにVPN越しにstreamを張る        

### Gatewayのセットアップ

- gatewayのnginxの設定
    - まずnginxをインストールする
    - 標準で待ち受けるportを変更する
        - 81?
    - 80と443から192.168.3.194(nginx-ingress external-ip)へのstreamを張る

## メモ

- HTTPS…?
    - cert-botはcronjobなので後回し
- 暇だったら、クラスタぶっ壊してArgoがいい感じに流してくれるか検証
    - ついでに再構築の手順もまとめておく
- 今後導入したいやつ
    - flannel -> calico
