---@module Utility.ReferencedMap
local ReferencedMap = require("Utility/ReferencedMap")

---@module Utility.Profiler
local Profiler = require("Utility/Profiler")

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@class Group: ReferencedMap
local Group = setmetatable({}, ReferencedMap)
Group.__index = Group

Group.object = LPH_NO_VIRTUALIZE(function(self, object)
	self.count = self.count + 1

	if not self.warned and self.count >= 500 then
		Logger.longNotify("(%s) Too many ESP objects — updates may stop.", object.identifier)
		self.warned = true
	end

	if self.count >= 500 then return end

	Profiler.run(string.format("ESP_Update_%s", object.identifier), object.update, object)
end)

Group.update = LPH_NO_VIRTUALIZE(function(self)
	local map = self:data()

	if not Configuration.idToggleValue(self.identifier, "Enable") then
		return self:hide()
	end

	if Configuration.expectToggleValue("ESPSplitUpdates") then
		local totalElements = #map
		local totalFrames = Configuration.expectOptionValue("ESPSplitFrames")
		local objectsPerPart = math.ceil(totalElements / totalFrames)
		local currentPart = self.part

		local startIdx = (currentPart - 1) * objectsPerPart + 1
		local endIdx = math.min(currentPart * objectsPerPart, totalElements)

		for idx = startIdx, endIdx do
			self:object(map[idx])
		end

		self.part = self.part + 1
		if self.part > totalFrames then
			self.count = 0
			self.part = 1
		end
	else
		for _, object in next, map do
			self:object(object)
		end
		self.part = 1
		self.count = 0
	end

	self.updated = true
end)

Group.hide = LPH_NO_VIRTUALIZE(function(self)
	if not self.updated then return end
	for _, object in next, self:data() do
		object:visible(false)
	end
	self.updated = false
end)

Group.detach = LPH_NO_VIRTUALIZE(function(self)
	for _, object in next, self:data() do
		object:detach()
	end
end)

function Group.new(identifier)
	local self = setmetatable(ReferencedMap.new(), Group)
	self.part = 1
	self.count = 0
	self.warned = false
	self.updated = true
	self.identifier = identifier
	return self
end

return Group
