-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
local u2 = require(script.CameraShakeInstance)
u1.CameraShakeInstance = u2
u1.Presets = require(script.CameraShakePresets)
local u3 = Vector3.new()
function u1.new(p4, p5) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local v6 = type(p4) == "number"
    assert(v6, "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)")
    local v7 = type(p5) == "function"
    assert(v7, "Callback must be a function")
    local v8 = {
        ["_running"] = false,
        ["_renderName"] = "CameraShaker",
        ["_renderPriority"] = p4,
        ["_posAddShake"] = u3,
        ["_rotAddShake"] = u3,
        ["_camShakeInstances"] = {},
        ["_removeInstances"] = {},
        ["_callback"] = p5
    }
    local v9 = u1
    return setmetatable(v8, v9)
end
local u10 = debug.profilebegin
local u11 = debug.profileend
function u1.Start(u12) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
    --]]
    if not u12._running then
        u12._running = true
        local u13 = u12._callback
        game:GetService("RunService"):BindToRenderStep(u12._renderName, u12._renderPriority, function(p14) --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u12
                [3] = u11
                [4] = u13
            --]]
            u10("CameraShakerUpdate")
            local v15 = u12:Update(p14)
            u11()
            u13(v15)
        end)
    end
end
function u1.Stop(p16) --[[ Line: 36 ]]
    if p16._running then
        game:GetService("RunService"):UnbindFromRenderStep(p16._renderName)
        p16._running = false
    end
end
function u1.StopSustained(p17, p18) --[[ Line: 43 ]]
    for _, v19 in pairs(p17._camShakeInstances) do
        if v19.fadeOutDuration == 0 then
            v19:StartFadeOut(p18 or v19.fadeInDuration)
        end
    end
end
local u20 = u2.CameraShakeState
local u21 = CFrame.new
local u22 = CFrame.Angles
local u23 = math.rad
function u1.Update(p24, p25) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u20
        [3] = u21
        [4] = u22
        [5] = u23
    --]]
    local v26 = u3
    local v27 = u3
    local v28 = p24._camShakeInstances
    for v29 = 1, #v28 do
        local v30 = v28[v29]
        local v31 = v30:GetState()
        if v31 == u20.Inactive and v30.DeleteOnInactive then
            p24._removeInstances[#p24._removeInstances + 1] = v29
        elseif v31 ~= u20.Inactive then
            local v32 = v30:UpdateShake(p25)
            v26 = v26 + v32 * v30.PositionInfluence
            v27 = v27 + v32 * v30.RotationInfluence
        end
    end
    for v33 = #p24._removeInstances, 1, -1 do
        table.remove(v28, p24._removeInstances[v33])
        p24._removeInstances[v33] = nil
    end
    return u21(v26) * u22(0, u23(v27.Y), 0) * u22(u23(v27.X), 0, (u23(v27.Z)))
end
function u1.Shake(p34, p35) --[[ Line: 75 ]]
    local v36
    if type(p35) == "table" then
        v36 = p35._camShakeInstance
    else
        v36 = false
    end
    assert(v36, "ShakeInstance must be of type CameraShakeInstance")
    p34._camShakeInstances[#p34._camShakeInstances + 1] = p35
    return p35
end
function u1.ShakeSustain(p37, p38) --[[ Line: 84 ]]
    local v39
    if type(p38) == "table" then
        v39 = p38._camShakeInstance
    else
        v39 = false
    end
    assert(v39, "ShakeInstance must be of type CameraShakeInstance")
    p37._camShakeInstances[#p37._camShakeInstances + 1] = p38
    p38:StartFadeIn(p38.fadeInDuration)
    return p38
end
function u1.ShakeOnce(p40, p41, p42, p43, p44, p45, p46) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v47 = u2.new(p41, p42, p43, p44)
    v47.PositionInfluence = typeof(p45) == "Vector3" and p45 and p45 or Vector3.new(0.15, 0.15, 0.15)
    v47.RotationInfluence = typeof(p46) == "Vector3" and p46 and p46 or Vector3.new(1, 1, 1)
    p40._camShakeInstances[#p40._camShakeInstances + 1] = v47
    return v47
end
function u1.StartShake(p48, p49, p50, p51, p52, p53) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v54 = u2.new(p49, p50, p51)
    v54.PositionInfluence = typeof(p52) == "Vector3" and p52 and p52 or Vector3.new(0.15, 0.15, 0.15)
    v54.RotationInfluence = typeof(p53) == "Vector3" and p53 and p53 or Vector3.new(1, 1, 1)
    v54:StartFadeIn(p51)
    p48._camShakeInstances[#p48._camShakeInstances + 1] = v54
    return v54
end
return u1