---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@class EntityESP
local EntityESP = {}
EntityESP.__index = EntityESP
EntityESP.__type = "EntityESP"

local playersService = game:GetService("Players")

local ELEMENT_PADDING = 1
local BILLBOARD_MIN_WIDTH = 10
local BILLBOARD_MIN_HEIGHT = 10

---Give an inside outline to a frame.
EntityESP.gio = LPH_NO_VIRTUALIZE(function(frame, strokeColor, insideOffset)
	local sizeOffset = -insideOffset * 2
	local strokeContainer = Instance.new("Frame")
	strokeContainer.Name = "Outline_" .. tostring(insideOffset)
	strokeContainer.Parent = frame
	strokeContainer.Size = UDim2.new(1, sizeOffset, 1, sizeOffset)
	strokeContainer.Position = UDim2.new(0, insideOffset, 0, insideOffset)
	strokeContainer.BackgroundTransparency = 1

	local outlineStroke = Instance.new("UIStroke")
	outlineStroke.Color = strokeColor
	outlineStroke.Thickness = 1
	outlineStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
	outlineStroke.Parent = strokeContainer

	return strokeContainer
end)

---Update text on a container.
EntityESP.utext = LPH_NO_VIRTUALIZE(function(self, container, text)
	local textLabel = container:FindFirstChildOfClass("TextLabel")
	if not textLabel then return end
	textLabel.Text = text
	textLabel.TextSize = Configuration.expectOptionValue("FontSize") or 13
	textLabel.Font = Enum.Font[Configuration.expectOptionValue("Font") or "Code"] or Enum.Font.Code
	textLabel.TextColor3 = Configuration.idOptionValue(self.identifier, "Color") or Color3.new(1, 1, 1)
end)

---Get the bar frame inside a container.
EntityESP.gb = LPH_NO_VIRTUALIZE(function(container)
	local bg = container:FindFirstChild("Background")
	if not bg then return nil end
	local barArea = bg:FindFirstChild("BarArea")
	if not barArea then return nil end
	return barArea:FindFirstChild("Bar")
end)

---Modify bar fill percentage.
EntityESP.mbs = LPH_NO_VIRTUALIZE(function(container, vertical, percentage)
	local bg = container:FindFirstChild("Background")
	if not bg then return end
	local barArea = bg:FindFirstChild("BarArea")
	if not barArea then return end
	local bar = barArea:FindFirstChild("Bar")
	if not bar then return end

	percentage = math.clamp(percentage, 0.0, 1.0)
	if vertical then
		bar.Size = UDim2.new(1, 0, percentage, 0)
	else
		bar.Size = UDim2.new(percentage, 0, 1, 0)
	end
end)

---Create a generic bar inside a container.
EntityESP.cgb = LPH_NO_VIRTUALIZE(function(self, container, separators, vertical, color)
	local background = Instance.new("Frame")
	background.Name = "Background"
	background.Parent = container

	if vertical then
		background.Size = UDim2.new(1, -1, -1, 0)
		background.Position = UDim2.new(1, -1, 1, 0)
		background.AnchorPoint = Vector2.new(1.0, 0.0)
	else
		background.Size = UDim2.new(1, 0, 1, 0)
		background.Position = UDim2.new(0, 0, 0, 0)
		background.AnchorPoint = Vector2.new(0, 0)
	end

	background.BackgroundColor3 = Color3.new(0.0862745, 0.105882, 0.219608)
	background.BorderSizePixel = 0
	self.gio(background, Color3.new(0, 0, 0), 0)

	local barArea = Instance.new("Frame")
	barArea.Name = "BarArea"
	barArea.Parent = background
	barArea.BackgroundTransparency = 1
	barArea.Position = UDim2.new(0, 1, 0, 1)
	barArea.Size = UDim2.new(1, -2, 1, -2)
	barArea.ZIndex = 1

	if separators then
		for i = 1, 4 do
			local sep = Instance.new("Frame")
			sep.Name = "Separator"
			sep.Parent = barArea
			sep.BackgroundColor3 = Color3.new(0, 0, 0)
			sep.BorderSizePixel = 0
			sep.Position = UDim2.new(0, 0, i / 5, 0)
			sep.Size = UDim2.new(1, 0, 0, 1)
			sep.ZIndex = 3
		end
	end

	local bar = Instance.new("Frame")
	bar.Name = "Bar"
	bar.Parent = barArea
	bar.BorderSizePixel = 0
	bar.ZIndex = 2

	if vertical then
		bar.AnchorPoint = Vector2.new(0, 1)
		bar.Position = UDim2.new(0, 0, 1, 0)
		bar.Size = UDim2.new(1, 0, 0.0, 0)
	else
		bar.Position = UDim2.new(0, 0, 0, 0)
		bar.Size = UDim2.new(0.0, 0, 1, 0)
	end

	bar.BackgroundColor3 = color
end)

