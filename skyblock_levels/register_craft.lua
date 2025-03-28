--[[

Skyblock for Minetest

Copyright (c) 2015 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-skyblock
License: GPLv3

]]--


-- desert_stone
minetest.register_craft({
	output = 'default:desert_stone',
	recipe = {
		{'default:desert_sand', 'default:desert_sand'},
		{'default:desert_sand', 'default:desert_sand'},
	}
})

-- mossycobble
minetest.register_craft({
	output = 'default:mossycobble',
	recipe = {
		{'group:flora'},
		{'default:cobble'},
	}
})

-- stone_with_coal
minetest.register_craft({
	output = 'default:stone_with_coal 2',
	recipe = {
		{'default:coal_lump'},
		{'default:stone'},
	}
})

-- stone_with_iron
minetest.register_craft({
	output = 'default:stone_with_iron 2',
	recipe = {
		{'default:iron_lump'},
		{'default:stone'},
	}
})

-- stone_with_copper
minetest.register_craft({
	output = 'default:stone_with_copper 2',
	recipe = {
		{'default:copper_lump'},
		{'default:stone'},
	}
})

-- stone_with_gold
minetest.register_craft({
	output = 'default:stone_with_gold 2',
	recipe = {
		{'default:gold_lump'},
		{'default:stone'},
	}
})

-- stone_with_tin
minetest.register_craft({
	output = 'default:stone_with_tin 2',
	recipe = {
		{'default:tin_lump'},
		{'default:stone'},
	}
})

-- stone_with_mithril
minetest.register_craft({
	output = 'moreores:mineral_mithril 2',
	recipe = {
		{'moreores:mithril_lump'},
		{'default:stone'},
	}
})

-- stone_with_mese
minetest.register_craft({
	output = 'default:stone_with_mese 2',
	recipe = {
		{'default:mese_crystal'},
		{'default:stone'},
	}
})

-- stone_with_diamond
minetest.register_craft({
	output = 'default:stone_with_diamond 2',
	recipe = {
		{'default:diamond'},
		{'default:stone'},
	}
})

-- obsidian
minetest.register_craft({
	output = 'default:obsidian 2',
	recipe = {
		{'default:obsidian_shard'},
		{'default:stone'},
	}
})

-- sand
minetest.register_craft({
	output = 'default:sand 4',
	recipe = {
		{'default:obsidian_shard'},
	}
})

-- cobble
minetest.register_craft({
	type = 'cooking',
	output = 'default:cobble 2',
	recipe = 'default:dirt',
})

-- gravel
minetest.register_craft({
	output = 'default:gravel 2',
	recipe = {
		{'default:cobble'},
	}
})

-- dirt
minetest.register_craft({
	output = 'default:dirt 2',
	recipe = {
		{'default:gravel'},
	}
})

-- clay_lump
minetest.register_craft({
	output = 'default:clay_lump 4',
	recipe = {
		{'default:dirt'},
	}
})

-- locked_chest from chest
minetest.register_craft({
	output = 'default:chest_locked',
	recipe = {
		{'default:steel_ingot'},
		{'default:chest'},
	}
})

-- sapling from leaves and sticks
minetest.register_craft({
	output = 'default:sapling',
	recipe = {
		{'default:leaves', 'default:leaves', 'default:leaves'},
		{'default:leaves', 'default:leaves', 'default:leaves'},
		{'', 'default:stick', ''},
	}
})

-- junglesapling from jungleleaves and sticks
minetest.register_craft({
	output = 'default:junglesapling',
	recipe = {
		{'default:jungleleaves', 'default:jungleleaves', 'default:jungleleaves'},
		{'default:jungleleaves', 'default:jungleleaves', 'default:jungleleaves'},
		{'', 'default:stick', ''},
	}
})

-- pine_sapling from pine_needles and sticks
minetest.register_craft({
	output = 'default:pine_sapling',
	recipe = {
		{'default:pine_needles', 'default:pine_needles', 'default:pine_needles'},
		{'default:pine_needles', 'default:pine_needles', 'default:pine_needles'},
		{'', 'default:stick', ''},
	}
})

