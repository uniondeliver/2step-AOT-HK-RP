---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

-- Visuals tab.
local VisualsTab = {}

---Initialize ESP Customization section.
---@param groupbox table
function VisualsTab.initESPCustomization(groupbox)
	groupbox:AddSlider("FontSize", {
		Text = "ESP Font Size",
		Default = 16,
		Min = 4,
		Max = 24,
		Rounding = 0,
	})

	groupbox:AddSlider("ESPSplitLineLength", {
		Text = "ESP Split Line Length",
		Tooltip = "The total length of a ESP label line before it splits into a new line.",
		Default = 30,
		Min = 10,
		Max = 100,
		Rounding = 0,
	})

	local fonts = {}

	for _, font in next, Enum.Font:GetEnumItems() do
		if font == Enum.Font.Unknown then
			continue
		end

		table.insert(fonts, font.Name)
	end

	groupbox:AddDropdown("Font", { Text = "ESP Fonts", Default = 1, Values = fonts })
end

---Initialize ESP Optimizations section.
---@param groupbox table
function VisualsTab.initESPOptimizations(groupbox)
	local limitToggle = groupbox:AddToggle("ESPLimitUpdates", {
		Text = "ESP Limit Updates",
		Tooltip = "Throttle ESP update rate.",
		Default = true,
	})

	local limitDepBox = groupbox:AddDependencyBox()

	limitDepBox:AddSlider("ESPRefreshRate", {
		Text = "ESP Refresh Rate",
		Suffix = "fps",
		Default = 30,
		Min = 1,
		Max = 144,
		Rounding = 0,
	})

	limitDepBox:SetupDependencies({
		{ limitToggle, true },
	})

	groupbox:AddToggle("ESPSplitUpdates", {
		Text = "ESP Split Updates",
		Tooltip = "This is an optimization where the ESP will split updating the object pool into multiple frames.",
		Default = false,
	})

	local esuDepBox = groupbox:AddDependencyBox()

	esuDepBox:AddSlider("ESPSplitFrames", {
		Text = "ESP Split Frames",
		Tooltip = "How many frames we have to split the object pool into.",
		Suffix = "f",
		Default = 64,
		Min = 1,
		Max = 64,
		Rounding = 0,
	})

	esuDepBox:SetupDependencies({
		{ Toggles.ESPSplitUpdates, true },
	})

	groupbox:AddToggle("NoPersisentESP", {
		Text = "No Persistent ESP",
		Tooltip = "Disable ESP models from being persistent and never being streamed out.",
		Default = false,
	})
end

---Initialize Base ESP section.
---@param identifier string
---@param groupbox table
---@return string, table
function VisualsTab.initBaseESPSection(identifier, groupbox)
	local enableToggle = groupbox
		:AddToggle(Configuration.identify(identifier, "Enable"), {
			Text = "Enable ESP",
			Default = false,
		})
		:AddKeyPicker(Configuration.identify(identifier, "Keybind"), {
			Default = "N/A",
			SyncToggleState = true,
			NoUI = true,
			Text = groupbox.Name,
		})

	enableToggle:AddColorPicker(Configuration.identify(identifier, "Color"), {
		Default = Color3.new(1, 1, 1),
	})

	local enableDepBox = groupbox:AddDependencyBox()

	enableDepBox:AddToggle(Configuration.identify(identifier, "ShowDistance"), {
		Text = "Show Distance",
		Default = false,
	})

	enableDepBox:AddSlider(Configuration.identify(identifier, "MaxDistance"), {
		Text = "Distance Threshold",
		Tooltip = "If the distance is greater than this value, the ESP object will not be shown.",
		Default = 2000,
		Min = 0,
		Max = 100000,
		Suffix = "studs",
		Rounding = 0,
	})

	enableDepBox:SetupDependencies({
		{ enableToggle, true },
	})

	return identifier, enableDepBox
end

