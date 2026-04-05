---@module Features.Game.Monitoring
local Monitoring = { subject = nil, seen = {} }

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.OriginalStore
local OriginalStore = require("Utility/OriginalStore")

---@module Utility.CoreGuiManager
local CoreGuiManager = require("Utility/CoreGuiManager")

---@module Utility.Logger
local Logger = require("Utility/Logger")

local monitoringMaid = Maid.new()
local cameraSubject = monitoringMaid:mark(OriginalStore.new())

local players = game:GetService("Players")
local runService = game:GetService("RunService")
local starterGui = game:GetService("StarterGui")

local renderStepped = Signal.new(runService.RenderStepped)
local beepSound = CoreGuiManager.imark(Instance.new("Sound"))

local lastUpdate = os.clock()

---Get the local player's HumanoidRootPart position.
---@return Vector3?
local function getLocalRoot()
	local char = players.LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	return hrp and hrp.Position
end

---Get all players within a given stud range.
---@param range number
---@return Player[]
local function getPlayersInRange(range)
	local localPos = getLocalRoot()
	if not localPos then return {} end

	local result = {}
	for _, player in ipairs(players:GetPlayers()) do
		if player == players.LocalPlayer then continue end
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp and (hrp.Position - localPos).Magnitude <= range then
			result[#result + 1] = player
		end
	end
	return result
end

local function updateProximity()
	local range = Configuration.expectOptionValue("PlayerProximityRange") or 350

	local inRange = getPlayersInRange(range)
	local inRangeSet = {}
	for _, p in ipairs(inRange) do inRangeSet[p] = true end

	-- Remove players who left range.
	for player, removeNotif in next, Monitoring.seen do
		if not inRangeSet[player] then
			removeNotif()
			Monitoring.seen[player] = nil
		end
	end

	-- Notify new players entering range.
	for _, player in ipairs(inRange) do
		if Monitoring.seen[player] then continue end

		Monitoring.seen[player] = Logger.mnnotify(
			"%s entered your proximity radius of %i studs.",
			player.Name,
			range
		)

		if Configuration.expectToggleValue("PlayerProximityBeep") then
			beepSound.SoundId = "rbxassetid://100849623977896"
			beepSound.PlaybackSpeed = 1
			beepSound.Volume = Configuration.expectOptionValue("PlayerProximityBeepVolume") or 0.1
			beepSound:Play()
		end
	end
end

local function updateSpectating()
	if Monitoring.subject then
		cameraSubject:set(workspace.CurrentCamera, "CameraSubject", Monitoring.subject)
	else
		cameraSubject:restore()
	end
end

local function updateRobloxChat()
	local show = Configuration.expectToggleValue("ShowRobloxChat")
	pcall(starterGui.SetCoreGuiEnabled, starterGui, Enum.CoreGuiType.Chat, show)
end

local function updateMonitoring()
	updateSpectating()

	if os.clock() - lastUpdate <= 1.0 then return end
	lastUpdate = os.clock()

	if Configuration.expectToggleValue("PlayerProximity") then
		updateProximity()
	end

	updateRobloxChat()
end

---Toggle spectating a player. Pass nil to reset.
---@param player Player?
function Monitoring.spectate(player)
	if not player or not player.Character then
		Monitoring.subject = nil
		Logger.notify("Spectating reset.")
		return
	end

	local hrp = player.Character:FindFirstChild("HumanoidRootPart")
	Monitoring.subject = (Monitoring.subject ~= hrp) and hrp or nil

	if Monitoring.subject then
		Logger.notify("Spectating %s.", player.Name)
	else
		Logger.notify("Stopped spectating.")
	end
end

function Monitoring.init()
	monitoringMaid:add(renderStepped:connect("Monitoring_RenderStepped", updateMonitoring))
	Logger.warn("Monitoring initialized.")
end

function Monitoring.detach()
	for _, removeNotif in next, Monitoring.seen do removeNotif() end
	Monitoring.seen = {}
	Monitoring.subject = nil
	monitoringMaid:clean()
	Logger.warn("Monitoring detached.")
end

return Monitoring
