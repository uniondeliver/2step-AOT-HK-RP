---@module Features.Visuals.WorldVisuals
local WorldVisuals = {}

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.OriginalStore
local OriginalStore = require("Utility/OriginalStore")

---@module Utility.OriginalStoreManager
local OriginalStoreManager = require("Utility/OriginalStoreManager")

---@module Utility.Logger
local Logger = require("Utility/Logger")

local wvMaid = Maid.new()
local fogMap = wvMaid:mark(OriginalStoreManager.new())
local lightingStore = wvMaid:mark(OriginalStore.new())
local ambienceMap = wvMaid:mark(OriginalStoreManager.new())
local fovStore = wvMaid:mark(OriginalStore.new())

local lighting = game:GetService("Lighting")
local runService = game:GetService("RunService")

local renderStepped = Signal.new(runService.RenderStepped)

local function updateNoFog()
	for _, obj in ipairs(lighting:GetChildren()) do
		if obj:IsA("Atmosphere") then
			fogMap:add(obj, "Density", 0)
			fogMap:add(obj, "Haze", 0)
		elseif obj:IsA("FogValue") or obj.Name == "Fog" then
			fogMap:add(obj, "FogEnd", 1e6)
		end
	end

	-- Also zero out lighting's built-in fog.
	fogMap:add(lighting, "FogEnd", 1e6)
	fogMap:add(lighting, "FogStart", 1e6)
end

local function updateFullbright()
	lightingStore:set(lighting, "Brightness", 10)
	lightingStore:set(lighting, "ClockTime", 12)
	lightingStore:set(lighting, "ShadowSoftness", 0)

	for _, obj in ipairs(lighting:GetChildren()) do
		if obj:IsA("Atmosphere") then
			fogMap:add(obj, "Brightness", 1)
		end
	end
end

local function updateAmbience()
	local useOriginal = Configuration.expectToggleValue("OriginalAmbienceColor")
	local colorOption = Options and Options["AmbienceColor"]
	local color = useOriginal and lighting.Ambient or (colorOption and colorOption.Value)

	if not color then return end

	local brightness = Configuration.expectOptionValue("OriginalAmbienceColorBrightness") or 0
	local boosted = useOriginal
		and Color3.new(
			math.clamp(color.R + brightness / 255, 0, 1),
			math.clamp(color.G + brightness / 255, 0, 1),
			math.clamp(color.B + brightness / 255, 0, 1)
		)
		or color

	ambienceMap:add(lighting, "Ambient", boosted)
	ambienceMap:add(lighting, "OutdoorAmbient", boosted)
end

local function updateFOV()
	local camera = workspace.CurrentCamera
	if not camera then return end
	fovStore:set(camera, "FieldOfView", Configuration.expectOptionValue("FieldOfView") or 90)
end

local function update()
	if Configuration.expectToggleValue("Fullbright") then
		updateFullbright()
	else
		lightingStore:restore()
	end

	if Configuration.expectToggleValue("NoFog") then
		updateNoFog()
	else
		fogMap:restore()
	end

	if Configuration.expectToggleValue("ModifyAmbience") then
		updateAmbience()
	else
		ambienceMap:restore()
	end

	if Configuration.expectToggleValue("ModifyFieldOfView") then
		updateFOV()
	else
		fovStore:restore()
	end
end

function WorldVisuals.init()
	wvMaid:add(renderStepped:connect("WorldVisuals_RenderStepped", update))
	Logger.warn("WorldVisuals initialized.")
end

function WorldVisuals.detach()
	wvMaid:clean()
	Logger.warn("WorldVisuals detached.")
end

return WorldVisuals
