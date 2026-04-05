-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("CollectionService")
local u2 = game:GetService("Players")
local u3 = game:GetService("RunService")
local u4 = {
    [Enum.HumanoidStateType.Dead] = true,
    [Enum.HumanoidStateType.Physics] = true
}
local u5 = {}
function setRagdollEnabled(p6, p7)
    local v8 = p6.Parent:FindFirstChild("RagdollConstraints")
    for _, v9 in pairs(v8:GetChildren()) do
        if v9:IsA("Constraint") then
            local v10 = v9.RigidJoint.Value
            local v11
            if p7 then
                v11 = nil
            else
                v11 = v9.Attachment1.Parent or nil
            end
            if v10.Part1 ~= v11 then
                v10.Part1 = v11
            end
        end
    end
end
function hasRagdollOwnership(p12)
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    return u3:IsServer() and true or u2:GetPlayerFromCharacter(p12.Parent) == u2.LocalPlayer
end
function ragdollAdded(u13)
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5[u13] = u13.StateChanged:Connect(function(_, p14) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u4
        --]]
        if hasRagdollOwnership(u13) then
            if u4[p14] then
                setRagdollEnabled(u13, true)
                return
            end
            setRagdollEnabled(u13, false)
        end
    end)
end
function ragdollRemoved(p15)
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5[p15]:Disconnect()
    u5[p15] = nil
end
v1:GetInstanceAddedSignal("Ragdoll"):Connect(ragdollAdded)
v1:GetInstanceRemovedSignal("Ragdoll"):Connect(ragdollRemoved)
for _, v16 in pairs(v1:GetTagged("Ragdoll")) do
    ragdollAdded(v16)
end
return nil