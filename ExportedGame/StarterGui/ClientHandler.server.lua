-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game.Players.LocalPlayer
local u2 = u1:GetMouse()
game.ReplicatedStorage:WaitForChild("ServerEvents")
local v3 = game.ReplicatedStorage:WaitForChild("ClientEvents")
local u4 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local u5 = script.Parent:WaitForChild("MainGui")
local v6 = game:GetService("RunService")
local u7 = game:GetService("UserInputService")
u5.Ammo.Text = ""
u5.FakeC.Visible = false
repeat
    wait()
until workspace:FindFirstChild(u1.Name)
u7.MouseIconEnabled = true
u1.PlayerGui:SetTopbarTransparency(0)
TweenService = game:GetService("TweenService")
v6.Heartbeat:Connect(function() --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u7
        [3] = u5
        [4] = u2
    --]]
    local v8 = u1.Character
    if v8 then
        local v9 = false
        for _, v10 in pairs(v8:GetChildren()) do
            if v10:IsA("Tool") and v10:FindFirstChild("Ammo") then
                v9 = true
            end
        end
        if v9 then
            u7.MouseIconEnabled = false
            u5.FakeC.Visible = true
            u5.FakeC.Position = UDim2.new(0, u2.X - u5.FakeC.Size.X.Offset / 2, 0, u2.Y - u5.FakeC.Size.Y.Offset / 2)
            return
        end
        u7.MouseIconEnabled = true
        u5.FakeC.Visible = false
    end
end)
u1.Character.ChildAdded:connect(function(p11) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if (p11:IsA("Tool") or p11:IsA("HopperBin")) and (p11:FindFirstChild("Ammo") and p11:FindFirstChild("AmmoLeft")) then
        p11.Ammo.Changed:connect(function(_) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            u5.Ammo.Text = ""
        end)
        p11.AmmoLeft.Changed:connect(function(_) --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            u5.Ammo.Text = ""
        end)
    end
end)
u1.Character.ChildRemoved:connect(function(p12) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if (p12:IsA("Tool") or p12:IsA("HopperBin")) and (p12:FindFirstChild("Ammo") and p12:FindFirstChild("AmmoLeft")) then
        u5.Ammo.Text = ""
    end
end)
u2.Move:connect(function() --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
        [3] = u5
    --]]
    if u2.Target then
        if game.Players:FindFirstChild(u2.Target.Parent.Name) and u2.Target.Parent.Name ~= u1.Name then
            if game.Players[u2.Target.Parent.Name].TeamColor == u1.TeamColor then
                u5.FakeC.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            else
                u5.FakeC.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        if game.Players:FindFirstChild(u2.Target.Parent.Parent.Name) and u2.Target.Parent.Parent.Name ~= u1.Name then
            if game.Players[u2.Target.Parent.Parent.Name].TeamColor == u1.TeamColor then
                u5.FakeC.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            else
                u5.FakeC.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        if u2.Target.Parent:FindFirstChild("HumanoidLink") and u2.Target.Parent.HumanoidLink.Value.Parent.Name ~= u1.Name then
            if game.Players[u2.Target.Parent.HumanoidLink.Value.Parent.Name].TeamColor == u1.TeamColor then
                u5.FakeC.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            else
                u5.FakeC.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        u5.FakeC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end
end)
u7.InputBegan:connect(function(p13) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
    --]]
    if p13.UserInputType == Enum.UserInputType.MouseButton3 then
        if script.Parent.MainGui.FakeC.Size == UDim2.new(0, 4, 0, 4) then
            script.Parent.MainGui.FakeC.Size = UDim2.new(0, 2, 0, 2)
        else
            script.Parent.MainGui.FakeC.Size = UDim2.new(0, 4, 0, 4)
        end
        u5.FakeC.Position = UDim2.new(0, u2.x - u5.FakeC.Size.X.Offset / 2, 0, u2.y - u5.FakeC.Size.Y.Offset / 2)
    end
