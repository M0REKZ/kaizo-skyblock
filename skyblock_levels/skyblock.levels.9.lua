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

local level = 9

--
-- PUBLIC FUNCTIONS
--

skyblock.levels[level] = {}

-- feats
-- Parts of this are purely hypothetical and not implement yet
skyblock.levels[level].feats = {
   {
      name = "Make a Jaffa cake",
      hint = "farming:jaffa_cake",
      feat = "make_jaffa_cake",
      count = 1,
      reward = "mobs_animal:sheep_white 2",
      craft = {"farming:jaffa_cake"}
   },
   {
      name = "Make a cow",
      hint = "mobs_animal:cow",
      feat = "make_cow",
      count = 1,
      reward = "mobs:meat_raw 5",
      craft = {"mobs_animal:cow"},
   },
   {
      name = "Make a red sheep",
      hint = "mobs_animal:sheep_red",
      feat = "make_sheep_red",
      count = 1,
      reward = "mobs_animal:cow 5",
      craft = {"mobs_animal:sheep_red"}
   },
   {
      name = "Place a meat block",
      hint = "mobs:meatblock",
      feat = "make_meat_block",
      count = 1,
      reward = "farming:garlic 5",
      placenode = {"mobs:meatblock"},
   },
   {
      name = "Make a crocodile",
      hint = "mobs_crocs:crocodile",
      feat = "make_crocodile",
      count = 1,
      reward = "farming:seed_sunflower",
      craft = {"mobs_crocs:crocodile"}
   },
   {
      name = "Make Pasta",
      hint = "farming:pasta",
      feat = "make_pasta",
      count = 1,
      reward = "farming:tomato 5",
      craft = {"farming:pasta"},
   },
   {
      name = "Eat spaghetti",
      hint = "farming:spaghetti",
      feat = "eat_spaghetti",
      count = 1,
      reward = "default:papyrus 10",
      item_eat = {"farming:spaghetti"},
   },
   {
      name = "Eat a toast",
      hint = "farming:toast_sandwich",
      feat = "make_toast_sandwich",
      count = 1,
      reward = "farming:scythe_mithril",
      craft = {"farming:toast_sandwich"},
   },
   {
      name = "Make a cat",
      hint = "mobs_animal:kitten",
      feat = "make_kitten",
      count = 1,
      reward = "default:sand 20",
      craft = {"mobs_animal:kitten"},
   },
   {
      name = "Make TNT",
      hint = "tnt:tnt",
      feat = "make_tnt",
      count = 1,
      reward = "lucky_block:super_lucky_block",
      craft = {"tnt:tnt"},
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
		..'label[0,0.5; Too easy for you?...]'
		..'label[0,1.0; .]'
		..'label[0,1.5; .]'
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
