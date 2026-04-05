-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("StarterGui");
(function() --[[ Name: hideLeaderboard, Line 8 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2, _ = pcall(function() --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        u1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
    end)
    if not v2 then
        task.wait(1)
        pcall(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            u1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
        end)
    end
end)()