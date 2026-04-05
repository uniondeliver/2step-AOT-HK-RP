-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local u2 = {}
u2.__index = u2
local u3 = {
    [Enum.HumanoidStateType.Running] = true,
    [Enum.HumanoidStateType.RunningNoPhysics] = true,
    [Enum.HumanoidStateType.Jumping] = true,
    [Enum.HumanoidStateType.Freefall] = true,
    [Enum.HumanoidStateType.FallingDown] = true,
    [Enum.HumanoidStateType.Climbing] = true,
    [Enum.HumanoidStateType.Swimming] = true,
    [Enum.HumanoidStateType.Ragdoll] = true,
    [Enum.HumanoidStateType.GettingUp] = true,
    [Enum.HumanoidStateType.Dead] = true
}
local u4 = {
    [Enum.HumanoidStateType.Dead] = true,
    [Enum.HumanoidStateType.Ragdoll] = true,
    [Enum.HumanoidStateType.Swimming] = true,
    [Enum.HumanoidStateType.Freefall] = true,
    [Enum.HumanoidStateType.Jumping] = true
}
local u5 = Enum.AnimationPriority.Action4
function u2.new() --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    local v6 = u2
    local v7 = setmetatable({}, v6)
    v7.player = u1.LocalPlayer
    v7.character = nil
    v7.humanoid = nil
    v7.animator = nil
    v7.currentTrack = nil
    v7.currentEmote = nil
    v7.isPlaying = false
    v7.connections = {}
    v7.onEmoteStarted = nil
    v7.onEmoteStopped = nil
    v7.animationCache = {}
    v7:_setupCharacter()
    v7:_setupRespawnHandler()
    return v7
end
function u2._setupCharacter(p8) --[[ Line: 72 ]]
    p8.character = p8.player.Character or p8.player.CharacterAdded:Wait()
    p8.humanoid = p8.character:WaitForChild("Humanoid")
    p8.animator = p8.humanoid:WaitForChild("Animator")
    p8.animationCache = {}
    p8:_setupMovementDetection()
end
function u2._setupRespawnHandler(u9) --[[ Line: 82 ]]
    u9.player.CharacterAdded:Connect(function(p10) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:StopEmote("respawn")
        u9:_cleanupConnections()
        u9.character = p10
        u9.humanoid = p10:WaitForChild("Humanoid")
        u9.animator = u9.humanoid:WaitForChild("Animator")
        u9.animationCache = {}
        u9:_setupMovementDetection()
    end)
end
function u2._isCurrentEmoteMovable(p11) --[[ Line: 96 ]]
    local v12 = p11.currentEmote
    if v12 then
        v12 = p11.currentEmote.Movable == true
    end
    return v12
end
function u2._setupMovementDetection(u13) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    u13:_cleanupConnections()
    local v17 = u13.humanoid.StateChanged:Connect(function(_, p14) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u4
            [3] = u3
        --]]
        if u13.isPlaying then
            if u13:_isCurrentEmoteMovable() then
                if u4[p14] then
                    u13:StopEmote("movement")
                    return
                end
            else
                local v15 = u3[p14] and u13.character:FindFirstChild("HumanoidRootPart")
                if v15 then
                    local v16 = v15.AssemblyLinearVelocity
                    if Vector2.new(v16.X, v16.Z).Magnitude > 0.5 or (p14 == Enum.HumanoidStateType.Jumping or (p14 == Enum.HumanoidStateType.Freefall or p14 == Enum.HumanoidStateType.Dead)) then
                        u13:StopEmote("movement")
                    end
                end
            end
        end
    end)
    local v18 = u13.connections
    table.insert(v18, v17)
    local v19 = u13.humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if u13.isPlaying then
            if not u13:_isCurrentEmoteMovable() then
                if u13.humanoid.MoveDirection.Magnitude > 0.1 then
                    u13:StopEmote("movement")
                end
            end
        else
            return
        end
    end)
    local v20 = u13.connections
    table.insert(v20, v19)
    local v21 = u13.humanoid:GetPropertyChangedSignal("Jump"):Connect(function() --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if u13.isPlaying and u13.humanoid.Jump then
            u13:StopEmote("jump")
        end
    end)
    local v22 = u13.connections
    table.insert(v22, v21)
end
function u2._cleanupConnections(p23) --[[ Line: 153 ]]
    for _, v24 in ipairs(p23.connections) do
        if v24.Connected then
            v24:Disconnect()
        end
    end
    p23.connections = {}
end
function u2._getOrCreateAnimation(p25, p26) --[[ Line: 166 ]]
    local v27 = p26.AnimationId
    if p25.animationCache[v27] then
        return p25.animationCache[v27]
    end
    local v28 = Instance.new("Animation")
    v28.AnimationId = p26.AnimationId
    v28.Name = "Emote_" .. p26.Name
    p25.animationCache[v27] = v28
    return v28
end
function u2.PlayEmote(u29, p30) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if not u29.animator then
        return false
    end
    if not (p30 and p30.AnimationId) then
        return false
    end
    if u29.isPlaying then
        u29:StopEmote("new_emote")
    end
    local u31 = u29:_getOrCreateAnimation(p30)
    local v32, u33 = pcall(function() --[[ Line: 196 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u31
        --]]
        return u29.animator:LoadAnimation(u31)
    end)
    if not (v32 and u33) then
        return false
    end
    u33.Priority = u5
    u33.Looped = p30.Looped or false
    u33:Play(0.2)
    u29.currentTrack = u33
    u29.currentEmote = p30
    u29.isPlaying = true
    if u29.onEmoteStarted then
        u29.onEmoteStarted(p30.Name)
    end
    if not p30.Looped then
        u33.Stopped:Once(function() --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u33
            --]]
            if u29.currentTrack == u33 then
                u29:_onEmoteFinished("completed")
            end
        end)
    end
    return true
end
function u2.StopEmote(p34, p35) --[[ Line: 228 ]]
    if p34.isPlaying and p34.currentTrack then
        local v36 = p34.currentEmote and (p34.currentEmote.Name or "unknown") or "unknown"
        p34.currentTrack:Stop(0.2)
        p34.currentTrack = nil
        p34.currentEmote = nil
        p34.isPlaying = false
        if p34.onEmoteStopped then
            p34.onEmoteStopped(v36, p35 or "manual")
        end
    end
end
function u2._onEmoteFinished(p37, p38) --[[ Line: 246 ]]
    if p37.isPlaying then
        local v39 = p37.currentEmote and (p37.currentEmote.Name or "unknown") or "unknown"
        p37.currentTrack = nil
        p37.currentEmote = nil
        p37.isPlaying = false
        if p37.onEmoteStopped then
            p37.onEmoteStopped(v39, p38)
        end
    end
end
function u2.IsPlaying(p40) --[[ Line: 264 ]]
    return p40.isPlaying
end
function u2.GetCurrentEmote(p41) --[[ Line: 268 ]]
    return p41.currentEmote
end
function u2.SetCallbacks(p42, p43, p44) --[[ Line: 272 ]]
    p42.onEmoteStarted = p43
    p42.onEmoteStopped = p44
end
function u2.Destroy(p45) --[[ Line: 277 ]]
    p45:StopEmote("destroy")
    p45:_cleanupConnections()
    p45.animationCache = {}
end
return u2