EntityESP.visible = LPH_NO_VIRTUALIZE(function(self, visible)
	self.billboard.Enabled = visible
end)

EntityESP.detach = LPH_NO_VIRTUALIZE(function(self)
	self.maid:clean()
end)

EntityESP.useperators = LPH_NO_VIRTUALIZE(function(self, distance)
	local bar = self.gb(self.hbar)
	if not bar then return end

	for _, sep in next, bar.Parent:GetChildren() do
		if sep:IsA("Frame") and sep.Name == "Separator" then
			sep.Visible = distance <= 300
		end
	end
end)

EntityESP.btext = LPH_NO_VIRTUALIZE(function(self, label, tags)
	if #tags <= 0 then
		return label
	end

	local lines = {}
	local start = true

	for _, tag in next, tags do
		local line = lines[#lines] or label

		if not start and #line > Configuration.expectOptionValue("ESPSplitLineLength") then
			lines[#lines + 1] = tag
			continue
		end

		line = line .. " " .. tag
		lines[start and 1 or #lines] = line
		start = false
	end

	return table.concat(lines, "\n"), #lines
end)

---Update entity ESP.
EntityESP.update = LPH_NO_VIRTUALIZE(function(self, tags)
	local identifier = self.identifier

	local localPlayer = playersService.LocalPlayer
	local localCharacter = localPlayer and localPlayer.Character
	local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

	local entityHumanoid = self.entity and self.entity:FindFirstChildOfClass("Humanoid")
	local entityRoot = self.entity and self.entity:FindFirstChild("HumanoidRootPart")
	local position = entityRoot and entityRoot.Position

	if not Configuration.idToggleValue(identifier, "Enable") then
		return self:visible(false)
	end

	if not entityHumanoid or not localRoot or not position then
		return self:visible(false)
	end

	local distance = (localRoot.Position - position).Magnitude

	if distance > Configuration.idOptionValue(identifier, "MaxDistance") then
		return self:visible(false)
	end

	self.billboard.Adornee = entityRoot

	self.bbstroke.Visible = Configuration.idToggleValue(identifier, "BoundingBox")
	self.wbstroke.Visible = Configuration.idToggleValue(identifier, "BoundingBox")
	self.dcontainer.Visible = Configuration.idToggleValue(identifier, "ShowDistance")
	self.hbar.Visible = Configuration.idToggleValue(identifier, "HealthBar")

	local fontSize = Configuration.expectOptionValue("FontSize") or 13
	local text, lines = self:btext(self.label, tags)
	self:utext(self.ncontainer, text)

	local name = self:find("Name")
	if name then
		name.space = (lines * fontSize) + (ELEMENT_PADDING * 2)
	end

	local delement = self:find("Distance")
	if delement then
		delement.space = fontSize + (ELEMENT_PADDING * 2)
	end

	if self.dcontainer then
		self:utext(self.dcontainer, string.format("%im", math.floor(distance)))
	end

	local bar = self.gb(self.hbar)
	if self.hbar and bar then
		local percent = entityHumanoid.Health / entityHumanoid.MaxHealth
		local fullColor = Configuration.idOptionValue(identifier, "FullColor")
		local emptyColor = Configuration.idOptionValue(identifier, "EmptyColor")

		self.mbs(self.hbar, true, percent)
		bar.BackgroundColor3 = emptyColor:Lerp(fullColor, math.clamp(percent, 0.0, 1.0))
		self:useperators(distance)
	end

	self:build()
	self:visible(true)
end)

---Build ESP layout.
EntityESP.build = LPH_NO_VIRTUALIZE(function(self)
	local sideOffsets = { top = 0, bottom = 0, left = 0, right = 0 }

	for side, elementList in next, self.elements do
		local offsetElementCount = 0
		for _, item in next, elementList do
			if not item.container.Visible then continue end
			sideOffsets[side] = sideOffsets[side] + item.space + ELEMENT_PADDING
			offsetElementCount = offsetElementCount + 1
		end
		if offsetElementCount > 0 then
			sideOffsets[side] = sideOffsets[side] - ELEMENT_PADDING
		end
	end

	local maxHorizontalPadding = math.max(sideOffsets.left, sideOffsets.right)
	local maxVerticalPadding = math.max(sideOffsets.top, sideOffsets.bottom)

	local extentsSize = self.entity:GetExtentsSize()

	if self.lextents and math.abs(self.lextents.Magnitude - extentsSize.Magnitude) >= 10.0 then
		self.sextents = nil
	end

	self.lextents = extentsSize

	if not self.sextents then
		local fmodel = self.entity:Clone()
		for _, inst in next, fmodel:GetDescendants() do
			if not inst.Parent then continue end
			if inst:IsA("BasePart") and not inst.Parent:IsA("BasePart") then continue end
			if not inst:FindFirstChildWhichIsA("Weld") and not inst:FindFirstChildWhichIsA("Motor6D") then continue end
			inst:Destroy()
		end
		self.sextents = fmodel:GetExtentsSize()
	end

	self.billboard.Size = UDim2.new(
		self.sextents.X + 1.5, maxHorizontalPadding * 2 + BILLBOARD_MIN_WIDTH,
		self.sextents.Y + 1.5, maxVerticalPadding * 2 + BILLBOARD_MIN_HEIGHT
	)

	self.bbox.Position = UDim2.new(0, maxHorizontalPadding, 0, maxVerticalPadding)
	self.bbox.Size = UDim2.new(1, -(maxHorizontalPadding * 2), 1, -(maxVerticalPadding * 2))

	local currentTopOffset = 0
	for _, element in next, self.elements.top do
		if not element.container.Visible then continue end
		element.container.Parent = self.canvas
		element.container.AnchorPoint = Vector2.new(0, 1)
		element.container.Position = UDim2.new(0, maxHorizontalPadding, 0, maxVerticalPadding - currentTopOffset)
		element.container.Size = UDim2.new(1, -(maxHorizontalPadding * 2), 0, element.space)
		currentTopOffset = currentTopOffset + element.space + ELEMENT_PADDING
		if not element.created and element.create then element.create(element.container) element.created = true end
	end

	local currentBottomOffset = 0
	for _, element in next, self.elements.bottom do
		if not element.container.Visible then continue end
		element.container.Parent = self.bbox
		element.container.AnchorPoint = Vector2.new(0, 0)
		element.container.Position = UDim2.new(0, 0, 1, currentBottomOffset)
		element.container.Size = UDim2.new(1, 0, 0, element.space)
		currentBottomOffset = currentBottomOffset + element.space + ELEMENT_PADDING
		if not element.created and element.create then element.create(element.container) element.created = true end
	end

	local currentLeftOffset = 0
	for _, element in next, self.elements.left do
		if not element.container.Visible then continue end
		element.container.Parent = self.canvas
		element.container.AnchorPoint = Vector2.new(1, 0)
		element.container.Position = UDim2.new(0, maxHorizontalPadding - currentLeftOffset, 0, maxVerticalPadding)
		element.container.Size = UDim2.new(0, element.space, 1, -(maxVerticalPadding * 2))
		currentLeftOffset = currentLeftOffset + element.space + ELEMENT_PADDING
		if not element.created and element.create then element.create(element.container) element.created = true end
	end

	local currentRightOffset = 0
	for _, element in next, self.elements.right do
		if not element.container.Visible then continue end
		element.container.Parent = self.bbox
		element.container.AnchorPoint = Vector2.new(0, 0)
		element.container.Position = UDim2.new(1, currentRightOffset, 0, 0)
		element.container.Size = UDim2.new(0, element.space, 1, 0)
		currentRightOffset = currentRightOffset + element.space + ELEMENT_PADDING
		if not element.created and element.create then element.create(element.container) element.created = true end
	end
end)

EntityESP.find = LPH_NO_VIRTUALIZE(function(self, name)
	for _, list in next, self.elements do
		for _, element in next, list do
			if element.name == name then return element end
		end
	end
	return nil
end)

EntityESP.add = LPH_NO_VIRTUALIZE(function(self, name, side, space, create)
	local container = Instance.new("Frame")
	container.Name = string.format("%s_Container_%s", side, name)
	container.BackgroundTransparency = 1

	table.insert(self.elements[side], {
		name = name,
		container = container,
		space = space,
		create = create,
		created = false,
	})

	return container
end)

EntityESP.extra = LPH_NO_VIRTUALIZE(function(_) end)

EntityESP.setup = LPH_NO_VIRTUALIZE(function(self)
	local root = self.entity:FindFirstChild("HumanoidRootPart")

	local billboardGui = Instance.new("BillboardGui")
	billboardGui.AlwaysOnTop = true
	billboardGui.Enabled = false
	billboardGui.Adornee = root or self.entity
	billboardGui.Parent = workspace
	billboardGui.ClipsDescendants = false
	billboardGui.AutoLocalize = false

	local canvas = Instance.new("Frame")
	canvas.Name = "Canvas"
	canvas.BackgroundTransparency = 1
	canvas.Size = UDim2.new(1, 0, 1, 0)
	canvas.Position = UDim2.new(0, 0, 0, 0)
	canvas.Parent = billboardGui

	local espBoundingBox = Instance.new("Frame")
	espBoundingBox.Name = "ESPBoundingBox"
	espBoundingBox.Parent = canvas
	espBoundingBox.BackgroundTransparency = 1
	espBoundingBox.Size = UDim2.new(1, 0, 1, 0)
	espBoundingBox.Position = UDim2.new(0, 0, 0, 0)

	self.bbstroke = self.gio(espBoundingBox, Color3.new(0, 0, 0), 0)
	self.wbstroke = self.gio(espBoundingBox, Color3.new(1, 1, 1), 1)

	self.billboard = self.maid:mark(billboardGui)
	self.canvas = self.maid:mark(canvas)
	self.bbox = self.maid:mark(espBoundingBox)

	self.hbar = self:add("HealthBar", "left", 6, function(container)
		self:cgb(container, true, true, Color3.new(1.0, 1.0, 1.0))
	end)

	self:extra()

	self.dcontainer = self:add("Distance", "bottom", 16, function(container)
		local textLabel = Instance.new("TextLabel")
		textLabel.Parent = container
		textLabel.Text = "0m"
		textLabel.Size = UDim2.new(0, 400, 1, 0)
		textLabel.AnchorPoint = Vector2.new(0.5, 0)
		textLabel.Position = UDim2.new(0.5, 0, 0, 0)
		textLabel.BackgroundTransparency = 1.0
		textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
		textLabel.TextStrokeTransparency = 0.0
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextSize = 13
		textLabel.TextWrapped = false
		textLabel.Font = Enum.Font.Code
	end)

	self.ncontainer = self:add("Name", "top", 16, function(container)
		local textLabel = Instance.new("TextLabel")
		textLabel.Parent = container
		textLabel.Text = "N/A"
		textLabel.Size = UDim2.new(0, 400, 1, 0)
		textLabel.AnchorPoint = Vector2.new(0.5, 0)
		textLabel.Position = UDim2.new(0.5, 0, 0, 0)
		textLabel.BackgroundTransparency = 1.0
		textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
		textLabel.TextStrokeTransparency = 0.0
		textLabel.TextColor3 = Color3.new(0.0117647, 1, 1)
		textLabel.TextSize = 13
		textLabel.TextWrapped = false
		textLabel.Font = Enum.Font.Code
	end)
end)

function EntityESP.new(entity, identifier, label)
	local self = setmetatable({}, EntityESP)
	self.label = label
	self.entity = entity
	self.identifier = identifier
	self.maid = Maid.new()
	self.elements = { top = {}, bottom = {}, left = {}, right = {} }
	return self
end

return EntityESP
