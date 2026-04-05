-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game:GetService("RunService")
local u3 = game:GetService("UserInputService")
local v4 = game:GetService("ReplicatedStorage")
local u5 = v1.LocalPlayer
local u6 = workspace.CurrentCamera
local v7 = v4:WaitForChild("Assets"):WaitForChild("Remotes")
local u8 = v7:WaitForChild("IsStaffRemote")
local v9 = false
for _ = 1, 10 do
    local v10, v11 = pcall(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        return u8:InvokeServer()
    end)
    if v10 then
        v9 = v11
        break
    end
    task.wait(1)
end
if v9 then
    print("[StaffControl] Staff confirm\195\169, chargement du syst\195\168me de contr\195\180le...")
    local v12 = v7:WaitForChild("StaffControlSync")
    local u13 = v7:WaitForChild("StaffControlRemote")
    local u14 = v7:WaitForChild("StaffMoveRemote")
    local u15 = v7:WaitForChild("StaffAttackRemote")
    print("[StaffControl] Tous les remotes trouv\195\169s, syst\195\168me pr\195\170t!")
    local u16 = {
        [Enum.KeyCode.One] = {
            ["attack"] = "Stomp",
            ["args"] = { "Left" }
        },
        [Enum.KeyCode.Two] = {
            ["attack"] = "Stomp",
            ["args"] = { "Right" }
        },
        [Enum.KeyCode.Three] = {
            ["attack"] = "Kick",
            ["args"] = { "Left" }
        },
        [Enum.KeyCode.Four] = {
            ["attack"] = "Kick",
            ["args"] = { "Right" }
        },
        [Enum.KeyCode.X] = {
            ["attack"] = "Predict",
            ["args"] = { "Left" }
        },
        [Enum.KeyCode.C] = {
            ["attack"] = "Predict",
            ["args"] = { "Right" }
        },
        [Enum.KeyCode.V] = {
            ["attack"] = "LowPredict",
            ["args"] = { "Left" }
        },
        [Enum.KeyCode.B] = {
            ["attack"] = "LowPredict",
            ["args"] = { "Right" }
        },
        [Enum.KeyCode.N] = {
            ["attack"] = "GroundGrab",
            ["args"] = { "Left" }
        },
        [Enum.KeyCode.J] = {
            ["attack"] = "GroundGrab",
            ["args"] = { "Right" }
        },
        [Enum.KeyCode.F] = {
            ["attack"] = "NapePredict",
            ["args"] = { "Left" }
        },
        [Enum.KeyCode.G] = {
            ["attack"] = "NapePredict",
            ["args"] = { "Right" }
        },
        [Enum.KeyCode.R] = {
            ["attack"] = "Punch",
            ["args"] = {}
        },
        [Enum.KeyCode.T] = {
            ["attack"] = "Dive",
            ["args"] = {}
        },
        [Enum.KeyCode.Y] = {
            ["attack"] = "Leap",
            ["args"] = {}
        }
    }
    local u17 = Enum.KeyCode.P
    local u18 = {
        ["Forward"] = Enum.KeyCode.W,
        ["Backward"] = Enum.KeyCode.S,
        ["Left"] = Enum.KeyCode.A,
        ["Right"] = Enum.KeyCode.D
    }
    local v19 = u5:WaitForChild("PlayerGui")
    local u20 = Instance.new("ScreenGui")
    u20.Name = "TitanControlHUD"
    u20.ResetOnSpawn = false
    u20.IgnoreGuiInset = true
    u20.DisplayOrder = 50
    u20.Enabled = false
    u20.Parent = v19
    local v21 = Instance.new("Frame")
    v21.Size = UDim2.new(0, 450, 0, 50)
    v21.Position = UDim2.new(0.5, -225, 1, -80)
    v21.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
    v21.BackgroundTransparency = 0.2
    v21.BorderSizePixel = 0
    v21.Parent = u20
    Instance.new("UICorner", v21).CornerRadius = UDim.new(0, 10)
    local v22 = Instance.new("UIStroke", v21)
    v22.Color = Color3.fromRGB(140, 140, 145)
    v22.Thickness = 1
    v22.Transparency = 0.5
    local u23 = Instance.new("TextLabel")
    u23.Size = UDim2.new(1, 0, 1, 0)
    u23.BackgroundTransparency = 1
    u23.Text = "Controle Titan | ZQSD: Bouger | P: Quitter"
    u23.TextColor3 = Color3.fromRGB(220, 220, 225)
    u23.TextSize = 16
    u23.Font = Enum.Font.Bodoni
    u23.Parent = v21
    local v24 = Instance.new("Frame")
    v24.Size = UDim2.new(0, 340, 0, 280)
    v24.Position = UDim2.new(0, 20, 1, -370)
    v24.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
    v24.BackgroundTransparency = 0.3
    v24.BorderSizePixel = 0
    v24.Parent = u20
    Instance.new("UICorner", v24).CornerRadius = UDim.new(0, 10)
    local v25 = Instance.new("UIStroke", v24)
    v25.Color = Color3.fromRGB(140, 140, 145)
    v25.Thickness = 1
    v25.Transparency = 0.5
    local v26 = Instance.new("TextLabel")
    v26.Size = UDim2.new(1, 0, 0, 25)
    v26.Position = UDim2.new(0, 0, 0, 5)
    v26.BackgroundTransparency = 1
    v26.Text = "ATTAQUES"
    v26.TextColor3 = Color3.fromRGB(220, 220, 225)
    v26.TextSize = 16
    v26.Font = Enum.Font.Bodoni
    v26.Parent = v24
    local u27 = nil
    local u28 = nil
    local u29 = nil
    local u30 = nil
    local u31 = nil
    local u32 = nil
    local u33 = false
    local u34 = nil
    local u35 = nil
    local u36 = nil
    for v37, v38 in ipairs({
        "1 - Stomp Gauche   | 2 - Stomp Droit",
        "3 - Kick Gauche    | 4 - Kick Droit",
        "X - Predict Gauche | C - Predict Droit",
        "V - LowPred Gauche | B - LowPred Droit",
        "N - GrGrab Gauche  | J - GrGrab Droit",
        "F - NapePred Gauche| G - NapePred Droit",
        "R - Punch",
        "T - Dive (Abnormal)",
        "Y - Leap (Crawler)",
        "",
        "ZQSD - Deplacement | Souris - Orientation",
        "P - Quitter le controle"
    }) do
        local v39 = Instance.new("TextLabel")
        v39.Size = UDim2.new(1, -20, 0, 16)
        v39.Position = UDim2.new(0, 10, 0, 25 + v37 * 17)
        v39.BackgroundTransparency = 1
        v39.Text = v38
        v39.TextColor3 = Color3.fromRGB(160, 160, 165)
        v39.TextSize = 12
        v39.Font = Enum.Font.SourceSans
        v39.TextXAlignment = Enum.TextXAlignment.Left
        v39.Parent = v24
    end
    local function u44(p40) --[[ Line: 191 ]]
        local v41 = workspace:FindFirstChild("AliveTitans")
        if not v41 then
            return nil
        end
        for _, v42 in pairs(v41:GetChildren()) do
            if v42:IsA("Model") then
                local v43 = v42:FindFirstChild("TitanID")
                if v43 and (v43:IsA("StringValue") and v43.Value == p40) then
                    return v42
                end
            end
        end
        return nil
    end
    local function u68(p45, p46) --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u44
            [3] = u29
            [4] = u34
            [5] = u30
            [6] = u31
            [7] = u6
            [8] = u35
            [9] = u32
            [10] = u5
            [11] = u27
            [12] = u20
            [13] = u23
            [14] = u28
            [15] = u2
            [16] = u3
            [17] = u18
            [18] = u14
            [19] = u36
            [20] = u17
            [21] = u13
            [22] = u16
            [23] = u15
        --]]
        if u33 then
            return
        end
        print("[StaffControl] D\195\169marrage du contr\195\180le du Titan:", p45)
        local v47 = nil
        for _ = 1, 20 do
            v47 = u44(p45)
            if v47 then
                break
            end
            task.wait(0.25)
        end
        if v47 then
            u33 = true
            u29 = p45
            u34 = v47
            u30 = p46
            u31 = u6.CameraSubject
            u35 = u6.CameraType
            u32 = u5.CameraMaxZoomDistance
            u27 = u5.CameraMinZoomDistance
            local v48 = 50 + (p46.HeightScale or 10) * 30
            u5.CameraMaxZoomDistance = math.clamp(v48, 50, 1000)
            u5.CameraMinZoomDistance = 10
            local v49 = v47:FindFirstChildWhichIsA("Humanoid")
            if v49 then
                u6.CameraSubject = v49
            end
            u6.CameraType = Enum.CameraType.Custom
            local v50 = u5.Character
            if v50 then
                for _, v51 in pairs(v50:GetDescendants()) do
                    if v51:IsA("BasePart") then
                        v51:SetAttribute("OriginalTransparency", v51.Transparency)
                        v51.Transparency = 1
                    elseif v51:IsA("Decal") or v51:IsA("Texture") then
                        v51:SetAttribute("OriginalTransparency", v51.Transparency)
                        v51.Transparency = 1
                    end
                end
            end
            u20.Enabled = true
            if p46 and p46.Type then
                u23.Text = "Controle: " .. p46.Type .. " | ZQSD: Bouger | Souris: Orienter | P: Quitter"
            end
            u28 = u2.Heartbeat:Connect(function() --[[ Line: 267 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u34
                    [3] = u6
                    [4] = u3
                    [5] = u18
                    [6] = u14
                --]]
                if u33 and (u34 and u34.Parent) then
                    local v52 = u34:FindFirstChild("HumanoidRootPart")
                    if v52 then
                        local v53 = Vector3.new(0, 0, 0)
                        local v54 = u6.CFrame
                        local v55 = v54.LookVector.X
                        local v56 = v54.LookVector.Z
                        local v57 = Vector3.new(v55, 0, v56).Unit
                        local v58 = v54.RightVector.X
                        local v59 = v54.RightVector.Z
                        local v60 = Vector3.new(v58, 0, v59).Unit
                        if u3:IsKeyDown(u18.Forward) then
                            v53 = v53 + v57
                        end
                        if u3:IsKeyDown(u18.Backward) then
                            v53 = v53 - v57
                        end
                        if u3:IsKeyDown(u18.Right) then
                            v53 = v53 + v60
                        end
                        if u3:IsKeyDown(u18.Left) then
                            v53 = v53 - v60
                        end
                        local v61
                        if v53.Magnitude > 0.1 then
                            v61 = v52.Position + v53.Unit * 200
                        else
                            v61 = v52.Position + v57 * 200
                        end
                        u14:FireServer(v53, v61)
                    end
                else
                    return
                end
            end)
            u36 = u3.InputBegan:Connect(function(p62, p63) --[[ Line: 304 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u17
                    [3] = u13
                    [4] = u16
                    [5] = u15
                --]]
                if p63 then
                    return
                elseif u33 then
                    if p62.KeyCode == u17 then
                        u13:FireServer("StopControl")
                    else
                        local v64 = u16[p62.KeyCode]
                        if v64 then
                            local v65 = u15
                            local v66 = v64.attack
                            local v67 = v64.args
                            v65:FireServer(v66, unpack(v67))
                        end
                    end
                else
                    return
                end
            end)
            print("[StaffControl] Contr\195\180le activ\195\169!")
        else
            warn("[StaffControl] Impossible de trouver le modele du Titan")
        end
    end
    local function u74() --[[ Line: 322 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u29
            [3] = u34
            [4] = u30
            [5] = u28
            [6] = u36
            [7] = u32
            [8] = u5
            [9] = u27
            [10] = u6
            [11] = u20
        --]]
        if u33 then
            print("[StaffControl] Arr\195\170t du contr\195\180le")
            u33 = false
            u29 = nil
            u34 = nil
            u30 = nil
            if u28 then
                u28:Disconnect()
                u28 = nil
            end
            if u36 then
                u36:Disconnect()
                u36 = nil
            end
            if u32 then
                u5.CameraMaxZoomDistance = u32
                u32 = nil
            end
            if u27 then
                u5.CameraMinZoomDistance = u27
                u27 = nil
            end
            local v69 = u5.Character
            if v69 then
                local v70 = v69:FindFirstChildWhichIsA("Humanoid")
                if v70 then
                    u6.CameraSubject = v70
                end
                for _, v71 in pairs(v69:GetDescendants()) do
                    if v71:IsA("BasePart") then
                        local v72 = v71:GetAttribute("OriginalTransparency")
                        if v72 ~= nil then
                            v71.Transparency = v72
                            v71:SetAttribute("OriginalTransparency", nil)
                        end
                    elseif v71:IsA("Decal") or v71:IsA("Texture") then
                        local v73 = v71:GetAttribute("OriginalTransparency")
                        if v73 ~= nil then
                            v71.Transparency = v73
                            v71:SetAttribute("OriginalTransparency", nil)
                        end
                    end
                end
            end
            u6.CameraType = Enum.CameraType.Custom
            u20.Enabled = false
        end
    end
    v12.OnClientEvent:Connect(function(p75, ...) --[[ Line: 382 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u74
        --]]
        print("[StaffControl] Re\195\167u du serveur:", p75)
        if p75 == "StartControl" then
            local u76, u77 = ...
            task.spawn(function() --[[ Line: 386 ]]
                --[[
                Upvalues:
                    [1] = u68
                    [2] = u76
                    [3] = u77
                --]]
                u68(u76, u77)
            end)
        elseif p75 == "StopControl" then
            u74()
        end
    end)
    u2.Heartbeat:Connect(function() --[[ Line: 394 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u34
            [3] = u74
        --]]
        if u33 then
            if not (u34 and u34.Parent) then
                u74()
            end
        end
    end)
end