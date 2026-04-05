-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("UserInputService")
local u3 = v1.LocalPlayer
local u4 = nil
local u5 = false
local u6 = {}
local function u8() --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    for _, v7 in ipairs(u6) do
        if v7.Connected then
            v7:Disconnect()
        end
    end
    u6 = {}
end
local function u32() --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u8
        [5] = u6
    --]]
    if u5 then
        if u5 then
            u5 = false
            if u4 then
                u4:Stop(0.2)
                u4 = nil
            end
            local v9 = u3.Character
            local v10 = v9 and v9:FindFirstChild("Animate")
            if v10 then
                v10.Disabled = false
            end
            u8()
        end
    else
        local v11 = u3.Character
        if v11 then
            local u12 = v11:FindFirstChildOfClass("Humanoid")
            if u12 and u12.Health > 0 then
                local v13 = u12:FindFirstChildOfClass("Animator")
                if v13 then
                    local v14 = v11:FindFirstChild("Animate")
                    if v14 then
                        v14.Disabled = true
                    end
                    for _, v15 in ipairs(v13:GetPlayingAnimationTracks()) do
                        v15:Stop(0)
                    end
                    local v16 = Instance.new("Animation")
                    v16.AnimationId = "rbxassetid://93075188511823"
                    u4 = v13:LoadAnimation(v16)
                    u4.Priority = Enum.AnimationPriority.Action4
                    u4.Looped = true
                    u4:Play(0)
                    u5 = true
                    local v17 = u6
                    local v18 = u12:GetPropertyChangedSignal("MoveDirection")
                    local function v21() --[[ Line: 70 ]]
                        --[[
                        Upvalues:
                            [1] = u12
                            [2] = u5
                            [3] = u4
                            [4] = u3
                            [5] = u8
                        --]]
                        if u12.MoveDirection.Magnitude > 0 then
                            if not u5 then
                                return
                            end
                            u5 = false
                            if u4 then
                                u4:Stop(0.2)
                                u4 = nil
                            end
                            local v19 = u3.Character
                            local v20 = v19 and v19:FindFirstChild("Animate")
                            if v20 then
                                v20.Disabled = false
                            end
                            u8()
                        end
                    end
                    table.insert(v17, v18:Connect(v21))
                    local v22 = u6
                    local v23 = u12.StateChanged
                    local function v27(_, p24) --[[ Line: 75 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                            [2] = u4
                            [3] = u3
                            [4] = u8
                        --]]
                        if p24 == Enum.HumanoidStateType.Freefall or p24 == Enum.HumanoidStateType.Dead then
                            if not u5 then
                                return
                            end
                            u5 = false
                            if u4 then
                                u4:Stop(0.2)
                                u4 = nil
                            end
                            local v25 = u3.Character
                            local v26 = v25 and v25:FindFirstChild("Animate")
                            if v26 then
                                v26.Disabled = false
                            end
                            u8()
                        end
                    end
                    table.insert(v22, v23:Connect(v27))
                    local v28 = u6
                    local v29 = v13.AnimationPlayed
                    local function v31(p30) --[[ Line: 83 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u5
                        --]]
                        if p30 ~= u4 and u5 then
                            p30:Stop(0)
                        end
                    end
                    table.insert(v28, v29:Connect(v31))
                end
            else
                return
            end
        else
            return
        end
    end
end
u3.CharacterAdded:Connect(function() --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
    --]]
    u5 = false
    u4 = nil
    u8()
end)
v2.InputBegan:Connect(function(p33, p34) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    if not p34 then
        if p33.KeyCode == Enum.KeyCode.N then
            u32()
        end
    end
end)