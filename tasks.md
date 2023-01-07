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
- ArgoCDをインストール
    - てきとーに
    
    [無心でコピペしてGitOpsを試してみた with Argo CD - Tech Inside Drecom](https://tech.drecom.co.jp/gitops-withargocd/)
    
    - それ用のリポジトリも作ってみる
- VPSをついか
- Domainを追加
    - tani.gq
- VPSのセットアップ
    - DNSをいい感じにする
    - wireguardをVPSとmasterに入れる
- kubernetesにいろいろ入れる
    - ArgoCDを使って流し込む
    - ingress
    - (metallb)
    - pvを作る(nfs)
    - nginxをインストール
    - hello taniを作る
    - ingressをnodeportにする
        - 31080とかにする？
        
        [Kubernetesのnginx-ingressを理解する - kun432's blog](https://kun432.hatenablog.com/entry/understanding-nginx-ingress-on-kubernetes)
        
- VPSのnginxで80をk8sの31080にstreamする
- HTTPS…?
- 暇だったら、クラスタぶっ壊してArgoがいい感じに流してくれるか検証
    - ついでに再構築の手順もまとめておく