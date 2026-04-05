---@module Features.Game.InfiniteBlade
local InfiniteBlade = {}

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

local maid = Maid.new()

local replicatedStorage = game:GetService("ReplicatedStorage")

local bladeWearRemote = nil
local deductBladeRemote = nil
local OldNameCall = nil

function InfiniteBlade.init()
	local odmgRemotes = replicatedStorage:WaitForChild("Remotes"):WaitForChild("ODMG")
	bladeWearRemote = odmgRemotes:WaitForChild("BladeWear")
	deductBladeRemote = odmgRemotes:WaitForChild("DeductBladeState")

	OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		if not checkcaller() then
			if getnamecallmethod() == "FireServer" and Configuration.expectToggleValue("InfiniteBlade") then
				if self == bladeWearRemote or self == deductBladeRemote then
					return
				end
			end
		end
		return OldNameCall(self, ...)
	end))

	maid:add(function()
		if OldNameCall then
			hookmetamethod(game, "__namecall", OldNameCall)
			OldNameCall = nil
		end
		bladeWearRemote = nil
		deductBladeRemote = nil
	end)
end

function InfiniteBlade.detach()
	maid:clean()
end

return InfiniteBlade
