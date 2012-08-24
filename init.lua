--[[

SkyBlock for MineTest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-skyblock
License: GPLv3

MAIN LOADER

]]--

-- expose functions to other modules
skyblock = {}

-- load config and functions
dofile(minetest.get_modpath("skyblock").."/config.lua")
dofile(minetest.get_modpath("skyblock").."/table_save.lua")
dofile(minetest.get_modpath("skyblock").."/api.lua")
dofile(minetest.get_modpath("skyblock").."/achievements.lua")

-- register entities
dofile(minetest.get_modpath("skyblock").."/register_alias.lua")
dofile(minetest.get_modpath("skyblock").."/register_node.lua")
dofile(minetest.get_modpath("skyblock").."/register_craft.lua")
dofile(minetest.get_modpath("skyblock").."/register_abm.lua")
dofile(minetest.get_modpath("skyblock").."/register_misc.lua")

-- log that we started
minetest.log("action", "[SkyBlock] loaded")