-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

game:GetService("TeleportService")
local v1 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local u2 = game:GetService("TweenService")
local u3 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local u4 = Enum.Font.Bodoni
local u5 = Enum.Font.Bodoni
local u6 = Color3.fromRGB(15, 15, 18)
local u7 = Color3.fromRGB(100, 100, 110)
local u8 = Color3.fromRGB(220, 220, 225)
local u9 = Color3.fromRGB(140, 140, 145)
local u10 = Color3.fromRGB(20, 20, 25)
local u11 = Color3.fromRGB(35, 35, 42)
local u12 = Color3.fromRGB(230, 230, 240)
local u13 = Color3.fromRGB(100, 100, 110)
local u14 = Color3.fromRGB(100, 100, 110)
local u15 = Enum.EasingStyle.Back
local u16 = Enum.EasingStyle.Back
local v17 = v1:WaitForChild("TeleportPromptEvent")
local u18 = v1:WaitForChild("TeleportConfirmEvent")
local function u46(p19, u20, u21) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u7
        [4] = u14
        [5] = u9
        [6] = u8
        [7] = u4
        [8] = u10
        [9] = u12
        [10] = u5
        [11] = u13
        [12] = u2
        [13] = u11
        [14] = u16
        [15] = u18
        [16] = u15
    --]]
    local v22 = u3:FindFirstChild("TeleportPromptGui")
    if v22 then
        v22:Destroy()
    end
    local u23 = Instance.new("ScreenGui")
    u23.Name = "TeleportPromptGui"
    u23.ResetOnSpawn = false
    u23.DisplayOrder = 100
    u23.Parent = u3
    local u24 = Instance.new("Frame")
    u24.Name = "MainFrame"
    u24.Size = UDim2.new(0, 0, 0, 0)
    u24.Position = UDim2.new(0.5, 0, 0.5, 0)
    u24.AnchorPoint = Vector2.new(0.5, 0.5)
    u24.BackgroundColor3 = u6
    u24.BorderSizePixel = 0
    u24.ClipsDescendants = true
    u24.Parent = u23
    Instance.new("UICorner", u24).CornerRadius = UDim.new(0, 15)
    local v25 = Instance.new("UIStroke")
    v25.Color = u7
    v25.Thickness = 3
    v25.Transparency = 0.4
    v25.Parent = u24
    local v26 = Instance.new("TextLabel")
    v26.Size = UDim2.new(0, 40, 0, 40)
    v26.Position = UDim2.new(0.5, 0, 0, 25)
    v26.AnchorPoint = Vector2.new(0.5, 0)
    v26.BackgroundTransparency = 1
    v26.Text = "\226\156\166"
    v26.TextColor3 = u14
    v26.TextSize = 30
    v26.Font = Enum.Font.GothamBold
    v26.Parent = u24
    local v27 = Instance.new("TextLabel")
    v27.Size = UDim2.new(1, -60, 0, 30)
    v27.Position = UDim2.new(0, 30, 0, 75)
    v27.BackgroundTransparency = 1
    v27.Text = "Voulez-vous voyager vers"
    v27.TextColor3 = u9
    v27.TextSize = 16
    v27.Font = Enum.Font.SourceSansItalic
    v27.TextWrapped = true
    v27.Parent = u24
    local v28 = Instance.new("TextLabel")
    v28.Size = UDim2.new(1, -60, 0, 40)
    v28.Position = UDim2.new(0, 30, 0, 105)
    v28.BackgroundTransparency = 1
    v28.Text = string.upper(p19) .. " ?"
    v28.TextColor3 = u8
    v28.TextSize = 22
    v28.Font = u4
    v28.TextWrapped = true
    v28.Parent = u24
    local v29 = Instance.new("Frame")
    v29.Size = UDim2.new(1, -60, 0, 45)
    v29.Position = UDim2.new(0, 30, 1, -70)
    v29.BackgroundTransparency = 1
    v29.Parent = u24
    local u30 = Instance.new("TextButton")
    u30.Name = "OuiButton"
    u30.Size = UDim2.new(0, 130, 0, 45)
    u30.Position = UDim2.new(0.5, -140, 0, 0)
    u30.BackgroundColor3 = u10
    u30.Text = "Oui"
    u30.TextColor3 = u12
    u30.TextSize = 20
    u30.Font = u5
    u30.BorderSizePixel = 0
    u30.AutoButtonColor = false
    u30.Parent = v29
    Instance.new("UICorner", u30).CornerRadius = UDim.new(0, 10)
    local u31 = Instance.new("UIStroke")
    u31.Color = u13
    u31.Thickness = 2
    u31.Transparency = 0.5
    u31.Parent = u30
    local u32 = Instance.new("TextButton")
    u32.Name = "NonButton"
    u32.Size = UDim2.new(0, 130, 0, 45)
    u32.Position = UDim2.new(0.5, 10, 0, 0)
    u32.BackgroundColor3 = u10
    u32.Text = "Non"
    u32.TextColor3 = u12
    u32.TextSize = 20
    u32.Font = u5
    u32.BorderSizePixel = 0
    u32.AutoButtonColor = false
    u32.Parent = v29
    Instance.new("UICorner", u32).CornerRadius = UDim.new(0, 10)
    local u33 = Instance.new("UIStroke")
    u33.Color = u13
    u33.Thickness = 2
    u33.Transparency = 0.5
    u33.Parent = u32
    local function u37(p34, p35) --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        local v36 = {
            ["BackgroundColor3"] = u11
        }
        u2:Create(p34, TweenInfo.new(0.2), v36):Play()
        u2:Create(p35, TweenInfo.new(0.2), {
            ["Transparency"] = 0.1
        }):Play()
    end
    local function u41(p38, p39) --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        local v40 = {
            ["BackgroundColor3"] = u10
        }
        u2:Create(p38, TweenInfo.new(0.2), v40):Play()
        u2:Create(p39, TweenInfo.new(0.2), {
            ["Transparency"] = 0.5
        }):Play()
    end
    u30.MouseEnter:Connect(function() --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u30
            [3] = u31
        --]]
        u37(u30, u31)
    end)
    u30.MouseLeave:Connect(function() --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u30
            [3] = u31
        --]]
        u41(u30, u31)
    end)
    u32.MouseEnter:Connect(function() --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u32
            [3] = u33
        --]]
        u37(u32, u33)
    end)
    u32.MouseLeave:Connect(function() --[[ Line: 193 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u32
            [3] = u33
        --]]
        u41(u32, u33)
    end)
    local u42 = false
    local function u45(p43) --[[ Line: 197 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u2
            [3] = u24
            [4] = u16
            [5] = u23
        --]]
        if not u42 then
            u42 = true
            local v44 = u2:Create(u24, TweenInfo.new(0.4, u16, Enum.EasingDirection.In), {
                ["Size"] = UDim2.new(0, 0, 0, 0)
            })
            v44:Play()
            v44.Completed:Wait()
            u23:Destroy()
            if p43 then
                p43()
            end
        end
    end
    u30.MouseButton1Click:Connect(function() --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u18
            [3] = u20
            [4] = u21
        --]]
        u45(function() --[[ Line: 215 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u20
                [3] = u21
            --]]
            u18:FireServer(u20, u21)
        end)
    end)
    u32.MouseButton1Click:Connect(function() --[[ Line: 220 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45()
    end)
    u2:Create(u24, TweenInfo.new(0.6, u15, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(0, 420, 0, 220)
    }):Play()
end
v17.OnClientEvent:Connect(function(p47, p48, p49) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u46
    --]]
    u46(p47, p48, p49)
end)