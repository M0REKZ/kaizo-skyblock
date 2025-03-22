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

local level = 5

--
-- PUBLIC FUNCTIONS
--

skyblock.levels[level] = {}

-- feats
-- Parts of this are purely hypothetical and not implement yet
skyblock.levels[level].feats = {
   {
      name = "Make a corral for your animals",
      hint = "default:fence_wood",
      feat = "make_corral",
      count = 10,
      reward = "mobs_animal:cow 2",
      placenode = {"default:fence_wood"}
   },
   {
      name = "Drink Milk",
      hint = "mobs:bucket_milk",
      feat = "eat_cow_milk",
      count = 1,
      reward = "mobs:shears",
      item_eat = {"mobs:bucket_milk"},
   },
   {
      name = "Make Cheese and eat it",
      hint = "mobs:cheese",
      feat = "make_cheese_eat",
      count = 1,
      reward = "default:pine_sapling 2",
      item_eat = {"mobs:cheese"}
   },
   {
      name = "Make a Cheese Block",
      hint = "mobs:cheeseblock",
      feat = "make_cheeseblock",
      count = 1,
      reward = "default:blueberry_bush_sapling 2",
      craft = {"mobs:cheeseblock"}
   },
   {
      name = "Eat a cow, dont forget to cook it!",
      hint = "mobs_animal:cow",
      feat = "eat_cow_meat",
      count = 1,
      reward = "mobs_animal:sheep_white 10",
      item_eat = {"mobs:meat"},
   },
   {
      name = "Make a bed",
      hint = "beds:bed",
      feat = "make_bed",
      count = 1,
      reward = "mobs_animal:chicken 4",
      placenode = {"beds:bed_bottom"},
   },
   {
      name = "Eat chicken, dont forget to cook it!",
      hint = "mobs:chicken_cooked",
      feat = "eat_chicken",
      count = 1,
      reward = "flowers:mushroom_brown 2",
      item_eat = {"mobs:chicken_cooked"},
   },
   {
      name = "Make a red carpet",
      hint = "wool:red",
      feat = "make_red_wool",
      count = 20,
      reward = "flowers:mushroom_red 2",
      placenode = {"wool:red"},
   },
   {
      name = "Make a fancy bed",
      hint = "beds:fancy_bed",
      feat = "make_fancy_bed",
      count = 1,
      reward = "mobs:cheeseblock",
      placenode = {"beds:fancy_bed_bottom"},
   },
   {
      name = "Make a Cheese house!!!",
      hint = "mobs:cheeseblock",
      feat = "make_cheese_house",
      count = 50,
      reward = "default:tin_lump",
      craft = {"farming:bottle_ethanol"},
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
		..'label[0,0.5; Animals!]'
		..'label[0,1.0; You will learn now how to]'
		..'label[0,1.5; take care of your mascots...]'
		..'label[0,2.0; Or not xD.]'

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
