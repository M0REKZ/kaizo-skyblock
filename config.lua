--[[

SkyBlock for MineTest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-skyblock
License: GPLv3

USER CONFIG

]]--

-- Should death result in a new spawn position
skyblock.NEW_SPAWN_ON_DEATH = 0 -- 0 or 1

-- How far apart to set players start positions
skyblock.START_GAP = 64

-- Radius of the starting sphere (0 to disable)
skyblock.SPHERE_RADIUS = 4

-- Width of the hollow sphere radius (nil for solid sphere, 0 for a cool effect)
skyblock.SPHERE_HOLLOW = nil

-- Which node to use for the sphere
skyblock.SPHERE_NODE = "default:dirt"

-- The Y position the spawn nodes will appear
skyblock.START_HEIGHT = 4

-- Surround the player with an ocean of water
skyblock.SEA = 1 -- 0 or 1

-- How many players will be in 1 row
-- skyblock.WORLD_WIDTH * skyblock.WORLD_WIDTH = total players
skyblock.WORLD_WIDTH = 100

-- How far down (in nodes) before a player dies and is respawned
skyblock.WORLD_BOTTOM = -32

-- Delay between skyblock respawn checks
skyblock.SPAWN_THROTLE = 2

-- Nodes above the spawn node where players are spawned
skyblock.SPAWN_HEIGHT = 4

-- Debug mode
skyblock.DEBUG = 1
