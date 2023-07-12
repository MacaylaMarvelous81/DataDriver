# Data Driver

A library mod for Crypt of the Necrodancer: Synchrony which creates items from
JSON files.

### Features
- [x] Custom Items
- [ ] Custom Enemies
- [ ] Custom Characters

### Example - Mod Item
[Example Mod Repository](https://github.com/MacaylaMarvelous81/DataDriverTestMod)

Items are loaded recursively from your mod's data/items/*.json. First, specify
Data Driver as a dependency in your mod.json:
```json
// mod.json
{
	// ...
	"dependencies": {
		"DataDriver_io_3162046": "1.0.0"
	}
}
```

Then you can create your items with JSON in the data/items directory:
```json
// data/items/test_item.json
{
	"name": "TestItem",
	"hint": "This is a test item!!",
	"slot": "head",
	"components": {
		"friendlyName": {
			"name": "Test Item"
		},
		"sprite": {
			"texture": "mods/ExampleMod/sprites/TestItem.png"
		}
	}
}
```
**TIP**: The data/items directory is searched recursively, so you can sort your
items into folders!  
**GOTCHA:** Since Data Driver is the mod loading the item, the item name will
start with its namespace, `DataDriver`, rather than the originating mod's. To
maintain uniqueness in item names, Data Driver will prefix the item name with
the mod's **directory name**. For example, if the item above was from a mod
located in `mods/ExampleMod`, then the item name would be
`DataDriver_ExampleModTestItem`.

Data Driver will register your item when it loads, so you can then use it in
your scripts!
```lua
Object.spawn("DataDriver_ExampleModTestItem", ...)
```
