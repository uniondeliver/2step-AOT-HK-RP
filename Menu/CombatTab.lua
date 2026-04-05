-- CombatTab module.
local CombatTab = {}

---Initialize Nape Expander section.
---@param groupbox table
function CombatTab.initNapeExpander(groupbox)
	local toggle = groupbox:AddToggle("NapeExpander", {
		Text = "Nape Expander",
		Tooltip = "Expand titan Nape and Eyes hitboxes to make them easier to hit.",
		Default = false,
	})

	local depBox = groupbox:AddDependencyBox()

	depBox:AddSlider("NapeExpandScale", {
		Text = "Expand Scale",
		Tooltip = "Multiplier applied to the original hitbox size.",
		Default = 5,
		Min = 1,
		Max = 20,
		Rounding = 1,
	})

	depBox:AddSlider("NapeTransparency", {
		Text = "Hitbox Transparency",
		Tooltip = "0 = fully visible, 1 = invisible.",
		Default = 0.5,
		Min = 0,
		Max = 1,
		Rounding = 2,
	})

	depBox:SetupDependencies({ { toggle, true } })
end

---Initialize tab.
---@param window table
function CombatTab.init(window)
	local tab = window:AddTab("Combat")

	CombatTab.initNapeExpander(tab:AddDynamicGroupbox("Titan"))
end

return CombatTab
