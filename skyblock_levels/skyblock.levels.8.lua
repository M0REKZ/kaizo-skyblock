--[[

Skyblock for Minetest

Copyright (c) 2015 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-skyblock
License: GPLv3

]]--

--[[
Level 4 mostly revolving around farming and dying
level 4 feats and rewards:

* craft_mesehoe       farming:seed_wheat
* use_hoe x40            farming:melon_slice
* plant_wheatseed        default:cactus
* craft_flour            farming:seed_cotton x10
* place_snowblock x50    dye:red x20
* dig_cactus x10         dye:white x20
* dig_geranium x5        flowers:mushroom_brown x2
* dig_tulip x5           flowers:mushroom_red x2
* dig_brownmushroom x15  farming:corn x50
* craft_ethanol          default:meselamp x5

]]--

local level = 8

--
-- PUBLIC FUNCTIONS
--

skyblock.levels[level] = {}

-- feats
-- Parts of this are purely hypothetical and not implement yet
skyblock.levels[level].feats = {
   {
      name = "Eat bread",
      hint = "farming:bread",
      feat = "eat_bread",
      count = 1,
      reward = "mobs_animal:cow 2",
      item_eat = {"farming:bread"}
   },
   {
      name = "Eat a corn cob",
      hint = "farming:corn_cob",
      feat = "eat_corn_cob",
      count = 1,
      reward = "farming:seed_rice 5",
      item_eat = {"farming:corn_cob"},
   },
   {
      name = "Eat rice bread",
      hint = "farming:rice_bread",
      feat = "eat_rice_bread",
      count = 1,
      reward = "farming:vanilla 2",
      item_eat = {"farming:rice_bread"}
   },
   {
      name = "Eat a slice of bread",
      hint = "farming:bread_slice",
      feat = "eat_bread_slice",
      count = 1,
      reward = "mobs:egg 10",
      item_eat = {"farming:bread_slice"},
   },
   {
      name = "Eat Vanilla Flan",
      hint = "farming:flan",
      feat = "eat_vanilla_flan",
      count = 1,
      reward = "farming:ginger 5",
      item_eat = {"farming:flan"}
   },
   {
      name = "Eat a gingerbread man",
      hint = "farming:gingerbread_man",
      feat = "eat_gingerbread_man",
      count = 1,
      reward = "farming:cocoa_beans_raw 40",
      item_eat = {"farming:gingerbread_man"},
   },
   {
      name = "Eat chocolate",
      hint = "farming:chocolate_dark",
      feat = "eat_chocolate_dark",
      count = 1,
      reward = "farming:pineapple 5",
      item_eat = {"farming:chocolate_dark"},
   },
   {
      name = "Make a chocolate block",
      hint = "farming:chocolate_block",
      feat = "make_chocolate_block",
      count = 1,
      reward = "farming:carrot 5",
      craft = {"farming:chocolate_block"},
   },
   {
      name = "Eat a chocolate donut",
      hint = "farming:donut_chocolate",
      feat = "eat_chocolate_donut",
      count = 1,
      reward = "default:sand 20",
      item_eat = {"farming:donut_chocolate"},
   },
   {
      name = "Drink carrot juice",
      hint = "farming:carrot_juice",
      feat = "drink_carrot_juice",
      count = 1,
      reward = "farming:mayonnaise",
      item_eat = {"farming:carrot_juice"},
   }
}

-- init level
skyblock.levels[level].init = function(player_name)
end

-- get level information
skyblock.levels[level].get_info = function(player_name)
	local info = {
		level=level,
		total=10,
		count=0,
		player_name=player_name,
		infotext='',
		formspec = '',
		formspec_quest = '',
	}

	local text = 'label[0,2.7; --== Quests ==--]'
		..'label[0,0.5; Time to be a Chef!]'
		..'label[0,1.0; Make delicious food]'
		..'label[0,1.5; to eat yourself.]'
		..'label[0,2.0; .]'

	info.formspec = skyblock.levels.get_inventory_formspec(level,info.player_name,true)..text
	info.formspec_quest = skyblock.levels.get_inventory_formspec(level,info.player_name)..text

	for k,v in ipairs(skyblock.levels[level].feats) do
		info.formspec = info.formspec..skyblock.levels.get_feat_formspec(info,k,v.feat,v.count,v.name,v.hint,true)
		info.formspec_quest = info.formspec_quest..skyblock.levels.get_feat_formspec(info,k,v.feat,v.count,v.name,v.hint)
	end
	if info.count>0 then
		info.count = info.count/2 -- only count once
	end

	info.infotext = 'LEVEL '..info.level..' for '..info.player_name..': '..info.count..' of '..info.total

	return info
end

-- Reward feats
skyblock.levels[level].reward_feat = function(player_name, feat)
   return skyblock.levels.reward_feat(level, player_name, feat)
end

-- Track node placement
skyblock.levels[level].on_placenode = function(pos, newnode, placer, oldnode)
   skyblock.levels.on_placenode(level, pos, newnode, placer, oldnode)
end

-- Track node digging
skyblock.levels[level].on_dignode = function(pos, oldnode, digger)
   skyblock.levels.on_dignode(level, pos, oldnode, digger)
end

-- track eating feats
skyblock.levels[level].on_item_eat = function(player_name, itemstack)
   skyblock.levels.on_item_eat(level, player_name, itemstack)
end

-- track crafting feats
skyblock.levels[level].on_craft = function(player_name, itemstack)
   skyblock.levels.on_craft(level, player_name, itemstack)
end

-- track hoe use
skyblock.levels[level].hoe_on_use = function(player_name, pointed_thing, wieldeditem)
   skyblock.levels.hoe_on_use(level, player_name, pointed_thing, wieldeditem)
end

skyblock.levels[level].bucket_on_use = function(player_name, pointed_thing) end
skyblock.levels[level].bucket_water_on_use = function(player_name, pointed_thing) end
skyblock.levels[level].bucket_lava_on_use = function(player_name, pointed_thing) end
