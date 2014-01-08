path, contents = nil, ""

function Initialize()
	path = SKIN:MakePathAbsolute(SKIN:GetVariable('notesfile', SKIN:ReplaceVariables('#@#Notes\notes.txt')))
	readFromFile()
end

function Update()
	return contents
end

function writeToFile()
	local text = SELF:GetOption('temp')
	local file = io.open(path, 'w')
	if not file then
		error ('unable to write to file ' .. path)
	else
		file:write('\239\187\191', text)
		file:close()
	end
end

function readFromFile()
	local file = io.open(path, 'r')
	if not file then
		error ('unable to read file ' .. path)
	else
		contents = file:read('*a')
		SKIN:Bang('!SetVariable', 'notetext', contents)
	end
end