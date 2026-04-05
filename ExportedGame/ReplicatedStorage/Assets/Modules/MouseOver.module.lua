-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = (game.Players.LocalPlayer or game.Players:GetPropertyChangedSignal("LocalPlayer"):Wait()):GetMouse()
local u2 = {}
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    for _, v3 in pairs(u2) do
        local v4 = v3.UIObj
        local v5 = u1.X
        local v6 = u1.Y
        v3.MouseIsInFrame = v4.AbsolutePosition.X < v5 and (v4.AbsolutePosition.Y < v6 and (v5 < v4.AbsolutePosition.X + v4.AbsoluteSize.X and v6 < v4.AbsolutePosition.Y + v4.AbsoluteSize.Y))
        if not v3.MouseIsInFrame and v3.MouseWasIn then
            v3.MouseWasIn = false
            v3.LeaveEvent:Fire()
        end
    end
    for _, v7 in pairs(u2) do
        if v7.MouseIsInFrame and not v7.MouseWasIn then
            v7.MouseWasIn = true
            v7.EnteredEvent:Fire()
        end
    end
end)
return {
    ["MouseEnterLeaveEvent"] = function(u8) --[[ Name: MouseEnterLeaveEvent, Line 51 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if u2[u8] then
            return u2[u8].EnteredEvent.Event, u2[u8].LeaveEvent.Event
        end
        local v9 = {
            ["UIObj"] = u8
        }
        local u10 = Instance.new("BindableEvent")
        local u11 = Instance.new("BindableEvent")
        v9.EnteredEvent = u10
        v9.LeaveEvent = u11
        v9.MouseWasIn = false
        u2[u8] = v9
        u8.AncestryChanged:Connect(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u10
                [3] = u11
                [4] = u2
            --]]
            if not u8.Parent then
                u10:Destroy()
                u11:Destroy()
                u2[u8] = nil
            end
        end)
        return u10.Event, u11.Event
    end
}