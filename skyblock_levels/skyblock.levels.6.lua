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

local level = 6

--
-- PUBLIC FUNCTIONS
--

skyblock.levels[level] = {}

-- feats
-- Parts of this are purely hypothetical and not implement yet
skyblock.levels[level].feats = {
   {
      name = "Make Bronze",
      hint = "default:bronze_ingot",
      feat = "make_bronze_ingot",
      count = 1,
      reward = "default:blueberries",
      craft = {"default:bronze_ingot"}
   },
   {
      name = "Make a Bronze Chestplate",
      hint = "3d_armor:chestplate_bronze",
      feat = "make_bronze_chestplate",
      count = 1,
      reward = "mobs:butter",
      craft = {"3d_armor:chestplate_bronze"},
   },
   {
      name = "Make a Bronze Sword",
      hint = "default:sword_bronze",
      feat = "make_bronze_sword",
      count = 1,
      reward = "mobs:glass_milk 2",
      craft = {"default:sword_bronze"}
   },
   {
      name = "Make a Gold Helmet",
      hint = "3d_armor:helmet_gold",
      feat = "make_gold_helmet",
      count = 1,
      reward = "default:mese",
      craft = {"3d_armor:helmet_gold"}
   },
   {
      name = "Kill the crocodile with your bronze sword!!",
      hint = "mobs_crocs:crocodile",
      feat = "kill_crocodile",
      count = 10,
      reward = "moreores:mithril_lump",
      sworduse = {},
      use_item = "default:sword_bronze",
   },
   {
      name = "Make a mithril sword",
      hint = "moreores:sword_mithril",
      feat = "make_mithril_sword",
      count = 1,
      reward = "mobs:egg 5",
      craft = {"moreores:sword_mithril"},
   },
   {
      name = "Make a mithril chestplate",
      hint = "3d_armor:chestplate_mithril",
      feat = "make_mithril_chestplate",
      count = 1,
      reward = "shields:shield_mithril",
      craft = {"3d_armor:chestplate_mithril"},
   },
   {
      name = "Build a house made with gold",
      hint = "default:goldblock",
      feat = "make_gold_block",
      count = 20,
      reward = "farming:garlic",
      placenode = {"default:goldblock"},
   },
   {
      name = "Build a house made with mese",
      hint = "default:mese",
      feat = "make_mese_block",
      count = 20,
      reward = "moreores:axe_mithril",
      placenode = {"default:mese"},
   },
   {
      name = "Make a Lucky Block and break it",
      hint = "lucky_block:lucky_block",
      feat = "make_lucky_block",
      count = 1,
      reward = "lucky_block:super_lucky_block",
      dignode = {"lucky_block:lucky_block"},
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
		..'label[0,0.5; Time to get Rich!]'
		..'label[0,1.0; Dress up with the most]'
		..'label[0,1.5; valuable things you]'
		..'label[0,2.0; can find in Minetest.]'

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
-- reward_feat
skyblock.levels[level].reward_feat = function(player_name, feat)
	local rewarded = skyblock.levels.reward_feat(level, player_name, feat)

	if rewarded and feat == 'make_gold_helmet' then
		local pos = skyblock.get_spawn(player_name)
		local y_up = 1
		while 1 == 1 do
			local node = minetest.get_node({x=pos.x, y=pos.y+y_up, z=pos.z}).name
			if node ~= "air" then
				if node ~= "ignore" then
					break
				else
					-- Err, place at player's pos...
					pos = minetest.get_player_by_name(player_name):get_pos()
					y_up = -1 -- Will get back to 0
				end
				y_up = y_up + 1
			else
				break
			end
		end
      minetest.add_entity({x=pos.x,y=pos.y+y_up,z=pos.z}, "mobs_crocs:crocodile")
		return true
	end

	return rewarded
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

-- track hoe use
skyblock.levels[level].sword_on_use = function(player_name, wieldeditem)
   skyblock.levels.sword_on_use(level, player_name, wieldeditem)
end

skyblock.levels[level].bucket_on_use = function(player_name, pointed_thing) end
skyblock.levels[level].bucket_water_on_use = function(player_name, pointed_thing) end
skyblock.levels[level].bucket_lava_on_use = function(player_name, pointed_thing) end