---Add entity ESP options (health bar + bounding box). Shared by Player and Titan ESP.
---@param identifier string
---@param depbox table
---@return string, table
function VisualsTab.addEntityESP(identifier, depbox)
	local hbToggle = depbox:AddToggle(Configuration.identify(identifier, "HealthBar"), {
		Text = "Show Health Bar",
		Default = true,
	})

	hbToggle:AddColorPicker(Configuration.identify(identifier, "FullColor"), {
		Default = Color3.new(0, 1, 0),
	})

	hbToggle:AddColorPicker(Configuration.identify(identifier, "EmptyColor"), {
		Default = Color3.new(1, 0, 0),
	})

	depbox:AddToggle(Configuration.identify(identifier, "BoundingBox"), {
		Text = "Show Bounding Box",
		Default = false,
	})

	return identifier, depbox
end

---Add Player ESP section.
---@param identifier string
---@param depbox table
function VisualsTab.addPlayerESP(identifier, depbox)
	local markAlliesToggle = depbox:AddToggle(Configuration.identify(identifier, "MarkAllies"), {
		Text = "Mark Allies",
		Default = false,
	})

	markAlliesToggle:AddColorPicker(Configuration.identify(identifier, "AllyColor"), {
		Default = Color3.new(1, 1, 1),
	})

	local showHealthToggle = depbox:AddToggle(Configuration.identify(identifier, "ShowHealth"), {
		Text = "Show Health",
		Default = true,
	})

	local shDepBox = depbox:AddDependencyBox()

	shDepBox:AddToggle(Configuration.identify(identifier, "ShowHealthPercentage"), {
		Text = "Show As Percentage",
		Default = false,
	})

	shDepBox:SetupDependencies({ { showHealthToggle, true } })

	local maDepBox = depbox:AddDependencyBox()

	maDepBox
		:AddToggle(Configuration.identify(identifier, "HideIfAlly"), {
			Text = "Hide Allies",
			Default = false,
		})
		:AddKeyPicker(Configuration.identify(identifier, "HideIfAllyKeybind"), {
			Default = "N/A",
			SyncToggleState = true,
			NoUI = true,
			Text = "Hide Allies",
		})

	maDepBox:SetupDependencies({
		{ Toggles[Configuration.identify(identifier, "MarkAllies")], true },
	})

	depbox:AddDropdown(Configuration.identify(identifier, "PlayerNameType"), {
		Text = "Player Name Type",
		Default = 1,
		Values = { "Roblox Display Name", "Roblox Username" },
	})
end

---Add Titan ESP section.
---@param identifier string
---@param depbox table
function VisualsTab.addTitanESP(identifier, depbox)
	depbox:AddToggle(Configuration.identify(identifier, "ShowNape"), {
		Text = "Show Nape Tag",
		Tooltip = "Adds a [NAPE] tag when the titan has a Nape hitbox part.",
		Default = false,
	})
end

---Add Filtered ESP section.
---@param identifier string
---@param depbox table
function VisualsTab.addFilterESP(identifier, depbox)
	local filterObjectsToggle = depbox:AddToggle(Configuration.identify(identifier, "FilterObjects"), {
		Text = "Filter Objects",
		Default = true,
	})

	local foDepBox = depbox:AddDependencyBox()

	local filterLabelList = foDepBox:AddDropdown(Configuration.identify(identifier, "FilterLabelList"), {
		Text = "Filter Label List",
		Default = {},
		SaveValues = true,
		Multi = true,
		Values = {},
	})

	local filterLabel = foDepBox:AddInput(Configuration.identify(identifier, "FilterLabel"), {
		Text = "Filter Label",
		Placeholder = "Partial or exact object label.",
	})

	foDepBox:AddDropdown(Configuration.identify(identifier, "FilterLabelListType"), {
		Text = "Filter List Type",
		Default = 1,
		Values = { "Hide Labels Out Of List", "Hide Labels In List" },
	})

	foDepBox:AddButton("Add Name To Filter", function()
		local filterLabelValue = filterLabel.Value

		if #filterLabelValue <= 0 then
			return Logger.notify("Please enter a valid filter name.")
		end

		local filterLabelListValues = filterLabelList.Values

		if not table.find(filterLabelListValues, filterLabelValue) then
			table.insert(filterLabelListValues, filterLabelValue)
		end

		filterLabelList:SetValues(filterLabelListValues)
		filterLabelList:SetValue({})
		filterLabelList:Display()
	end)

	foDepBox:AddButton("Remove Selected Names", function()
		local filterLabelListValues = filterLabelList.Values
		local selectedFilterNames = filterLabelList.Value

		for selectedFilterName, _ in next, selectedFilterNames do
			local selectedIndex = table.find(filterLabelListValues, selectedFilterName)
			if not selectedIndex then
				return Logger.notify("The selected filter name %s does not exist in the list", selectedFilterName)
			end

			table.remove(filterLabelListValues, selectedIndex)
		end

		filterLabelList:SetValues(filterLabelListValues)
		filterLabelList:SetValue({})
		filterLabelList:Display()
	end)

	foDepBox:SetupDependencies({
		{ filterObjectsToggle, true },
	})
