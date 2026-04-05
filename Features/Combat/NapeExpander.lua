---@module Features.Combat.NapeExpander
local NapeExpander = {}

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.TaskSpawner
local TaskSpawner = require("Utility/TaskSpawner")

local maid = Maid.new()

local workspace = game:GetService("Workspace")

---Disconnect ProtectHitboxSizes connection, resize the part, make it non-solid and apply transparency.
---@param part BasePart
---@param scale number
local function expandPart(part, scale)
	-- Strip the size-protection signal set up by TitanClient's ProtectHitboxSizes.
	for _, conn in ipairs(getconnections(part:GetPropertyChangedSignal("Size"))) do
		conn:Disconnect()
	end

	part.Size = part.Size * scale
	part.CanCollide = false
	part.Transparency = Configuration.expectOptionValue("NapeTransparency") or 1
end

---Expand Nape and Eyes hitboxes on a titan model.
---@param titanModel Instance
local function expandTitan(titanModel)
	local scale = Configuration.expectOptionValue("NapeExpandScale") or 5
	for _, name in ipairs({ "Nape", "Eyes" }) do
		local part = titanModel:FindFirstChild(name)
		if part and part:IsA("BasePart") then
			expandPart(part, scale)
		end
	end
end

function NapeExpander.init()
	local aliveTitans = workspace:WaitForChild("AliveTitans")

	for _, titan in ipairs(aliveTitans:GetChildren()) do
		if titan:IsA("Model") and Configuration.expectToggleValue("NapeExpander") then
			TaskSpawner.spawn("NapeExpander.expandExisting", expandTitan, titan)
		end
	end

	maid:add(aliveTitans.ChildAdded:Connect(function(titan)
		if not titan:IsA("Model") then return end
		TaskSpawner.delay("NapeExpander.expandNew", function() return 1 end, function()
			if titan.Parent and Configuration.expectToggleValue("NapeExpander") then
				expandTitan(titan)
			end
		end)
	end))
end

function NapeExpander.detach()
	maid:clean()
end

return NapeExpander
