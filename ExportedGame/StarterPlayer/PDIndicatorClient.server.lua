-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
local u4 = game:GetService("Debris")
local u5 = v1.LocalPlayer
local v6 = u2:WaitForChild("PermanentDeathNotify")
local u7 = u2:WaitForChild("PDStart")
local u8 = nil
local function u22() --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u5
        [4] = u7
        [5] = u3
    --]]
    if u8 then
        u8:Destroy()
        u8 = nil
    end
    local v9 = Instance.new("Sound")
    v9.SoundId = "rbxassetid://139481207162657"
    v9.Volume = 1
    v9.Parent = workspace
    v9:Play()
    u4:AddItem(v9, 10)
    local v10 = Instance.new("ScreenGui")
    v10.Name = "PDIndicatorGui"
    v10.ResetOnSpawn = false
    v10.DisplayOrder = 100
    v10.IgnoreGuiInset = true
    v10.Parent = u5.PlayerGui
    u8 = v10
    local v11 = u7:Clone()
    v11.Parent = v10
    v11.AnchorPoint = Vector2.new(0.5, 0)
    v11.Position = UDim2.new(0.5, 0, 0, 0)
    local u12 = {}
    local function v14(p13) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        if p13:IsA("ImageLabel") or p13:IsA("ImageButton") then
            u12[p13] = {
                ["ImageTransparency"] = p13.ImageTransparency
            }
            p13.ImageTransparency = 1
        end
        if p13:IsA("GuiObject") then
            if not u12[p13] then
                u12[p13] = {}
            end
            u12[p13].BackgroundTransparency = p13.BackgroundTransparency
            p13.BackgroundTransparency = 1
        end
        if p13:IsA("TextLabel") or p13:IsA("TextButton") then
            u12[p13].TextTransparency = p13.TextTransparency
            p13.TextTransparency = 1
        end
    end
    v14(v11)
    for _, v15 in ipairs(v11:GetDescendants()) do
        v14(v15)
    end
    local u16 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local function v20(p17) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u3
            [3] = u16
        --]]
        local v18 = u12[p17]
        if v18 then
            local v19 = {}
            if v18.ImageTransparency ~= nil then
                v19.ImageTransparency = v18.ImageTransparency
            end
            if v18.BackgroundTransparency ~= nil then
                v19.BackgroundTransparency = v18.BackgroundTransparency
            end
            if v18.TextTransparency ~= nil then
                v19.TextTransparency = v18.TextTransparency
            end
            if next(v19) then
                u3:Create(p17, u16, v19):Play()
            end
        end
    end
    v20(v11)
    for _, v21 in ipairs(v11:GetDescendants()) do
        v20(v21)
    end
end
local function u30() --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    if u8 then
        local v23 = u8:FindFirstChildOfClass("Frame")
        if v23 then
            local u24 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            local function v27(p25) --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u24
                --]]
                local v26 = {}
                if p25:IsA("ImageLabel") or p25:IsA("ImageButton") then
                    v26.ImageTransparency = 1
                end
                if p25:IsA("GuiObject") then
                    v26.BackgroundTransparency = 1
                end
                if p25:IsA("TextLabel") or p25:IsA("TextButton") then
                    v26.TextTransparency = 1
                end
                if next(v26) then
                    u3:Create(p25, u24, v26):Play()
                end
            end
            local v28 = u3:Create(v23, u24, {
                ["BackgroundTransparency"] = 1
            })
            v28:Play()
            v28.Completed:Connect(function() --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                if u8 then
                    u8:Destroy()
                    u8 = nil
                end
            end)
            for _, v29 in ipairs(v23:GetDescendants()) do
                v27(v29)
            end
        else
            u8:Destroy()
            u8 = nil
        end
    else
        return
    end
end
v6.OnClientEvent:Connect(function(p31) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u30
    --]]
    if p31 then
        u22()
    else
        u30()
    end
end)
task.spawn(function() --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u22
    --]]
    if not u5.Character then
        u5.CharacterAdded:Wait()
    end
    task.wait(1)
    if u2:GetAttribute("PDActive") then
        print("\226\156\133 PD already active on join, showing indicator")
        u22()
    end
end)
u2:GetAttributeChangedSignal("PDActive"):Connect(function() --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
        [3] = u30
    --]]
    if u2:GetAttribute("PDActive") then
        u22()
    else
        u30()
    end
end)