# Defined in - @ line 1
function qemukvmbr --description 'alias qemukvmbr qemu-system-x86_64 -m 2048 -enable-kvm -net nic -net bridge,br=br0'
	qemu-system-x86_64 -m 2048 -enable-kvm -net nic -net bridge,br=br0 $argv;
end
