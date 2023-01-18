[参考にしたサイト](https://tech.drecom.co.jp/gitops-withargocd/)

[Sample-Repositry](https://github.com/argoproj/argocd-example-apps)

## 1. Namespaceの作成

まずはArgo CDのリソースを動かすNamespaceを作成します。

```bash
$ kubectl create namespace argocd
```

## 2. Podの作成

```bash
$ kubectl apply -n argocd -f argcd-install.yaml
```

```bash
$ kubectl get pod -n argocd

---

NAME                                 READY   STATUS    RESTARTS   AGE
argocd-application-controller-0      1/1     Running   0          32s
argocd-dex-server-567b48df49-mrqfq   1/1     Running   0          32s
argocd-redis-6fb68d9df5-gwtkk        1/1     Running   0          32s
argocd-repo-server-6dcbd9cb-sl99q    1/1     Running   0          32s
argocd-server-69678b4f65-b84wd       1/1     Running   0          32s
```

## 3. GUI画面へアクセス

```bash
$ kubectl port-forward svc/argocd-server -n argocd 8080:443 --address='0.0.0.0'
```

```
Username	admin
Password	（argocd-serverのPod名）
```

```
$ kubectl get pod -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```

## 4. デモ用のリポジトリをフォーク

## 5. リポジトリの登録

Setting -> Repositories -> CONNECT REPO USING HTTPS

## 6. アプリケーションの設定・同期

```bash
$ kubectl create ns develop
```

NEW APP -> kustomize-guestbook

Path: kustomize-guestbook

Namespace: develop

-> CREATE

```bash
$ kubectl get deploy,svc,pod -n develop

---

NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/kustomize-guestbook-ui   1/1     1            1           9s
 
NAME                             TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/kustomize-guestbook-ui   ClusterIP   10.103.78.215   <none>        80/TCP    9s
 
NAME                                          READY   STATUS    RESTARTS   AGE
pod/kustomize-guestbook-ui-779bc8b498-tpnzg   1/1     Running   0          9s
```

```bash
$ kubectl port-forward svc/kustomize-guestbook-ui -n develop 8081:80 --address='0.0.0.0'
```
