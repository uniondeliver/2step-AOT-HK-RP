---@module Features.Visuals.Objects.EntityESP
local EntityESP = require("Features/Visuals/Objects/EntityESP")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Game.PlayerScanning
local PlayerScanning = require("Game/PlayerScanning")

---@class PlayerESP: EntityESP
local PlayerESP = setmetatable({}, { __index = EntityESP })
PlayerESP.__index = PlayerESP
PlayerESP.__type = "PlayerESP"

local players = game:GetService("Players")

local ESP_HEALTH = "[%i/%i HP]"
local ESP_HEALTH_PCT = "[%.0f%%]"

PlayerESP.update = LPH_NO_VIRTUALIZE(function(self)
	local localPlayer = players.LocalPlayer
	local localCharacter = localPlayer.Character
	local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

	if not localRoot then return self:visible(false) end

	local entity = self.entity
	local player = self.player
	local identifier = self.identifier

	local humanoid = entity:FindFirstChildOfClass("Humanoid")
	if not humanoid then return self:visible(false) end

	local root = entity:FindFirstChild("HumanoidRootPart")
	if not root then return self:visible(false) end

	if
		PlayerScanning.isAlly(player)
		and Configuration.idToggleValue(identifier, "HideIfAlly")
		and Configuration.idToggleValue(identifier, "MarkAllies")
	then
		return self:visible(false)
	end

	-- Name.
	local nameType = Configuration.idOptionValue(identifier, "PlayerNameType")
	if nameType == "Roblox Display Name" then
		self.label = player.DisplayName
	else
		self.label = player.Name
	end

	-- Tags.
	local tags = {}

	if Configuration.idToggleValue(identifier, "ShowHealthPercentage") then
		tags[#tags + 1] = ESP_HEALTH_PCT:format((humanoid.Health / humanoid.MaxHealth) * 100)
	else
		tags[#tags + 1] = ESP_HEALTH:format(math.floor(humanoid.Health), math.floor(humanoid.MaxHealth))
	end

	EntityESP.update(self, tags)

	-- Ally color on name label.
	local label = self.ncontainer:FindFirstChildOfClass("TextLabel")
	if not label then return end

	if Configuration.idToggleValue(identifier, "MarkAllies") and PlayerScanning.isAlly(player) then
		label.TextColor3 = Configuration.idOptionValue(identifier, "AllyColor") or Color3.new(0, 1, 0)
	end
end)

function PlayerESP.new(identifier, player, character)
	local self = setmetatable(EntityESP.new(character, identifier, player.Name), PlayerESP)
	self.player = player
	self.identifier = identifier

	if character and character:IsA("Model") and not Configuration.expectOptionValue("NoPersisentESP") then
		character.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
	end

	self:setup()
	self:build()
	self:update()

	return self
end

return PlayerESP
