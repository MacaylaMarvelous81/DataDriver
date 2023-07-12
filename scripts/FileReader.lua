local FileIO = require "system.game.FileIO"
local JSON = require "system.utils.serial.JSON"

--[[--
	Module responsible for reading JSON files and turning it into Lua tables
	for easier data usage.
	@module FileReader
]]
local FileReader = {}

--[[--
	Reads a JSON file and returns the data as a table. Raises errors if it was
	unable to read the file or decode its contents.
	@param path The path of the file to read.
]]
function FileReader.ReadJSONFile(path)
	local fileData = FileIO.readFileToString(path)
	if fileData == nil then
		error(string.format("Failed reading a file from %s.", path))
	end

	local data = JSON.decode(fileData)
	return data
end

return FileReader