-- desert_cobble from dirt and gravel
minetest.register_craft({
	output = 'default:desert_cobble 2',
	recipe = {
		{'default:dirt'},
		{'default:gravel'},
	}
})

-- desert_sand from desert_stone
minetest.register_craft({
	output = 'default:desert_sand 4',
	recipe = {
		{'default:desert_stone'},
	}
})

-- snowblock from bucket_water
minetest.register_craft({
	output = 'default:ice',
	recipe = {
		{'bucket:bucket_water'},
	}
})

-- ice from snowblock
minetest.register_craft({
	output = 'default:ice',
	recipe = {
		{'default:snowblock', 'default:snowblock'},
		{'default:snowblock', 'default:snowblock'},
	}
})

-- snowblock from ice
minetest.register_craft({
	output = 'default:snowblock 4',
	recipe = {
		{'default:ice'},
	}
})

-- glass from desert_sand
minetest.register_craft({
	type = 'cooking',
	output = 'default:glass',
	recipe = 'default:desert_sand',
})

-- rice
minetest.register_craft({
	output = 'farming:seed_rice 2',
	recipe = {
		{'farming:rice'},
	}
})

-- rice
minetest.register_craft({
	output = 'mobs_animal:chicken',
	recipe = {
		{'mobs:egg'},
	}
})

minetest.register_craft({
	output = 'mobs_animal:cow',
	recipe = {
		{'wool:white', 'wool:black', 'wool:white'},
		{'group:food_meat_raw', 'group:food_meat_raw', 'group:food_meat_raw'},
		{'wool:white', 'wool:black', 'wool:white'},
	}
})

minetest.register_craft({
	output = 'mobs_animal:sheep_red',
	recipe = {
		{'wool:red', 'wool:red', 'wool:red'},
		{'group:food_meat_raw', 'group:food_meat_raw', 'group:food_meat_raw'},
		{'wool:red', 'wool:red', 'wool:red'},
	}
})

minetest.register_craft({
	output = 'mobs_crocs:crocodile',
	recipe = {
		{'wool:green', 'wool:green', 'wool:green'},
		{'group:food_meat_raw', 'default:mese', 'group:food_meat_raw'},
		{'wool:green', 'wool:green', 'wool:green'},
	}
})

minetest.register_craft({
	output = 'mobs_animal:kitten',
	recipe = {
		{'wool:orange', 'wool:orange', 'wool:orange'},
		{'group:food_meat_raw', 'default:diamondblock', 'group:food_meat_raw'},
		{'wool:orange', 'wool:orange', 'wool:orange'},
	}
})

minetest.register_craft({
	output = 'dye:dark_green 2',
	recipe = {
		{'farming:weed'},
	}
})

minetest.register_craft({
	output = 'dye:yellow 4',
	recipe = {
		{'default:gold_lump'},
	}
})

minetest.register_craft({
	output = 'dye:yellow 4',
	recipe = {
		{'default:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'dye:red 4',
	recipe = {
		{'default:clay_brick'},
	}
})

minetest.register_craft({
	output = 'dye:red 36',
	recipe = {
		{'default:brick'},
	}
})

minetest.register_craft({
	output = 'dye:white 10',
	recipe = {
		{'wool:white'},
	}
})

minetest.register_craft({
	output = 'dye:white 2',
	recipe = {
		{'mobs:chicken_feather'},
	}
})

minetest.register_craft({
	output = 'ethereal:orange',
	recipe = {
		{'dye:orange'},
		{'default:apple'},
	}
})

minetest.register_craft({
	output = 'dye:white',
	recipe = {
		{'group:food_flour'},
	}
})

minetest.register_craft({
	output = 'wool:white',
	recipe = {
		{'dye:white', 'dye:white', 'dye:white'},
		{'dye:white', 'dye:white', 'dye:white'},
		{'dye:white', 'dye:white', 'dye:white'},
	}
})

minetest.register_craft({
	output = 'dye:white 9',
	recipe = {
		{'wool:white'},
	}
})