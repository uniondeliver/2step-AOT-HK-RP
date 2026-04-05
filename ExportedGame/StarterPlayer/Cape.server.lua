-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("UserInputService")
local u3 = v1.LocalPlayer
local u4 = false
local function u9(p5, p6) --[[ Line: 7 ]]
    for _, v7 in ipairs(p5:GetChildren()) do
        if v7:IsA("Accessory") then
            local v8 = v7:FindFirstChild("Handle")
            if v8 then
                v8.Transparency = p6 and 0 or 1
            end
        end
    end
end
v2.InputBegan:Connect(function(p10, p11) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u9
    --]]
    if p11 then
        return
    elseif p10.KeyCode == Enum.KeyCode.H then
        local v12 = u3.Character
        if v12 then
            local v13 = v12:FindFirstChild("CapeEquipee_" .. u3.Name)
            if v13 then
                u4 = not u4
                v13.Head.HoodUp.Transparency = u4 and 0 or 1
                v13.Head.HoodDown.Transparency = u4 and 1 or 0
                u9(v12, not u4)
            end
        else
            return
        end
    else
        return
    end
end)