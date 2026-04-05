-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {
    ["Version"] = "2.1",
    ["AttachmentName"] = "DmgPoint",
    ["DebugMode"] = false
}
local u2 = require(script.MainHandler)
local u3 = require(script.HitboxObject)
function u1.Initialize(_, p4, p5) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u1
    --]]
    assert(p4, "You must provide an object instance.")
    local v6 = u2:check(p4)
    if not v6 then
        v6 = u3:new()
        v6:config(p4, p5)
        v6:seekAttachments(u1.AttachmentName)
        v6.debugMode = u1.DebugMode
        u2:add(v6)
    end
    return v6
end
function u1.Deinitialize(_, p7) --[[ Line: 198 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2:remove(p7)
end
return u1