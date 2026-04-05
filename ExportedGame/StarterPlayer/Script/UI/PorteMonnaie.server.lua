-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("UserInputService")
local u4 = game:GetService("TweenService")
local u5 = u1.LocalPlayer
local u6 = u5:WaitForChild("PlayerGui")
local u7 = Enum.KeyCode.V
local u8 = 0
local u9 = v2:WaitForChild("GetGalons")
local u10 = v2:WaitForChild("TransferGalons")
local u11 = {
    ["TitleText"] = Color3.fromRGB(220, 220, 225),
    ["SubtitleGray"] = Color3.fromRGB(140, 140, 145),
    ["MainBg"] = Color3.fromRGB(18, 18, 20),
    ["SectionBg"] = Color3.fromRGB(16, 16, 20),
    ["InputBg"] = Color3.fromRGB(20, 20, 25),
    ["ButtonBg"] = Color3.fromRGB(25, 25, 30),
    ["StrokeColor"] = Color3.fromRGB(140, 140, 145),
    ["DarkBg"] = Color3.fromRGB(8, 8, 10),
    ["ActiveTab"] = Color3.fromRGB(30, 30, 35)
}
local function u14(p12) --[[ Line: 285 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
    --]]
    u8 = u9:InvokeServer()
    local v13 = u8
    p12.Text = tostring(v13):reverse():gsub("(%d%d%d)", "%1 "):reverse():gsub("^ ", "") .. " Galons"
