-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
game:GetService("TweenService")
local v4 = v1.LocalPlayer
local u5 = v4:WaitForChild("PlayerGui")
local v6 = v4.UserId
for _, v7 in ipairs({
    3858421557,
    3572633228,
    1851495055,
    392755404,
    111821567,
    2415818550,
    11364337,
    1228991578,
    1515737540
}) do
    if v7 == v6 then
        v62 = true
        ::l4::
        if v62 then
            local u8 = v2:WaitForChild("OSTControl")
            local u9 = {
                {
                    ["name"] = "Musique 1",
                    ["soundId"] = "106841547132512"
                },
                {
                    ["name"] = "Musique 2",
                    ["soundId"] = "116626805044059"
                },
                {
                    ["name"] = "Musique 3",
                    ["soundId"] = "98200089787720"
                },
                {
                    ["name"] = "Musique 4",
                    ["soundId"] = "79150995852944"
                },
                {
                    ["name"] = "Musique 5",
                    ["soundId"] = "99258103340696"
                },
                {
                    ["name"] = "Musique 6",
                    ["soundId"] = "138512883702015"
                },
                {
                    ["name"] = "Musique 7",
                    ["soundId"] = "94848219083533"
                },
                {
                    ["name"] = "Musique 8",
                    ["soundId"] = "132804098113960"
                },
                {
                    ["name"] = "Musique 9",
                    ["soundId"] = "80686397989200"
                },
                {
                    ["name"] = "Musique 10",
                    ["soundId"] = "113558313928953"
                },
                {
                    ["name"] = "Musique 11",
                    ["soundId"] = "102163958243210"
                },
                {
                    ["name"] = "Musique 12",
                    ["soundId"] = "123852796283986"
                },
                {
                    ["name"] = "Musique 13",
                    ["soundId"] = "93245086628488"
                },
                {
                    ["name"] = "Musique 14",
                    ["soundId"] = "127497988957443"
                },
                {
                    ["name"] = "Musique 15",
                    ["soundId"] = "137785964723933"
                },
                {
                    ["name"] = "Musique 16",
                    ["soundId"] = "84676523671942"
                },
                {
                    ["name"] = "Musique 17",
                    ["soundId"] = "107631803368577"
                },
                {
                    ["name"] = "Musique 18",
                    ["soundId"] = "100261793928772"
                },
                {
                    ["name"] = "Musique 19",
                    ["soundId"] = "102974950847332"
                }
            }
            local u10 = false
            local u11 = false
            local u12 = 50
            local u13 = {
                ["Background"] = Color3.fromRGB(15, 15, 15),
                ["Secondary"] = Color3.fromRGB(20, 20, 20),
                ["Border"] = Color3.fromRGB(60, 60, 60),
                ["Text"] = Color3.fromRGB(230, 230, 230),
                ["TextDim"] = Color3.fromRGB(160, 160, 160)
            }
            local function v61() --[[ Line: 74 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u13
                    [3] = u3
                    [4] = u9
                    [5] = u8
                    [6] = u12
                    [7] = u10
                    [8] = u11
                --]]
                local v14 = Instance.new("ScreenGui")
                v14.Name = "OSTGui"
                v14.ResetOnSpawn = false
                v14.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                v14.Parent = u5
                local u15 = Instance.new("TextButton")
                u15.Name = "OpenButton"
                u15.Size = UDim2.new(0, 100, 0, 40)
                u15.Position = UDim2.new(1, -110, 0, 10)
                u15.Text = "OST"
                u15.Font = Enum.Font.Garamond
                u15.TextSize = 18
                u15.TextColor3 = u13.Text
                u15.BackgroundColor3 = u13.Secondary
                u15.BorderSizePixel = 1
                u15.BorderColor3 = u13.Border
                u15.AutoButtonColor = false
                u15.Parent = v14
                local v16 = Instance.new("TextLabel")
                v16.Size = UDim2.new(1, 0, 0, 10)
                v16.Position = UDim2.new(0, 0, 1, -10)
                v16.Text = "Press O"
                v16.Font = Enum.Font.Garamond
                v16.TextSize = 10
                v16.TextColor3 = u13.TextDim
                v16.BackgroundTransparency = 1
                v16.Parent = u15
                local u17 = Instance.new("Frame")
                u17.Name = "MainFrame"
                u17.Size = UDim2.new(0, 600, 0, 650)
                u17.Position = UDim2.new(0.5, -300, 0.5, -325)
                u17.BackgroundColor3 = u13.Background
                u17.BorderSizePixel = 1
                u17.BorderColor3 = u13.Border
                u17.Visible = false
                u17.Parent = v14
                local v18 = Instance.new("Frame")
                v18.Name = "Header"
                v18.Size = UDim2.new(1, 0, 0, 100)
                v18.BackgroundColor3 = u13.Background
                v18.BorderSizePixel = 0
                v18.Parent = u17
                local v19 = Instance.new("Frame")
                v19.Size = UDim2.new(1, 0, 0, 1)
                v19.Position = UDim2.new(0, 0, 1, 0)
                v19.BackgroundColor3 = u13.Border
                v19.BorderSizePixel = 0
                v19.Parent = v18
                local u20 = nil
                local u21 = nil
                local u22 = nil
                v18.InputBegan:Connect(function(u23) --[[ Line: 143 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u21
                        [3] = u22
                        [4] = u17
                    --]]
                    if u23.UserInputType == Enum.UserInputType.MouseButton1 then
                        u20 = true
                        u21 = u23.Position
                        u22 = u17.Position
                        u23.Changed:Connect(function() --[[ Line: 149 ]]
                            --[[
                            Upvalues:
                                [1] = u23
                                [2] = u20
                            --]]
                            if u23.UserInputState == Enum.UserInputState.End then
                                u20 = false
                            end
                        end)
                    end
                end)
                u3.InputChanged:Connect(function(p24) --[[ Line: 157 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u21
                        [3] = u17
                        [4] = u22
                    --]]
                    if p24.UserInputType == Enum.UserInputType.MouseMovement and u20 then
                        local v25 = p24.Position - u21
                        u17.Position = UDim2.new(u22.X.Scale, u22.X.Offset + v25.X, u22.Y.Scale, u22.Y.Offset + v25.Y)
                    end
                end)
                local v26 = Instance.new("TextLabel")
                v26.Size = UDim2.new(1, 0, 0, 40)
                v26.Position = UDim2.new(0, 0, 0, 20)
                v26.Text = "HUMANITY\'S KINGDOM"
                v26.Font = Enum.Font.Garamond
                v26.TextSize = 32
                v26.TextColor3 = u13.Text
                v26.BackgroundTransparency = 1
                v26.TextXAlignment = Enum.TextXAlignment.Center
                v26.Parent = v18
                local v27 = Instance.new("TextLabel")
                v27.Size = UDim2.new(1, 0, 0, 20)
                v27.Position = UDim2.new(0, 0, 0, 65)
                v27.Text = "Syst\195\168me de musique"
                v27.Font = Enum.Font.Garamond
                v27.TextSize = 16
                v27.TextColor3 = u13.TextDim
                v27.BackgroundTransparency = 1
                v27.TextXAlignment = Enum.TextXAlignment.Center
                v27.Parent = v18
                local u28 = Instance.new("TextButton")
                u28.Size = UDim2.new(0, 35, 0, 35)
                u28.Position = UDim2.new(1, -45, 0, 10)
                u28.Text = "\195\151"
                u28.Font = Enum.Font.Garamond
                u28.TextSize = 30
                u28.TextColor3 = u13.Text
                u28.BackgroundColor3 = u13.Secondary
                u28.BorderSizePixel = 1
                u28.BorderColor3 = u13.Border
                u28.AutoButtonColor = false
                u28.Parent = v18
                local u29 = Instance.new("ScrollingFrame")
                u29.Name = "ScrollFrame"
                u29.Size = UDim2.new(1, -40, 1, -230)
                u29.Position = UDim2.new(0, 20, 0, 110)
                u29.BackgroundTransparency = 1
                u29.BorderSizePixel = 0
                u29.ScrollBarThickness = 3
                u29.ScrollBarImageColor3 = u13.Border
                u29.Parent = u17
                local u30 = Instance.new("UIListLayout")
                u30.Padding = UDim.new(0, 12)
                u30.Parent = u29
                for _, u31 in ipairs(u9) do
                    local u32 = Instance.new("TextButton")
                    u32.Size = UDim2.new(1, -10, 0, 55)
                    u32.Text = ""
                    u32.BackgroundColor3 = u13.Secondary
                    u32.BorderSizePixel = 1
                    u32.BorderColor3 = u13.Border
                    u32.AutoButtonColor = false
                    u32.Parent = u29
                    local v33 = Instance.new("TextLabel")
                    v33.Size = UDim2.new(1, -30, 1, 0)
                    v33.Position = UDim2.new(0, 15, 0, 0)
                    v33.Text = u31.name
                    v33.Font = Enum.Font.Garamond
                    v33.TextSize = 20
                    v33.TextColor3 = u13.Text
                    v33.BackgroundTransparency = 1
                    v33.TextXAlignment = Enum.TextXAlignment.Center
                    v33.Parent = u32
                    u32.MouseEnter:Connect(function() --[[ Line: 233 ]]
                        --[[
                        Upvalues:
                            [1] = u32
                        --]]
                        u32.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    end)
                    u32.MouseLeave:Connect(function() --[[ Line: 237 ]]
                        --[[
                        Upvalues:
                            [1] = u32
                            [2] = u13
                        --]]
                        u32.BackgroundColor3 = u13.Secondary
                    end)
                    u32.MouseButton1Click:Connect(function() --[[ Line: 241 ]]
                        --[[
                        Upvalues:
                            [1] = u32
                            [2] = u13
                            [3] = u8
                            [4] = u31
                        --]]
                        u32.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        task.wait(0.2)
                        u32.BackgroundColor3 = u13.Secondary
                        u8:FireServer("Play", {
                            ["soundId"] = u31.soundId,
                            ["name"] = u31.name
                        })
                    end)
                end
                u29.CanvasSize = UDim2.new(0, 0, 0, u30.AbsoluteContentSize.Y + 10)
                u30:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 254 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                        [2] = u30
                    --]]
                    u29.CanvasSize = UDim2.new(0, 0, 0, u30.AbsoluteContentSize.Y + 10)
                end)
                local v34 = Instance.new("Frame")
                v34.Name = "PlayerFrame"
                v34.Size = UDim2.new(1, 0, 0, 110)
                v34.Position = UDim2.new(0, 0, 1, -110)
                v34.BackgroundColor3 = u13.Background
                v34.BorderSizePixel = 0
                v34.Parent = u17
                local v35 = Instance.new("Frame")
                v35.Size = UDim2.new(1, 0, 0, 1)
                v35.BackgroundColor3 = u13.Border
                v35.BorderSizePixel = 0
                v35.Parent = v34
                local v36 = Instance.new("TextLabel")
                v36.Size = UDim2.new(1, 0, 0, 14)
                v36.Position = UDim2.new(0, 0, 0, 12)
                v36.Text = "Lecture en cours"
                v36.Font = Enum.Font.Garamond
                v36.TextSize = 12
                v36.TextColor3 = u13.TextDim
                v36.BackgroundTransparency = 1
                v36.TextXAlignment = Enum.TextXAlignment.Center
                v36.Parent = v34
                local u37 = Instance.new("TextLabel")
                u37.Name = "CurrentLabel"
                u37.Size = UDim2.new(1, -40, 0, 28)
                u37.Position = UDim2.new(0, 20, 0, 30)
                u37.Text = "Aucune musique"
                u37.Font = Enum.Font.Garamond
                u37.TextSize = 22
                u37.TextColor3 = u13.Text
                u37.BackgroundTransparency = 1
                u37.TextXAlignment = Enum.TextXAlignment.Center
                u37.Parent = v34
                local v38 = Instance.new("Frame")
                v38.Size = UDim2.new(0, 150, 0, 40)
                v38.Position = UDim2.new(0.5, -75, 1, -50)
                v38.BackgroundTransparency = 1
                v38.Parent = v34
                local u39 = Instance.new("TextButton")
                u39.Name = "PlayPauseButton"
                u39.Size = UDim2.new(0, 45, 0, 40)
                u39.Position = UDim2.new(0, 0, 0, 0)
                u39.Text = "\226\150\182"
                u39.Font = Enum.Font.Garamond
                u39.TextSize = 20
                u39.TextColor3 = u13.Text
                u39.BackgroundColor3 = u13.Secondary
                u39.BorderSizePixel = 1
                u39.BorderColor3 = u13.Border
                u39.AutoButtonColor = false
                u39.Parent = v38
                local u40 = Instance.new("TextButton")
                u40.Name = "StopButton"
                u40.Size = UDim2.new(0, 45, 0, 40)
                u40.Position = UDim2.new(0, 52, 0, 0)
                u40.Text = "\226\150\160"
                u40.Font = Enum.Font.Garamond
                u40.TextSize = 18
                u40.TextColor3 = u13.Text
                u40.BackgroundColor3 = u13.Secondary
                u40.BorderSizePixel = 1
                u40.BorderColor3 = u13.Border
                u40.AutoButtonColor = false
                u40.Parent = v38
                local v41 = Instance.new("Frame")
                v41.Size = UDim2.new(0, 200, 0, 20)
                v41.Position = UDim2.new(1, -220, 1, -50)
                v41.BackgroundTransparency = 1
                v41.Parent = v34
                local u42 = Instance.new("TextLabel")
                u42.Name = "VolumeLabel"
                u42.Size = UDim2.new(0, 60, 1, 0)
                u42.Text = "Vol: 50%"
                u42.Font = Enum.Font.Garamond
                u42.TextSize = 13
                u42.TextColor3 = u13.TextDim
                u42.BackgroundTransparency = 1
                u42.TextXAlignment = Enum.TextXAlignment.Left
                u42.Parent = v41
                local u43 = Instance.new("Frame")
                u43.Name = "VolumeSlider"
                u43.Size = UDim2.new(0, 130, 0, 4)
                u43.Position = UDim2.new(0, 70, 0, 8)
                u43.BackgroundColor3 = u13.Secondary
                u43.BorderSizePixel = 1
                u43.BorderColor3 = u13.Border
                u43.Parent = v41
                local u44 = Instance.new("Frame")
                u44.Name = "Fill"
                u44.Size = UDim2.new(0.5, 0, 1, 0)
                u44.BackgroundColor3 = u13.Text
                u44.BorderSizePixel = 0
                u44.Parent = u43
                local v45 = Instance.new("TextButton")
                v45.Size = UDim2.new(1, 0, 0, 20)
                v45.Position = UDim2.new(0, 0, 0, -8)
                v45.Text = ""
                v45.BackgroundTransparency = 1
                v45.Parent = u43
                local function u48(p46) --[[ Line: 369 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u44
                        [3] = u42
                        [4] = u8
                    --]]
                    u12 = math.clamp(p46, 0, 100)
                    u44.Size = UDim2.new(u12 / 100, 0, 1, 0)
                    local v47 = u12
                    u42.Text = "Vol: " .. math.floor(v47) .. "%"
                    u8:FireServer("SetVolume", {
                        ["volume"] = u12 / 100
                    })
                end
                v45.MouseButton1Down:Connect(function() --[[ Line: 376 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u43
                        [3] = u48
                    --]]
                    local u51 = u3.InputChanged:Connect(function(p49) --[[ Line: 378 ]]
                        --[[
                        Upvalues:
                            [1] = u43
                            [2] = u48
                        --]]
                        if p49.UserInputType == Enum.UserInputType.MouseMovement then
                            local v50 = (p49.Position.X - u43.AbsolutePosition.X) / u43.AbsoluteSize.X * 100
                            u48((math.clamp(v50, 0, 100)))
                        end
                    end)
                    local u52 = nil
                    u52 = u3.InputEnded:Connect(function(p53) --[[ Line: 387 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                            [2] = u52
                        --]]
                        if p53.UserInputType == Enum.UserInputType.MouseButton1 then
                            u51:Disconnect()
                            u52:Disconnect()
                        end
                    end)
                end)
                v45.MouseButton1Click:Connect(function() --[[ Line: 395 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u43
                        [3] = u48
                    --]]
                    local v54 = (u3:GetMouseLocation().X - u43.AbsolutePosition.X) / u43.AbsoluteSize.X * 100
                    u48((math.clamp(v54, 0, 100)))
                end)
                u39.MouseEnter:Connect(function() --[[ Line: 402 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                    --]]
                    u39.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                end)
                u39.MouseLeave:Connect(function() --[[ Line: 405 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                        [2] = u13
                    --]]
                    u39.BackgroundColor3 = u13.Secondary
                end)
                u40.MouseEnter:Connect(function() --[[ Line: 409 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                    --]]
                    u40.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                end)
                u40.MouseLeave:Connect(function() --[[ Line: 412 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                        [2] = u13
                    --]]
                    u40.BackgroundColor3 = u13.Secondary
                end)
                u15.MouseEnter:Connect(function() --[[ Line: 416 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                    --]]
                    u15.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                end)
                u15.MouseLeave:Connect(function() --[[ Line: 419 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u13
                    --]]
                    u15.BackgroundColor3 = u13.Secondary
                end)
                u28.MouseEnter:Connect(function() --[[ Line: 423 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                end)
                u28.MouseLeave:Connect(function() --[[ Line: 426 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u13
                    --]]
                    u28.BackgroundColor3 = u13.Secondary
                end)
                local function v55() --[[ Line: 430 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u17
                    --]]
                    u10 = not u10
                    u17.Visible = u10
                end
                u15.MouseButton1Click:Connect(v55)
                u28.MouseButton1Click:Connect(v55)
                u39.MouseButton1Click:Connect(function() --[[ Line: 438 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u11
                        [3] = u39
                    --]]
                    u8:FireServer("Toggle")
                    u11 = not u11
                    u39.Text = u11 and "\226\143\184" or "\226\150\182"
                end)
                u40.MouseButton1Click:Connect(function() --[[ Line: 444 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u11
                        [3] = u39
                        [4] = u37
                    --]]
                    u8:FireServer("Stop")
                    u11 = false
                    u39.Text = "\226\150\182"
                    u37.Text = "Aucune musique"
                end)
                u3.InputBegan:Connect(function(p56, p57) --[[ Line: 451 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u17
                    --]]
                    if not p57 then
                        if p56.KeyCode == Enum.KeyCode.O then
                            u10 = not u10
                            u17.Visible = u10
                        end
                    end
                end)
                u8.OnClientEvent:Connect(function(p58, p59) --[[ Line: 458 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u11
                        [3] = u39
                        [4] = u12
                        [5] = u44
                        [6] = u42
                    --]]
                    if p58 == "UpdateOST" then
                        u37.Text = p59.name
                        u11 = true
                        u39.Text = "\226\143\184"
                        return
                    elseif p58 == "StopOST" then
                        u37.Text = "Aucune musique"
                        u11 = false
                        u39.Text = "\226\150\182"
                    elseif p58 == "VolumeChanged" then
                        u12 = p59.volume * 100
                        u44.Size = UDim2.new(p59.volume, 0, 1, 0)
                        local v60 = u12
                        u42.Text = "Vol: " .. math.floor(v60) .. "%"
                    end
                end)
            end
            task.wait(1)
            v61()
        end
    end
end
local v62 = false
goto l4