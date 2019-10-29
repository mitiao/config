# Defined in - @ line 1
function qemukvm2048 --description 'alias qemukvm2048 qemu-system-x86_64 -m 2048 -enable-kvm'
	qemu-system-x86_64 -m 2048 -enable-kvm $argv;
end
