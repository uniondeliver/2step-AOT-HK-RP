-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("UserInputService")
local v3 = v1.LocalPlayer
local u4 = v3.Character or v3.CharacterAdded:Wait()
local u5 = u4:WaitForChild("Humanoid")
local u6 = true
v3.CharacterAdded:Connect(function(p7) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4 = p7
    u5 = u4:WaitForChild("Humanoid")
end)
v2.JumpRequest:Connect(function() --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    if u6 then
        u6 = false
        u5:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        task.delay(1.5, function() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            u6 = true
        end)
    else
        u5:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
    end
end)