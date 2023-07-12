local FileIO = require "system.game.FileIO"
local ItemDataLoader = require "DataDriver.ItemDataLoader"
local FileReader = require "DataDriver.FileReader"

print("Beginning search for mod data.")

for _, modName in pairs(FileIO.listFiles("mods", FileIO.List.DIRECTORIES)) do
	local modRoot = "mods/" .. modName
	local data = modRoot .. "/data"
	local itemPath = data .. "/items"

	for _, itemFile in pairs(FileIO.listFiles(itemPath, FileIO.List.FILES + FileIO.List.FULL_PATH + FileIO.List.RECURSIVE)) do
		local itemData = FileReader.ReadJSONFile(itemFile)
		ItemDataLoader.Load(modName, itemData)
	end
end
