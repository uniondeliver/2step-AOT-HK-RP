-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = v1.LocalPlayer
local u4 = require(script.CameraModule)
local u5 = require(script.AnimationModule)
local v6 = require(script.InputModule)
local u7 = require(script.InterfaceModule)
local u8 = require(script.GrabClient)
local u9 = require(script.AttackGrabClient)
local u10 = require(script.BeastGrabClient)
local u11 = require(script.ThoughtsModule)
local u12 = require(script.EffectsModule)
local u13 = require(script.SoundPlayer)
local u14 = v2:WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("ShifterRemotes"):WaitForChild("ShifterMain")
local u15 = v2:WaitForChild("Assets")
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = v6.new(u14, u11)
local function u32(p21) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u4
        [3] = u17
        [4] = u5
        [5] = u18
        [6] = u7
        [7] = u19
        [8] = u9
        [9] = u14
        [10] = u10
        [11] = u8
        [12] = u20
        [13] = u15
        [14] = u3
    --]]
    u16 = p21
    local u22 = p21.Model
    local v23 = u22:WaitForChild("Head")
    local v24 = u22:FindFirstChildOfClass("Humanoid")
    local v25 = u22:WaitForChild("HumanoidRootPart")
    if v24 then
        v24.AutomaticScalingEnabled = false
        local v26 = v25:FindFirstChild("RootJoint") or u22:FindFirstChild("RootJoint", true)
        if v26 and v26:IsA("Motor6D") then
            v26.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.5707963267948966, 0, 3.141592653589793)
            v26.C1 = CFrame.new(0, 0, 0)
        end
    end
    workspace.CurrentCamera.CameraSubject = v23
    u4:Enable()
    if p21.CameraPresetOption then
        u4:SetActiveCameraSettings(p21.CameraPresetOption)
    end
    u17 = u5.new(p21, u4)
    u17:Bind()
    u18 = u7.new()
    u18:Display(p21)
    if p21.Type == "Attack" then
        u19 = u9.new(u14, p21, u17)
    elseif p21.Type == "Beast" then
        u19 = u10.new(u14, p21, u17)
    elseif p21.Type == "Jaw" or (p21.Type == "Wolf" or p21.Type == "Warhammer") then
        u19 = u8.new(u14, p21, u17)
    else
        u19 = u8.new(u14, p21, u17)
    end
    u20:BindShifter(p21, u17, u4, u18, u19)
    u22:GetAttributeChangedSignal("Blind"):Connect(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u15
            [3] = u3
        --]]
        if u22:GetAttribute("Blind") then
            local v27 = Instance.new("BlurEffect")
            v27.Name = "ShifterBlur"
            v27.Size = 10
            v27.Parent = game.Lighting
            local v28 = u15:FindFirstChild("Effects")
            if v28 then
                v28 = u15.Effects:FindFirstChild("ShifterBlind")
            end
            if v28 then
                v28:Clone().Parent = u3:WaitForChild("PlayerGui")
                return
            end
            local v29 = u3:WaitForChild("PlayerGui")
            if not v29:FindFirstChild("ShifterBlind") then
                local v30 = Instance.new("ScreenGui")
                v30.Name = "ShifterBlind"
                v30.ResetOnSpawn = false
                v30.DisplayOrder = 100
                v30.Parent = v29
                local v31 = Instance.new("Frame")
                v31.Size = UDim2.new(1, 0, 1, 0)
                v31.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                v31.BackgroundTransparency = 0.15
                v31.BorderSizePixel = 0
                v31.Parent = v30
            end
        end
    end)
end
local function u36() --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u4
        [3] = u3
        [4] = u17
        [5] = u18
        [6] = u19
        [7] = u20
    --]]
    u16 = nil
    u4:Disable()
    task.wait(0.5)
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    local v33 = u3.Character
    local v34 = v33 and v33:FindFirstChildWhichIsA("Humanoid")
    if v34 then
        workspace.CurrentCamera.CameraSubject = v34
    end
    if u17 then
        u17:Unbind()
        u17 = nil
    end
    if u18 then
        u18:Undisplay()
        u18 = nil
    end
    u19 = nil
    u20:UnbindShifter()
    if game.Lighting:FindFirstChild("ShifterBlur") then
        game.Lighting.ShifterBlur:Destroy()
    end
    local v35 = u3:FindFirstChild("PlayerGui")
    if v35 and v35:FindFirstChild("ShifterBlind") then
        v35.ShifterBlind:Destroy()
    end
    if v35 and v35:FindFirstChild("RageGui") then
        v35.RageGui:Destroy()
    end
