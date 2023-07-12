local CustomEntities = require "necro.game.data.CustomEntities"

--[[--
	Module responsible for loading item data from tables.
	@module ItemDataLoader
]]
local ItemDataLoader = {}

--[[--
	Loads item data from data. The item name will be in the format of
	DataDriver_<ModNamespace><ItemName> because the namespace of the item will
	be of the creating mod, which will be Data Driver in this case.
	@param modName The namespace of the originating mod.
	@param data A table containing item data to load.
]]
function ItemDataLoader.Load(modName, data)
	CustomEntities.extend({
		name = modName .. data.name,
		template = CustomEntities.template.item(),
		data = {
			hint = data.hint,
			slot = data.slot
		},
		components = data.components
	})
end

return ItemDataLoader
