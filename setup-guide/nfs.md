## Setup nfs-server

```bash
$ sudo apt install nfs-kernel-server
```

```bash
$ sudo mkdir -p /export/nfs
$ sudo chown -R nobody:nogroup /export/nfs
$ sudo chmod 777 /export/nfs
```

```bash
$ sudo nano /etc/exports

---

/export/nfs 192.168.3.0/24(rw,sync,no_subtree_check)
```

```bash
$ sudo exportfs -a
$ systemctl restart nfs-server.service
```

## Setup kubernetes-worker-node

```bash
$ apt-get install nfs-common 
```
