## 1. Create Namespace

```bash
$ kubectl create namespace argocd
```

## 2. Install argocd

```bash
$ kubectl apply -n argocd -f argcd-install.yaml
```

## 3. Access to web-gui

```bash
$ kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

$ kubectl get svc -n argocd
```

```
$ kubectl -n argocd get secret/argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

```
Username	admin
```

## 4. Registry Repo

Setting -> Repositories -> CONNECT REPO USING HTTPS
