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

local level = 7

--
-- PUBLIC FUNCTIONS
--

skyblock.levels[level] = {}

-- feats
-- Parts of this are purely hypothetical and not implement yet
skyblock.levels[level].feats = {
   {
      name = "Make a cart",
      hint = "carts:cart",
      feat = "make_cart",
      count = 1,
      reward = "farming:coffee_cup_hot",
      craft = {"carts:cart"}
   },
   {
      name = "Make a rail for your cart",
      hint = "carts:rail",
      feat = "make_cart_rail",
      count = 1,
      reward = "mobs_turtles:turtle",
      placenode = {"carts:rail"},
   },
   {
      name = "Make mese wires and place them",
      hint = "mesecons:wire_00000000_off",
      feat = "make_mese_wire",
      count = 50,
      reward = "default:pine_sapling 2",
      placenode = {"mesecons:wire_00000000_off"}
   },
   {
      name = "Make a piston",
      hint = "mesecons_pistons:piston_normal_off",
      feat = "make_piston",
      count = 1,
      reward = "default:blueberry_bush_sapling 2",
      craft = {"mesecons_pistons:piston_normal_off"}
   },
   {
      name = "Make a switch",
      hint = "mesecons_switch:mesecon_switch_off",
      feat = "make_switch",
      count = 1,
      reward = "mobs_animal:penguin 2",
      craft = {"mesecons_switch:mesecon_switch_off"},
   },
   {
      name = "Make a electric torch",
      hint = "mesecons_torch:mesecon_torch_on",
      feat = "make_electric_torch",
      count = 1,
      reward = "default:sand 30",
      craft = {"mesecons_torch:mesecon_torch_on"},
   },
   {
      name = "Make a microcontroller",
      hint = "mesecons_microcontroller:microcontroller0000",
      feat = "make_microcontroller",
      count = 1,
      reward = "flowers:flower_dandelion_yellow 5",
      craft = {"mesecons_microcontroller:microcontroller0000"},
   },
   {
      name = "Make a player detector",
      hint = "mesecons_detector:object_detector_off",
      feat = "make_player_detector",
      count = 1,
      reward = "flowers:flower_viola 4",
      craft = {"mesecons_detector:object_detector_off"},
   },
   {
      name = "Make a solar panel",
      hint = "mesecons_solarpanel:solar_panel_off",
      feat = "make_solar_panel",
      count = 1,
      reward = "default:acacia_bush_sapling",
      placenode = {"mesecons_solarpanel:solar_panel_off"},
   },
   {
      name = "Make a power plant",
      hint = "mesecons_powerplant:power_plant",
      feat = "make_power_plant",
      count = 1,
      reward = "farming:flour 5",
      craft = {"mesecons_powerplant:power_plant"},
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
		..'label[0,0.5; Lets start being]'
		..'label[0,1.0; more technological...]'
		..'label[0,1.5; By using MESE!!]'
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
