TEMPLATE_VMID=9000
BOOT_IMAGE_TARGET_VOLUME=wd-blue
VM_LIST=( 
    "1001 tani-k8s-cp-1 2    2048  192.168.3.181"
    "1002 tani-k8s-cp-2 2    2048  192.168.3.182"
    "1003 tani-k8s-cp-3 2    2048  192.168.3.183"
    "1101 tani-k8s-cw-1 4    4096  192.168.3.191"
    "1102 tani-k8s-cw-2 4    4096  192.168.3.192"
    "1103 tani-k8s-cw-3 4    4096  192.168.3.193"
)

wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
qm create $TEMPLATE_VMID --memory 512 --net0 virtio,bridge=vmbr0 --name tst-tani-k8s-template
qm importdisk $TEMPLATE_VMID focal-server-cloudimg-amd64.img wd-blue
qm set $TEMPLATE_VMID --scsihw virtio-scsi-pci --scsi0 wd-blue:vm-9000-disk-0
qm set $TEMPLATE_VMID --ide2 wd-blue:cloudinit
qm set $TEMPLATE_VMID --boot c --bootdisk scsi0
qm set $TEMPLATE_VMID --serial0 socket --vga serial0
qm template $TEMPLATE_VMID
rm -rf focal-server-cloudimg-amd64.img


for array in "${VM_LIST[@]}"
do
    echo "${array}" | while read -r vmid vmname cpu mem vmip
    do
        qm clone "${TEMPLATE_VMID}" "${vmid}" --name "${vmname}" --full true
        qm set "${vmid}" --cores "${cpu}" --memory "${mem}"
        qm resize "${vmid}" scsi0 30G
    done
done