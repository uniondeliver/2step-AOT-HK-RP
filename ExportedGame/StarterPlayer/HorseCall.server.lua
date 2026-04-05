-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

uis = game:GetService("UserInputService")
rs = game:GetService("ReplicatedStorage")
local u1 = false
local v2 = game.Players.LocalPlayer
local u3 = v2.Character or v2.CharacterAdded:Wait()
uis.InputBegan:Connect(function(p4, p5) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    if p4.KeyCode == Enum.KeyCode.B and (not p5 and (u3:FindFirstChild("Titan") == nil and u1 == false)) then
        u1 = true
        local v6 = u3.Humanoid:LoadAnimation(script.Call)
        v6.Priority = Enum.AnimationPriority.Action4
        v6:Play()
        wait(1)
        rs.CallHorse:FireServer()
        task.wait(8)
        u1 = false
    end
end)