end
local u41, u42, u43, u44, u45, u46, v47 = (function() --[[ Name: createWalletUI, Line 32 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
    --]]
    local v15 = Instance.new("ScreenGui")
    v15.Name = "WalletGUI"
    v15.ResetOnSpawn = false
    v15.IgnoreGuiInset = true
    v15.DisplayOrder = 50
    v15.Enabled = false
    v15.Parent = u6
    local v16 = Instance.new("Frame", v15)
    v16.Size = UDim2.new(1, 0, 1, 0)
    v16.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v16.BackgroundTransparency = 0.5
    v16.BorderSizePixel = 0
    v16.ZIndex = 1
    local v17 = Instance.new("Frame", v16)
    v17.Size = UDim2.new(0, 700, 0, 680)
    v17.Position = UDim2.new(0.5, 0, 0.5, 0)
    v17.AnchorPoint = Vector2.new(0.5, 0.5)
    v17.BackgroundColor3 = u11.MainBg
    v17.BorderSizePixel = 0
    v17.ZIndex = 2
    Instance.new("UICorner", v17).CornerRadius = UDim.new(0, 12)
    local v18 = Instance.new("UIStroke", v17)
    v18.Color = u11.StrokeColor
    v18.Thickness = 2
    v18.Transparency = 0.3
    local v19 = Instance.new("TextLabel", v17)
    v19.Size = UDim2.new(1, 0, 0, 80)
    v19.Position = UDim2.new(0, 0, 0, 20)
    v19.BackgroundTransparency = 1
    v19.Text = "PORTE-MONNAIE"
    v19.Font = Enum.Font.Bodoni
    v19.TextSize = 46
    v19.TextColor3 = u11.TitleText
    v19.TextStrokeTransparency = 1
    v19.ZIndex = 3
    local v20 = Instance.new("TextLabel", v17)
    v20.Size = UDim2.new(1, 0, 0, 30)
    v20.Position = UDim2.new(0, 0, 0, 100)
    v20.BackgroundTransparency = 1
    v20.Text = "Gestion de vos Galons"
    v20.Font = Enum.Font.SourceSansItalic
    v20.TextSize = 22
    v20.TextColor3 = u11.SubtitleGray
    v20.ZIndex = 3
    local v21 = Instance.new("Frame", v17)
    v21.Size = UDim2.new(0.9, 0, 0, 2)
    v21.Position = UDim2.new(0.05, 0, 0, 140)
    v21.BackgroundColor3 = u11.StrokeColor
    v21.BorderSizePixel = 0
    v21.ZIndex = 3
    local v22 = Instance.new("Frame", v17)
    v22.Size = UDim2.new(0.9, 0, 0, 100)
    v22.Position = UDim2.new(0.05, 0, 0, 160)
    v22.BackgroundColor3 = u11.SectionBg
    v22.BorderSizePixel = 0
    v22.ZIndex = 3
    Instance.new("UICorner", v22).CornerRadius = UDim.new(0, 10)
    local v23 = Instance.new("TextLabel", v22)
    v23.Size = UDim2.new(1, 0, 0, 35)
    v23.Position = UDim2.new(0, 0, 0, 10)
    v23.BackgroundTransparency = 1
    v23.Text = "SOLDE ACTUEL"
    v23.Font = Enum.Font.Bodoni
    v23.TextSize = 20
    v23.TextColor3 = u11.SubtitleGray
    v23.ZIndex = 4
    local v24 = Instance.new("TextLabel", v22)
    v24.Name = "GalonAmount"
    v24.Size = UDim2.new(1, 0, 0, 50)
    v24.Position = UDim2.new(0, 0, 0, 45)
    v24.BackgroundTransparency = 1
    v24.Text = "0 Galons"
    v24.Font = Enum.Font.Bodoni
    v24.TextSize = 42
    v24.TextColor3 = u11.TitleText
    v24.ZIndex = 4
    local v25 = Instance.new("Frame", v17)
    v25.Size = UDim2.new(0.9, 0, 0, 300)
    v25.Position = UDim2.new(0.05, 0, 0, 290)
    v25.BackgroundColor3 = u11.SectionBg
    v25.BorderSizePixel = 0
    v25.ZIndex = 3
    Instance.new("UICorner", v25).CornerRadius = UDim.new(0, 10)
    local v26 = Instance.new("TextLabel", v25)
    v26.Size = UDim2.new(1, 0, 0, 50)
    v26.Position = UDim2.new(0, 0, 0, 15)
    v26.BackgroundTransparency = 1
    v26.Text = "EFFECTUER UN VIREMENT"
    v26.Font = Enum.Font.Bodoni
    v26.TextSize = 28
    v26.TextColor3 = u11.TitleText
    v26.ZIndex = 4
    local v27 = Instance.new("TextLabel", v25)
    v27.Size = UDim2.new(0.9, 0, 0, 25)
    v27.Position = UDim2.new(0.05, 0, 0, 75)
    v27.BackgroundTransparency = 1
    v27.Text = "Destinataire"
    v27.Font = Enum.Font.Bodoni
    v27.TextSize = 18
    v27.TextColor3 = u11.SubtitleGray
    v27.TextXAlignment = Enum.TextXAlignment.Left
    v27.ZIndex = 4
    local v28 = Instance.new("TextButton", v25)
    v28.Name = "RecipientButton"
    v28.Size = UDim2.new(0.9, 0, 0, 55)
    v28.Position = UDim2.new(0.05, 0, 0, 100)
    v28.BackgroundColor3 = u11.InputBg
    v28.Text = "S\195\169lectionner un joueur"
    v28.Font = Enum.Font.Bodoni
    v28.TextSize = 20
    v28.TextColor3 = u11.SubtitleGray
    v28.TextXAlignment = Enum.TextXAlignment.Left
    v28.BorderSizePixel = 0
    v28.AutoButtonColor = false
    v28.ZIndex = 4
    Instance.new("UIPadding", v28).PaddingLeft = UDim.new(0, 15)
    Instance.new("UICorner", v28).CornerRadius = UDim.new(0, 8)
    local v29 = Instance.new("UIStroke", v28)
    v29.Color = u11.StrokeColor
    v29.Thickness = 1
    v29.Transparency = 0.5
    local v30 = Instance.new("TextLabel", v28)
    v30.Size = UDim2.new(0, 30, 1, 0)
    v30.Position = UDim2.new(1, -35, 0, 0)
    v30.BackgroundTransparency = 1
    v30.Text = "\226\150\188"
    v30.Font = Enum.Font.GothamBold
    v30.TextSize = 16
    v30.TextColor3 = u11.SubtitleGray
    v30.ZIndex = 5
    local v31 = Instance.new("ScrollingFrame", v25)
    v31.Name = "PlayerList"
    v31.Size = UDim2.new(0.9, 0, 0, 0)
    v31.Position = UDim2.new(0.05, 0, 0, 157)
    v31.BackgroundColor3 = u11.InputBg
    v31.BorderSizePixel = 0
    v31.ScrollBarThickness = 6
    v31.ScrollBarImageColor3 = u11.StrokeColor
    v31.Visible = false
    v31.ZIndex = 10
    v31.ClipsDescendants = true
    Instance.new("UICorner", v31).CornerRadius = UDim.new(0, 8)
    local v32 = Instance.new("UIStroke", v31)
    v32.Color = u11.StrokeColor
    v32.Thickness = 1
    v32.Transparency = 0.5
    local v33 = Instance.new("UIListLayout", v31)
    v33.SortOrder = Enum.SortOrder.Name
    v33.Padding = UDim.new(0, 2)
    local v34 = Instance.new("TextLabel", v25)
    v34.Size = UDim2.new(0.9, 0, 0, 25)
    v34.Position = UDim2.new(0.05, 0, 0, 165)
    v34.BackgroundTransparency = 1
    v34.Text = "Montant"
    v34.Font = Enum.Font.Bodoni
    v34.TextSize = 18
    v34.TextColor3 = u11.SubtitleGray
    v34.TextXAlignment = Enum.TextXAlignment.Left
    v34.ZIndex = 4
    local v35 = Instance.new("TextBox", v25)
    v35.Name = "AmountInput"
    v35.Size = UDim2.new(0.9, 0, 0, 55)
    v35.Position = UDim2.new(0.05, 0, 0, 190)
    v35.BackgroundColor3 = u11.InputBg
    v35.PlaceholderText = "Montant en Galons"
    v35.PlaceholderColor3 = u11.SubtitleGray
    v35.Text = ""
    v35.TextColor3 = u11.TitleText
    v35.Font = Enum.Font.Bodoni
    v35.TextSize = 22
    v35.BorderSizePixel = 0
    v35.ClearTextOnFocus = false
    v35.ZIndex = 4
    Instance.new("UICorner", v35).CornerRadius = UDim.new(0, 8)
    local v36 = Instance.new("UIStroke", v35)
    v36.Color = u11.StrokeColor
    v36.Thickness = 1
    v36.Transparency = 0.5
    local v37 = Instance.new("TextButton", v17)
    v37.Name = "SendButton"
    v37.Size = UDim2.new(0.9, 0, 0, 55)
    v37.Position = UDim2.new(0.05, 0, 0, 610)
    v37.BackgroundColor3 = u11.ButtonBg
    v37.Text = "Envoyer le virement"
    v37.Font = Enum.Font.Bodoni
    v37.TextSize = 22
    v37.TextColor3 = u11.SubtitleGray
    v37.BorderSizePixel = 0
    v37.AutoButtonColor = true
    v37.ZIndex = 3
    Instance.new("UICorner", v37).CornerRadius = UDim.new(0, 10)
    local v38 = Instance.new("UIStroke", v37)
    v38.Color = u11.StrokeColor
    v38.Thickness = 1
    v38.Transparency = 0.5
    local v39 = Instance.new("TextButton", v17)
    v39.Name = "CloseButton"
    v39.Size = UDim2.new(0, 40, 0, 40)
    v39.Position = UDim2.new(1, -50, 0, 10)
    v39.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v39.BackgroundTransparency = 0.3
    v39.Text = "\226\156\149"
    v39.Font = Enum.Font.GothamBold
    v39.TextSize = 24
    v39.TextColor3 = Color3.fromRGB(255, 255, 255)
    v39.BorderSizePixel = 0
    v39.AutoButtonColor = true
    v39.ZIndex = 3
    Instance.new("UICorner", v39).CornerRadius = UDim.new(0, 4)
    local v40 = Instance.new("UIStroke", v39)
    v40.Color = Color3.fromRGB(80, 80, 80)
    v40.Thickness = 1
    v40.Transparency = 0
    return v15, v24, v28, v31, v35, v37, v39
end)()
local u48 = nil
local u49 = false
local function u55() --[[ Line: 296 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u1
        [3] = u5
        [4] = u11
        [5] = u48
        [6] = u43
        [7] = u4
        [8] = u49
    --]]
    for _, v50 in pairs(u44:GetChildren()) do
        if v50:IsA("TextButton") then
            v50:Destroy()
        end
    end
    local v51 = u1:GetPlayers()
    local v52 = 0
    for _, u53 in pairs(v51) do
        if u53 ~= u5 then
            v52 = v52 + 1
            local u54 = Instance.new("TextButton")
            u54.Name = u53.Name
            u54.Size = UDim2.new(1, -10, 0, 40)
            u54.BackgroundColor3 = u11.ButtonBg
            u54.Text = u53.DisplayName .. " (@" .. u53.Name .. ")"
            u54.Font = Enum.Font.Bodoni
            u54.TextSize = 18
            u54.TextColor3 = u11.TitleText
            u54.TextXAlignment = Enum.TextXAlignment.Left
            u54.BorderSizePixel = 0
            u54.AutoButtonColor = true
            u54.ZIndex = 11
            u54.Parent = u44
            Instance.new("UIPadding", u54).PaddingLeft = UDim.new(0, 10)
            Instance.new("UICorner", u54).CornerRadius = UDim.new(0, 6)
            u54.Activated:Connect(function() --[[ Line: 329 ]]
                --[[
                Upvalues:
                    [1] = u48
                    [2] = u53
                    [3] = u43
                    [4] = u11
                    [5] = u4
                    [6] = u44
                    [7] = u49
                --]]
                u48 = u53.Name
                u43.Text = u53.DisplayName .. " (@" .. u53.Name .. ")"
                u43.TextColor3 = u11.TitleText
                u4:Create(u44, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                    ["Size"] = UDim2.new(0.9, 0, 0, 0)
                }):Play()
                task.wait(0.2)
                u44.Visible = false
                u49 = false
            end)
            u54.MouseEnter:Connect(function() --[[ Line: 342 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u11
                --]]
                u54.BackgroundColor3 = u11.ActiveTab
            end)
            u54.MouseLeave:Connect(function() --[[ Line: 346 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u11
                --]]
                u54.BackgroundColor3 = u11.ButtonBg
            end)
        end
    end
    u44.CanvasSize = UDim2.new(0, 0, 0, v52 * 42)