end
u14.OnClientEvent:Connect(function(p37, ...) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u36
        [3] = u18
        [4] = u12
        [5] = u11
        [6] = u13
        [7] = u16
        [8] = u20
        [9] = u3
    --]]
    local v38 = { ... }
    if p37 == "Transform" then
        u32(v38[1])
        return
    elseif p37 == "Detransform" then
        u36()
    elseif p37 == "Health" then
        if u18 then
            u18:UpdateHealth(v38[1], v38[2])
            return
        end
    elseif p37 == "Energy" then
        if u18 then
            u18:UpdateEnergy(v38[1], v38[2])
            return
        end
    elseif p37 == "BlockStamina" then
        if u18 then
            u18:UpdateBlockStamina(v38[1], v38[2])
            return
        end
    else
        if p37 == "ShifterLightning" then
            u12:Lightning(v38[1])
            return
        end
        if p37 == "CameraShake" then
            u12:CameraShake(v38[1])
            return
        end
        if p37 == "NukeEffect" then
            u12:NukeEffect(v38[1], v38[2])
            return
        end
        if p37 == "Thought" then
            u11:MakeMessage({
                ["Text"] = v38[1],
                ["FadeIn"] = 0.5,
                ["Duration"] = 4
            })
            return
        end
        if p37 == "ShiftCount" then
            local v39 = v38[1]
            if v39 > 0 then
                u11:MakeMessage({
                    ["Text"] = "Il me reste " .. tostring(v39) .. " transformation(s).",
                    ["FadeIn"] = 0.5,
                    ["Duration"] = 3
                })
            else
                u11:MakeMessage({
                    ["Text"] = "Je suis \195\169puis\195\169, je ne peux plus me transformer.",
                    ["FadeIn"] = 0.5,
                    ["Duration"] = 3
                })
            end
        end
        if p37 == "PlaySound" then
            u13:Play(v38[1])
            return
        end
        if p37 == "PlayCritSound" then
            u13:PlayCrit(v38[1])
            return
        end
        if p37 == "BerserkerRage" then
            local v40 = v38[1]
            local v41 = v38[2]
            if u16 then
                if v40 then
                    u20:SetRageSpeedBonus(v41 or 0)
                    u11:MakeMessage({
                        ["Text"] = "RAGE ! [Vitesse et d\195\169g\195\162ts augment\195\169s]",
                        ["FadeIn"] = 0.2,
                        ["Duration"] = 3
                    })
                else
                    u20:SetRageSpeedBonus(0)
                end
            else
                return
            end
        end
        if p37 == "RageMeter" then
            local v42 = v38[1]
            local v43 = v38[2]
            local v44 = u3:FindFirstChild("PlayerGui")
            if not v44 then
                return
            end
            local v45 = v44:FindFirstChild("RageGui")
            if not v45 then
                v45 = Instance.new("ScreenGui")
                v45.Name = "RageGui"
                v45.ResetOnSpawn = false
                v45.DisplayOrder = 10
                v45.Parent = v44
                local v46 = Instance.new("Frame")
                v46.Name = "Background"
                v46.Size = UDim2.new(0, 220, 0, 22)
                v46.Position = UDim2.new(0.5, -110, 1, -80)
                v46.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                v46.BorderSizePixel = 0
                v46.Parent = v45
                local v47 = Instance.new("UICorner")
                v47.CornerRadius = UDim.new(0, 6)
                v47.Parent = v46
                local v48 = Instance.new("Frame")
                v48.Name = "Fill"
                v48.Size = UDim2.new(0, 0, 1, 0)
                v48.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
                v48.BorderSizePixel = 0
                v48.Parent = v46
                local v49 = Instance.new("UICorner")
                v49.CornerRadius = UDim.new(0, 6)
                v49.Parent = v48
                local v50 = Instance.new("TextLabel")
                v50.Name = "Label"
                v50.Size = UDim2.new(1, 0, 1, 0)
                v50.BackgroundTransparency = 1
                v50.Text = "RAGE"
                v50.TextColor3 = Color3.fromRGB(255, 255, 255)
                v50.TextScaled = true
                v50.Font = Enum.Font.GothamBold
                v50.Parent = v46
            end
            local v51 = v45.Background:FindFirstChild("Fill")
            if v51 then
                local v52
                if v43 > 0 then
                    local v53 = v42 / v43
                    v52 = math.clamp(v53, 0, 1) or 0
                else
                    v52 = 0
                end
                v51.Size = UDim2.new(v52, 0, 1, 0)
                local v54 = u16 and u16.Config
                if v54 then
                    v54 = u16.Config.BerserkerRage
                end
                if (v54 and v54.MinRageToActivate or 50) <= v42 then
                    v51.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
                    return
                end
                v51.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
            end
        end
    end
end)