-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local u3 = game:GetService("UserInputService")
local u4 = game:GetService("TweenService")
local v5 = v1.LocalPlayer
local u6 = v5.Character or v5.CharacterAdded:Wait()
u6:WaitForChild("Torso")
local u7 = u6:WaitForChild("HumanoidRootPart")
local u8 = u6:WaitForChild("Humanoid")
local u9 = u6:WaitForChild("Head")
local u10 = require(script.Parent:WaitForChild("CoreMemory"))
local u11 = workspace.CurrentCamera
local u12 = 0
local u13 = 0
local u14 = 0
local u15 = 0
local u16 = 0
local u17 = 0
local u18 = 10
local u19 = 10
local u20 = nil
local u21 = nil
local u22 = 0
local u23 = Instance.new("Part")
u23.Parent = u11
u23.Transparency = 1
u23.Size = Vector3.new()
u23.Anchored = true
u23.CanCollide = false
local function u26(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u10
    --]]
    for _, v25 in pairs(u9:GetChildren()) do
        if v25:IsA("Decal") then
            if v25:GetAttribute("FaceFade") then
                if u6:FindFirstChild("Clothing"):FindFirstChild("Cape") and (u6:FindFirstChild("Clothing"):FindFirstChild("Cape"):FindFirstChild("Cape") and (u6:FindFirstChild("Clothing"):FindFirstChild("Cape"):FindFirstChild("Cape").Transparency == 0 and u6:FindFirstChild("Clothing"):FindFirstChild("Cape"):FindFirstChild("Head").Transparency == 0)) then
                    v25.Transparency = u10.firstPerson and 1 or 0
                else
                    v25.Transparency = 1
                end
            else
                v25.Transparency = p24
            end
        end
    end
end
local u27 = {
    ["CAMERA_SMOOTH_HORIZONTAL_SPEED"] = 5,
    ["CAMERA_SMOOTH_VERTICAL_SPEED"] = 5,
    ["CAMERA_MAX_DISTANCE"] = 5
}
local u28 = Vector3.new(0, 0, 0)
local u29 = Vector3.new(0, 0, 0)
local u30 = true
local function v48(p31) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u9
        [3] = u29
        [4] = u27
        [5] = u30
        [6] = u11
        [7] = u10
    --]]
    local v32 = u28
    local v33 = u9.AssemblyLinearVelocity.X
    local v34 = u9.AssemblyLinearVelocity.Z
    u28 = v32 - Vector3.new(v33, 0, v34) * p31
    local v35 = u29
    local v36 = u9.AssemblyLinearVelocity.Y
    u29 = v35 - Vector3.new(0, v36, 0) * p31
    local v37 = u28
    local v38 = u27.CAMERA_MAX_DISTANCE
    if v38 < v37.Magnitude then
        v37 = v37.Unit * v38
    end
    u28 = v37
    local v39 = u29
    local v40 = u27.CAMERA_MAX_DISTANCE
    if v40 < v39.Magnitude then
        v39 = v39.Unit * v40
    end
    u29 = v39
    local v41 = u28
    local v42 = p31 * u27.CAMERA_SMOOTH_HORIZONTAL_SPEED
    u28 = v41:Lerp(Vector3.new(0, 0, 0), (math.min(v42, 1)))
    local v43 = u29
    local v44 = p31 * u27.CAMERA_SMOOTH_VERTICAL_SPEED
    u29 = v43:Lerp(Vector3.new(0, 0, 0), (math.min(v44, 1)))
    local v45 = u28 + u29
    if u30 then
        local v46 = u11
        v46.CFrame = v46.CFrame + (u10.smoothCameraEnabled and v45 and v45 or Vector3.new())
    else
        local v47 = u11
        v47.CFrame = v47.CFrame + Vector3.new()
    end
