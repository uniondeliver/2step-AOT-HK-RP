-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("StarterGui")
task.spawn(function() --[[ Line: 3 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    while not pcall(function() --[[ Line: 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        u1:SetCore("ResetButtonCallback", false)
    end) do
        task.wait()
    end
end)