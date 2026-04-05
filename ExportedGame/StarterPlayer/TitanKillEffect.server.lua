-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {
    ["MainKillSound"] = "rbxassetid://9125402735",
    ["MainVolume"] = 0.8,
    ["MainPitch"] = 1,
    ["SlashSound"] = "rbxassetid://136833367092810",
    ["SlashVolume"] = 0.5,
    ["SlashPitch"] = 0.9,
    ["SlashDelay"] = 0.05
}
local u2 = {
    "Un de plus...",
    "Pour l\'humanit\195\169.",
    "Ils tombent un par un.",
    "La libert\195\169 a un prix.",
    "Encore un monstre abattu.",
    "Je n\'arr\195\170terai jamais.",
    "Pour mes camarades.",
    "Ce n\'est que le d\195\169but.",
    "Un titan de moins.",
    "La chasse continue.",
    "\195\135a en fait un de moins.",
    "Dans la nuque, comme il faut.",
    "Pas aujourd\'hui.",
    "Pour les murs.",
    "Pour toi, M\195\168re.",
    "Comme \195\160 l\'entrainement.",
    "Je n\'abandonnerai pas."
}
local v3 = game:GetService("Players")
local u4 = game:GetService("TweenService")
local v5 = game:GetService("ReplicatedStorage")
local u6 = game:GetService("Debris")
local u7 = v3.LocalPlayer:WaitForChild("PlayerGui")
local v8 = v5:WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("TitanKillEffect", 30)
if v8 then
    local u9 = Instance.new("ScreenGui")
    u9.Name = "TitanKillEffectGui"
    u9.ResetOnSpawn = false
    u9.IgnoreGuiInset = true
    u9.DisplayOrder = 100
    u9.Parent = u7
    local function u11() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        local v10 = Instance.new("Frame")
        v10.Name = "WhiteFlash"
        v10.Size = UDim2.new(1, 0, 1, 0)
        v10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v10.BackgroundTransparency = 1
        v10.BorderSizePixel = 0
        v10.ZIndex = 11
        v10.Parent = u9
        return v10
    end
    local function u14() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        local v12 = Instance.new("Frame")
        v12.Name = "RedFlash"
        v12.Size = UDim2.new(1, 0, 1, 0)
        v12.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        v12.BackgroundTransparency = 1
        v12.BorderSizePixel = 0
        v12.ZIndex = 10
        v12.Parent = u9
        local v13 = Instance.new("UIGradient")
        v13.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.7), NumberSequenceKeypoint.new(0.5, 0.1), NumberSequenceKeypoint.new(1, 0.6) })
        v13.Parent = v12
        return v12
    end
    local function u18(p15) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
        --]]
        local u16 = Instance.new("Frame")
        u16.Size = UDim2.new(0.4, 0, 0.08, 0)
        u16.Position = UDim2.new(0.3, 0, 0.85, 0)
        u16.BackgroundTransparency = 1
        u16.Parent = u9
        local u17 = Instance.new("TextLabel")
        u17.Size = UDim2.new(1, 0, 1, 0)
        u17.BackgroundTransparency = 1
        u17.Text = p15
        u17.TextColor3 = Color3.fromRGB(255, 255, 255)
        u17.TextStrokeTransparency = 0.7
        u17.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        u17.Font = Enum.Font.GothamBold
        u17.TextSize = 28
        u17.TextTransparency = 1
        u17.Parent = u16
        u4:Create(u17, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {
            ["TextTransparency"] = 0
        }):Play()
        task.delay(2, function() --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u17
                [3] = u16
            --]]
            u4:Create(u17, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {
                ["TextTransparency"] = 1
            }):Play()
            task.delay(0.7, function() --[[ Line: 140 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:Destroy()
            end)
        end)
    end
    local function u21() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u7
            [3] = u6
        --]]
        local v19 = Instance.new("Sound")
        v19.Volume = u1.MainVolume
        v19.PlaybackSpeed = u1.MainPitch
        v19.SoundId = u1.MainKillSound
        v19.Parent = u7
        v19:Play()
        u6:AddItem(v19, 3)
        task.delay(u1.SlashDelay, function() --[[ Line: 159 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u7
                [3] = u6
            --]]
            local v20 = Instance.new("Sound")
            v20.Volume = u1.SlashVolume
            v20.PlaybackSpeed = u1.SlashPitch
            v20.SoundId = u1.SlashSound
            v20.Parent = u7
            v20:Play()
            u6:AddItem(v20, 2)
        end)
    end
    local u22 = false
    local function u25() --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u21
            [3] = u2
            [4] = u18
            [5] = u11
            [6] = u4
            [7] = u14
        --]]
        if not u22 then
            u22 = true
            u21()
            u18(u2[math.random(1, #u2)])
            local u23 = u11()
            u4:Create(u23, TweenInfo.new(0.05), {
                ["BackgroundTransparency"] = 0.2
            }):Play()
            task.delay(0.08, function() --[[ Line: 189 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u23
                --]]
                u4:Create(u23, TweenInfo.new(0.18), {
                    ["BackgroundTransparency"] = 1
                }):Play()
                task.delay(0.2, function() --[[ Line: 191 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23:Destroy()
                end)
            end)
            local u24 = u14()
            task.delay(0.1, function() --[[ Line: 196 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u24
                    [3] = u22
                --]]
                u4:Create(u24, TweenInfo.new(0.25), {
                    ["BackgroundTransparency"] = 0.25
                }):Play()
                task.delay(0.35, function() --[[ Line: 198 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u24
                        [3] = u22
                    --]]
                    u4:Create(u24, TweenInfo.new(0.9, Enum.EasingStyle.Sine), {
                        ["BackgroundTransparency"] = 1
                    }):Play()
                    task.delay(1, function() --[[ Line: 200 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                            [2] = u22
                        --]]
                        u24:Destroy()
                        u22 = false
                    end)
                end)
            end)
        end
    end
    v8.OnClientEvent:Connect(function(_, _) --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25()
    end)
end