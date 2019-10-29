# Defined in - @ line 1
function qcow2create --description 'alias qcow2create qemu-img create -f qcow2'
	qemu-img create -f qcow2 $argv;
end