end
u43.Activated:Connect(function() --[[ Line: 355 ]]
    --[[
    Upvalues:
        [1] = u49
        [2] = u55
        [3] = u44
        [4] = u1
        [5] = u4
    --]]
    u49 = not u49
    if u49 then
        u55()
        u44.Visible = true
        u44.Size = UDim2.new(0.9, 0, 0, 0)
        local v56 = #u1:GetPlayers() * 42
        local v57 = math.min(200, v56)
        u4:Create(u44, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            ["Size"] = UDim2.new(0.9, 0, 0, v57)
        }):Play()
    else
        u4:Create(u44, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            ["Size"] = UDim2.new(0.9, 0, 0, 0)
        }):Play()
        task.wait(0.2)
        u44.Visible = false
    end
end)
local u58 = false
local u59 = false
local function u64() --[[ Line: 380 ]]
    --[[
    Upvalues:
        [1] = u59
        [2] = u58
        [3] = u41
        [4] = u14
        [5] = u42
        [6] = u55
        [7] = u4
        [8] = u49
        [9] = u44
    --]]
    if u59 then
        return
    else
        u58 = not u58
        if u58 then
            u41.Enabled = true
            u59 = true
            u14(u42)
            u55()
            local v60 = u41:FindFirstChild("Frame"):FindFirstChild("Frame")
            if v60 then
                v60.Size = UDim2.new(0, 0, 0, 0)
                local v61 = u4:Create(v60, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.new(0, 700, 0, 680)
                })
                v61:Play()
                v61.Completed:Connect(function() --[[ Line: 399 ]]
                    --[[
                    Upvalues:
                        [1] = u59
                    --]]
                    u59 = false
                end)
            else
                u59 = false
            end
        else
            u59 = true
            if u49 then
                u49 = false
                u44.Visible = false
                u44.Size = UDim2.new(0.9, 0, 0, 0)
            end
            local v62 = u41:FindFirstChild("Frame"):FindFirstChild("Frame")
            if v62 then
                local v63 = u4:Create(v62, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 0, 0, 0)
                })
                v63:Play()
                v63.Completed:Connect(function() --[[ Line: 420 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u59
                    --]]
                    u41.Enabled = false
                    u59 = false
                end)
            else
                u41.Enabled = false
                u59 = false
            end
        end
    end
