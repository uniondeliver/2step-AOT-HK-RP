-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game:GetService("UserInputService")
local v3 = game:GetService("RunService")
local u4 = v1.LocalPlayer
local u5 = u4.Character or u4.CharacterAdded:Wait()
local u6 = u5:WaitForChild("Humanoid")
local u7 = u6:WaitForChild("Animator")
local u8 = {
    ["Mousquet"] = true,
    ["Rifle"] = true,
    ["Sabre"] = true,
    ["Flintlock"] = true
}
local u9 = Instance.new("Animation")
u9.AnimationId = "rbxassetid://87034224282342"
local u10 = Instance.new("Animation")
u10.AnimationId = "rbxassetid://140446622850484"
local u11 = Instance.new("Animation")
u11.AnimationId = "rbxassetid://103858339599626"
local u12 = Instance.new("Animation")
u12.AnimationId = "rbxassetid://115822285597901"
local u13 = u7:LoadAnimation(u9)
local u14 = u7:LoadAnimation(u10)
local u15 = u7:LoadAnimation(u11)
local u16 = u7:LoadAnimation(u12)
u13.Priority = Enum.AnimationPriority.Action
u14.Priority = Enum.AnimationPriority.Action
u15.Priority = Enum.AnimationPriority.Action
u16.Priority = Enum.AnimationPriority.Action
u13.Looped = true
u14.Looped = true
u15.Looped = true
u16.Looped = false
local u17 = false
local u18 = false
local u19 = "idle"
local u20 = false
local u21 = workspace.CurrentCamera
local u22 = {}
local function u24() --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
    --]]
    if not u5 then
        return true
    end
    for _, v23 in pairs(u5:GetChildren()) do
        if v23:IsA("Tool") and u8[v23.Name] then
            return true
        end
    end
    return u5:FindFirstChild("Odmg") and true or false
end
local function u25() --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u15
        [4] = u16
        [5] = u19
        [6] = u20
    --]]
    if u13.IsPlaying then
        u13:Stop(0.2)
    end
    if u14.IsPlaying then
        u14:Stop(0.2)
    end
    if u15.IsPlaying then
        u15:Stop(0.2)
    end
    if u16.IsPlaying then
        u16:Stop(0.2)
    end
    u19 = "none"
    u20 = false
end
local function u29() --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v26 = u4:FindFirstChild("PlayerScripts")
    local v27 = v26 and v26:FindFirstChild("RbxCharacterSounds")
    if v27 then
        v27.Disabled = true
        v27:Destroy()
    end
    local v28 = u5 and u5:FindFirstChild("RbxCharacterSounds")
    if v28 then
        v28.Disabled = true
        v28:Destroy()
    end
end
local function u31(u30) --[[ Line: 152 ]]
    if u30:IsA("Sound") then
        u30.Volume = 0
        u30.PlayOnRemove = false
        u30:GetPropertyChangedSignal("Volume"):Connect(function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            if u30.Volume > 0 then
                u30.Volume = 0
            end
        end)
        if u30.IsPlaying then
            u30:Stop()
        end
        u30.Played:Connect(function() --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30:Stop()
        end)
    end
