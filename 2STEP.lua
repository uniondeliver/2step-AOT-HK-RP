-- Detach and initialize a 2STEP instance.
-- Exposes shared.TwoStep for GUI/Library.lua access.
local TwoStep = { queued = false, silent = false }

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Menu
local Menu = require("Menu")

---@module Features
local Features = require("Features")

---@module Utility.ControlModule
local ControlModule = require("Utility/ControlModule")

---@module Game.Timings.SaveManager
local SaveManager = require("Game/Timings/SaveManager")

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Game.Timings.ModuleManager
local ModuleManager = require("Game/Timings/ModuleManager")

---@module Utility.CoreGuiManager
local CoreGuiManager = require("Utility/CoreGuiManager")

---@module Utility.PersistentData
local PersistentData = require("Utility/PersistentData")

---@module Game.PlayerScanning
local PlayerScanning = require("Game/PlayerScanning")

---@module Game.Keybinding
local Keybinding = require("Game/Keybinding")

-- 2STEP maid.
local stepMaid = Maid.new()

-- Services.
local playersService = game:GetService("Players")

-- Timestamp.
local startTimestamp = os.clock()

---Initialize instance.
function TwoStep.init()
	shared.TwoStep = TwoStep
	local localPlayer = nil

	repeat
		task.wait()
	until game:IsLoaded()

	repeat
		localPlayer = playersService.LocalPlayer
	until localPlayer ~= nil

	PersistentData.init()

	if isfile and isfile("smarker_ts.txt") then
		TwoStep.silent = true
	end

	PlayerScanning.init()

	Keybinding.init()

	CoreGuiManager.set()

	SaveManager.init()

	ModuleManager.refresh()

	ControlModule.init()

	Features.init()

	Menu.init()

	Logger.notify("Script has been initialized in %ims.", (os.clock() - startTimestamp) * 1000)
end

---Detach instance.
function TwoStep.detach()
	stepMaid:clean()

	PlayerScanning.detach()

	Keybinding.detach()

	ModuleManager.detach()

	SaveManager.detach()

	Menu.detach()

	ControlModule.detach()

	Features.detach()

	CoreGuiManager.clear()

	Logger.warn("Script has been detached.")
end

return TwoStep
