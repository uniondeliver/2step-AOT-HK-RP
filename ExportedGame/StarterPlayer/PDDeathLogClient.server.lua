-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = v1.LocalPlayer
v2:WaitForChild("PDDeathLog").OnClientEvent:Connect(function(p4) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    print("[PD LOG CLIENT] Event received - entries:", p4 and (#p4 or "NIL") or "NIL")
    if p4 then
        local v5 = u3.PlayerGui:FindFirstChild("PDDeathLogGui")
        if v5 then
            v5:Destroy()
        end
        local u6 = Instance.new("ScreenGui")
        u6.Name = "PDDeathLogGui"
        u6.ResetOnSpawn = false
        u6.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u6.DisplayOrder = 999
        local v7 = Instance.new("Frame")
        v7.Size = UDim2.new(1, 0, 1, 0)
        v7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v7.BackgroundTransparency = 0.5
        v7.BorderSizePixel = 0
        v7.ZIndex = 1
        v7.Parent = u6
        local v8 = #p4
        local v9 = 0
        local v10 = 0
        local v11 = 0
        for _, v12 in ipairs(p4) do
            if v12.left then
                v9 = v9 + 1
            elseif v12.immune then
                v10 = v10 + 1
            else
                v11 = v11 + 1
            end
        end
        local v13 = math.max(v8, 1) * 34 + 110 + 50
        local v14 = Instance.new("Frame")
        v14.Size = UDim2.new(0, 480, 0, v13)
        v14.Position = UDim2.new(0.5, -240, 0.5, -v13 / 2)
        v14.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
        v14.BorderSizePixel = 0
        v14.ZIndex = 2
        v14.Parent = u6
        local v15 = Instance.new("UICorner")
        v15.CornerRadius = UDim.new(0, 10)
        v15.Parent = v14
        local v16 = Instance.new("Frame")
        v16.Size = UDim2.new(1, 0, 0, 5)
        v16.Position = UDim2.new(0, 0, 0, 0)
        v16.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        v16.BorderSizePixel = 0
        v16.ZIndex = 3
        v16.Parent = v14
        local v17 = Instance.new("UICorner")
        v17.CornerRadius = UDim.new(0, 10)
        v17.Parent = v16
        local v18 = Instance.new("TextLabel")
        v18.Size = UDim2.new(1, -20, 0, 36)
        v18.Position = UDim2.new(0, 10, 0, 12)
        v18.BackgroundTransparency = 1
        v18.Text = "\226\154\148  RAPPORT PERMANENT DEATH  \226\154\148"
        v18.TextColor3 = Color3.fromRGB(220, 55, 55)
        v18.Font = Enum.Font.GothamBold
        v18.TextSize = 17
        v18.TextXAlignment = Enum.TextXAlignment.Center
        v18.ZIndex = 3
        v18.Parent = v14
        local v19 = Instance.new("TextLabel")
        v19.Size = UDim2.new(1, -20, 0, 24)
        v19.Position = UDim2.new(0, 10, 0, 50)
        v19.BackgroundTransparency = 1
        v19.Text = string.format("Total : %d   |   %d wip\195\169(s)   |   %d immunis\195\169(s)   |   %d parti(s)", v8, v11, v10, v9)
        v19.TextColor3 = Color3.fromRGB(180, 180, 180)
        v19.Font = Enum.Font.Gotham
        v19.TextSize = 13
        v19.TextXAlignment = Enum.TextXAlignment.Center
        v19.ZIndex = 3
        v19.Parent = v14
        local v20 = Instance.new("Frame")
        v20.Size = UDim2.new(1, -20, 0, 1)
        v20.Position = UDim2.new(0, 10, 0, 82)
        v20.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        v20.BorderSizePixel = 0
        v20.ZIndex = 3
        v20.Parent = v14
        local v21 = Instance.new("TextLabel")
        v21.Size = UDim2.new(0.4, -10, 0, 22)
        v21.Position = UDim2.new(0, 10, 0, 88)
        v21.BackgroundTransparency = 1
        v21.Text = "USERNAME ROBLOX"
        v21.TextColor3 = Color3.fromRGB(120, 120, 120)
        v21.Font = Enum.Font.GothamBold
        v21.TextSize = 11
        v21.TextXAlignment = Enum.TextXAlignment.Left
        v21.ZIndex = 3
        v21.Parent = v14
        local v22 = Instance.new("TextLabel")
        v22.Size = UDim2.new(0.4, -10, 0, 22)
        v22.Position = UDim2.new(0.4, 0, 0, 88)
        v22.BackgroundTransparency = 1
        v22.Text = "NOM RP"
        v22.TextColor3 = Color3.fromRGB(120, 120, 120)
        v22.Font = Enum.Font.GothamBold
        v22.TextSize = 11
        v22.TextXAlignment = Enum.TextXAlignment.Left
        v22.ZIndex = 3
        v22.Parent = v14
        local v23 = Instance.new("TextLabel")
        v23.Size = UDim2.new(0.2, -10, 0, 22)
        v23.Position = UDim2.new(0.8, 0, 0, 88)
        v23.BackgroundTransparency = 1
        v23.Text = "STATUT"
        v23.TextColor3 = Color3.fromRGB(120, 120, 120)
        v23.Font = Enum.Font.GothamBold
        v23.TextSize = 11
        v23.TextXAlignment = Enum.TextXAlignment.Left
        v23.ZIndex = 3
        v23.Parent = v14
        if v8 == 0 then
            local v24 = Instance.new("TextLabel")
            v24.Size = UDim2.new(1, -20, 0, 34)
            v24.Position = UDim2.new(0, 10, 0, 110)
            v24.BackgroundTransparency = 1
            v24.Text = "Aucune mort enregistr\195\169e durant cette session."
            v24.TextColor3 = Color3.fromRGB(140, 140, 140)
            v24.Font = Enum.Font.GothamItalic
            v24.TextSize = 14
            v24.TextXAlignment = Enum.TextXAlignment.Center
            v24.ZIndex = 3
            v24.Parent = v14
        else
            for v25, v26 in ipairs(p4) do
                local v27 = 110 + (v25 - 1) * 34
                if v25 % 2 == 0 then
                    local v28 = Instance.new("Frame")
                    v28.Size = UDim2.new(1, 0, 0, 34)
                    v28.Position = UDim2.new(0, 0, 0, v27)
                    v28.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    v28.BorderSizePixel = 0
                    v28.ZIndex = 2
                    v28.Parent = v14
                end
                local v29 = v26.immune and Color3.fromRGB(130, 130, 130) or (v26.left and Color3.fromRGB(160, 130, 200) or Color3.fromRGB(235, 235, 235))
                local v30 = Instance.new("TextLabel")
                v30.Size = UDim2.new(0.4, -10, 0, 34)
                v30.Position = UDim2.new(0, 10, 0, v27)
                v30.BackgroundTransparency = 1
                v30.Text = v26.robloxName
                v30.TextColor3 = v29
                v30.Font = Enum.Font.Gotham
                v30.TextSize = 14
                v30.TextXAlignment = Enum.TextXAlignment.Left
                v30.ZIndex = 3
                v30.Parent = v14
                local v31 = Instance.new("TextLabel")
                v31.Size = UDim2.new(0.4, -10, 0, 34)
                v31.Position = UDim2.new(0.4, 0, 0, v27)
                v31.BackgroundTransparency = 1
                v31.Text = v26.rpName
                v31.TextColor3 = v29
                v31.Font = Enum.Font.Gotham
                v31.TextSize = 14
                v31.TextXAlignment = Enum.TextXAlignment.Left
                v31.ZIndex = 3
                v31.Parent = v14
                local v32 = Instance.new("TextLabel")
                v32.Size = UDim2.new(0.2, -10, 0, 34)
                v32.Position = UDim2.new(0.8, 0, 0, v27)
                v32.BackgroundTransparency = 1
                v32.Text = v26.left and "Parti" or (v26.immune and "Immunis\195\169" or "Wip\195\169")
                v32.TextColor3 = v26.left and Color3.fromRGB(160, 130, 200) or (v26.immune and Color3.fromRGB(200, 160, 40) or Color3.fromRGB(200, 60, 60))
                v32.Font = Enum.Font.GothamBold
                v32.TextSize = 13
                v32.TextXAlignment = Enum.TextXAlignment.Left
                v32.ZIndex = 3
                v32.Parent = v14
            end
        end
        local v33 = Instance.new("TextButton")
        v33.Size = UDim2.new(0, 120, 0, 32)
        v33.Position = UDim2.new(0.5, -60, 1, -42)
        v33.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        v33.Text = "Fermer"
        v33.TextColor3 = Color3.fromRGB(255, 255, 255)
        v33.Font = Enum.Font.GothamBold
        v33.TextSize = 14
        v33.BorderSizePixel = 0
        v33.ZIndex = 3
        v33.Parent = v14
        local v34 = Instance.new("UICorner")
        v34.CornerRadius = UDim.new(0, 6)
        v34.Parent = v33
        v33.MouseButton1Click:Connect(function() --[[ Line: 252 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            u6:Destroy()
        end)
        v7.InputBegan:Connect(function(p35) --[[ Line: 257 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            if p35.UserInputType == Enum.UserInputType.MouseButton1 then
                u6:Destroy()
            end
        end)
        u6.Parent = u3.PlayerGui
    else
        warn("[PD LOG CLIENT] deathLog is nil, aborting")
    end
end)