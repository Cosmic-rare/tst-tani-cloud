## send snapshot to different pool

```bash
$ zfs snapshot -r pool1/kubernetes-mariadb@snap
$ zfs send -R pool1/kubernetes-mariadb@snap | zfs receive -v main/kubernetes-mariadb
```
