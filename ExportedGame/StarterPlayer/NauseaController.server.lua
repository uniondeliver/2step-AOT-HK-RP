-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game.Players.LocalPlayer
local u2 = game:GetService("RunService")
local u3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage"):WaitForChild("ClientEvents"):WaitForChild("NauseaTrigger")
local v5 = Enum.RenderPriority.Camera.Value + 1
local u6 = Enum.RenderPriority.Character.Value + 1
local u7 = 0
local u8 = false
local u9 = false
local u10 = 0
local u11 = 1.5
local u12 = nil
local u13 = {}
local u14 = nil
local u15 = false
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = false
local u21 = nil
_G.NauseaOverdose = false
local function u26() --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    for v22 = #u13, 1, -1 do
        local u23 = u13[v22]
        if u23 then
            pcall(function() --[[ Line: 58 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:Cancel()
            end)
        end
        u13[v22] = nil
    end
    u13 = {}
    for _, v24 in ipairs(game.Lighting:GetChildren()) do
        if v24:IsA("BlurEffect") and v24.Name == "NauseaBlur" then
            v24:Destroy()
        end
    end
    local v25 = Instance.new("BlurEffect")
    v25.Name = "NauseaBlur"
    v25.Size = 0
    v25.Parent = game.Lighting
    return v25
end
if not game.Lighting:FindFirstChild("NauseaBlur") then
    u26()
end
local function u29() --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    for v27 = #u13, 1, -1 do
        local u28 = u13[v27]
        if u28 then
            pcall(function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:Cancel()
            end)
        end
        u13[v27] = nil
    end
    u13 = {}
end
local function u34(p30) --[[ Line: 109 ]]
    local v31 = p30:FindFirstChildOfClass("Humanoid")
    if v31 then
        local v32 = v31:FindFirstChildOfClass("Animator")
        if v32 then
            for _, v33 in ipairs(v32:GetPlayingAnimationTracks()) do
                v33:Stop(0)
            end
        end
    else
        return
    end
end
local function u37() --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u1
    --]]
    if u17 and u17.Parent then
        return u17
    end
    local v35 = Instance.new("ScreenGui")
    v35.Name = "OverdoseScreen"
    v35.ResetOnSpawn = false
    v35.DisplayOrder = 999
    v35.IgnoreGuiInset = true
    local v36 = Instance.new("Frame")
    v36.Name = "BlackFrame"
    v36.Size = UDim2.new(1, 0, 1, 0)
    v36.Position = UDim2.new(0, 0, 0, 0)
    v36.BackgroundColor3 = Color3.new(0, 0, 0)
    v36.BackgroundTransparency = 1
    v36.BorderSizePixel = 0
    v36.ZIndex = 100
    v36.Parent = v35
    v35.Parent = u1.PlayerGui
    u17 = v35
    return v35
end
local function u43() --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u3
        [3] = u13
    --]]
    local v38 = u37():FindFirstChild("BlackFrame")
    if v38 then
        v38.BackgroundTransparency = 1
        local v39 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        local v40 = {
            ["BackgroundTransparency"] = 0
        }
        if v38 then
            if not v38.Parent then
                return
            end
            local v41 = u3:Create(v38, v39, v40)
            local v42 = u13
            table.insert(v42, v41)
            v41:Play()
        end
    end
end
local function u47(u44) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u3
    --]]
    if u17 and u17.Parent then
        local v45 = u17:FindFirstChild("BlackFrame")
        if v45 then
            local v46 = u3:Create(v45, TweenInfo.new(3.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["BackgroundTransparency"] = 1
            })
            v46:Play()
            v46.Completed:Connect(function() --[[ Line: 185 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u44
                --]]
                if u17 and u17.Parent then
                    u17:Destroy()
                    u17 = nil
                end
                if u44 then
                    u44()
                end
            end)
        elseif u44 then
            u44()
        end
    else
        if u44 then
            u44()
        end
        return
    end
end
local function u50() --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u18
        [3] = u15
    --]]
    local u48 = u1.Character
    if u48 then
        u48 = u48:FindFirstChildOfClass("Humanoid")
    end
    if u48 then
        u48:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        if u18 then
            u18:Disconnect()
        end
        u18 = u48.HealthChanged:Connect(function(p49) --[[ Line: 212 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u48
            --]]
            if u15 then
                if p49 < u48.MaxHealth then
                    u48.Health = u48.MaxHealth
                end
            end
        end)
        u48.Health = u48.MaxHealth
    end
