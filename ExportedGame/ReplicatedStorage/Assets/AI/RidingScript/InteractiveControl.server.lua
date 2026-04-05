-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game:GetService("Debris")
local u3 = game:GetService("UserInputService")
local u4 = game:GetService("ContextActionService")
local v5 = game:GetService("RunService")
local v6 = v1.LocalPlayer
local v7 = v6.Character
v6:GetMouse()
local u8 = nil
for _, v9 in pairs(v7:GetChildren()) do
    if v9:IsA("Humanoid") then
        u8 = v9
        break
    end
end
local u10 = script:WaitForChild("ServerControl").Value
local u11 = false
local u12 = false
local u13 = true
function InvokeServer(u14, u15)
    --[[
    Upvalues:
        [1] = u10
    --]]
    pcall(function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u14
            [3] = u15
        --]]
        return u10:InvokeServer(u14, u15)
    end)
end
function Dismount()
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u4
    --]]
    if DisableJump then
        DisableJump:disconnect()
    end
    InvokeServer("Dismount")
    u13 = false
    if u3.TouchEnabled then
        u4:UnbindAction("RidableHorse_Dismount")
    end
end
if u8 then
    DisableJump = u8.Changed:connect(function(p16) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if p16 == "Jump" then
            u8.Jump = false
            InvokeServer("Jump")
        end
    end)
end
u3.InputBegan:connect(function(p17) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    if p17.KeyCode == Enum.KeyCode.LeftControl or p17.KeyCode == Enum.KeyCode.RightControl then
        Dismount()
        return
    elseif p17.KeyCode == Enum.KeyCode.W then
        u11 = true
    elseif p17.KeyCode == Enum.KeyCode.S then
        u12 = true
    end
end)
u3.InputEnded:connect(function(p18) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    if p18.KeyCode == Enum.KeyCode.W then
        u11 = false
    elseif p18.KeyCode == Enum.KeyCode.S then
        u12 = false
    end
end)
if u3.TouchEnabled then
    u4:BindActionToInputTypes("RidableHorse_Dismount", function() --[[ Line: 72 ]]
        Dismount()
    end, true, Enum.KeyCode.LeftControl)
    u4:SetTitle("RidableHorse_Dismount", "Dismount")
end
u10.Changed:connect(function(p19) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u2
    --]]
    if p19 == "Parent" and not u10.Parent then
        u4:UnbindAction("RidableHorse_Dismount")
        u2:AddItem(script, 1)
    end
end)
v5.RenderStepped:Connect(function() --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
        [3] = u12
    --]]
    if u13 then
        if u11 then
            InvokeServer("ChangeSpeed", 1)
            return
        end
        if u12 then
            InvokeServer("ChangeSpeed", -1)
        end
    end
end)