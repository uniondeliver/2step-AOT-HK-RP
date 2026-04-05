-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local u4 = game:GetService("TweenService")
local u5 = game:GetService("Debris")
local u6 = u1.LocalPlayer
local u7 = v3:WaitForChild("Assets")
local v8 = u7:WaitForChild("Remotes")
local v9 = v8:WaitForChild("TitanAction")
local u10 = v8:WaitForChild("TitanSync")
local u11 = u7:WaitForChild("Animations")
local u12 = {}
local u13 = {
    ["IsGrabbed"] = false,
    ["OriginalWalkSpeed"] = 16,
    ["OriginalJumpPower"] = 50
}
local u14 = {}
u14.__index = u14
function u14.new(p15, p16) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v17 = u14
    local v18 = setmetatable({}, v17)
    v18.UUID = p15
    v18.Type = p16.Type
    v18.HeightScale = p16.HeightScale
    v18.Model = nil
    v18.LoadedAnims = {}
    v18.Blinded = false
    v18.Frozen = false
    v18.Grabbing = nil
    v18.Hitboxes = {}
    v18.Aggression = p16.Aggression or "Default"
    return v18
end
function u14.FindModel(p19) --[[ Line: 87 ]]
    local v20 = workspace:FindFirstChild("AliveTitans")
    if v20 then
        for _, v21 in pairs(v20:GetChildren()) do
            if v21:IsA("Model") and v21:GetAttribute("TitanModel") then
                local v22 = v21:FindFirstChild("TitanID")
                if v22 and (v22:IsA("StringValue") and v22.Value == p19.UUID) then
                    p19.Model = v21
                    return v21
                end
            end
        end
        return nil
    end
end
function u14.SetupAnimations(p23) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p23.Model then
        local v24 = p23.Model:FindFirstChildWhichIsA("Humanoid")
        if v24 then
            local v25 = u11:FindFirstChild(p23.Type == "Abnormal" and "Abnormals" or (p23.Type == "Crawler" and "Crawlers" or "Normals"))
            if v25 then
                for _, v26 in pairs(v25:GetChildren()) do
                    if v26:IsA("Animation") then
                        p23.LoadedAnims[v26.Name] = v24:LoadAnimation(v26)
                    end
                end
                p23:SetupWalkIdle()
                p23:ProtectHitboxSizes()
            end
        else
            return
        end
    else
        return
    end
end
function u14.SetupWalkIdle(u27) --[[ Line: 128 ]]
    local v28 = u27.Model:FindFirstChildWhichIsA("Humanoid")
    if v28 then
        local v29 = math.random(1, 3)
        local u30 = nil
        local v31, v32
        if u27.Type == "Crawler" then
            v31 = "Idle"
            v32 = "Walk"
            u30 = 1.5
        else
            v31 = "Idle" .. v29
            if u27.Type == "Normal" then
                v32 = u27.LoadedAnims.NewWalk and "NewWalk" or "Walk" .. v29
            else
                v32 = "Walk" .. v29
            end
        end
        local u33 = u27.LoadedAnims[v31]
        local u34 = u27.LoadedAnims[v32]
        u27._idleAnim = u33
        u27._walkAnim = u34
        if u33 then
            u33:Play(0.15)
            u33.Priority = Enum.AnimationPriority.Idle
        end
        if u34 then
            u34.Priority = Enum.AnimationPriority.Movement
            v28.Running:Connect(function(p35) --[[ Line: 161 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u34
                    [3] = u30
                    [4] = u33
                --]]
                if u27.Frozen then
                    if u34.IsPlaying then
                        u34:Stop(0.15)
                    end
                    return
                else
                    local v36 = u27.Model
                    if v36 then
                        v36 = u27.Model:FindFirstChild("HumanoidRootPart")
                    end
                    if v36 and v36.Anchored then
                        if u34.IsPlaying then
                            u34:Stop(0.15)
                        end
                    elseif p35 > 15 then
                        if not u34.IsPlaying then
                            u34:Play(0.15)
                            if u30 then
                                u34:AdjustSpeed(u30)
                                return
                            end
                        end
                    elseif p35 <= 15 then
                        if u34.IsPlaying then
                            u34:Stop(0.15)
                        end
                        if u33 then
                            u33:Play(0.15)
                            u33.Priority = Enum.AnimationPriority.Idle
                        end
                    end
                end
            end)
        end
    end
end
function u14.ProtectHitboxSizes(p37) --[[ Line: 191 ]]
    if p37.Model then
        for _, v38 in pairs({ "Nape", "Eyes" }) do
            local u39 = p37.Model:FindFirstChild(v38)
            if u39 then
                local u40 = u39.Size
                u39:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 197 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                        [2] = u40
                    --]]
                    if u39.Size ~= u40 then
                        u39.Size = u40
                    end
                end)
            end
        end
    end
