---@module Features.Game.TeleportTool
local TeleportTool = {}

local players = game:GetService("Players")

local TOOL_NAME = "Teleport Tool"

function TeleportTool.give()
	local player = players.LocalPlayer
	local character = player.Character
	local backpack = player:FindFirstChildOfClass("Backpack")
	if not backpack then return end

	-- Remove any existing copy.
	for _, parent in ipairs({ backpack, character }) do
		if not parent then continue end
		local existing = parent:FindFirstChild(TOOL_NAME)
		if existing then existing:Destroy() end
	end

	local tool = Instance.new("Tool")
	tool.Name = TOOL_NAME
	tool.RequiresHandle = false
	tool.ToolTip = "Click anywhere to teleport there."
	tool.Parent = backpack

	local mouse = player:GetMouse()

	tool.Activated:Connect(function()
		local char = player.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if not root or not mouse.Hit then return end

		local pos = mouse.Hit.Position
		root.CFrame = CFrame.new(pos.X, pos.Y + 3, pos.Z)
			* CFrame.fromEulerAnglesYXZ(0, math.atan2(root.CFrame.LookVector.X, root.CFrame.LookVector.Z), 0)
		root.AssemblyLinearVelocity = Vector3.zero
	end)
end

function TeleportTool.init() end
function TeleportTool.detach() end

return TeleportTool
