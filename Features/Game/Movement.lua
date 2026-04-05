---@module Features.Game.Movement
local Movement = {}

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

---@module Utility.OriginalStoreManager
local OriginalStoreManager = require("Utility/OriginalStoreManager")

---@module Utility.InstanceWrapper
local InstanceWrapper = require("Utility/InstanceWrapper")

---@module Utility.ControlModule
local ControlModule = require("Utility/ControlModule")

---@module Utility.Logger
local Logger = require("Utility/Logger")

local movementMaid = Maid.new()
local noClipMap = movementMaid:mark(OriginalStoreManager.new())

local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")

local preSimulation = Signal.new(runService.PreSimulation)

local function updateNoClip(character)
	for _, part in ipairs(character:GetChildren()) do
		if not part:IsA("BasePart") then continue end
		noClipMap:add(part, "CanCollide", false)
	end
end

local function updateSpeedHack(rootPart, humanoid)
	if Configuration.expectToggleValue("Fly") then return end
	rootPart.AssemblyLinearVelocity = rootPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)
	local moveDir = humanoid.MoveDirection
	if moveDir.Magnitude <= 0.001 then return end
	rootPart.AssemblyLinearVelocity = rootPart.AssemblyLinearVelocity
		+ moveDir.Unit * Configuration.expectOptionValue("SpeedhackSpeed")
end

local function updateFly(rootPart)
	local camera = workspace.CurrentCamera
	if not camera then return end

	local bv = InstanceWrapper.create(movementMaid, "flyBodyVelocity", "BodyVelocity", rootPart)
	bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	local velocity = camera.CFrame:VectorToWorldSpace(
		ControlModule.getMoveVector() * (Configuration.expectOptionValue("FlySpeed") or 200)
	)

	if userInputService:IsKeyDown(Enum.KeyCode.Space) then
		velocity = velocity + Vector3.new(0, Configuration.expectOptionValue("FlyUpSpeed") or 150, 0)
	end

	bv.Velocity = velocity
end

local function updateInfiniteJump(rootPart)
	if Configuration.expectToggleValue("Fly") then return end
	if not userInputService:IsKeyDown(Enum.KeyCode.Space) then return end
	rootPart.AssemblyLinearVelocity = rootPart.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
	rootPart.AssemblyLinearVelocity = rootPart.AssemblyLinearVelocity
		+ Vector3.new(0, Configuration.expectOptionValue("InfiniteJumpBoost") or 50, 0)
end

local function updateMovement()
	local character = players.LocalPlayer.Character
	if not character then return end

	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end

	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then return end

	if Configuration.expectToggleValue("AnchorCharacter") then
		rootPart.Anchored = true
	end

	if Configuration.expectToggleValue("NoClip") then
		updateNoClip(character)
	else
		noClipMap:restore()
	end

	if Configuration.expectToggleValue("Fly") then
		updateFly(rootPart)
	else
		movementMaid["flyBodyVelocity"] = nil
	end

	if Configuration.expectToggleValue("Speedhack") then
		updateSpeedHack(rootPart, humanoid)
	end

	if Configuration.expectToggleValue("InfiniteJump") then
		updateInfiniteJump(rootPart)
	end
end

function Movement.init()
	movementMaid:add(preSimulation:connect("Movement_PreSimulation", updateMovement))
	Logger.warn("Movement initialized.")
end

function Movement.detach()
	movementMaid:clean()
	Logger.warn("Movement detached.")
end

return Movement
