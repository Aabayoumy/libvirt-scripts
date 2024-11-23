virt-install --name win11-master --cdrom /tank/storage/template/iso/win11_business_24h2_nov_2024.iso --os-variant=win11 \
 --network network=default,model=virtio --disk size=64,cache=none,bus=virtio,path=/media/mydata/VMs/win11-master.qcow2 --disk path=/tank/storage/template/iso/virtio-win.iso,device=cdrom \
 --memory 8196 --sound default --graphics spice,listen=0.0.0.0 --vcpu 4 --cpu host-passthrough --video qxl --noautoconsole --features kvm_hidden=on,smm=on --tpm backend.type=emulator,backend.version=2.0,model=tpm-tis \
 --boot loader=/usr/share/ovmf/x64/OVMF_CODE.secboot.4m.fd,loader_ro=yes,loader_type=pflash,nvram_template=/usr/share/ovmf/x64/OVMF_VARS.4m.fd

 # virsh domfstrim win11-master