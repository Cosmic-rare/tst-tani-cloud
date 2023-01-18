[参考にしたサイト](https://blog.framinal.life/entry/2020/04/16/022042)

```bash
$ kubectl apply -f metallb-namespace.yaml
$ kubectl apply -f metallb.yaml
# On first install only
$ kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

```bash
$ kubectl get pods -n metallb-system
NAME                          READY   STATUS    RESTARTS   AGE
controller-57f648cb96-vqm4v   1/1     Running   0          83s
speaker-qgspg                 1/1     Running   0          84s
$ kubectl get daemonsets -n metallb-system 
NAME      DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                 AGE
speaker   1         1         1       1            1           beta.kubernetes.io/os=linux   114s
$ kubectl get deploy -n metallb-system 
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
controller   1/1     1            1           2m16s
```

```bash
$ kubectl apply -f metallb-config.yaml 
configmap/config created
```
