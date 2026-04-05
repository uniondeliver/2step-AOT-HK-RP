-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

repeat
    wait()
until game.Players.LocalPlayer.Character
repeat
    wait()
until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
camera = game.Workspace.CurrentCamera
character = game.Players.LocalPlayer.Character
Z = 0
damping = character.Humanoid.WalkSpeed * 2
PI = 3.1415926
tck = PI / 2
running = false
strafing = false
character.Humanoid.Strafing:connect(function(p1) --[[ Line: 16 ]]
    strafing = p1
end)
character.Humanoid.Jumping:connect(function() --[[ Line: 20 ]]
    running = false
end)
character.Humanoid.Swimming:connect(function() --[[ Line: 24 ]]
    running = false
end)
character.Humanoid.Running:connect(function(p2) --[[ Line: 28 ]]
    if p2 > 0.5 then
        running = true
    else
        running = false
    end
end)
character.Humanoid.Changed:connect(function(p3) --[[ Line: 36 ]]
    if p3 == "WalkSpeed" then
        if character.Humanoid.WalkSpeed > 8 then
            damping = character.Humanoid.WalkSpeed * 2
            return
        end
        damping = character.Humanoid.WalkSpeed * 16
    end
end)
function mix(p4, p5, p6)
    return p5 + (p4 - p5) * p6
end
while true do
    game:GetService("RunService").RenderStepped:wait()
    fps = (camera.CoordinateFrame.p - character.Head.Position).Magnitude
    if fps < 0 then
        Z = 1
    else
        Z = 0
    end
    if running == true and strafing == false then
        tck = tck + character.Humanoid.WalkSpeed / 92
    else
        if tck > 0 and tck < PI / 2 then
            tck = mix(tck, PI / 2, 0.9)
        end
        if tck > PI / 2 and tck < PI then
            tck = mix(tck, PI / 2, 0.9)
        end
        if tck > PI and tck < PI * 1.5 then
            tck = mix(tck, PI * 1.5, 0.9)
        end
        if tck > PI * 1.5 and tck < PI * 2 then
            tck = mix(tck, PI * 1.5, 0.9)
        end
    end
    if tck >= PI * 2 then
        tck = 0
    end
    local v7 = camera
    local v8 = camera.CoordinateFrame
    local v9 = CFrame.new
    local v10 = tck
    local v11 = math.cos(v10) / damping
    local v12 = tck * 2
    local v13 = v8 * v9(v11, math.sin(v12) / (damping * 2), Z)
    local v14 = CFrame.Angles
    local v15 = tck - PI * 1.5
    v7.CoordinateFrame = v13 * v14(0, 0, math.sin(v15) / (damping * 20))
end