end
v3.InputBegan:Connect(function(p65, p66) --[[ Line: 431 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u64
    --]]
    if not p66 then
        if p65.KeyCode == u7 then
            u64()
        end
    end
end)
v47.Activated:Connect(function() --[[ Line: 438 ]]
    --[[
    Upvalues:
        [1] = u64
    --]]
    u64()
end)
u46.Activated:Connect(function() --[[ Line: 442 ]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u48
        [3] = u4
        [4] = u43
        [5] = u11
        [6] = u8
        [7] = u10
        [8] = u14
        [9] = u42
        [10] = u46
    --]]
    local v67 = u45.Text
    local v68 = tonumber(v67)
    if u48 and u48 ~= "" then
        if v68 and v68 > 0 then
            if u8 < v68 then
                u4:Create(u45, TweenInfo.new(0.1), {
                    ["BackgroundColor3"] = Color3.fromRGB(60, 20, 20)
                }):Play()
                task.wait(0.5)
                u4:Create(u45, TweenInfo.new(0.3), {
                    ["BackgroundColor3"] = u11.InputBg
                }):Play()
                return
            elseif u10:InvokeServer(u48, v68) then
                u48 = nil
                u43.Text = "S\195\169lectionner un joueur"
                u43.TextColor3 = u11.SubtitleGray
                u45.Text = ""
                u14(u42)
                u4:Create(u46, TweenInfo.new(0.2), {
                    ["BackgroundColor3"] = Color3.fromRGB(30, 80, 30)
                }):Play()
                task.wait(0.5)
                u4:Create(u46, TweenInfo.new(0.3), {
                    ["BackgroundColor3"] = u11.ButtonBg
                }):Play()
            else
                u4:Create(u46, TweenInfo.new(0.2), {
                    ["BackgroundColor3"] = Color3.fromRGB(80, 20, 20)
                }):Play()
                task.wait(0.5)
                u4:Create(u46, TweenInfo.new(0.3), {
                    ["BackgroundColor3"] = u11.ButtonBg
                }):Play()
            end
        else
            u4:Create(u45, TweenInfo.new(0.1), {
                ["BackgroundColor3"] = Color3.fromRGB(60, 20, 20)
            }):Play()
            task.wait(0.5)
            u4:Create(u45, TweenInfo.new(0.3), {
                ["BackgroundColor3"] = u11.InputBg
            }):Play()
            return
        end
    else
        u4:Create(u43, TweenInfo.new(0.1), {
            ["BackgroundColor3"] = Color3.fromRGB(60, 20, 20)
        }):Play()
        task.wait(0.5)
        u4:Create(u43, TweenInfo.new(0.3), {
            ["BackgroundColor3"] = u11.InputBg
        }):Play()
        return
    end
end)
task.spawn(function() --[[ Line: 493 ]]
    --[[
    Upvalues:
        [1] = u58
        [2] = u14
        [3] = u42
    --]]
    while true do
        repeat
            task.wait(5)
        until u58
        u14(u42)
    end
end)