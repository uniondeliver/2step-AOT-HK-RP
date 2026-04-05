-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("UserInputService")
local u2 = game:GetService("TweenService")
local v3 = game:GetService("Players")
local v4 = game:GetService("ReplicatedStorage")
local u5 = game:GetService("RunService")
local u6 = v3.LocalPlayer
local u7 = v4:WaitForChild("QTERemote")
local u8 = { Enum.KeyCode.Q, Enum.KeyCode.E }
local u9 = false
local u10 = nil
local u11 = 0
local u12 = 0
local u13 = 10
local u14 = 3
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = Color3.fromRGB
local u19 = UDim2.new
local _ = Vector3.new
local u20 = math.random
local u21 = math.floor
local u22 = math.max
local u23 = string.format
local function u33(p24) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
        [3] = u18
        [4] = u21
        [5] = u13
        [6] = u14
    --]]
    local v25 = u6:WaitForChild("PlayerGui")
    local v26 = Instance.new("ScreenGui")
    v26.Name = "QTEGui"
    v26.ResetOnSpawn = false
    v26.Parent = v25
    local v27 = Instance.new("TextLabel")
    v27.Name = "TimerLabel"
    v27.Size = u19(0, 200, 0, 60)
    v27.Position = u19(0.5, -100, 0.02, 0)
    v27.BackgroundColor3 = u18(50, 50, 50)
    v27.BackgroundTransparency = 0.3
    v27.BorderSizePixel = 0
    local v28 = u21(p24)
    v27.Text = tostring(v28)
    v27.TextColor3 = u18(255, 255, 255)
    v27.TextSize = 40
    v27.Font = Enum.Font.GothamBold
    v27.Parent = v26
    local v29 = Instance.new("UICorner")
    v29.CornerRadius = UDim.new(0, 15)
    v29.Parent = v27
    local v30 = Instance.new("TextLabel")
    v30.Name = "ProgressLabel"
    v30.Size = u19(0, 150, 0, 50)
    v30.Position = u19(0, 20, 1, -70)
    v30.BackgroundColor3 = u18(50, 50, 50)
    v30.BackgroundTransparency = 0.3
    v30.BorderSizePixel = 0
    v30.Text = "0 / " .. u13
    v30.TextColor3 = u18(255, 255, 255)
    v30.TextSize = 28
    v30.Font = Enum.Font.GothamBold
    v30.Parent = v26
    local v31 = Instance.new("UICorner")
    v31.CornerRadius = UDim.new(0, 12)
    v31.Parent = v30
    local v32 = Instance.new("TextLabel")
    v32.Name = "ErrorLabel"
    v32.Size = u19(0, 150, 0, 40)
    v32.Position = u19(0, 20, 1, -115)
    v32.BackgroundTransparency = 1
    v32.BorderSizePixel = 0
    v32.Text = "Erreurs: 0 / " .. u14
    v32.TextColor3 = u18(255, 255, 255)
    v32.TextSize = 18
    v32.Font = Enum.Font.Gotham
    v32.Parent = v26
    return v26
end
local function u36() --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u2
        [3] = u18
        [4] = u19
    --]]
    if u15 then
        local u34 = u15:FindFirstChild("CurrentKeyFrame")
        if u34 then
            local v35 = u2:Create(u34, TweenInfo.new(0.1), {
                ["BackgroundColor3"] = u18(100, 255, 100),
                ["Size"] = u19(0, 85, 0, 85)
            })
            v35:Play()
            v35.Completed:Once(function() --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u2
                    [3] = u18
                    [4] = u19
                --]]
                if u34 and u34.Parent then
                    u2:Create(u34, TweenInfo.new(0.15), {
                        ["BackgroundColor3"] = u18(50, 50, 50),
                        ["Size"] = u19(0, 75, 0, 75)
                    }):Play()
                end
            end)
        end
    else
        return
    end
end
local function u44(p37) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
        [3] = u19
        [4] = u18
        [5] = u2
    --]]
    if u15 then
        local v38 = u15:FindFirstChild("CurrentKeyFrame")
        if v38 then
            v38:Destroy()
        end
        local v39 = u20(15, 85) / 100
        local v40 = u20(25, 65) / 100
        local v41 = Instance.new("Frame")
        v41.Name = "CurrentKeyFrame"
        v41.Size = u19(0, 0, 0, 0)
        v41.Position = u19(v39, -37.5, v40, -37.5)
        v41.BackgroundColor3 = u18(50, 50, 50)
        v41.BackgroundTransparency = 1
        v41.BorderSizePixel = 0
        v41.Rotation = -90
        v41.Parent = u15
        local v42 = Instance.new("UICorner")
        v42.CornerRadius = UDim.new(0.2, 0)
        v42.Parent = v41
        local v43 = Instance.new("TextLabel")
        v43.Size = u19(1, 0, 1, 0)
        v43.BackgroundTransparency = 1
        v43.Text = p37.Name:sub(1, 1)
        v43.TextColor3 = u18(255, 255, 255)
        v43.TextSize = 38
        v43.TextTransparency = 1
        v43.Font = Enum.Font.GothamBold
        v43.Parent = v41
        u2:Create(v41, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            ["Size"] = u19(0, 75, 0, 75),
            ["BackgroundTransparency"] = 0.3,
            ["Rotation"] = 0
        }):Play()
        u2:Create(v43, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            ["TextTransparency"] = 0
        }):Play()
    end
