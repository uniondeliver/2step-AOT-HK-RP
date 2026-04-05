local Features = {}

---@module Features.Visuals.Visuals
local Visuals = require("Features/Visuals/Visuals")

---@module Features.Visuals.WorldVisuals
local WorldVisuals = require("Features/Visuals/WorldVisuals")

---@module Features.Automation.AutoQTE
local AutoQTE = require("Features/Automation/AutoQTE")

---@module Features.Game.Movement
local Movement = require("Features/Game/Movement")

---@module Features.Game.Monitoring
local Monitoring = require("Features/Game/Monitoring")

---@module Features.Game.TeleportTool
local TeleportTool = require("Features/Game/TeleportTool")

---@module Features.Game.InfiniteGas
local InfiniteGas = require("Features/Game/InfiniteGas")

---@module Features.Game.InfiniteBlade
local InfiniteBlade = require("Features/Game/InfiniteBlade")

---@module Features.Combat.NapeExpander
local NapeExpander = require("Features/Combat/NapeExpander")

function Features.init()
	Visuals.init()
	WorldVisuals.init()
	AutoQTE.init()
	Movement.init()
	Monitoring.init()
	InfiniteGas.init()
	InfiniteBlade.init()
	NapeExpander.init()
end

function Features.detach()
	Visuals.detach()
	WorldVisuals.detach()
	AutoQTE.detach()
	Movement.detach()
	Monitoring.detach()
	InfiniteGas.detach()
	InfiniteBlade.detach()
	NapeExpander.detach()
end

return Features