end
local function u47() --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u5
        [3] = u31
        [4] = u6
    --]]
    for _, v32 in pairs(u22) do
        if v32.Connected then
            v32:Disconnect()
        end
    end
    u22 = {}
    local v33 = u5:FindFirstChild("HumanoidRootPart")
    if v33 then
        for _, v34 in pairs(v33:GetChildren()) do
            if v34:IsA("Sound") then
                u31(v34)
            end
        end
        local v36 = v33.ChildAdded:Connect(function(p35) --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            if p35:IsA("Sound") then
                task.wait()
                u31(p35)
            end
        end)
        local v37 = u22
        table.insert(v37, v36)
    end
    local v38 = u5:FindFirstChild("Head")
    if v38 then
        for _, v39 in pairs(v38:GetChildren()) do
            if v39:IsA("Sound") then
                u31(v39)
            end
        end
        local v41 = v38.ChildAdded:Connect(function(p40) --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            if p40:IsA("Sound") then
                task.wait()
                u31(p40)
            end
        end)
        local v42 = u22
        table.insert(v42, v41)
    end
    if u6 then
        for _, v43 in pairs(u6:GetChildren()) do
            if v43:IsA("Sound") then
                u31(v43)
            end
        end
        local v45 = u6.ChildAdded:Connect(function(p44) --[[ Line: 205 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            if p44:IsA("Sound") then
                task.wait()
                u31(p44)
            end
        end)
        local v46 = u22
        table.insert(v46, v45)
    end
end
u29()
task.wait(0.3)
u47()
local function u50() --[[ Line: 255 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u25
        [4] = u17
        [5] = u6
        [6] = u19
        [7] = u13
        [8] = u14
        [9] = u15
    --]]
    u5.ChildAdded:Connect(function(p48) --[[ Line: 256 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u25
            [3] = u17
            [4] = u6
        --]]
        if p48:IsA("Tool") and u8[p48.Name] then
            u25()
            u17 = false
            u6.WalkSpeed = 12
        end
    end)
    u5.ChildRemoved:Connect(function(p49) --[[ Line: 262 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u17
            [3] = u6
            [4] = u19
            [5] = u13
            [6] = u14
            [7] = u15
        --]]
        if p49:IsA("Tool") and u8[p49.Name] then
            u17 = false
            u6.WalkSpeed = 12
            u19 = "none"
            if u19 == "idle" then
                return
            end
            if u13.IsPlaying then
                u13:Stop(0.2)
            end
            if u14.IsPlaying then
                u14:Stop(0.2)
            end
            if u15.IsPlaying then
                u15:Stop(0.2)
            end
            u15:Play(0.2)
            u19 = "idle"
        end
    end)
end
u2.InputBegan:Connect(function(p51, p52) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u24
        [3] = u6
    --]]
    if not p52 then
        if p51.KeyCode == Enum.KeyCode.LeftShift or p51.KeyCode == Enum.KeyCode.RightShift then
            u17 = true
            if not u24() then
                u6.WalkSpeed = 25
            end
        end
    end
end)
u2.InputEnded:Connect(function(p53, _) --[[ Line: 315 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u6
    --]]
    if p53.KeyCode == Enum.KeyCode.LeftShift or p53.KeyCode == Enum.KeyCode.RightShift then
        u17 = false
        u6.WalkSpeed = 12
    end
end)
u2.InputBegan:Connect(function(p54, p55) --[[ Line: 325 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u2
        [3] = u6
    --]]
    if not p55 then
        if p54.KeyCode == Enum.KeyCode.LeftControl or p54.KeyCode == Enum.KeyCode.RightControl then
            u18 = not u18
            if u18 then
                u2.MouseBehavior = Enum.MouseBehavior.LockCenter
                u6.AutoRotate = false
                return
            end
            u2.MouseBehavior = Enum.MouseBehavior.Default
            u6.AutoRotate = true
        end
    end
end)
v3.RenderStepped:Connect(function() --[[ Line: 341 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u5
        [3] = u21
    --]]
    if u18 and (u5 and u5:FindFirstChild("HumanoidRootPart")) then
        local v56 = u5.HumanoidRootPart
        local v57 = u21.CFrame.LookVector
        local v58 = v57.X
        local v59 = v57.Z
        local v60 = Vector3.new(v58, 0, v59).Unit
        v56.CFrame = CFrame.new(v56.Position, v56.Position + v60)
    end
end)
v3.Heartbeat:Connect(function() --[[ Line: 353 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
        [3] = u25
        [4] = u24
        [5] = u17
        [6] = u20
        [7] = u13
        [8] = u14
        [9] = u15
    --]]
    if u6 and u6.Health > 0 then
        if u6.Sit then
            if u19 ~= "none" then
                u25()
            end
            return
        elseif u24() then
            if u19 ~= "none" then
                u25()
                u17 = false
                u6.WalkSpeed = 12
            end
            return
        elseif u20 then
            return
        elseif u6.MoveDirection.Magnitude > 0.1 then
            if u17 then
                if u19 ~= "run" then
                    if u13.IsPlaying then
                        u13:Stop(0.2)
                    end
                    if u14.IsPlaying then
                        u14:Stop(0.2)
                    end
                    if u15.IsPlaying then
                        u15:Stop(0.2)
                    end
                    u14:Play(0.2)
                    u19 = "run"
                end
            elseif u19 ~= "walk" then
                if u13.IsPlaying then
                    u13:Stop(0.2)
                end
                if u14.IsPlaying then
                    u14:Stop(0.2)
                end
                if u15.IsPlaying then
                    u15:Stop(0.2)
                end
                u13:Play(0.2)
                u19 = "walk"
            end
        elseif u19 ~= "idle" then
            if u13.IsPlaying then
                u13:Stop(0.2)
            end
            if u14.IsPlaying then
                u14:Stop(0.2)
            end
            if u15.IsPlaying then
                u15:Stop(0.2)
            end
            u15:Play(0.2)
            u19 = "idle"
        end
    else
        return
    end
end)
u4.CharacterAdded:Connect(function(p61) --[[ Line: 385 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
        [4] = u13
        [5] = u9
        [6] = u14
        [7] = u10
        [8] = u15
        [9] = u11
        [10] = u16
        [11] = u12
        [12] = u19
        [13] = u17
        [14] = u20
        [15] = u18
        [16] = u2
        [17] = u29
        [18] = u47
        [19] = u50
        [20] = u24
    --]]
    u5 = p61
    u6 = u5:WaitForChild("Humanoid")
    u7 = u6:WaitForChild("Animator")
    u13 = u7:LoadAnimation(u9)
    u14 = u7:LoadAnimation(u10)
    u15 = u7:LoadAnimation(u11)
    u16 = u7:LoadAnimation(u12)
    u13.Priority = Enum.AnimationPriority.Action
    u14.Priority = Enum.AnimationPriority.Action
    u15.Priority = Enum.AnimationPriority.Action
    u16.Priority = Enum.AnimationPriority.Action
    u13.Looped = true
    u14.Looped = true
    u15.Looped = true
    u16.Looped = false
    u19 = "idle"
    u17 = false
    u20 = false
    u18 = false
    u6.WalkSpeed = 12
    u6.AutoRotate = true
    u2.MouseBehavior = Enum.MouseBehavior.Default
    task.wait(0.5)
    u29()
    task.wait(0.3)
    u47()
    u6:GetPropertyChangedSignal("Sit"):Connect(function() --[[ Line: 244 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u19
            [3] = u13
            [4] = u14
            [5] = u15
        --]]
        if not u6.Sit then
            u6.WalkSpeed = 12
            if u19 == "idle" then
                return
            end
            if u13.IsPlaying then
                u13:Stop(0.2)
            end
            if u14.IsPlaying then
                u14:Stop(0.2)
            end
            if u15.IsPlaying then
                u15:Stop(0.2)
            end
            u15:Play(0.2)
            u19 = "idle"
        end
    end)
    u50()
    u6.StateChanged:Connect(function(_, p62) --[[ Line: 276 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u20
            [3] = u13
            [4] = u14
            [5] = u15
            [6] = u19
            [7] = u16
        --]]
        if u24() then
            return
        elseif p62 == Enum.HumanoidStateType.Jumping then
            u20 = true
            if u13.IsPlaying then
                u13:Stop(0.15)
            end
            if u14.IsPlaying then
                u14:Stop(0.15)
            end
            if u15.IsPlaying then
                u15:Stop(0.15)
            end
            u19 = "jump"
            u16:Play(0.1)
        elseif (p62 == Enum.HumanoidStateType.Landed or (p62 == Enum.HumanoidStateType.Running or p62 == Enum.HumanoidStateType.RunningNoPhysics)) and u20 then
            u20 = false
            if u16.IsPlaying then
                u16:Stop(0.2)
            end
            u19 = "none"
        end
    end)
end)
u6.WalkSpeed = 12
u6:GetPropertyChangedSignal("Sit"):Connect(function() --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
        [3] = u13
        [4] = u14
        [5] = u15
    --]]
    if not u6.Sit then
        u6.WalkSpeed = 12
        if u19 == "idle" then
            return
        end
        if u13.IsPlaying then
            u13:Stop(0.2)
        end
        if u14.IsPlaying then
            u14:Stop(0.2)
        end
        if u15.IsPlaying then
            u15:Stop(0.2)
        end
        u15:Play(0.2)
        u19 = "idle"
    end
end)
u50()
u6.StateChanged:Connect(function(_, p63) --[[ Line: 276 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u20
        [3] = u13
        [4] = u14
        [5] = u15
        [6] = u19
        [7] = u16
    --]]
    if u24() then
        return
    elseif p63 == Enum.HumanoidStateType.Jumping then
        u20 = true
        if u13.IsPlaying then
            u13:Stop(0.15)
        end
        if u14.IsPlaying then
            u14:Stop(0.15)
        end
        if u15.IsPlaying then
            u15:Stop(0.15)
        end
        u19 = "jump"
        u16:Play(0.1)
    elseif (p63 == Enum.HumanoidStateType.Landed or (p63 == Enum.HumanoidStateType.Running or p63 == Enum.HumanoidStateType.RunningNoPhysics)) and u20 then
        u20 = false
        if u16.IsPlaying then
            u16:Stop(0.2)
        end
        u19 = "none"
    end
end)
if u19 ~= "idle" then
    if u13.IsPlaying then
        u13:Stop(0.2)
    end
    if u14.IsPlaying then
        u14:Stop(0.2)
    end
    if u15.IsPlaying then
        u15:Stop(0.2)
    end
    u15:Play(0.2)
    u19 = "idle"
end