## check attached disk

```bash
$ ls -l /dev/disk/by-id/

lrwxrwxrwx 1 root root  9 Jan 20 22:53 ata-HGST_HUH728080ALE604_VKHV9Z7X -> ../../sdc
```

```bash
$ qm set 100 -virtio0 /dev/disk/by-id/ata-HGST_HUH728080ALE604_VKHV9Z7X
```

- `-virtio0`
- `-scsi0`
- `-sata0`
