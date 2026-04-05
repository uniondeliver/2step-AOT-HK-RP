-- Menu module.
local Menu = {}

---@module GUI.ThemeManager
local ThemeManager = require("GUI/ThemeManager")

---@module GUI.SaveManager
local SaveManager = require("GUI/SaveManager")

---@module GUI.Library
local Library = require("GUI/Library")

---@module Menu.CombatTab
local CombatTab = require("Menu/CombatTab")

---@module Menu.GameTab
local GameTab = require("Menu/GameTab")

---@module Menu.VisualsTab
local VisualsTab = require("Menu/VisualsTab")

---@module Menu.2STEPTab (Settings)
local SettingsTab = require("Menu/2STEPTab")

---@module Menu.AutomationTab
local AutomationTab = require("Menu/AutomationTab")

---@module Menu.ExploitTab
local ExploitTab = require("Menu/ExploitTab")

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

-- Services.
local runService = game:GetService("RunService")
local stats = game:GetService("Stats")
local players = game:GetService("Players")

-- Signals.
local renderStepped = Signal.new(runService.RenderStepped)

-- Maids.
local menuMaid = Maid.new()

-- Constants.
local MENU_TITLE = "2STEP"

---Initialize menu.
function Menu.init()
	local window = Library:CreateWindow({
		Title = MENU_TITLE,
		Center = true,
		AutoShow = not (shared.TwoStep and shared.TwoStep.silent),
		TabPadding = 8,
		MenuFadeTime = 0.0,
	})

	ThemeManager:SetLibrary(Library)
	ThemeManager:SetFolder("2STEP-Themes")

	SaveManager:SetLibrary(Library)
	SaveManager:IgnoreThemeSettings()
	SaveManager:SetFolder("2STEP-Configs")
	SaveManager:SetIgnoreIndexes({
		"Fly",
		"NoClip",
		"Speedhack",
		"InfiniteJump",
	})

	CombatTab.init(window)
	GameTab.init(window)
	VisualsTab.init(window)
	ExploitTab.init(window)
	AutomationTab.init(window)
	SettingsTab.init(window)

	local lastUpdate = os.clock()

	menuMaid:add(renderStepped:connect(
		"Menu_WatermarkUpdate",
		LPH_NO_VIRTUALIZE(function()
			if os.clock() - lastUpdate <= 0.5 then
				return
			end

			lastUpdate = os.clock()

			local networkStats = stats:FindFirstChild("Network")
			local workspaceStats = stats:FindFirstChild("Workspace")
			local performanceStats = stats:FindFirstChild("PerformanceStats")
			local serverStats = networkStats and networkStats:FindFirstChild("ServerStatsItem") or nil

			local pingData = serverStats and serverStats:FindFirstChild("Data Ping") or nil
			local heartbeatData = workspaceStats and workspaceStats:FindFirstChild("Heartbeat") or nil
			local cpuData = performanceStats and performanceStats:FindFirstChild("CPU") or nil
			local gpuData = performanceStats and performanceStats:FindFirstChild("GPU") or nil

			local ping = pingData and pingData:GetValue() or 0.0
			local fps = heartbeatData and heartbeatData:GetValue() or 0.0
			local cpu = cpuData and cpuData:GetValue() or 0.0
			local gpu = gpuData and gpuData:GetValue() or 0.0

			local mouse = players.LocalPlayer and players.LocalPlayer:GetMouse()
			local position = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position
			local positionFormat = position and string.format("(%.2f, %.2f, %.2f)", position.X, position.Y, position.Z)
				or "N/A"

			local str = string.format("%s | %.2fms | %.1f/s | %.1fms | %.1fms", MENU_TITLE, ping, fps, cpu, gpu)

			if Configuration.expectToggleValue("ShowDebugInformation") then
				str = str .. string.format(" | %s", positionFormat)
				str = str .. string.format(" | %s", mouse and mouse.Target and mouse.Target:GetFullName() or "N/A")
			end

			Library:SetWatermark(str)
		end)
	))

	Library.ToggleKeybind = Options.MenuKeybind

	SaveManager:LoadAutoloadConfig()

	Logger.warn("Menu initialized.")
end

---Detach menu.
function Menu.detach()
	menuMaid:clean()

	Library:Unload()

	Logger.warn("Menu detached.")
end

return Menu