end)
v3.PlaySound.OnClientEvent:connect(function(p14, p15) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p14 then
        if p15 then
            if u1.Character == p15 then
                return
            end
        elseif p14:IsDescendantOf(u1.Character) then
            return
        end
        local v16 = Instance.new("Sound", p14.Parent)
        v16.SoundId = p14.SoundId
        v16.PlaybackSpeed = p14.PlaybackSpeed
        v16.Volume = p14.Volume
        v16.Name = p14.Name .. "Playing"
        v16:Play()
        game:GetService("Debris"):AddItem(v16, p14.TimeLength)
    end
end)
v3.StopSound.OnClientEvent:connect(function(p17, p18) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p17 then
        if p18 then
            if u1.Character == p18 then
                return
            end
        elseif p17:IsDescendantOf(u1.Character) then
            return
        end
        local v19 = p17.Parent:FindFirstChild(p17.Name .. "Playing")
        if v19 then
            v19:Destroy()
        end
    end
end)
v3.Aglin.OnClientEvent:connect(function(p20, p21, p22, p23, p24, p25) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
    --]]
    if p20 == u1.Character then
        return
    else
        local v26 = p20.Torso.Neck
        local v27 = p20.Tilt.Mtiltweld
        local v28 = p20.FakeHead.FakeNeck
        if p25 then
            if not p24 then
                TweenService:Create(v26, TweenInfo.new(p23), {
                    ["C0"] = u4 * CFrame.Angles(0, 0, p22[3])
                }):Play()
            end
            TweenService:Create(v28, TweenInfo.new(p23), {
                ["C0"] = u4 * CFrame.Angles(0, 0, 0)
            }):Play()
            TweenService:Create(v27, TweenInfo.new(p23), {
                ["C0"] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
            }):Play()
        else
            if not p24 then
                TweenService:Create(v26, TweenInfo.new(p23), {
                    ["C0"] = u4 * CFrame.Angles(p22[1], p22[2], p22[3])
                }):Play()
            end
            TweenService:Create(v28, TweenInfo.new(p23), {
                ["C0"] = u4 * CFrame.Angles(0, 0, 0)
            }):Play()
            TweenService:Create(v27, TweenInfo.new(p23), {
                ["C0"] = CFrame.new(0, 0, 0) * CFrame.Angles(p21, 0, 0)
            }):Play()
        end
    end
end)
v3.AnimateT.OnClientEvent:connect(function(p29, p30, p31, p32) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p29:IsDescendantOf(u1.Character) then
        return
    elseif p32 then
        TweenService:Create(p29, TweenInfo.new(p31), p32):Play()
    else
        TweenService:Create(p29, TweenInfo.new(p31), {
            ["C1"] = p30
        }):Play()
    end
end)
v3.AnimateFE.OnClientEvent:connect(function(p33, p34, p35, p36, p37, p38, p39) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
    --]]
    if p38 ~= u1.Character then
        TweenService:Create(p38.Torso.Neck, TweenInfo.new(p34), {
            ["C0"] = u4 * CFrame.Angles(p35, p36, p37)
        }):Play()
        TweenService:Create(p38.Torso.Mweld1, TweenInfo.new(p34), {
            ["C1"] = p33[1] * CFrame.new(0, p39, 0)
        }):Play()
        TweenService:Create(p38.Torso.Mweld2, TweenInfo.new(p34), {
            ["C1"] = p33[2] * CFrame.new(0, p39, 0)
        }):Play()
        if p33[3] then
            TweenService:Create(p38["Right Arm"].Mweld3, TweenInfo.new(p34), {
                ["C1"] = p33[3] * CFrame.new(0, p39, 0)
            }):Play()
        end
        TweenService:Create(p38.HumanoidRootPart.Mtweld, TweenInfo.new(p34), {
            ["C1"] = p33[4] * CFrame.new(0, p39, 0)
        }):Play()
    end
end)