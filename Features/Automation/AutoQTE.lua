---@module Features.Automation.AutoQTE
local AutoQTE = {}

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.TaskSpawner
local TaskSpawner = require("Utility/TaskSpawner")

local maid = Maid.new()

local replicatedStorage = game:GetService("ReplicatedStorage")

local KEYS = { "Q", "E" }

---Return a randomised human-like delay in seconds.
local function humanDelay()
	local base = math.random(150, 380) / 1000
	-- ~12% chance of a brief hesitation
	if math.random(1, 8) == 1 then
		base = base + math.random(150, 280) / 1000
	end
	return base
end

function AutoQTE.init()
	local qteRemote = replicatedStorage:WaitForChild("QTERemote")

	maid:add(qteRemote.OnClientEvent:Connect(function(event, _, totalKeys)
		if event ~= "Start" then return end
		if not Configuration.expectToggleValue("AutoQTE") then return end

		TaskSpawner.spawn("AutoQTE.solve", function()
			local count = totalKeys or 10
			for i = 1, count do
				-- Check toggle each iteration in case user turns it off mid-QTE.
				if not Configuration.expectToggleValue("AutoQTE") then break end

				task.wait(humanDelay())

				-- Alternate keys randomly to look natural.
				local key = KEYS[math.random(1, #KEYS)]
				qteRemote:FireServer("KeyPressed", key)
			end
		end)
	end))
end

function AutoQTE.detach()
	maid:clean()
end

return AutoQTE
