---@module Features.Game.InfiniteGas
local InfiniteGas = {}

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.TaskSpawner
local TaskSpawner = require("Utility/TaskSpawner")

local maid = Maid.new()

local players = game:GetService("Players")

local GAS_ATTRS = { "RightGas", "LeftGas" }

---Lock a character attribute at its current max value.
---@param character Model
---@param attr string
local function lockAttr(character, attr)
	local max = character:GetAttribute(attr) or 0

	maid:add(character:GetAttributeChangedSignal(attr):Connect(function()
		if not Configuration.expectToggleValue("InfiniteGas") then return end
		local current = character:GetAttribute(attr) or 0
		if current > max then
			max = current
		elseif current < max then
			character:SetAttribute(attr, max)
		end
	end))
end

local function setup(character)
	TaskSpawner.spawn("InfiniteGas.setup", function()
		task.wait(1)
		for _, attr in ipairs(GAS_ATTRS) do
			lockAttr(character, attr)
		end
	end)
end

function InfiniteGas.init()
	local localPlayer = players.LocalPlayer
	maid:add(localPlayer.CharacterAdded:Connect(setup))
	if localPlayer.Character then
		setup(localPlayer.Character)
	end
end

function InfiniteGas.detach()
	maid:clean()
end

return InfiniteGas
