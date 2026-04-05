-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("TextChatService")
local u4 = require(v2:WaitForChild("Modules"):WaitForChild("EmotesConfig"))
local v5 = require(script.Parent:WaitForChild("Modules"):WaitForChild("EmotePlayer"))
local u6 = v1.LocalPlayer
local u7 = nil
v1.PlayerRemoving:Connect(function(p8) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    if p8 == u6 and u7 then
        u7:Destroy()
    end
end)
u7 = v5.new()
function v3.OnIncomingMessage(p9) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u7
    --]]
    if p9.TextSource and (p9.TextSource.UserId == u6.UserId and p9.Status == Enum.TextChatMessageStatus.Sending) then
        local v10 = p9.Text:lower():match("^%S+")
        local u11 = v10 and u4.GetEmoteByCommand(v10)
        if u11 then
            task.spawn(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u11
                --]]
                if u7 then
                    u7:PlayEmote(u11)
                end
            end)
        end
    end
    if p9.Text and p9.Text:sub(1, 1) == "/" then
        local v12 = Instance.new("TextChatMessageProperties")
        v12.Text = " "
        v12.PrefixText = " "
        return v12
    end
end