end
local function u54(p51) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v52 = RaycastParams.new()
    v52.FilterType = Enum.RaycastFilterType.Exclude
    v52.FilterDescendantsInstances = { u1.Character }
    local v53 = workspace:Raycast(p51.Position, Vector3.new(0, -50, 0), v52)
    if v53 then
        return v53.Position
    else
        return p51.Position - Vector3.new(0, 2, 0)
    end
end
local function u67() --[[ Line: 286 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u50
        [3] = u19
        [4] = u34
        [5] = u54
        [6] = u21
        [7] = u20
        [8] = u2
        [9] = u6
        [10] = u15
    --]]
    local v55 = u1.Character
    local v56
    if v55 then
        v56 = v55:FindFirstChildOfClass("Humanoid")
    else
        v56 = v55
    end
    local v57
    if v55 then
        v57 = v55:FindFirstChild("HumanoidRootPart")
    else
        v57 = v55
    end
    if v56 and v57 then
        u50()
        u19 = v57.CFrame
        local v58 = v55:FindFirstChild("Animate")
        if v58 then
            v58.Disabled = true
        end
        u34(v55)
        v56.PlatformStand = true
        v56.AutoRotate = false
        local v59 = u54(v57)
        local v60 = v57.CFrame.LookVector
        local v61 = v60.X
        local v62 = v60.Z
        local v63 = math.atan2(v61, v62)
        u21 = CFrame.new(v59 + Vector3.new(0, 1.2, 0)) * CFrame.Angles(0, v63, 0) * CFrame.Angles(-1.5707963267948966, 0, 0)
        v57.CFrame = u21
        v57.Anchored = true
        v57.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        v57.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        if not u20 then
            u20 = true
            u2:BindToRenderStep("NauseaRagdoll", u6, function() --[[ Line: 255 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u21
                    [3] = u1
                --]]
                if u15 then
                    if u21 then
                        local v64 = u1.Character
                        if v64 then
                            local v65 = v64:FindFirstChild("HumanoidRootPart")
                            local v66 = v64:FindFirstChildOfClass("Humanoid")
                            if v65 then
                                v65.CFrame = u21
                                v65.Anchored = true
                                v65.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                v65.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            end
                            if v66 then
                                v66.PlatformStand = true
                            end
                        end
                    else
                        return
                    end
                else
                    return
                end
            end)
        end
    else
        return
    end
