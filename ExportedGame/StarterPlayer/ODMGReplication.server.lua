-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local u3 = game:GetService("TweenService")
game:GetService("TextChatService")
game:GetService("RunService")
game:GetService("UserInputService")
local u4 = v2.LocalPlayer
local v5 = v1:WaitForChild("Remotes"):WaitForChild("ODMG")
local u6 = v1:WaitForChild("Assets"):WaitForChild("Hook")
local u7 = workspace:WaitForChild("Storage"):WaitForChild("Hooks")
local u8 = {}
local u9 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
v5:WaitForChild("ReplicateAudio").OnClientEvent:Connect(function(p10, p11, p12, p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v14 = u4 ~= p10 and p10.Character
    if v14 then
        local v15 = v14:FindFirstChild("ODMG")
        local v16 = v15 and v15:FindFirstChild("SFX")
        if v16 then
            local v17 = v16:FindFirstChild(p11)
            local v18 = p13 and type(p13) == "number" and v17:FindFirstChildOfClass("PitchShiftSoundEffect")
            if v18 then
                v18.Octave = p13
            end
            if v17 then
                if p12 then
                    v17:Play()
                    return
                end
                v17:Stop()
            end
        end
    end
end)
v5:WaitForChild("ReplicateVFX").OnClientEvent:Connect(function(p19, p20, p21) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if u4 ~= p19 then
        local v22 = p19.Character
        local v23 = v22 and v22:FindFirstChild("ODMG")
        if v23 then
            local v24 = {}
            for _, v25 in pairs(v23:GetDescendants()) do
                if v25:IsA("ParticleEmitter") or v25:IsA("Trail") then
                    v24[v25.Name] = v25
                end
            end
            local v26 = v24[p20]
            if v26 then
                v26.Enabled = p21
            end
        end
    end
end)
function fire_hook(p27, p28, u29, u30, u31, p32)
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u8
        [4] = u3
        [5] = u9
    --]]
    local u33 = u30 - u29.Position
    local u34 = u6:Clone()
    u34.Parent = u7
    u34.CFrame = CFrame.lookAt(p28.WorldPosition, u30)
    local v35 = u8
    table.insert(v35, {
        ["hook"] = u34,
        ["plr"] = p27,
        ["origin_a"] = p28,
        ["side"] = p32,
        ["reeling"] = false
    })
    local u36 = u34:FindFirstChild("WeldConstraint")
    local v37 = u34:WaitForChild("Wire")
    v37.Attachment0 = p28
    local u38 = u3:Create(u34, TweenInfo.new((u30 - p28.WorldPosition).Magnitude * 0.001, u9.EasingStyle, u9.EasingDirection), {
        ["CFrame"] = CFrame.new(u30)
    })
    u38:Play()
    v37.CurveSize0 = -15
    local u39 = u3:Create(v37, TweenInfo.new(0.09, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true, 0), {
        ["CurveSize0"] = 15
    })
    u39:Play()
    u38.Completed:Connect(function(p40) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u39
            [3] = u34
            [4] = u29
            [5] = u33
            [6] = u30
            [7] = u31
            [8] = u36
        --]]
        u38:Destroy()
        u39:Cancel()
        if p40 ~= Enum.PlaybackState.Cancelled then
            u34.CFrame = CFrame.lookAt(u29.Position + u33, u30 - u31)
            u34.Anchored = false
            u36.Part1 = u29
            u34:FindFirstChild("Impact"):Play()
        end
    end)
end
function reel_hook(p41, p42)
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u9
    --]]
    for u43, u44 in pairs(u8) do
        if u44.plr.UserId == p41.UserId and (u44.side == p42 and not u44.reeling) then
            u44.reeling = true
            local v45 = u44.hook:FindFirstChild("WeldConstraint")
            if v45 then
                v45.Part1 = nil
                u44.hook.Anchored = true
            end
            local v46 = u44.hook:FindFirstChild("Wire")
            local u47 = u3:Create(u44.hook, TweenInfo.new((u44.hook.Position - u44.origin_a.WorldPosition).Magnitude * 0.001, u9.EasingStyle, u9.EasingDirection), {
                ["CFrame"] = CFrame.new(u44.origin_a.WorldPosition)
            })
            u47:Play()
            if v46 then
                v46.CurveSize0 = -15
            end
            local u48 = u3:Create(v46, TweenInfo.new(0.09, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true, 0), {
                ["CurveSize0"] = 15
            })
            u48:Play()
            u47.Completed:Connect(function(_) --[[ Line: 169 ]]
                --[[
                Upvalues:
                    [1] = u48
                    [2] = u47
                    [3] = u44
                    [4] = u8
                    [5] = u43
                --]]
                u48:Cancel()
                u47:Destroy()
                u44.hook:Destroy()
                u8[u43] = nil
            end)
        end
    end
end
v5:WaitForChild("ReplicateHook").OnClientEvent:Connect(function(p49, p50, p51, p52, p53, p54, p55) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if u4 ~= p49 and p50 then
        if p55 then
            if p51 then
                fire_hook(p49, p50, p51, p52, p53, p54)
                return
            end
        else
            reel_hook(p49, p54)
        end
    end
end)
print("Replication Initialised")