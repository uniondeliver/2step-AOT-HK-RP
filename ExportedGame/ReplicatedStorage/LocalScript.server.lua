-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = script.Parent
local u2 = game.Players.LocalPlayer:GetMouse()
local u3 = game.ReplicatedStorage:WaitForChild("SpawnBearRemote")
v1.Activated:Connect(function() --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    u3:FireServer(u2.Hit.Position)
end)