---@module Features.Visuals.Objects.EntityESP
local EntityESP = require("Features/Visuals/Objects/EntityESP")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@class TitanESP: EntityESP
local TitanESP = setmetatable({}, { __index = EntityESP })
TitanESP.__index = TitanESP
TitanESP.__type = "TitanESP"

local ESP_HEALTH = "[%i/%i HP]"

TitanESP.update = LPH_NO_VIRTUALIZE(function(self)
	local titan = self.entity
	if not titan or not titan.Parent then
		return self:visible(false)
	end

	-- Prefer a TitanType attribute, fall back to model name.
	self.label = titan:GetAttribute("TitanType") or titan.Name

	local humanoid = titan:FindFirstChildOfClass("Humanoid")
	local tags = {}

	if humanoid then
		tags[#tags + 1] = ESP_HEALTH:format(math.floor(humanoid.Health), math.floor(humanoid.MaxHealth))
	end

	if Configuration.idToggleValue(self.identifier, "ShowNape") then
		local nape = titan:FindFirstChild("Nape")
		if nape then
			tags[#tags + 1] = "[NAPE]"
		end
	end

	EntityESP.update(self, tags)
end)

function TitanESP.new(identifier, titan)
	if not titan:IsA("Model") then
		return error("TitanESP expected a Model.")
	end

	local self = setmetatable(EntityESP.new(titan, identifier, titan.Name), TitanESP)

	if not Configuration.expectOptionValue("NoPersisentESP") then
		titan.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
	end

	self:setup()
	self:build()
	self:update()

	return self
end

return TitanESP
