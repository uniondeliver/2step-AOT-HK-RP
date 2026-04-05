-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
local u2 = debug.profilebegin
local u3 = debug.profileend
local v4 = Vector3.new
local u5 = CFrame.new
local u6 = CFrame.Angles
local u7 = math.rad
local u8 = v4()
local u9 = require(script.CameraShakeInstance)
local u10 = u9.CameraShakeState
u1.CameraShakeInstance = u9
u1.Presets = require(script.CameraShakePresets)
function u1.new(p11, p12) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u1
    --]]
    local v13 = type(p11) == "number"
    assert(v13, "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)")
    local v14 = type(p12) == "function"
    assert(v14, "Callback must be a function")
    local v15 = {
        ["_running"] = false,
        ["_renderName"] = "CameraShaker",
        ["_renderPriority"] = p11,
        ["_posAddShake"] = u8,
        ["_rotAddShake"] = u8,
        ["_camShakeInstances"] = {},
        ["_removeInstances"] = {},
        ["_callback"] = p12
    }
    local v16 = u1
    return setmetatable(v15, v16)
end
function u1.Start(u17) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    if not u17._running then
        u17._running = true
        local u18 = u17._callback
        game:GetService("RunService"):BindToRenderStep(u17._renderName, u17._renderPriority, function(p19) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u17
                [3] = u3
                [4] = u18
            --]]
            u2("CameraShakerUpdate")
            local v20 = u17:Update(p19)
            u3()
            u18(v20)
        end)
    end
end
function u1.Stop(p21) --[[ Line: 59 ]]
    if p21._running then
        game:GetService("RunService"):UnbindFromRenderStep(p21._renderName)
        p21._running = false
    end
end
function u1.StopSustained(p22, p23) --[[ Line: 66 ]]
    for _, v24 in pairs(p22._camShakeInstances) do
        if v24.fadeOutDuration == 0 then
            v24:StartFadeOut(p23 or v24.fadeInDuration)
        end
    end
end
function u1.Update(p25, p26) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u5
        [4] = u6
        [5] = u7
    --]]
    local v27 = u8
    local v28 = u8
    local v29 = p25._camShakeInstances
    for v30 = 1, #v29 do
        local v31 = v29[v30]
        local v32 = v31:GetState()
        if v32 == u10.Inactive and v31.DeleteOnInactive then
            p25._removeInstances[#p25._removeInstances + 1] = v30
        elseif v32 ~= u10.Inactive then
            local v33 = v31:UpdateShake(p26)
            v27 = v27 + v33 * v31.PositionInfluence
            v28 = v28 + v33 * v31.RotationInfluence
        end
    end
    for v34 = #p25._removeInstances, 1, -1 do
        local v35 = p25._removeInstances[v34]
        table.remove(v29, v35)
        p25._removeInstances[v34] = nil
    end
    return u5(v27) * u6(0, u7(v28.Y), 0) * u6(u7(v28.X), 0, (u7(v28.Z)))
end
function u1.Shake(p36, p37) --[[ Line: 111 ]]
    local v38
    if type(p37) == "table" then
        v38 = p37._camShakeInstance
    else
        v38 = false
    end
    assert(v38, "ShakeInstance must be of type CameraShakeInstance")
    p36._camShakeInstances[#p36._camShakeInstances + 1] = p37
    return p37
end
function u1.ShakeSustain(p39, p40) --[[ Line: 118 ]]
    local v41
    if type(p40) == "table" then
        v41 = p40._camShakeInstance
    else
        v41 = false
    end
    assert(v41, "ShakeInstance must be of type CameraShakeInstance")
    p39._camShakeInstances[#p39._camShakeInstances + 1] = p40
    p40:StartFadeIn(p40.fadeInDuration)
    return p40
end
function u1.ShakeOnce(p42, p43, p44, p45, p46, p47, p48) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v49 = u9.new(p43, p44, p45, p46)
    v49.PositionInfluence = typeof(p47) == "Vector3" and p47 and p47 or Vector3.new(0.15, 0.15, 0.15)
    v49.RotationInfluence = typeof(p48) == "Vector3" and p48 and p48 or Vector3.new(1, 1, 1)
    p42._camShakeInstances[#p42._camShakeInstances + 1] = v49
    return v49
end
function u1.StartShake(p50, p51, p52, p53, p54, p55) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v56 = u9.new(p51, p52, p53)
    v56.PositionInfluence = typeof(p54) == "Vector3" and p54 and p54 or Vector3.new(0.15, 0.15, 0.15)
    v56.RotationInfluence = typeof(p55) == "Vector3" and p55 and p55 or Vector3.new(1, 1, 1)
    v56:StartFadeIn(p53)
    p50._camShakeInstances[#p50._camShakeInstances + 1] = v56
    return v56
end
return u1