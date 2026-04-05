-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game:GetService("TweenService")
local v3 = v1.LocalPlayer
local u4 = v3.Character or v3.CharacterAdded:Wait()
local v5 = v3:WaitForChild("PlayerGui")
local v6 = Instance.new("ScreenGui")
v6.Name = "GasDisplay"
v6.ResetOnSpawn = false
v6.Parent = v5
local u7 = Instance.new("TextLabel")
u7.Size = UDim2.new(0.4, 0, 0.07, 0)
u7.Position = UDim2.new(0.3, 0, 0.88, 0)
u7.BackgroundTransparency = 1
u7.TextColor3 = Color3.fromRGB(255, 255, 255)
u7.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
u7.TextStrokeTransparency = 0.6
u7.Font = Enum.Font.GothamBold
u7.TextScaled = true
u7.TextTransparency = 1
u7.Text = ""
u7.Parent = v6
local u8 = 0
local function u9() --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u8
    --]]
    u7.Text = "J\'ai " .. (u4:GetAttribute("LeftGas") or 0) .. "% de gaz \195\160 gauche, et " .. (u4:GetAttribute("RightGas") or 0) .. "% \195\160 droite."
    u7.TextTransparency = 0
    u8 = tick() + 3
end
u4:GetAttributeChangedSignal("ShowGas"):Connect(u9)
task.spawn(function() --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u7
    --]]
    while true do
        repeat
            task.wait(0.1)
        until u8 > 0 and u8 <= tick()
        u2:Create(u7, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {
            ["TextTransparency"] = 1
        }):Play()
        u8 = 0
    end
end)
v3.CharacterAdded:Connect(function(p10) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u7
        [4] = u9
    --]]
    u4 = p10
    u8 = 0
    u7.TextTransparency = 1
    u4:GetAttributeChangedSignal("ShowGas"):Connect(u9)
end)