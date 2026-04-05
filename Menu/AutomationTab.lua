-- AutomationTab module.
local AutomationTab = {}

---Initialize 'Input Automation' section.
---@param groupbox table
function AutomationTab.initInputAutomation(groupbox)
	groupbox:AddToggle("AntiAFK", {
		Text = "Anti AFK",
		Tooltip = "Prevent the player from being kicked for being idle by sending periodic inputs for you.",
		Default = false,
	})

	groupbox:AddToggle("AutoQTE", {
		Text = "Auto QTE",
		Tooltip = "Automatically solve QTE grab challenges with human-like timing.",
		Default = false,
	})
end

---Initialize tab.
---@param window table
function AutomationTab.init(window)
	local tab = window:AddTab("Auto")

	AutomationTab.initInputAutomation(tab:AddDynamicGroupbox("Input Automation"))
end

return AutomationTab
