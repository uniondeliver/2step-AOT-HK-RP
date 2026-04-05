-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local u3 = game:GetService("TweenService")
local v4 = v2.LocalPlayer:WaitForChild("PlayerGui")
local v5 = v1:WaitForChild("SendPrivateMessage", 30)
if v5 then
    local v6 = v4:FindFirstChild("MessageDisplay")
    if v6 then
        v6:Destroy()
    end
    local v7 = Instance.new("ScreenGui")
    v7.Name = "MessageDisplay"
    v7.ResetOnSpawn = false
    v7.DisplayOrder = 100
    v7.IgnoreGuiInset = true
    v7.Parent = v4
    local u8 = Instance.new("Frame")
    u8.Name = "Messages"
    u8.Size = UDim2.new(0.35, 0, 0.4, 0)
    u8.Position = UDim2.new(0.63, 0, 0.05, 0)
    u8.BackgroundTransparency = 1
    u8.ClipsDescendants = true
    u8.Parent = v7
    local v9 = Instance.new("UIListLayout")
    v9.SortOrder = Enum.SortOrder.LayoutOrder
    v9.Padding = UDim.new(0, 6)
    v9.VerticalAlignment = Enum.VerticalAlignment.Top
    v9.Parent = u8
    local u10 = Instance.new("Frame")
    u10.Name = "Narration"
    u10.Size = UDim2.new(0.6, 0, 0.12, 0)
    u10.Position = UDim2.new(0.2, 0, 0.44, 0)
    u10.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    u10.BackgroundTransparency = 1
    u10.BorderSizePixel = 0
    u10.Visible = false
    u10.ZIndex = 50
    u10.Parent = v7
    local v11 = Instance.new("UICorner")
    v11.CornerRadius = UDim.new(0, 6)
    v11.Parent = u10
    local u12 = Instance.new("Frame")
    u12.Size = UDim2.new(0.3, 0, 0, 2)
    u12.Position = UDim2.new(0.35, 0, 0, 0)
    u12.BackgroundColor3 = Color3.fromRGB(180, 100, 255)
    u12.BorderSizePixel = 0
    u12.BackgroundTransparency = 1
    u12.ZIndex = 51
    u12.Parent = u10
    local u13 = Instance.new("TextLabel")
    u13.Size = UDim2.new(0.9, 0, 0.85, 0)
    u13.Position = UDim2.new(0.05, 0, 0.1, 0)
    u13.BackgroundTransparency = 1
    u13.TextColor3 = Color3.fromRGB(255, 255, 255)
    u13.Font = Enum.Font.Garamond
    u13.TextSize = 22
    u13.TextWrapped = true
    u13.TextXAlignment = Enum.TextXAlignment.Center
    u13.TextYAlignment = Enum.TextYAlignment.Center
    u13.Text = ""
    u13.TextTransparency = 1
    u13.ZIndex = 51
    u13.Parent = u10
    local u14 = 0
    local function u20() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        local v15 = {}
        for _, v16 in pairs(u8:GetChildren()) do
            if v16:IsA("Frame") then
                table.insert(v15, v16)
            end
        end
        if #v15 > 5 then
            table.sort(v15, function(p17, p18) --[[ Line: 102 ]]
                return p17.LayoutOrder < p18.LayoutOrder
            end)
            for v19 = 1, #v15 - 5 do
                v15[v19]:Destroy()
            end
        end
    end
    local function u31(p21, p22) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u20
            [3] = u8
            [4] = u3
        --]]
        if p21 and p21 ~= "" then
            u14 = u14 + 1
            u20()
            local v23 = p22 and Color3.fromRGB(140, 35, 35) or Color3.fromRGB(25, 25, 50)
            local v24 = p22 and Color3.fromRGB(255, 120, 120) or Color3.fromRGB(140, 140, 255)
            local u25 = Instance.new("Frame")
            u25.Size = UDim2.new(1, 0, 0, 50)
            u25.BackgroundColor3 = v23
            u25.BackgroundTransparency = 0.15
            u25.BorderSizePixel = 0
            u25.LayoutOrder = u14
            u25.Parent = u8
            local v26 = Instance.new("UICorner")
            v26.CornerRadius = UDim.new(0, 8)
            v26.Parent = u25
            local u27 = Instance.new("TextLabel")
            u27.Size = UDim2.new(0, 24, 0, 24)
            u27.Position = UDim2.new(0, 8, 0, 5)
            u27.BackgroundTransparency = 1
            u27.Text = p22 and "\240\159\147\162" or "\226\156\137\239\184\143"
            u27.TextSize = 16
            u27.Font = Enum.Font.GothamBold
            u27.Parent = u25
            local u28 = Instance.new("TextLabel")
            u28.Size = UDim2.new(1, -40, 0, 14)
            u28.Position = UDim2.new(0, 36, 0, 4)
            u28.BackgroundTransparency = 1
            u28.TextColor3 = v24
            u28.Font = Enum.Font.GothamBold
            u28.TextSize = 10
            u28.TextXAlignment = Enum.TextXAlignment.Left
            u28.Text = p22 and "ANNONCE" or "MESSAGE PRIV\195\137"
            u28.Parent = u25
            local u29 = Instance.new("TextLabel")
            u29.Size = UDim2.new(1, -40, 0, 24)
            u29.Position = UDim2.new(0, 36, 0, 20)
            u29.BackgroundTransparency = 1
            u29.TextColor3 = Color3.fromRGB(240, 240, 240)
            u29.Font = Enum.Font.GothamMedium
            u29.TextSize = 14
            u29.TextWrapped = true
            u29.TextXAlignment = Enum.TextXAlignment.Left
            u29.Text = p21
            u29.Parent = u25
            task.delay(8, function() --[[ Line: 164 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u3
                    [3] = u28
                    [4] = u29
                    [5] = u27
                --]]
                if u25 and u25.Parent then
                    local v30 = TweenInfo.new(1, Enum.EasingStyle.Quad)
                    u3:Create(u25, v30, {
                        ["BackgroundTransparency"] = 1
                    }):Play()
                    u3:Create(u28, v30, {
                        ["TextTransparency"] = 1
                    }):Play()
                    u3:Create(u29, v30, {
                        ["TextTransparency"] = 1
                    }):Play()
                    u3:Create(u27, v30, {
                        ["TextTransparency"] = 1
                    }):Play()
                    task.wait(1.1)
                    if u25 and u25.Parent then
                        u25:Destroy()
                    end
                end
            end)
        end
    end
    local function u37(p32) --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u20
            [3] = u8
            [4] = u3
        --]]
        if p32 and p32 ~= "" then
            u14 = u14 + 1
            u20()
            local u33 = Instance.new("Frame")
            u33.Size = UDim2.new(1, 0, 0, 30)
            u33.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            u33.BackgroundTransparency = 0.25
            u33.BorderSizePixel = 0
            u33.LayoutOrder = u14
            u33.Parent = u8
            local v34 = Instance.new("UICorner")
            v34.CornerRadius = UDim.new(0, 6)
            v34.Parent = u33
            local u35 = Instance.new("TextLabel")
            u35.Size = UDim2.new(1, -16, 1, 0)
            u35.Position = UDim2.new(0, 8, 0, 0)
            u35.BackgroundTransparency = 1
            u35.TextColor3 = Color3.fromRGB(190, 190, 190)
            u35.Font = Enum.Font.Gotham
            u35.TextSize = 13
            u35.TextWrapped = true
            u35.TextXAlignment = Enum.TextXAlignment.Left
            u35.Text = p32
            u35.Parent = u33
            task.delay(5, function() --[[ Line: 206 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u3
                    [3] = u35
                --]]
                if u33 and u33.Parent then
                    local v36 = TweenInfo.new(0.8, Enum.EasingStyle.Quad)
                    u3:Create(u33, v36, {
                        ["BackgroundTransparency"] = 1
                    }):Play()
                    u3:Create(u35, v36, {
                        ["TextTransparency"] = 1
                    }):Play()
                    task.wait(0.9)
                    if u33 and u33.Parent then
                        u33:Destroy()
                    end
                end
            end)
        end
    end
    local u38 = 0
    local function u45(p39) --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u13
            [3] = u10
            [4] = u12
            [5] = u3
        --]]
        if p39 and p39 ~= "" then
            u38 = u38 + 1
            local v40 = u38
            u13.Text = ""
            u13.TextTransparency = 0
            u10.BackgroundTransparency = 0.35
            u12.BackgroundTransparency = 0
            u10.Visible = true
            for v41 = 1, #p39 do
                if u38 ~= v40 then
                    return
                end
                u13.Text = p39:sub(1, v41)
                task.wait(0.04)
            end
            if u38 == v40 then
                local v42 = task.wait
                local v43 = #p39 * 0.06
                v42((math.clamp(v43, 3, 10)))
                if u38 == v40 then
                    local v44 = TweenInfo.new(1.5, Enum.EasingStyle.Quad)
                    u3:Create(u13, v44, {
                        ["TextTransparency"] = 1
                    }):Play()
                    u3:Create(u10, v44, {
                        ["BackgroundTransparency"] = 1
                    }):Play()
                    u3:Create(u12, v44, {
                        ["BackgroundTransparency"] = 1
                    }):Play()
                    task.wait(1.6)
                    if u38 == v40 then
                        u10.Visible = false
                    end
                end
            else
                return
            end
        else
            return
        end
    end
    v5.OnClientEvent:Connect(function(p46, p47) --[[ Line: 259 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u31
            [3] = u37
        --]]
        if p46 and (type(p46) == "string" and p46 ~= "") then
            if p47 == "na" then
                task.spawn(u45, p46)
                return
            elseif p47 == true then
                u31(p46, true)
                return
            elseif p47 == false then
                u31(p46, false)
            else
                u37(p46)
            end
        else
            return
        end
    end)
end