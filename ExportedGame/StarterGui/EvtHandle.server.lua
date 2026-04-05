-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = nil
local u2 = game.Players.LocalPlayer
local u3 = u2.Character or u2.CharacterAdded:Wait()
local u4 = true
u2.CharacterAdded:connect(function() --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u1
        [4] = u4
    --]]
    u3 = u2.Character
    if u1 ~= nil then
        game:GetService("TweenService"):Create(u1, TweenInfo.new(5), {
            ["Volume"] = 0
        }):Play()
        delay(5, function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u4
            --]]
            if u1 ~= nil then
                u1:Stop()
                u1 = nil
            end
            u4 = true
            PlayIdle()
        end)
    end
end)
u2.CharacterAppearanceLoaded:Wait()
local u5 = u3:WaitForChild("Humanoid")
local u6 = {}
local u7 = nil
for _, v8 in pairs(script:GetChildren()) do
    if v8:IsA("Sound") and not v8:FindFirstChild("Unique") then
        table.insert(u6, v8)
    end
end
local u9 = nil
local u10 = nil
function PlayIdle(p11)
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u6
        [4] = u5
        [5] = u7
    --]]
    local v12 = script.Parent.IdleMusic
    for _, v13 in pairs(v12:GetChildren()) do
        if v13:IsA("Sound") then
            v13:Stop()
        end
    end
    if u10 == nil then
        if not p11 then
            if v12.Name == "IdleMusic" then
                p11 = v12:GetChildren()[math.random(#v12:GetChildren())]
            else
                p11 = u6[math.random(#u6)]
            end
        end
        u9 = p11
    else
        u9 = u10
    end
    if u9 and (not inCombat and u5.Health > 0) then
        u9.Volume = 0
        u9.Playing = true
        u7 = game:GetService("TweenService"):Create(u9, TweenInfo.new(1), {
            ["Volume"] = script.Parent.Settings.Settings.IdleVolume.Volume.Value
        })
        u7:Play()
    end
end
script.Parent:WaitForChild("AreaMusic").Event:connect(function(p14) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u9
        [3] = u10
    --]]
    if not inCombat and u1 == nil then
        if u9 ~= nil then
            game:GetService("TweenService"):Create(u9, TweenInfo.new(0.2), {
                ["Volume"] = 0
            }):Play()
            task.delay(0.2, function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                if inCombat then
                    if u9 ~= nil then
                        u9:Stop()
                    end
                    u9 = nil
                end
            end)
        end
        task.wait(0.2)
        if p14 == nil then
            if u10 then
                u10:Destroy()
            end
            u10 = nil
        else
            local v15 = p14:Clone()
            v15.Parent = script.Parent.AreaTracks
            u10 = v15
        end
        PlayIdle(p14)
    end
end)
PlayIdle()
script.Parent.Settings.Settings.IdleVolume.Volume.Changed:connect(function() --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
    --]]
    if u9 ~= nil and u9.Playing then
        u7 = game:GetService("TweenService"):Create(u9, TweenInfo.new(0.2), {
            ["Volume"] = script.Parent.Settings.Settings.IdleVolume.Volume.Value
        })
        u7:Play()
    end
end)
u5.Died:connect(function() --[[ Line: 122 ]]
    inCombat = false
end)