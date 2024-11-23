#! /bin/bash
vm=$2
os=$1
#sudo cp ./t_$os.qcow2 /media/mydata/libvirt/images/$vm.qcow2
sudo rsync -ah --progress ./t_$os.qcow2 /media/mydata/VMs/$vm.qcow2
sudo virt-install --name=$vm \
--ram=4096 --vcpus=4  \
--hvm \
--boot uefi,loader.secure=yes \
--os-variant=$os \
--disk /media/mydata/VMs/$vm.qcow2,bus=virtio \
--network network=lab,model=virtio \
--graphics spice,listen=10.0.0.200,defaultMode=insecure \
--import  \
--noreboot \
--noautoconsole -v