end
function u14.PlayAnim(p41, p42, p43, p44) --[[ Line: 204 ]]
    local v45 = p41.LoadedAnims[p42]
    if not v45 then
        return nil
    end
    v45:Play(p43 or 0.1)
    if p44 then
        v45:AdjustSpeed(p44)
    end
    return v45
end
function u14.GetAnimLength(p46, p47) --[[ Line: 212 ]]
    local v48 = p46.LoadedAnims[p47]
    if not v48 then
        return 1
    end
    local v49 = 0
    while v48.Length <= 0 and v49 < 30 do
        task.wait()
        v49 = v49 + 1
    end
    return v48.Length
end
function u14.CancelAnims(p50, p51) --[[ Line: 223 ]]
    for _, v52 in pairs(p50.LoadedAnims) do
        if v52.IsPlaying then
            v52:Stop(p51 or 0.3)
        end
    end
end
function u14.Hitbox(p53, u54, p55, u56) --[[ Line: 233 ]]
    if not p55 then
        return p53.Hitboxes[u54]
    end
    if p53.Hitboxes[u54] then
        p53.Hitboxes[u54]:Disconnect()
    end
    local v60 = p55.Touched:Connect(function(p57) --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u56
        --]]
        local v58 = p57.Parent
        if v58 and v58:IsA("Model") then
            local v59 = v58:FindFirstChildWhichIsA("Humanoid")
            if v59 then
                if v59.Health <= 0 then
                    return
                elseif v58:FindFirstChild("IFrames") then
                    return
                elseif v58:GetAttribute("Shifter") and u54 ~= "Punch" then
                    return
                elseif v58:GetAttribute("BeingGrabbed") then
                    return
                elseif not v58:FindFirstChild("Grabbing", true) then
                    u56(v58, v59)
                end
            else
                return
            end
        else
            return
        end
    end)
    p53.Hitboxes[u54] = v60
    return v60
end
function u14.CreateTempHitbox(p61, p62, p63, p64) --[[ Line: 268 ]]
    local v65 = p62:Clone()
    for _, v66 in v65:GetChildren() do
        if v66:IsA("Texture") or v66:IsA("Motor6D") then
            v66:Destroy()
        end
    end
    v65.Transparency = 1
    v65.CanCollide = false
    v65.CanQuery = false
    if p63 then
        if typeof(p63) == "Vector3" then
            v65.Size = p62.Size * p63
        else
            v65.Size = p62.Size * p63
        end
    end
    if p64 then
        v65.CFrame = p62.CFrame * p64
    else
        v65.CFrame = p62.CFrame
    end
    v65.Parent = p61.Model
    local v67 = Instance.new("WeldConstraint")
    v67.Part0 = v65
    v67.Part1 = p62
    v67.Parent = v65
    return v65
end
function u14.CreateScaledGrabHitbox(p68, p69, p70, p71, p72) --[[ Line: 298 ]]
    local v73 = p68.HeightScale / p70
    local v74 = p69:Clone()
    for _, v75 in v74:GetChildren() do
        if v75:IsA("Texture") or v75:IsA("Motor6D") then
            v75:Destroy()
        end
    end
    v74.Transparency = 1
    v74.CanCollide = false
    v74.CanQuery = false
    local v76 = p69.Size
    local v77 = v73 * p71.X
    local v78 = v73 * p71.Y
    local v79 = v73 * p71.Z
    v74.Size = v76 + Vector3.new(v77, v78, v79)
    if p72 then
        v74.CFrame = p69.CFrame * CFrame.new(0, v73 * p72, 0)
    else
        v74.CFrame = p69.CFrame
    end
    v74.Parent = p68.Model
    local v80 = Instance.new("WeldConstraint")
    v80.Part0 = v74
    v80.Part1 = p69
    v80.Parent = v74
    return v74
end
function u14.WaitForMarker(_, u81, u82, p83) --[[ Line: 327 ]]
    if u81 then
        local u84 = p83 or 2
        pcall(function() --[[ Line: 330 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u82
                [3] = u84
            --]]
            local v85 = u81:GetMarkerReachedSignal(u82)
            local u86 = false
            local u87 = nil
            u87 = v85:Connect(function() --[[ Line: 334 ]]
                --[[
                Upvalues:
                    [1] = u86
                    [2] = u87
                --]]
                u86 = true
                u87:Disconnect()
            end)
            local v88 = tick()
            local v89 = u87
            while not u86 and tick() - v88 < u84 do
                task.wait()
            end
            if v89.Connected then
                v89:Disconnect()
            end
        end)
    end
