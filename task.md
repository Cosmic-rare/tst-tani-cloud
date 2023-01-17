## やること

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

### VPSのセットアップ

- VPSをついか
    - tst-k8s-public-gateway
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