end
local function u79() --[[ Line: 328 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u2
        [3] = u21
        [4] = u18
        [5] = u1
        [6] = u19
    --]]
    if u20 then
        u20 = false
        pcall(function() --[[ Line: 281 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            u2:UnbindFromRenderStep("NauseaRagdoll")
        end)
    end
    u21 = nil
    if u18 then
        u18:Disconnect()
        u18 = nil
    end
    local v68 = u1.Character
    if v68 then
        v68 = v68:FindFirstChildOfClass("Humanoid")
    end
    if v68 then
        v68:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        v68.Health = v68.MaxHealth
    end
    local v69 = u1.Character
    local v70
    if v69 then
        v70 = v69:FindFirstChildOfClass("Humanoid")
    else
        v70 = v69
    end
    local v71
    if v69 then
        v71 = v69:FindFirstChild("HumanoidRootPart")
    else
        v71 = v69
    end
    local v72 = v69 and v69:FindFirstChild("Animate")
    if v72 then
        v72.Disabled = false
    end
    if v71 then
        if u19 then
            local v73 = v71.Position + Vector3.new(0, 3, 0)
            local v74 = u19.LookVector
            local v75 = CFrame.new
            local v76 = v74.X
            local v77 = v74.Z
            v71.CFrame = v75(v73, v73 + Vector3.new(v76, 0, v77))
        end
        v71.Anchored = false
        v71.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        v71.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
    if v70 then
        v70.PlatformStand = false
        v70.AutoRotate = true
        v70:ChangeState(Enum.HumanoidStateType.GettingUp)
        task.delay(0.2, function() --[[ Line: 361 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            local v78 = u1.Character
            if v78 then
                v78 = u1.Character:FindFirstChildOfClass("Humanoid")
            end
            if v78 then
                v78:ChangeState(Enum.HumanoidStateType.Running)
            end
        end)
    end
    u19 = nil
end
u2:BindToRenderStep("NauseaShake", v5, function() --[[ Line: 375 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u7
        [4] = u10
        [5] = u11
    --]]
    if u8 or u9 then
        local v80 = workspace.CurrentCamera
        if v80 then
            if u7 > 0 or u9 then
                local v81
                if u9 then
                    v81 = 1 - (tick() - u10) / u11
                    if v81 <= 0 then
                        u9 = false
                        if u7 <= 0 then
                            v80.FieldOfView = 70
                        end
                        return
                    end
                else
                    v81 = 1
                end
                local v82 = u7
                local v83 = v82 <= 0 and u9 and 1 or v82
                local v84 = tick()
                local v85 = v83 * 1.2 + 2.5
                local v86 = v85 > 20 and 20 or v85
                local v87
                if v83 <= 4 then
                    v87 = 1.8 ^ v83 * 0.02
                else
                    v87 = v83 == 5 and 0.28 or (v83 == 6 and 0.38 or (v83 - 6) * 0.05 + 0.38)
                end
                local v88 = (v87 > 1.5 and 1.5 or v87) * v81
                local v89
                if v83 <= 4 then
                    v89 = 1.8 ^ v83 * 0.002618
                else
                    v89 = v83 == 5 and 0.035 or (v83 == 6 and 0.045 or (v83 - 6) * 0.005 + 0.045)
                end
                local v90 = (v89 > 0.12217 and 0.12217 or v89) * v81
                local v91
                if v83 <= 4 then
                    v91 = 1.7 ^ v83 * 0.015
                else
                    v91 = v83 == 5 and 0.1 or (v83 == 6 and 0.14 or (v83 - 6) * 0.02 + 0.14)
                end
                local v92 = (v91 > 0.8 and 0.8 or v91) * v81
                local v93 = 1.6 ^ v83 * 0.3
                local v94 = (v93 > 8 and 8 or v93) * v81
                local v95 = 1.7 ^ v83 * 0.8 + 70
                local v96 = v95 > 120 and 120 or v95
                local v97 = v84 * v86 * 0.7
                local v98 = math.sin(v97) * 0.6
                local v99 = v84 * v86 * 1.3 + 1.7
                local v100 = math.sin(v99) * 0.3
                local v101 = v84 * v86 * 0.9 + 3.1
                local v102 = math.cos(v101) * 0.1
                local v103 = v98 + v100 + v102
                local v104 = v84 * v86 * 0.5
                local v105 = math.sin(v104) * v92
                local v106 = v84 * v86 * 0.55 + 0.5
                local v107 = math.cos(v106) * v92
                local v108 = v84 * v86 + v103
                local v109 = math.sin(v108) * v88 + v105
                local v110 = v84 * v86 * 1.3 + v103 * 0.8
                local v111 = math.cos(v110) * v88 + v107
                local v112 = v84 * v86 * 0.35 + v103 * 0.5
                local v113 = math.sin(v112) * v90
                v80.CFrame = v80.CFrame * CFrame.new(v109, v111, 0) * CFrame.Angles(0, 0, v113)
                local v114 = v84 * v86 * 0.4 + 1.2
                v80.FieldOfView = (v96 + math.sin(v114) * v94 - 70) * v81 + 70
            end
        else
            return
        end
    else
        return
    end
end)
local function u121() --[[ Line: 475 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u8
        [3] = u9
        [4] = u29
        [5] = u7
        [6] = u3
        [7] = u13
    --]]
    local v115 = game.Lighting:FindFirstChild("NauseaBlur") or u26()
    u8 = true
    u9 = false
    u29()
    local v116 = TweenInfo.new(0.5)
    local v117 = {}
    local v118 = 1.5 * 1.6 ^ u7
    v117.Size = v118 > 40 and 40 or v118
    if v115 then
        if not v115.Parent then
            return
        end
        local v119 = u3:Create(v115, v116, v117)
        local v120 = u13
        table.insert(v120, v119)
        v119:Play()
    end
end
local function u133(p122) --[[ Line: 485 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u26
        [3] = u8
        [4] = u9
        [5] = u10
        [6] = u11
        [7] = u29
        [8] = u3
        [9] = u13
    --]]
    u7 = p122
    local v123 = game.Lighting:FindFirstChild("NauseaBlur") or u26()
    if u7 <= 0 then
        u8 = false
        u9 = true
        u10 = tick()
        u11 = 1.5
        u29()
        local v124 = TweenInfo.new(1.5)
        local v125 = {
            ["Size"] = 0
        }
        if v123 then
            if v123.Parent then
                local v126 = u3:Create(v123, v124, v125)
                local v127 = u13
                table.insert(v127, v126)
                v126:Play()
            end
        end
    else
        u29()
        local v128 = TweenInfo.new(1)
        local v129 = {}
        local v130 = 1.5 * 1.6 ^ u7
        v129.Size = v130 > 40 and 40 or v130
        if v123 then
            if not v123.Parent then
                return
            end
            local v131 = u3:Create(v123, v128, v129)
            local v132 = u13
            table.insert(v132, v131)
            v131:Play()
        end
    end
end
local function u136() --[[ Line: 543 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u67
        [4] = u43
        [5] = u16
        [6] = u79
        [7] = u47
        [8] = u7
        [9] = u133
    --]]
    if not u15 then
        u15 = true
        _G.NauseaOverdose = true
        if u12 then
            pcall(task.cancel, u12)
            u12 = nil
        end
        u67()
        u43()
        u16 = task.spawn(function() --[[ Line: 553 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u79
                [3] = u47
                [4] = u12
                [5] = u7
                [6] = u133
                [7] = u16
            --]]
            task.wait(180)
            u15 = false
            _G.NauseaOverdose = false
            u79()
            u47(nil)
            if u12 then
                pcall(task.cancel, u12)
                u12 = nil
            end
            u12 = task.spawn(function() --[[ Line: 517 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u133
                    [3] = u12
                --]]
                while u7 > 0 do
                    local v134 = u7
                    local v135 = v134 <= 0 and 0 or 60 * 1.25 ^ (v134 - 1)
                    task.wait(v135)
                    if u7 > 0 then
                        u133(u7 - 1)
                    end
                end
                u12 = nil
            end)
            u16 = nil
        end)
    end
end
local function u143() --[[ Line: 571 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
        [3] = u15
        [4] = u79
        [5] = u17
        [6] = u29
        [7] = u20
        [8] = u2
        [9] = u7
        [10] = u8
        [11] = u9
        [12] = u21
        [13] = u19
        [14] = u26
        [15] = u18
        [16] = u1
    --]]
    if u12 then
        pcall(task.cancel, u12)
        u12 = nil
    end
    if u16 then
        pcall(task.cancel, u16)
        u16 = nil
    end
    u15 = false
    _G.NauseaOverdose = false
    u79()
    if u17 and u17.Parent then
        u17:Destroy()
        u17 = nil
    end
    u29()
    if u20 then
        u20 = false
        pcall(function() --[[ Line: 281 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            u2:UnbindFromRenderStep("NauseaRagdoll")
        end)
    end
    u7 = 0
    u8 = false
    u9 = false
    u15 = false
    _G.NauseaOverdose = false
    u21 = nil
    u19 = nil
    u26()
    if u17 and u17.Parent then
        u17:Destroy()
        u17 = nil
    end
    if u18 then
        u18:Disconnect()
        u18 = nil
    end
    local v137 = u1.Character
    if v137 then
        v137 = v137:FindFirstChildOfClass("Humanoid")
    end
    if v137 then
        v137:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        v137.Health = v137.MaxHealth
    end
    local v138 = u1.Character
    if v138 then
        local v139 = v138:FindFirstChild("Animate")
        if v139 then
            v139.Disabled = false
        end
        local v140 = v138:FindFirstChildOfClass("Humanoid")
        local v141 = v138:FindFirstChild("HumanoidRootPart")
        if v141 then
            v141.Anchored = false
        end
        if v140 then
            v140.PlatformStand = false
            v140.AutoRotate = true
        end
    end
    local v142 = workspace.CurrentCamera
    if v142 then
        v142.FieldOfView = 70
        v142.CameraType = Enum.CameraType.Custom
    end
end
v4.Event:Connect(function() --[[ Line: 614 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
        [3] = u121
        [4] = u136
        [5] = u12
        [6] = u133
    --]]
    if u15 then
        return
    else
        u7 = u7 + 1
        if u7 >= 7 then
            u121()
            u136()
        else
            u121()
            if u12 then
                pcall(task.cancel, u12)
                u12 = nil
            end
            u12 = task.spawn(function() --[[ Line: 517 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u133
                    [3] = u12
                --]]
                while u7 > 0 do
                    local v144 = u7
                    local v145 = v144 <= 0 and 0 or 60 * 1.25 ^ (v144 - 1)
                    task.wait(v145)
                    if u7 > 0 then
                        u133(u7 - 1)
                    end
                end
                u12 = nil
            end)
        end
    end
end)
local function v148(p146) --[[ Line: 632 ]]
    --[[
    Upvalues:
        [1] = u143
        [2] = u14
    --]]
    u143()
    local v147 = p146:WaitForChild("Humanoid")
    if u14 then
        u14:Disconnect()
    end
    u14 = v147.Died:Connect(function() --[[ Line: 637 ]]
        --[[
        Upvalues:
            [1] = u143
        --]]
        u143()
    end)
end
u1.CharacterAdded:Connect(v148)
if u1.Character then
    task.spawn(v148, u1.Character)
end