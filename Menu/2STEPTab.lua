-- Settings tab module.
local SettingsTab = {}

---@module GUI.ThemeManager
local ThemeManager = require("GUI/ThemeManager")

---@module GUI.SaveManager
local SaveManager = require("GUI/SaveManager")

---@module GUI.Library
local Library = require("GUI/Library")

---@module Utility.Logger
local Logger = require("Utility/Logger")

---Initialize Cheat Settings section.
---@param groupbox table
function SettingsTab.initCheatSettingsSection(groupbox)
	groupbox:AddButton("Toggle Silent Mode", function()
		if not isfile or not delfile or not writefile then
			return
		end

		shared.TwoStep.silent = not shared.TwoStep.silent

		if not shared.TwoStep.silent then
			Logger.notify("Silent mode was disabled.")
		end

		if isfile("smarker_ts.txt") then
			delfile("smarker_ts.txt")
		else
			writefile(
				"smarker_ts.txt",
				"Silent mode is enabled. Deleting this file will turn it off."
			)
		end
	end)

	groupbox:AddButton("Unload Cheat", function()
		shared.TwoStep.detach()
	end)
end

---Initialize UI Settings section.
---@param groupbox table
function SettingsTab.initUISettingsSection(groupbox)
	local menuBindLabel = groupbox:AddLabel("Menu Bind")

	menuBindLabel:AddKeyPicker("MenuKeybind", { Default = "LeftAlt", NoUI = true, Text = "Menu Keybind" })

	local keybindFrameLabel = groupbox:AddLabel("Keybind List Bind")

	keybindFrameLabel:AddKeyPicker("KeybindList", {
		Default = "N/A",
		Mode = "Off",
		NoUI = true,
		Text = "Keybind List",
		Callback = function(Value)
			Library.KeybindFrame.Visible = Value
		end,
	})

	local watermarkFrameLabel = groupbox:AddLabel("Watermark Bind")

	watermarkFrameLabel:AddKeyPicker("Watermark", {
		Default = "N/A",
		Mode = "Off",
		NoUI = true,
		Text = "Watermark",
		Callback = function(Value)
			Library:SetWatermarkVisibility(Value)
		end,
	})
end

---Initialize tab.
function SettingsTab.init(window)
	local tab = window:AddTab("Settings")

	SettingsTab.initCheatSettingsSection(tab:AddLeftGroupbox("Cheat Settings"))
	SettingsTab.initUISettingsSection(tab:AddRightGroupbox("UI Settings"))

	ThemeManager:ApplyToTab(tab)
	SaveManager:BuildConfigSection(tab)
end

return SettingsTab
