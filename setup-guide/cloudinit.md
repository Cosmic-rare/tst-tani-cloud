## Create template

```bash
$ wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img # ubuntu 20.04
$ wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img # ubuntu 22.04

$ qm create 9000 --memory 512 --net0 virtio,bridge=vmbr0

$ qm importdisk 9000 focal-server-cloudimg-amd64.img ssd-000

$ qm set 9000 --scsihw virtio-scsi-pci --scsi0 ssd-000:vm-9000-disk-0

$ qm set 9000 --ide2 ssd-000:cloudinit

$ qm set 9000 --boot c --bootdisk scsi0

$ qm set 9000 --serial0 socket --vga serial0

$ qm template 9000

$ rm -rf focal-server-cloudimg-amd64.img
```

## clone template

```bash
$ qm clone 9000 "${vmid}" --name "${vmname}" --full true
```

## setting of VM

```bash
$ qm set "${vmid}" --cores "${cpu}" --memory "${mem}"

$ qm resize "${vmid}" scsi0 25G
```
