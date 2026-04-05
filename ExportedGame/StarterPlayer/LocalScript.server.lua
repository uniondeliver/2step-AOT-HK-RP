-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
local v4 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v5 = v2:WaitForChild("SendPrivateMessage")
local v6 = Instance.new("ScreenGui")
v6.Name = "PrivateMessageGui"
v6.ResetOnSpawn = false
v6.Parent = v4
local v7 = Instance.new("Frame")
v7.Size = UDim2.new(0.4, 0, 0.06, 0)
v7.Position = UDim2.new(0.3, 0, 0.78, 0)
v7.BackgroundTransparency = 1
v7.Parent = v6
local u8 = Instance.new("TextLabel")
u8.Size = UDim2.new(1, 0, 1, 0)
u8.BackgroundTransparency = 1
u8.TextColor3 = Color3.fromRGB(255, 255, 255)
u8.Font = Enum.Font.Garamond
u8.TextScaled = true
u8.Text = ""
u8.TextTransparency = 1
u8.Parent = v7
local u9 = Instance.new("TextLabel")
u9.Size = UDim2.new(1, 0, 1, 0)
u9.BackgroundTransparency = 1
u9.TextColor3 = Color3.fromRGB(255, 50, 50)
u9.Font = Enum.Font.Garamond
u9.TextScaled = true
u9.Text = ""
u9.TextTransparency = 1
u9.Parent = v7
local u10 = Instance.new("TextLabel")
u10.Size = UDim2.new(1, 0, 1, 0)
u10.BackgroundTransparency = 1
u10.TextColor3 = Color3.fromRGB(255, 210, 50)
u10.Font = Enum.Font.Garamond
u10.TextScaled = true
u10.Text = ""
u10.TextTransparency = 1
u10.Parent = v7
local function u12(p11) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    u8.Font = Enum.Font.Garamond
    u8.Text = p11
    u8.TextTransparency = 1
    u3:Create(u8, TweenInfo.new(0.5), {
        ["TextTransparency"] = 0
    }):Play()
    task.delay(7, function() --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
        --]]
        u3:Create(u8, TweenInfo.new(0.8), {
            ["TextTransparency"] = 1
        }):Play()
    end)
end
local function u14(p13) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
    --]]
    u9.Font = Enum.Font.Garamond
    u9.Text = p13
    u9.TextTransparency = 1
    u3:Create(u9, TweenInfo.new(0.5), {
        ["TextTransparency"] = 0
    }):Play()
    task.delay(7, function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u9
        --]]
        u3:Create(u9, TweenInfo.new(0.8), {
            ["TextTransparency"] = 1
        }):Play()
    end)
end
local function u16(p15) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
    --]]
    u10.Text = p15
    u10.TextTransparency = 1
    u3:Create(u10, TweenInfo.new(0.5), {
        ["TextTransparency"] = 0
    }):Play()
    task.delay(7, function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
        --]]
        u3:Create(u10, TweenInfo.new(0.8), {
            ["TextTransparency"] = 1
        }):Play()
    end)
end
v5.OnClientEvent:Connect(function(p17, p18) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
        [3] = u12
    --]]
    if p18 == true then
        u14(p17)
        return
    elseif p18 == "na" then
        u16(p17)
    else
        u12(p17)
    end
end)