-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("UserInputService")
local u3 = game:GetService("TweenService")
local u4 = game:GetService("StarterGui")
local u5 = v1.LocalPlayer
local u6 = u5:WaitForChild("PlayerGui")
task.spawn(function() --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for _ = 1, 10 do
        if pcall(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
        end) then
            break
        end
        task.wait(0.5)
    end
end)
local u7 = {
    {
        ["seuil"] = 90,
        ["texte"] = "\194\171 Je me sens parfaitement bien\226\128\166 comme si rien ne pouvait m\'arr\195\170ter. \194\187"
    },
    {
        ["seuil"] = 70,
        ["texte"] = "\194\171 Une \195\169gratignure, \195\160 peine. Je peux continuer. \194\187"
    },
    {
        ["seuil"] = 50,
        ["texte"] = "\194\171 Je commence \195\160 sentir la douleur. Il faut rester concentr\195\169. \194\187"
    },
    {
        ["seuil"] = 30,
        ["texte"] = "\194\171 C\'est s\195\169rieux. Mon corps me l\195\162che peu \195\160 peu\226\128\166 \194\187"
    },
    {
        ["seuil"] = 10,
        ["texte"] = "\194\171 Je devrais me faire soigner imm\195\169diatement. Vite. \194\187"
    },
    {
        ["seuil"] = 0,
        ["texte"] = "\194\171 Je suis au bord du gouffre\226\128\166 encore un souffle et c\'est fini. \194\187"
    }
}
local function u9(p8) --[[ Line: 46 ]]
    if p8 >= 70 then
        return Color3.fromRGB(218, 200, 150)
    elseif p8 >= 40 then
        return Color3.fromRGB(210, 160, 80)
    else
        return Color3.fromRGB(200, 80, 80)
    end
end
local u10 = false
local function u20(p11, p12) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u3
    --]]
    if not u10 then
        u10 = true
        local u13 = Instance.new("ScreenGui")
        u13.Name = "HealthMonologue"
        u13.ResetOnSpawn = false
        u13.IgnoreGuiInset = true
        u13.DisplayOrder = 120
        u13.Parent = u6
        local u14 = Instance.new("TextLabel", u13)
        u14.Size = UDim2.new(0.6, 0, 0, 70)
        u14.Position = UDim2.new(0.2, 0, 0.78, 0)
        u14.BackgroundTransparency = 1
        u14.BorderSizePixel = 0
        u14.Text = p11
        u14.TextColor3 = p12
        u14.TextTransparency = 1
        u14.Font = Enum.Font.Bodoni
        u14.TextSize = 22
        u14.TextXAlignment = Enum.TextXAlignment.Center
        u14.TextYAlignment = Enum.TextYAlignment.Center
        u14.TextWrapped = true
        u14.LineHeight = 1.35
        u14.ZIndex = 5
        local u15 = Instance.new("TextLabel", u13)
        u15.Size = u14.Size
        u15.Position = UDim2.new(0.2, 2, 0.78, 2)
        u15.BackgroundTransparency = 1
        u15.BorderSizePixel = 0
        u15.Text = p11
        u15.TextColor3 = Color3.fromRGB(0, 0, 0)
        u15.TextTransparency = 1
        u15.Font = Enum.Font.Bodoni
        u15.TextSize = 22
        u15.TextXAlignment = Enum.TextXAlignment.Center
        u15.TextYAlignment = Enum.TextYAlignment.Center
        u15.TextWrapped = true
        u15.LineHeight = 1.35
        u15.ZIndex = 4
        local v16 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local u17 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        u3:Create(u14, v16, {
            ["TextTransparency"] = 0
        }):Play()
        u3:Create(u15, v16, {
            ["TextTransparency"] = 0.7
        }):Play()
        task.delay(3.5, function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u14
                [3] = u17
                [4] = u15
                [5] = u13
                [6] = u10
            --]]
            local v18 = u3:Create(u14, u17, {
                ["TextTransparency"] = 1
            })
            local v19 = u3:Create(u15, u17, {
                ["TextTransparency"] = 1
            })
            v18:Play()
            v19:Play()
            v18.Completed:Wait()
            u13:Destroy()
            u10 = false
        end)
    end
end
v2.InputBegan:Connect(function(p21, p22) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u9
        [4] = u20
    --]]
    if p22 then
        return
    end
    if p21.KeyCode ~= Enum.KeyCode.J then
        return
    end
    local v23 = u5.Character
    if not v23 then
        return
    end
    local v24 = v23:FindFirstChildOfClass("Humanoid")
    if not v24 then
        return
    end
    local v25 = v24.Health / v24.MaxHealth * 100
    local v26 = math.floor(v25)
    local v27 = math.clamp(v26, 0, 100)
    for _, v28 in ipairs(u7) do
        if v28.seuil <= v27 then
            v29 = v28.texte
            ::l12::
            u20(v29, (u9(v27)))
            return
        end
    end
    local v29 = u7[#u7].texte
    goto l12
end)