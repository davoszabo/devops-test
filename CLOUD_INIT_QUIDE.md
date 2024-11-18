wget https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2

qm create 8002 --memory 2048 --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci

qm importdisk 8002 debian-11-genericcloud-amd64.qcow2 local

qm set 8002 --scsi0 local:8002/vm-8002-disk-0.raw

qm set 8002 --ide2 local:cloudinit

qm set 8002 --boot order=scsi0

qm set 8002 --serial0 socket --vga serial0

qm template 8002

# Image can be removed after template creation
rm -rf debian-11-genericcloud-amd64.qcow2