end
local function u46() --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u14
        [4] = u18
        [5] = u2
    --]]
    if u15 then
        local v45 = u15:FindFirstChild("ErrorLabel")
        if v45 then
            v45.Text = "Erreurs: " .. u12 .. " / " .. u14
            v45.TextColor3 = u18(255, 50, 50)
            u2:Create(v45, TweenInfo.new(0.3), {
                ["TextColor3"] = u18(255, 255, 255)
            }):Play()
        end
    end
end
local function u64(u47, p48, p49) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u11
        [4] = u12
        [5] = u13
        [6] = u14
        [7] = u33
        [8] = u10
        [9] = u8
        [10] = u20
        [11] = u44
        [12] = u18
        [13] = u17
        [14] = u5
        [15] = u22
        [16] = u23
        [17] = u16
        [18] = u1
        [19] = u36
        [20] = u7
        [21] = u46
        [22] = u2
    --]]
    if not u9 then
        if u15 then
            u15:Destroy()
            u15 = nil
        end
        u9 = true
        u11 = 0
        u12 = 0
        u13 = p48
        u14 = p49
        u15 = u33(u47)
        u10 = u8[u20(1, #u8)]
        u44(u10)
        local u50 = os.clock()
        local u51 = u18(255, 255, 255)
        local u52 = u18(255, 100, 100)
        local u53 = u18(50, 50, 50)
        u17 = u5.Heartbeat:Connect(function() --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u47
                [3] = u50
                [4] = u22
                [5] = u23
                [6] = u52
                [7] = u51
            --]]
            if u15 then
                local v54 = u15:FindFirstChild("TimerLabel")
                if v54 then
                    local v55 = u22(0, u47 - (os.clock() - u50))
                    v54.Text = u23("%.1f", v55)
                    v54.TextColor3 = v55 <= 5 and u52 or u51
                end
            end
        end)
        local u56 = Enum.KeyCode.Q
        local u57 = Enum.KeyCode.E
        u16 = u1.InputBegan:Connect(function(p58, p59) --[[ Line: 225 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u10
                [3] = u11
                [4] = u15
                [5] = u13
                [6] = u36
                [7] = u7
                [8] = u8
                [9] = u20
                [10] = u44
                [11] = u56
                [12] = u57
                [13] = u12
                [14] = u46
                [15] = u18
                [16] = u2
                [17] = u53
            --]]
            if not p59 and u9 then
                local v60 = p58.KeyCode
                if v60 == u10 then
                    u11 = u11 + 1
                    local v61 = u15 and u15:FindFirstChild("ProgressLabel")
                    if v61 then
                        v61.Text = u11 .. " / " .. u13
                    end
                    u36()
                    u7:FireServer("KeyPressed", p58.KeyCode.Name)
                    if u11 < u13 then
                        u10 = u8[u20(1, #u8)]
                        u44(u10)
                        return
                    end
                elseif v60 == u56 or v60 == u57 then
                    u12 = u12 + 1
                    u46()
                    local v62 = u15:FindFirstChild("CurrentKeyFrame")
                    if v62 then
                        v62.BackgroundColor3 = u18(255, 50, 50)
                        local v63 = {
                            ["BackgroundColor3"] = u53
                        }
                        u2:Create(v62, TweenInfo.new(0.3), v63):Play()
                    end
                    u7:FireServer("KeyError")
                end
            end
        end)
    end
end
local function u66(_) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u9
        [3] = u17
        [4] = u16
        [5] = u11
        [6] = u12
        [7] = u10
    --]]
    if u15 then
        u9 = false
        if u17 then
            u17:Disconnect()
            u17 = nil
        end
        if u16 then
            u16:Disconnect()
            u16 = nil
        end
        local v65 = u15:FindFirstChild("CurrentKeyFrame")
        if v65 then
            v65:Destroy()
        end
        task.wait(2)
        u9 = false
        if u16 then
            u16:Disconnect()
            u16 = nil
        end
        if u17 then
            u17:Disconnect()
            u17 = nil
        end
        if u15 then
            u15:Destroy()
            u15 = nil
        end
        u11 = 0
        u12 = 0
        u10 = nil
    end
end
u7.OnClientEvent:Connect(function(p67, ...) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u64
        [2] = u66
    --]]
    if p67 == "Start" then
        local v68, v69, v70 = ...
        u64(v68, v69, v70)
        return
    elseif p67 == "Success" then
        u66(true)
    elseif p67 == "Fail" then
        u66(false)
    end
end)