end
function u14.HandleStomp(u90, u91) --[[ Line: 350 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u91 and (u90.Model and not u90.Frozen) then
        u90:PlayAnim(string.gsub(u91.Name, "Foot", "") .. "Stomp")
        local u92 = u90:CreateTempHitbox(u91, 1.5)
        local u93 = nil
        task.delay(0.5, function() --[[ Line: 359 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u90
                [3] = u92
                [4] = u10
                [5] = u91
            --]]
            u93 = u90:Hitbox("Stomp", u92, function(p94) --[[ Line: 360 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u90
                    [3] = u91
                    [4] = u93
                    [5] = u92
                --]]
                u10:FireServer(u90.UUID, "Stomp", p94, u91.Name)
                if u93 then
                    u93:Disconnect()
                end
                if u92 and u92.Parent then
                    u92:Destroy()
                end
            end)
        end)
        task.delay(2, function() --[[ Line: 367 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u92
            --]]
            if u93 then
                pcall(function() --[[ Line: 368 ]]
                    --[[
                    Upvalues:
                        [1] = u93
                    --]]
                    u93:Disconnect()
                end)
            end
            if u92 and u92.Parent then
                u92:Destroy()
            end
        end)
    end
end
function u14.HandleKick(u95, u96, _) --[[ Line: 377 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u96 and (u95.Model and not u95.Frozen) then
        local v97 = u95:PlayAnim(string.gsub(u96.Name, "Foot", "") .. "Kick")
        if v97 then
            v97.Priority = Enum.AnimationPriority.Action2
        end
        local u98 = u95:CreateTempHitbox(u96, Vector3.new(1.5, 3, 1.5))
        local u99 = nil
        if v97 then
            local u100 = nil
            u100 = v97.KeyframeReached:Connect(function(p101) --[[ Line: 389 ]]
                --[[
                Upvalues:
                    [1] = u99
                    [2] = u95
                    [3] = u98
                    [4] = u10
                    [5] = u96
                    [6] = u100
                --]]
                if p101 == "Start" then
                    u99 = u95:Hitbox("Kick", u98, function(p102) --[[ Line: 391 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u95
                            [3] = u96
                            [4] = u99
                            [5] = u98
                        --]]
                        u10:FireServer(u95.UUID, "Kick", p102, u96.Name)
                        if u99 then
                            u99:Disconnect()
                        end
                        if u98 and u98.Parent then
                            u98:Destroy()
                        end
                    end)
                else
                    if u99 then
                        pcall(function() --[[ Line: 397 ]]
                            --[[
                            Upvalues:
                                [1] = u99
                            --]]
                            u99:Disconnect()
                        end)
                    end
                    if u98 and u98.Parent then
                        u98:Destroy()
                    end
                    if u100 then
                        u100:Disconnect()
                    end
                end
            end)
        end
        task.delay(2, function() --[[ Line: 404 ]]
            --[[
            Upvalues:
                [1] = u99
                [2] = u98
            --]]
            if u99 then
                pcall(function() --[[ Line: 405 ]]
                    --[[
                    Upvalues:
                        [1] = u99
                    --]]
                    u99:Disconnect()
                end)
            end
            if u98 and u98.Parent then
                u98:Destroy()
            end
        end)
    end
end
function u14.HandlePredict(u103, u104, u105, _) --[[ Line: 414 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u103.Model and not u103.Frozen then
        local v106 = u103.Model:FindFirstChild(u105 .. "Hand")
        if v106 then
            local v107 = u105 .. "Grab"
            local v108 = u103:PlayAnim(v107, 0.1)
            local v109 = u103:CreateScaledGrabHitbox(v106, 25, Vector3.new(1.8, 3, 1.8), 0.8)
            u103:WaitForMarker(v108, "HitboxBegin", 2)
            local u110 = nil
            u110 = u103:Hitbox("Grab", v109, function(p111) --[[ Line: 428 ]]
                --[[
                Upvalues:
                    [1] = u104
                    [2] = u10
                    [3] = u103
                    [4] = u105
                    [5] = u110
                --]]
                if u104 and u104 ~= p111 then
                    return
                elseif not p111:FindFirstChild("Grabbing", true) then
                    u10:FireServer(u103.UUID, "Grab", p111, u105)
                    if u110 then
                        u110:Disconnect()
                    end
                end
            end)
            local v112 = v108 and u103:GetAnimLength(v107) - v108.TimePosition - 0.05 or 1
            task.wait((math.max(v112, 0.1)))
            if u110 then
                pcall(function() --[[ Line: 440 ]]
                    --[[
                    Upvalues:
                        [1] = u110
                    --]]
                    u110:Disconnect()
                end)
            end
            if v109 and v109.Parent then
                v109:Destroy()
            end
            u10:FireServer(u103.UUID, "Grab", nil, nil, true)
        end
    else
        return
    end
end
function u14.HandleLowPredict(u113, u114, u115, _) --[[ Line: 450 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u113.Model and not u113.Frozen then
        local v116 = u113.Model:FindFirstChild(u115 .. "Hand")
        if v116 then
            local v117 = u115 .. "LowGrab"
            if not u113.LoadedAnims[v117] then
                v117 = u115 .. "Grab"
            end
            local v118 = u113:PlayAnim(v117, 0.1)
            local v119 = u113:CreateScaledGrabHitbox(v116, 25, Vector3.new(1.8, 3, 1.8), 0.8)
            u113:WaitForMarker(v118, "HitboxBegin", 2)
            local u120 = nil
            u120 = u113:Hitbox("Grab", v119, function(p121) --[[ Line: 468 ]]
                --[[
                Upvalues:
                    [1] = u114
                    [2] = u10
                    [3] = u113
                    [4] = u115
                    [5] = u120
                --]]
                if u114 and u114 ~= p121 then
                    return
                elseif not p121:FindFirstChild("Grabbing", true) then
                    u10:FireServer(u113.UUID, "Grab", p121, u115)
                    if u120 then
                        u120:Disconnect()
                    end
                end
            end)
            local v122 = v118 and u113:GetAnimLength(v117) - v118.TimePosition - 0.05 or 1
            task.wait((math.max(v122, 0.1)))
            if u120 then
                pcall(function() --[[ Line: 480 ]]
                    --[[
                    Upvalues:
                        [1] = u120
                    --]]
                    u120:Disconnect()
                end)
            end
            if v119 and v119.Parent then
                v119:Destroy()
            end
            u10:FireServer(u113.UUID, "Grab", nil, nil, true)
        end
    else
        return
    end
end
function u14.HandleNapePredict(u123, u124, u125, _) --[[ Line: 490 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u123.Model and not u123.Frozen then
        local v126 = u123.Model:FindFirstChild(u125 .. "Hand")
        if v126 then
            local v127 = u125 .. "NapeGrab"
            if not u123.LoadedAnims[v127] then
                v127 = u125 .. "Grab"
            end
            local v128 = u123:PlayAnim(v127, 0.1, 1.2)
            local v129 = u123:CreateScaledGrabHitbox(v126, 25, Vector3.new(2.2, 3.5, 2.2), nil)
            u123:WaitForMarker(v128, "HitboxBegin", 1.5)
            local u130 = nil
            u130 = u123:Hitbox("Grab", v129, function(p131) --[[ Line: 508 ]]
                --[[
                Upvalues:
                    [1] = u124
                    [2] = u10
                    [3] = u123
                    [4] = u125
                    [5] = u130
                --]]
                if u124 and u124 ~= p131 then
                    return
                elseif not p131:FindFirstChild("Grabbing", true) then
                    u10:FireServer(u123.UUID, "Grab", p131, u125)
                    if u130 then
                        u130:Disconnect()
                    end
                end
            end)
            local v132 = v128 and u123:GetAnimLength(v127) - v128.TimePosition - 0.05 or 1
            task.wait((math.max(v132, 0.1)))
            if u130 then
                pcall(function() --[[ Line: 520 ]]
                    --[[
                    Upvalues:
                        [1] = u130
                    --]]
                    u130:Disconnect()
                end)
            end
            if v129 and v129.Parent then
                v129:Destroy()
            end
        end
    else
        return
    end
end
function u14.HandleGroundGrab(u133, u134, u135) --[[ Line: 528 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u133.Model and not u133.Frozen then
        local v136 = u133.Model:FindFirstChild(u135 .. "Hand")
        if v136 then
            local v137 = u135 .. "GroundGrab"
            if not u133.LoadedAnims[v137] then
                v137 = u135 .. "Grab"
            end
            local v138 = u133:PlayAnim(v137, 0.1, 1.1)
            if v138 then
                v138.Priority = Enum.AnimationPriority.Action3
            end
            local v139 = u133.HeightScale / 20
            local u140 = Instance.new("Part")
            u140.Name = "GroundGrabHitbox"
            u140.Transparency = 1
            u140.CanCollide = false
            u140.CanQuery = false
            u140.Anchored = false
            local v141 = v136.Size.X + v139 * 4
            local v142 = v136.Size.Y + v139 * 6
            local v143 = v136.Size.Z + v139 * 4
            u140.Size = Vector3.new(v141, v142, v143)
            u140.CFrame = v136.CFrame * CFrame.new(0, -v139 * 1.5, -v139 * 0.5)
            u140.Parent = u133.Model
            local v144 = Instance.new("WeldConstraint")
            v144.Part0 = u140
            v144.Part1 = v136
            v144.Parent = u140
            local v145 = u135 .. "Foot"
            local v146 = u133.Model:FindFirstChild(v145)
            local u147
            if v146 then
                u147 = Instance.new("Part")
                u147.Name = "GroundGrabFloorHitbox"
                u147.Transparency = 1
                u147.CanCollide = false
                u147.CanQuery = false
                u147.Anchored = false
                local v148 = v146.Size.X * 3
                local v149 = v146.Size.Y * 2
                local v150 = v146.Size.Z * 3
                u147.Size = Vector3.new(v148, v149, v150)
                u147.CFrame = v146.CFrame * CFrame.new(0, -v146.Size.Y, 0)
                u147.Parent = u133.Model
                local v151 = Instance.new("WeldConstraint")
                v151.Part0 = u147
                v151.Part1 = v146
                v151.Parent = u147
            else
                u147 = nil
            end
            if v138 then
                u133:WaitForMarker(v138, "HitboxBegin", 2)
            end
            local u152 = false
            local u153 = nil
            u153 = u133:Hitbox("Grab", u140, function(p154) --[[ Line: 595 ]]
                --[[
                Upvalues:
                    [1] = u152
                    [2] = u134
                    [3] = u10
                    [4] = u133
                    [5] = u135
                    [6] = u153
                --]]
                if u152 then
                    return
                elseif u134 and u134 ~= p154 then
                    return
                elseif not p154:FindFirstChild("Grabbing", true) then
                    u152 = true
                    u10:FireServer(u133.UUID, "Grab", p154, u135)
                    if u153 then
                        u153:Disconnect()
                    end
                end
            end)
            local u155 = nil
            if u147 then
                local v157 = u133:Hitbox("GrabFloor", u147, function(p156) --[[ Line: 608 ]]
                    --[[
                    Upvalues:
                        [1] = u152
                        [2] = u134
                        [3] = u10
                        [4] = u133
                        [5] = u135
                        [6] = u155
                        [7] = u153
                    --]]
                    if u152 then
                        return
                    elseif u134 and u134 ~= p156 then
                        return
                    elseif not p156:FindFirstChild("Grabbing", true) then
                        u152 = true
                        u10:FireServer(u133.UUID, "Grab", p156, u135)
                        if u155 then
                            u155:Disconnect()
                        end
                        if u153 then
                            pcall(function() --[[ Line: 617 ]]
                                --[[
                                Upvalues:
                                    [1] = u153
                                --]]
                                u153:Disconnect()
                            end)
                        end
                    end
                end)
                u155 = v157
            end
            if v138 then
                v138.Ended:Connect(function() --[[ Line: 622 ]]
                    --[[
                    Upvalues:
                        [1] = u153
                        [2] = u155
                        [3] = u140
                        [4] = u147
                    --]]
                    if u153 then
                        pcall(function() --[[ Line: 623 ]]
                            --[[
                            Upvalues:
                                [1] = u153
                            --]]
                            u153:Disconnect()
                        end)
                    end
                    if u155 then
                        pcall(function() --[[ Line: 624 ]]
                            --[[
                            Upvalues:
                                [1] = u155
                            --]]
                            u155:Disconnect()
                        end)
                    end
                    if u140 and u140.Parent then
                        u140:Destroy()
                    end
                    if u147 and u147.Parent then
                        u147:Destroy()
                    end
                end)
            end
            task.delay(3.5, function() --[[ Line: 630 ]]
                --[[
                Upvalues:
                    [1] = u153
                    [2] = u155
                    [3] = u140
                    [4] = u147
                --]]
                if u153 then
                    pcall(function() --[[ Line: 631 ]]
                        --[[
                        Upvalues:
                            [1] = u153
                        --]]
                        u153:Disconnect()
                    end)
                end
                if u155 then
                    pcall(function() --[[ Line: 632 ]]
                        --[[
                        Upvalues:
                            [1] = u155
                        --]]
                        u155:Disconnect()
                    end)
                end
                if u140 and u140.Parent then
                    u140:Destroy()
                end
                if u147 and u147.Parent then
                    u147:Destroy()
                end
            end)
        end
    else
        return
    end
end
function u14.HandleDive(u158, u159) --[[ Line: 642 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u158.Model and not u158.Frozen then
        u158:PlayAnim("Dive", 0.3)
        local v160 = u158.Model:FindFirstChild("LeftHand")
        local v161 = u158.Model:FindFirstChild("RightHand")
        local u162 = nil
        local u163 = nil
        local u164 = nil
        local u165
        if v160 then
            u165 = u158:CreateScaledGrabHitbox(v160, 25, Vector3.new(2, 3, 2), nil)
            local v167 = u158:Hitbox("DiveLeft", u165, function(p166) --[[ Line: 655 ]]
                --[[
                Upvalues:
                    [1] = u159
                    [2] = u10
                    [3] = u158
                    [4] = u162
                    [5] = u163
                --]]
                if not u159 or u159 == p166 then
                    u10:FireServer(u158.UUID, "Dive", p166)
                    u10:FireServer(u158.UUID, "Grab", p166, "Left")
                    if u162 then
                        u162:Disconnect()
                    end
                    if u163 then
                        pcall(function() --[[ Line: 661 ]]
                            --[[
                            Upvalues:
                                [1] = u163
                            --]]
                            u163:Disconnect()
                        end)
                    end
                end
            end)
            u162 = v167
        else
            u165 = nil
        end
        if v161 then
            u164 = u158:CreateScaledGrabHitbox(v161, 25, Vector3.new(2, 3, 2), nil)
            u163 = u158:Hitbox("DiveRight", u164, function(p168) --[[ Line: 667 ]]
                --[[
                Upvalues:
                    [1] = u159
                    [2] = u10
                    [3] = u158
                    [4] = u162
                    [5] = u163
                --]]
                if not u159 or u159 == p168 then
                    u10:FireServer(u158.UUID, "Dive", p168)
                    u10:FireServer(u158.UUID, "Grab", p168, "Right")
                    if u162 then
                        pcall(function() --[[ Line: 672 ]]
                            --[[
                            Upvalues:
                                [1] = u162
                            --]]
                            u162:Disconnect()
                        end)
                    end
                    if u163 then
                        u163:Disconnect()
                    end
                end
            end)
        end
        task.delay(0.7, function() --[[ Line: 677 ]]
            --[[
            Upvalues:
                [1] = u162
                [2] = u163
                [3] = u165
                [4] = u164
            --]]
            if u162 then
                pcall(function() --[[ Line: 678 ]]
                    --[[
                    Upvalues:
                        [1] = u162
                    --]]
                    u162:Disconnect()
                end)
            end
            if u163 then
                pcall(function() --[[ Line: 679 ]]
                    --[[
                    Upvalues:
                        [1] = u163
                    --]]
                    u163:Disconnect()
                end)
            end
            if u165 and u165.Parent then
                u165:Destroy()
            end
            if u164 and u164.Parent then
                u164:Destroy()
            end
        end)
    end
end
function u14.HandleLeap(u169, u170, u171) --[[ Line: 689 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u169.Model and not u169.Frozen then
        local u172 = {}
        local v173 = u169.LoadedAnims.NewBodySlam and "NewBodySlam" or "LeapStart"
        u169:PlayAnim(v173, 0.1)
        local v174 = u169.Model:FindFirstChild("UpperTorso")
        if v174 then
            local v175 = Instance.new("Part")
            v175.Transparency = 1
            v175.CanCollide = false
            v175.CanQuery = false
            v175.Anchored = false
            v175.Size = Vector3.new(120, 25, 80)
            v175.CFrame = v174.CFrame * CFrame.new(0, 20, -v174.Size.Z / 1.5)
            v175.Parent = u169.Model
            local v176 = Instance.new("WeldConstraint")
            v176.Part0 = v175
            v176.Part1 = u169.Model.HumanoidRootPart
            v176.Parent = v175
            local u178 = u169:Hitbox("Leap", v175, function(p177) --[[ Line: 715 ]]
                --[[
                Upvalues:
                    [1] = u172
                    [2] = u170
                    [3] = u10
                    [4] = u169
                    [5] = u171
                --]]
                if u172[p177] then
                    return
                elseif not u170 or u170 == p177 then
                    u10:FireServer(u169.UUID, "Leap", p177, u171)
                    u172[p177] = true
                end
            end)
            local v179 = u169:GetAnimLength(v173)
            local v180 = task.wait
            local v181 = v179 - 0.8
            v180((math.max(v181, 0.5)))
            if v175 and v175.Parent then
                v175:Destroy()
            end
            if u178 then
                pcall(function() --[[ Line: 727 ]]
                    --[[
                    Upvalues:
                        [1] = u178
                    --]]
                    u178:Disconnect()
                end)
            end
            u169:PlayAnim("LeapLand", 0.3)
        end
    else
        return
    end
end
function u14.HandlePunch(u182, u183) --[[ Line: 736 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u182.Model and not u182.Frozen then
        local v184 = u182:PlayAnim("Punch", 0.1)
        local v185 = u182.Model:FindFirstChild("RightHand") or u182.Model:FindFirstChild("LeftHand")
        if v185 then
            local v186 = u182:CreateTempHitbox(v185, 2)
            local u187 = nil
            u187 = u182:Hitbox("Punch", v186, function(p188) --[[ Line: 749 ]]
                --[[
                Upvalues:
                    [1] = u183
                    [2] = u10
                    [3] = u182
                    [4] = u187
                --]]
                if not u183 or u183 == p188 then
                    u10:FireServer(u182.UUID, "Punch", p188)
                    if u187 then
                        u187:Disconnect()
                    end
                end
            end)
            local v189 = v184 and u182:GetAnimLength("Punch") or 1.5
            local v190 = task.wait
            local v191 = v189 - 0.2
            v190((math.max(v191, 0.3)))
            if u187 then
                pcall(function() --[[ Line: 758 ]]
                    --[[
                    Upvalues:
                        [1] = u187
                    --]]
                    u187:Disconnect()
                end)
            end
            if v186 and v186.Parent then
                v186:Destroy()
            end
        end
    else
        return
    end
end
function u14.HandleGrab(p192, p193) --[[ Line: 766 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
    --]]
    if p193 == u6 and not u13.IsGrabbed then
        u13.IsGrabbed = true
        local v194 = u6.Character
        if v194 then
            local v195 = v194:FindFirstChildWhichIsA("Humanoid")
            if v195 then
                u13.OriginalWalkSpeed = v195.WalkSpeed
                u13.OriginalJumpPower = v195.JumpPower
                v195.WalkSpeed = 0
                v195.JumpPower = 0
                v195.JumpHeight = 0
            end
            u6:SetAttribute("BeingGrabbed", true)
        end
    end
    p192.Grabbing = p193
end
function u14.HandleGrabReleased(p196) --[[ Line: 773 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    if u13.IsGrabbed then
        u13.IsGrabbed = false
        local v197 = u6.Character
        if v197 then
            local v198 = v197:FindFirstChildWhichIsA("Humanoid")
            if v198 then
                v198.WalkSpeed = u13.OriginalWalkSpeed or 16
                v198.JumpPower = u13.OriginalJumpPower or 50
                v198.JumpHeight = 7.2
            end
            u6:SetAttribute("BeingGrabbed", nil)
        end
    end
    p196.Grabbing = nil
end
function u14.HandleBlind(u199, p200) --[[ Line: 782 ]]
    u199.Blinded = true
    local v201
    if u199.Type == "Crawler" then
        v201 = ""
    else
        local v202 = math.random
        v201 = tostring(v202(1, 3))
    end
    local v203 = "Blind" .. v201
    local u204 = u199:PlayAnim(v203, 0.35)
    if u204 then
        u204:AdjustSpeed(u199:GetAnimLength(v203) / p200 or 1)
        if u199.Type == "Crawler" then
            local u205 = u204.KeyframeReached:Connect(function() --[[ Line: 800 ]]
                --[[
                Upvalues:
                    [1] = u204
                --]]
                u204:AdjustSpeed(0)
            end)
            task.delay(p200, function() --[[ Line: 803 ]]
                --[[
                Upvalues:
                    [1] = u205
                --]]
                if u205 then
                    u205:Disconnect()
                end
            end)
        end
        task.delay(p200, function() --[[ Line: 808 ]]
            --[[
            Upvalues:
                [1] = u204
                [2] = u199
            --]]
            if u204 and u204.IsPlaying then
                u204:Stop(0.1)
            end
            u199.Blinded = false
        end)
    else
        task.delay(p200, function() --[[ Line: 813 ]]
            --[[
            Upvalues:
                [1] = u199
            --]]
            u199.Blinded = false
        end)
    end
end
function u14.HandleFreeze(p206) --[[ Line: 823 ]]
    p206.Frozen = true
    p206:CancelAnims(0.3)
    if p206._idleAnim then
        p206._idleAnim:Play(0.15)
        p206._idleAnim.Priority = Enum.AnimationPriority.Idle
    end
end
function u14.HandleUnfreeze(p207) --[[ Line: 832 ]]
    p207.Frozen = false
    p207:SetupWalkIdle()
end
function u14.HandleDead(u208) --[[ Line: 841 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u7
        [4] = u5
        [5] = u12
    --]]
    u208.Grabbing = nil
    if u13.IsGrabbed then
        u13.IsGrabbed = false
        local v209 = u6.Character
        if v209 then
            local v210 = v209:FindFirstChildWhichIsA("Humanoid")
            if v210 then
                v210.WalkSpeed = u13.OriginalWalkSpeed or 16
                v210.JumpPower = u13.OriginalJumpPower or 50
                v210.JumpHeight = 7.2
            end
            u6:SetAttribute("BeingGrabbed", nil)
        end
    end
    for _, u211 in pairs(u208.Hitboxes) do
        pcall(function() --[[ Line: 846 ]]
            --[[
            Upvalues:
                [1] = u211
            --]]
            u211:Disconnect()
        end)
    end
    u208.Hitboxes = {}
    u208:CancelAnims(0.3)
    local v212 = u208:PlayAnim("Death" .. math.random(1, 3), 0.3, 1.2)
    if v212 and u208.Model then
        v212.KeyframeReached:Connect(function() --[[ Line: 854 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u208
                [3] = u5
            --]]
            local v213 = u7.Effects:FindFirstChild("TitanDeadSmoke")
            local v214 = v213 and v213:FindFirstChild("Attach")
            if v214 then
                local v215 = v214:Clone()
                local v216 = Instance.new("Part")
                v216.Transparency = 1
                v216.CanCollide = false
                v216.CanQuery = false
                local v217 = u208.Model:FindFirstChild("UpperTorso")
                if v217 then
                    v216.Position = v217.Position
                end
                v216.Parent = workspace
                v215.Parent = v216
                local v218 = v215:FindFirstChild("Smoke")
                if v218 then
                    v218:Emit(v218:GetAttribute("EmitCount") or 10)
                end
                u5:AddItem(v216, 4)
            end
        end)
    end
    task.delay(10, function() --[[ Line: 876 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u208
        --]]
        u12[u208.UUID] = nil
    end)
end
repeat
    task.wait(0.5)
until workspace:FindFirstChild("AliveTitans")
local function u221(p219, p220) --[[ Line: 887 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if not p220 or p219.C0 ~= CFrame.new(p219.C0.Position) then
        u4:Create(p219, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
            ["C0"] = CFrame.new(p219.C0.Position)
        }):Play()
    end
end
local function u227(p222) --[[ Line: 896 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v223 = (1 / 0)
    local v224 = nil
    for _, v225 in pairs(u1:GetPlayers()) do
        if v225.Character and (v225.Character.Parent and v225.Character:FindFirstChild("HumanoidRootPart")) then
            local v226 = (v225.Character.HumanoidRootPart.Position - p222.HumanoidRootPart.Position).Magnitude
            if v226 < v223 then
                v224 = v225.Character.HumanoidRootPart
                v223 = v226
            end
        end
    end
    return v224
end
v2.RenderStepped:Connect(function(p228) --[[ Line: 911 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u221
        [3] = u6
        [4] = u227
    --]]
    for _, v229 in pairs(u12) do
        if type(v229) == "table" and (v229.Model and v229.Model.Parent) then
            local v230 = v229.Model:FindFirstChild("HumanoidRootPart")
            if v230 then
                local v231 = v229.Model:FindFirstChild("Head")
                if v231 then
                    local v232 = v231:FindFirstChildOfClass("Motor6D")
                    if v232 then
                        if v229.Blinded or (v229.Model:GetAttribute("Dead") or (v229.Grabbing or v229.Aggression == "Peaceful")) then
                            u221(v232, true)
                        else
                            local v233 = u6.Character
                            if v233 and (v233.Parent and (v233:FindFirstChild("HumanoidRootPart") and (v233.HumanoidRootPart.Position - v230.Position).Magnitude <= 700)) then
                                local v234 = u227(v229.Model)
                                if v234 then
                                    local v235 = v230.CFrame
                                    local v236 = v231.CFrame
                                    local v237 = (v234.Position - v236.Position).Unit
                                    local v238 = v237.X
                                    local v239 = v237.Z
                                    local v240 = Vector3.new(v238, 0, v239).Unit
                                    local v241 = v235.LookVector.Unit:Dot(v240)
                                    local v242 = math.clamp(v241, -1, 1)
                                    if math.acos(v242) <= 1.4311699866353502 then
                                        local v243 = v235:ToObjectSpace((CFrame.lookAt(v236.Position, v236.Position + v237)))
                                        v232.C0 = v232.C0:Lerp(CFrame.new(v232.C0.Position) * v243.Rotation, 5 * p228)
                                    else
                                        u221(v232, true)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
v9.OnClientEvent:Connect(function(p244, p245, ...) --[[ Line: 966 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    if p245 == "New" then
        local v246 = ...
        if not u12[p244] then
            local u247 = u14.new(p244, v246)
            u12[p244] = u247
            task.spawn(function() --[[ Line: 973 ]]
                --[[
                Upvalues:
                    [1] = u247
                --]]
                for _ = 1, 15 do
                    task.wait(0.5)
                    u247:FindModel()
                    if u247.Model then
                        u247:SetupAnimations()
                        return
                    end
                end
            end)
        end
    else
        local v248 = u12[p244]
        if v248 then
            if p245 == "Stomp" then
                v248:HandleStomp(...)
                return
            elseif p245 == "Kick" then
                v248:HandleKick(...)
                return
            elseif p245 == "Predict" then
                v248:HandlePredict(...)
                return
            elseif p245 == "LowPredict" then
                v248:HandleLowPredict(...)
                return
            elseif p245 == "NapePredict" then
                v248:HandleNapePredict(...)
                return
            elseif p245 == "GroundGrab" then
                v248:HandleGroundGrab(...)
                return
            elseif p245 == "Punch" then
                v248:HandlePunch(...)
                return
            elseif p245 == "Dive" then
                v248:HandleDive(...)
                return
            elseif p245 == "Leap" then
                v248:HandleLeap(...)
                return
            elseif p245 == "Grab" then
                v248:HandleGrab(...)
                return
            elseif p245 == "GrabReleased" then
                v248:HandleGrabReleased()
                return
            elseif p245 == "Blind" then
                v248:HandleBlind(...)
                return
            elseif p245 == "Freeze" then
                v248:HandleFreeze()
                return
            elseif p245 == "Unfreeze" then
                v248:HandleUnfreeze()
            elseif p245 == "Dead" then
                v248:HandleDead()
            end
        else
            return
        end
    end
end)