end

---Initialize Visual Removals section.
---@param groupbox table
function VisualsTab.initVisualRemovalsSection(groupbox)
	groupbox:AddToggle("NoFog", {
		Text = "No Fog",
		Tooltip = "Removes fog and atmosphere density.",
		Default = false,
	})

	groupbox:AddToggle("Fullbright", {
		Text = "Fullbright",
		Tooltip = "Maximizes lighting brightness and removes shadows.",
		Default = false,
	})
end

---Initialize World Visuals section.
---@param groupbox table
function VisualsTab.initWorldVisualsSection(groupbox)
	groupbox:AddToggle("ModifyFieldOfView", {
		Text = "Modify Field Of View",
		Default = false,
	})

	local fovDepBox = groupbox:AddDependencyBox()

	fovDepBox:AddSlider("FieldOfView", {
		Text = "Field Of View Slider",
		Default = 90,
		Min = 0,
		Max = 120,
		Suffix = "°",
		Rounding = 0,
	})

	fovDepBox:SetupDependencies({
		{ Toggles.ModifyFieldOfView, true },
	})

	local modifyAmbienceToggle = groupbox:AddToggle("ModifyAmbience", {
		Text = "Modify Ambience",
		Tooltip = "Modify the ambience of the game.",
		Default = false,
	})

	modifyAmbienceToggle:AddColorPicker("AmbienceColor", {
		Default = Color3.fromHex("FFFFFF"),
	})

	local oacDepBox = groupbox:AddDependencyBox()

	oacDepBox:AddToggle("OriginalAmbienceColor", {
		Text = "Original Ambience Color",
		Tooltip = "Use the game's original ambience color instead of a custom one.",
		Default = false,
	})

	local umacDepBox = oacDepBox:AddDependencyBox()

	umacDepBox:AddSlider("OriginalAmbienceColorBrightness", {
		Text = "Original Ambience Brightness",
		Default = 0,
		Min = 0,
		Max = 255,
		Suffix = "+",
		Rounding = 0,
	})

	oacDepBox:SetupDependencies({
		{ Toggles.ModifyAmbience, true },
	})

	umacDepBox:SetupDependencies({
		{ Toggles.OriginalAmbienceColor, true },
	})
end

---Initialize tab.
---@param window table
function VisualsTab.init(window)
	local tab = window:AddTab("Visuals")

	VisualsTab.initESPCustomization(tab:AddDynamicGroupbox("ESP Customization"))
	VisualsTab.initESPOptimizations(tab:AddDynamicGroupbox("ESP Optimizations"))
	VisualsTab.initWorldVisualsSection(tab:AddDynamicGroupbox("World Visuals"))
	VisualsTab.initVisualRemovalsSection(tab:AddDynamicGroupbox("Visual Removals"))
	VisualsTab.addPlayerESP(VisualsTab.addEntityESP(VisualsTab.initBaseESPSection("Player", tab:AddDynamicGroupbox("Player ESP"))))
	VisualsTab.addTitanESP(VisualsTab.addEntityESP(VisualsTab.initBaseESPSection("Titan", tab:AddDynamicGroupbox("Titan ESP"))))
end

return VisualsTab
