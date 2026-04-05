---@module Features.Game.InfiniteHook
local InfiniteHook = {}

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

local maid = Maid.new()

local players = game:GetService("Players")

local OldNameCall = nil


---Check if the calling script is the ODMG client.
---@return boolean
local function isODMGCaller()
	local ok, script = pcall(getcallingscript)
	if not ok or not script then return false end
	return script.Name == "Client"
		and script.Parent
		and script.Parent.Name == "ODMG"
end

function InfiniteHook.init()
	OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		if not checkcaller() then
			local method = getnamecallmethod()

			if method == "Raycast" and self == workspace then
				if Configuration.expectToggleValue("InfiniteHook") and isODMGCaller() then
					local origin, direction, params = ...
					if direction and direction.Magnitude > 0 then
						local range = Configuration.expectOptionValue("HookRange") or 500
						return OldNameCall(self, origin, direction.Unit * range, params)
					end
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
	end)
end

function InfiniteHook.detach()
	maid:clean()
end

return InfiniteHook
