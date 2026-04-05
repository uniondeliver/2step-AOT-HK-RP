---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Utility.TaskSpawner
local TaskSpawner = require("Utility/TaskSpawner")

---@module Utility.Profiler
local Profiler = require("Utility/Profiler")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Features.Visuals.Group
local Group = require("Features/Visuals/Group")

---@module Features.Visuals.Objects.PlayerESP
local PlayerESP = require("Features/Visuals/Objects/PlayerESP")

---@module Features.Visuals.Objects.TitanESP
local TitanESP = require("Features/Visuals/Objects/TitanESP")

local Visuals = {}

local runService = game:GetService("RunService")
local players = game:GetService("Players")

local renderStepped = Signal.new(runService.RenderStepped)
local visualsMaid = Maid.new()

local groups = {}
local lastESPUpdate = os.clock()

---Add or get the group for an identifier, then insert the object.
local emplaceObject = LPH_NO_VIRTUALIZE(function(instance, object)
	local group = groups[object.identifier] or Group.new(object.identifier)
	group:insert(instance, object)
	groups[object.identifier] = group
end)

---Remove an instance from all groups and detach its ESP object.
local onInstanceRemoving = LPH_NO_VIRTUALIZE(function(inst)
	for _, group in next, groups do
		local object = group:remove(inst)
		if object then
			object:detach()
		end
	end
end)

---Update all ESP groups, throttled by ESPRefreshRate.
local updateESP = LPH_NO_VIRTUALIZE(function()
	if Configuration.expectToggleValue("ESPLimitUpdates") then
		local rate = Configuration.expectOptionValue("ESPRefreshRate") or 30
		if os.clock() - lastESPUpdate <= 1 / rate then return end
	end

	lastESPUpdate = os.clock()

	for _, group in next, groups do
		group:update()
	end
end)

---Handle a player joining — create PlayerESP on each character spawn.
local onPlayerAdded = LPH_NO_VIRTUALIZE(function(player)
	if player == players.LocalPlayer then return end

	local characterAdded = Signal.new(player.CharacterAdded)
	local characterRemoving = Signal.new(player.CharacterRemoving)
	local playerDestroying = Signal.new(player.Destroying)

	local addedId, removingId, destroyingId

	addedId = visualsMaid:add(characterAdded:connect("Visuals_CharacterAdded_" .. player.UserId, function(character)
		onInstanceRemoving(player)
		emplaceObject(player, PlayerESP.new("Player", player, character))
	end))

	removingId = visualsMaid:add(characterRemoving:connect("Visuals_CharacterRemoving_" .. player.UserId, function()
		onInstanceRemoving(player)
	end))

	destroyingId = visualsMaid:add(playerDestroying:connect("Visuals_PlayerDestroying_" .. player.UserId, function()
		visualsMaid[addedId] = nil
		visualsMaid[removingId] = nil
		visualsMaid[destroyingId] = nil
	end))

	if player.Character then
		emplaceObject(player, PlayerESP.new("Player", player, player.Character))
	end
end)

---Handle a titan model appearing in AliveTitans.
local onTitanAdded = LPH_NO_VIRTUALIZE(function(titan)
	if not titan:IsA("Model") then return end
	if not titan:GetAttribute("TitanModel") then return end

	-- Wait for the humanoid to exist before creating ESP.
	TaskSpawner.spawn("Visuals_TitanESP_" .. titan.Name, function()
		local humanoid = titan:FindFirstChildOfClass("Humanoid") or titan:WaitForChild("Humanoid", 5)
		if not humanoid then return end
		if not titan.Parent then return end
		emplaceObject(titan, TitanESP.new("Titan", titan))
	end)
end)

function Visuals.init()
	local aliveTitans = workspace:WaitForChild("AliveTitans")

	-- Existing players.
	for _, player in ipairs(players:GetPlayers()) do
		TaskSpawner.spawn("Visuals_InitPlayer_" .. player.Name, onPlayerAdded, player)
	end

	-- Existing titans.
	for _, titan in ipairs(aliveTitans:GetChildren()) do
		TaskSpawner.spawn("Visuals_InitTitan_" .. titan.Name, onTitanAdded, titan)
	end

	-- Player tracking.
	local playerAddedSignal = Signal.new(players.PlayerAdded)
	visualsMaid:add(playerAddedSignal:connect("Visuals_PlayerAdded", onPlayerAdded))

	-- Titan tracking.
	local titanAddedSignal = Signal.new(aliveTitans.ChildAdded)
	local titanRemovedSignal = Signal.new(aliveTitans.ChildRemoved)
	visualsMaid:add(titanAddedSignal:connect("Visuals_TitanAdded", onTitanAdded))
	visualsMaid:add(titanRemovedSignal:connect("Visuals_TitanRemoved", onInstanceRemoving))

	-- Update loop.
	visualsMaid:add(renderStepped:connect("Visuals_RenderStepped", updateESP))

	Logger.warn("Visuals initialized.")
end

function Visuals.detach()
	for _, group in next, groups do
		group:detach()
	end

	visualsMaid:clean()

	Logger.warn("Visuals detached.")
end

return Visuals
