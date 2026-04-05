-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

b = script.Parent
local v1 = 20
local v2 = 45
local u3 = game:GetService("TweenService")
local u4 = game:service("Lighting")
local u5 = v1 == nil and 0 or v1
local u6 = v2 == nil and 0 or v2
function TimeChanged()
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u3
    --]]
    local v7 = (u5 / 60 + 6) * 60
    local v8 = (u6 / 60 + 17) * 60
    if v7 < v8 then
        if v7 <= u4:GetMinutesAfterMidnight() and u4:GetMinutesAfterMidnight() <= v8 then
            game.Lighting.Ambient = Color3.new(0.33725490196078434, 0.33725490196078434, 0.33725490196078434)
            if b.IsPlaying ~= true then
                u3:Create(b, TweenInfo.new(5), {
                    ["Volume"] = 0.3
                }):Play()
                b:Play()
            end
        else
            u3:Create(b, TweenInfo.new(5), {
                ["Volume"] = 0
            }):Play()
            b:Stop()
            return
        end
    else
        if v8 < v7 then
            if v7 <= u4:GetMinutesAfterMidnight() or u4:GetMinutesAfterMidnight() <= v8 then
                if b.IsPlaying ~= true then
                    game.Lighting.Ambient = Color3.new(0.33725490196078434, 0.33725490196078434, 0.33725490196078434)
                    b:Play()
                    u3:Create(b, TweenInfo.new(5), {
                        ["Volume"] = 0.3
                    }):Play()
                end
            end
            u3:Create(b, TweenInfo.new(5), {
                ["Volume"] = 0
            }):Play()
            b:Stop()
        end
        return
    end
end
TimeChanged()
game.Lighting.Changed:connect(function(p9) --[[ Line: 46 ]]
    if p9 == "TimeOfDay" then
        TimeChanged()
    end
end)