end
v2:BindToRenderStep("CameraSmoothing", Enum.RenderPriority.Camera.Value + 1, v48)
v2.RenderStepped:Connect(function(p49) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u8
        [4] = u10
        [5] = u30
        [6] = u22
        [7] = u28
        [8] = u29
        [9] = u4
        [10] = u23
        [11] = u7
        [12] = u9
        [13] = u26
        [14] = u20
        [15] = u21
        [16] = u16
        [17] = u17
        [18] = u12
        [19] = u13
        [20] = u14
        [21] = u15
        [22] = u3
        [23] = u18
        [24] = u19
    --]]
    if u6:FindFirstChild("ODMG") == nil then
        u11.CameraType = Enum.CameraType.Custom
        u11.CameraSubject = u8
        u8.CameraOffset = Vector3.new(0, 0, 0)
        u10.firstPerson = false
        u30 = false
        u22 = 0
        u28 = Vector3.new(0, 0, 0)
        u29 = Vector3.new(0, 0, 0)
        return
    end
    if u10.currentCannonModel or u10.firstPerson then
        u30 = false
    else
        u30 = true
    end
    u4:Create(u23, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        ["CFrame"] = u7.CFrame * CFrame.new(0, 2, 0)
    }):Play()
    if (u10.currentCannonModel and not u10.cannonFirstPerson or not u10.currentCannonModel) and (u10.currentHorseModel and not u10.horseFirstPerson or not u10.currentHorseModel) then
        u8:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        u11.CameraType = Enum.CameraType.Custom
        if (u9.Position - u11.CFrame.Position).Magnitude <= 1.8 then
            for _, v50 in pairs(u6:GetChildren()) do
                if v50:GetAttribute("IsAccessory") then
                    for _, v51 in pairs(v50:GetDescendants()) do
                        if v51:IsA("BasePart") then
                            v51.LocalTransparencyModifier = u22
                        end
                    end
                end
            end
            u9.LocalTransparencyModifier = u22
            u26(u22)
            u10.firstPerson = true
            u8.CameraOffset = Vector3.new():Lerp(Vector3.new(0, 0, -0.6), u22)
            u11.CameraSubject = u8
        else
            for _, v52 in pairs(u6:GetChildren()) do
                if v52:GetAttribute("IsAccessory") then
                    for _, v53 in pairs(v52:GetDescendants()) do
                        if v53:IsA("BasePart") then
                            v53.LocalTransparencyModifier = 0
                        end
                    end
                end
            end
            u9.LocalTransparencyModifier = 0
            u26(0)
            u10.firstPerson = false
            u8.CameraOffset = (Vector3.new(0, 0, -0.6)):Lerp(Vector3.new(), u22)
            u11.CameraSubject = u8
        end
    else
        u8:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
    end
    if u10.firstPerson then
        if u22 < 1 then
            local v54 = u22 + 0.03
            u22 = math.clamp(v54, 0, 1)
        end
    elseif u22 > 0 then
        local v55 = u22 - 0.03
        u22 = math.clamp(v55, 0, 1)
    end
    local v56 = u7.AssemblyLinearVelocity
    local v57 = v56.X
    local v58 = v56.Z
    local _ = Vector3.new(v57, 0, v58).Magnitude
    local v59 = v56.Magnitude * 0.5
    if v59 > 0.02 then
        local v60 = p49 * 60
        u20 = math.random(1, 2)
        u21 = math.random(1, 2)
        local v61
        if v60 <= 2 then
            local v62 = u16
            local v63 = tick() * 0.5 * u20
            local v64 = math.cos(v63) * (math.random(5, 20) / 200) * v60
            local v65 = 0.05 * v60
            v61 = v62 + (v64 - v62) * v65 or 0
        else
            v61 = 0
        end
        u16 = v61
        local v66
        if v60 <= 2 then
            local v67 = u17
            local v68 = tick() * 0.5 * u21
            local v69 = math.cos(v68) * (math.random(2, 10) / 200) * v60
            local v70 = 0.05 * v60
            v66 = v67 + (v69 - v67) * v70 or 0
        else
            v66 = 0
        end
        u17 = v66
        local v71 = u11
        local v72 = v71.CFrame
        local v73 = u12
        local v74 = CFrame.Angles(0, 0, (math.rad(v73)))
        local v75 = CFrame.Angles
        local v76 = u13 * v60
        local v77 = math.clamp(v76, -0.15, 0.15)
        local v78 = math.rad(v77)
        local v79 = u14 * v60
        local v80 = math.clamp(v79, -0.5, 0.5)
        local v81 = v74 * v75(v78, math.rad(v80), u15)
        local v82 = CFrame.Angles
        local v83 = u16
        local v84 = math.rad(v83)
        local v85 = u17
        local v86 = math.rad(v85)
        local v87 = u17 * 10
        v71.CFrame = v72 * (v81 * v82(v84, v86, (math.rad(v87))))
        local v88 = u15
        local v89 = u11.CFrame
        local v90 = u8.WalkSpeed
        local v91 = -v89:VectorToObjectSpace(v56 / math.max(v90, 0.01)).X * 0.05
        local v92 = 0.03 * v60
        local v93 = v88 + (v91 - v88) * v92
        u15 = math.clamp(v93, -0.05, 0.05)
        local v94 = u12
        local v95 = u3:GetMouseDelta().X / v60 * 0.15
        local v96 = math.clamp(v95, -2.5, 2.5)
        local v97 = 0.25 * v60
        u12 = v94 + (v96 - v94) * v97
        local v98 = u13
        local v99 = tick() * u18
        local v100 = math.sin(v99) / 5
        local v101 = u19 / 10
        local v102 = v100 * math.min(1, v101)
        local v103 = 0.25 * v60
        u13 = v98 + (v102 - v98) * v103
        if v59 > 1 then
            local v104 = u14
            local v105 = u18
            local v106 = tick() * 0.5 * math.floor(v105)
            local v107 = math.cos(v106) * (u18 / 200)
            local v108 = 0.25 * v60
            v111 = v104 + (v107 - v104) * v108
            if v111 then
                goto l51
            end
        end
        local v109 = u14
        local v110 = 0.05 * v60
        local v111 = v109 + (0 - v109) * v110
        ::l51::
        u14 = v111
        local v112 = v59 > 12 and 20 or (v59 > 0.1 and 12 or 0)
        local v113 = v59 > 0.1 and 18 or (v59 > 0.1 and 14 or 0)
        u18 = v112
        u19 = v113
    end
end)
local u114 = CFrame.new()
v2:BindToRenderStep("RotateCameraInDirectionPlayerIsGoing", Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u114
        [4] = u11
    --]]
    if u6:FindFirstChild("ODMG") ~= nil then
        local v115 = u10.cameraTilt
        u114 = u114:Lerp(CFrame.Angles(0, 0, (math.rad(v115))), 0.02)
        local v116 = u11
        v116.CFrame = v116.CFrame * u114
    end
end)