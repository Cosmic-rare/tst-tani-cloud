# CloudInitの使い方

## テンプレートの作成

```bash
$ wget https://cloud-images.ubuntu.com/focal/20230109/focal-server-cloudimg-amd64.img

$ qm create 9000 --memory 512 --net0 virtio,bridge=vmbr0

$ qm importdisk 9000 focal-server-cloudimg-amd64.img ssd-000

$ qm set 9000 --scsihw virtio-scsi-pci --scsi0 ssd-000:vm-9000-disk-0

$ qm set 9000 --ide2 ssd-000:cloudinit

$ qm set 9000 --boot c --bootdisk scsi0

$ qm set 9000 --serial0 socket --vga serial0

$ qm template 9000

$ rm -rf focal-server-cloudimg-amd64.img
```

## クローン

```bash
$ qm clone 9000 "${vmid}" --name "${vmname}" --full true
```

## VMの設定

```bash
$ qm set "${vmid}" --cores "${cpu}" --memory "${mem}"

$ qm resize "${vmid}" scsi0 25G
```
