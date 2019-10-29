# Defined in - @ line 1
function http --description 'alias http python3 -m http.server'
	python3 -m http.server $argv;
end
