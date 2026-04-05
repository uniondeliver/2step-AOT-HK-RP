-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local u2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local u4 = require(v3:WaitForChild("Modules"):WaitForChild("EmotesConfig"))
local u5 = {}
u5.__index = u5
local u6 = u4.Colors
local u7 = u4.Settings
local u8 = TweenInfo.new(u7.OpenDuration, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u9 = TweenInfo.new(u7.CloseDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local u10 = TweenInfo.new(0.15, Enum.EasingStyle.Quad)
local u11 = TweenInfo.new(0.1, Enum.EasingStyle.Quad)
function u5.new() --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u1
    --]]
    local v12 = u5
    local v13 = setmetatable({}, v12)
    v13.player = u1.LocalPlayer
    v13.playerGui = v13.player:WaitForChild("PlayerGui")
    v13.isOpen = false
    v13.isAnimating = false
    v13.currentPlayingEmote = nil
    v13.targetSize = UDim2.new(0, 0, 0, 0)
    v13.gui = nil
    v13.mainFrame = nil
    v13.emoteButtons = {}
    v13.onEmoteSelected = nil
    v13:_createUI()
    return v13
end
function u5._createUI(p14) --[[ Line: 73 ]]
    local v15 = Instance.new("ScreenGui")
    v15.Name = "EmotesGUI"
    v15.ResetOnSpawn = false
    v15.IgnoreGuiInset = true
    v15.DisplayOrder = 100
    v15.Enabled = false
    v15.Parent = p14.playerGui
    p14.gui = v15
    local v16 = p14:_createMainFrame(v15)
    p14.mainFrame = v16
    p14:_createHeader(v16)
    p14:_createSeparator(v16, 65)
    p14:_generateEmoteButtons((p14:_createEmoteContainer(v16)))
    p14:_createFooter(v16)
    p14:_calculateTargetSize()
end
function u5._calculateTargetSize(p17) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    local v18 = #u4.Emotes
    if v18 == 0 then
        p17.targetSize = UDim2.new(0, 320, 0, 165)
    else
        local v19 = v18 / u7.GridColumns
        local v20 = math.ceil(v19)
        local v21 = u7.EmoteButtonSize + 25
        local v22 = u7.EmoteButtonPadding
        local v23 = v20 * v21 + (v20 - 1) * v22 + 30
        local v24 = 70 + math.min(v23, 280) + 35
        p17.targetSize = UDim2.new(0, 320, 0, v24)
    end
end
function u5._createMainFrame(_, p25) --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v26 = Instance.new("Frame")
    v26.Name = "MainFrame"
    v26.Size = UDim2.new(0, 0, 0, 0)
    v26.Position = UDim2.new(1, -20, 1, -20)
    v26.AnchorPoint = Vector2.new(1, 1)
    v26.BackgroundColor3 = u6.MainBg
    v26.BorderSizePixel = 0
    v26.ZIndex = 2
    v26.ClipsDescendants = true
    v26.Parent = p25
    local v27 = Instance.new("UICorner")
    v27.CornerRadius = UDim.new(0, 14)
    v27.Parent = v26
    local v28 = Instance.new("UIStroke")
    v28.Color = u6.StrokeColor
    v28.Thickness = 1.5
    v28.Transparency = 0.3
    v28.Parent = v26
    return v26
end
function u5._createHeader(u29, p30) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u10
    --]]
    local v31 = Instance.new("Frame")
    v31.Name = "Header"
    v31.Size = UDim2.new(1, 0, 0, 70)
    v31.Position = UDim2.new(0, 0, 0, 0)
    v31.BackgroundTransparency = 1
    v31.ZIndex = 3
    v31.Parent = p30
    local v32 = Instance.new("TextLabel")
    v32.Name = "Title"
    v32.Size = UDim2.new(1, -50, 0, 35)
    v32.Position = UDim2.new(0, 15, 0, 12)
    v32.BackgroundTransparency = 1
    v32.Text = "EMOTES"
    v32.Font = Enum.Font.Bodoni
    v32.TextSize = 32
    v32.TextColor3 = u6.TitleText
    v32.TextXAlignment = Enum.TextXAlignment.Left
    v32.ZIndex = 4
    v32.Parent = v31
    local v33 = Instance.new("TextLabel")
    v33.Name = "Subtitle"
    v33.Size = UDim2.new(1, -50, 0, 18)
    v33.Position = UDim2.new(0, 15, 0, 45)
    v33.BackgroundTransparency = 1
    v33.Text = "S\195\169lectionnez une animation"
    v33.Font = Enum.Font.SourceSansItalic
    v33.TextSize = 14
    v33.TextColor3 = u6.SubtitleText
    v33.TextXAlignment = Enum.TextXAlignment.Left
    v33.ZIndex = 4
    v33.Parent = v31
    local u34 = Instance.new("TextButton")
    u34.Name = "CloseButton"
    u34.Size = UDim2.new(0, 32, 0, 32)
    u34.Position = UDim2.new(1, -42, 0, 10)
    u34.BackgroundColor3 = u6.ButtonBg
    u34.Text = "\226\156\149"
    u34.Font = Enum.Font.GothamBold
    u34.TextSize = 16
    u34.TextColor3 = u6.SubtitleText
    u34.BorderSizePixel = 0
    u34.AutoButtonColor = false
    u34.ZIndex = 5
    u34.Parent = v31
    local v35 = Instance.new("UICorner")
    v35.CornerRadius = UDim.new(0, 6)
    v35.Parent = u34
    local v36 = Instance.new("UIStroke")
    v36.Color = u6.StrokeColor
    v36.Thickness = 1
    v36.Transparency = 0.5
    v36.Parent = u34
    u34.MouseEnter:Connect(function() --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u34
            [3] = u10
            [4] = u6
        --]]
        u2:Create(u34, u10, {
            ["BackgroundColor3"] = u6.ButtonHover,
            ["TextColor3"] = u6.TitleText
        }):Play()
    end)
    u34.MouseLeave:Connect(function() --[[ Line: 209 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u34
            [3] = u10
            [4] = u6
        --]]
        u2:Create(u34, u10, {
            ["BackgroundColor3"] = u6.ButtonBg,
            ["TextColor3"] = u6.SubtitleText
        }):Play()
    end)
    u34.Activated:Connect(function() --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:Close()
    end)
end
function u5._createSeparator(_, p37, p38) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v39 = Instance.new("Frame")
    v39.Name = "Separator"
    v39.Size = UDim2.new(0.9, 0, 0, 1)
    v39.Position = UDim2.new(0.05, 0, 0, p38)
    v39.BackgroundColor3 = u6.StrokeColor
    v39.BackgroundTransparency = 0.5
    v39.BorderSizePixel = 0
    v39.ZIndex = 3
    v39.Parent = p37
    local v40 = Instance.new("UIGradient")
    v40.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.15, 0),
        NumberSequenceKeypoint.new(0.85, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    v40.Parent = v39
end
function u5._createEmoteContainer(_, p41) --[[ Line: 242 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v42 = Instance.new("ScrollingFrame")
    v42.Name = "EmoteContainer"
    v42.Size = UDim2.new(1, -20, 1, -115)
    v42.Position = UDim2.new(0, 10, 0, 75)
    v42.BackgroundTransparency = 1
    v42.BorderSizePixel = 0
    v42.ScrollBarThickness = 4
    v42.ScrollBarImageColor3 = u6.StrokeColor
    v42.ScrollBarImageTransparency = 0.3
    v42.ZIndex = 3
    v42.CanvasSize = UDim2.new(0, 0, 0, 0)
    v42.AutomaticCanvasSize = Enum.AutomaticSize.Y
    v42.Parent = p41
    local v43 = Instance.new("UIGridLayout")
    v43.Name = "Grid"
    v43.CellSize = UDim2.new(0, u7.EmoteButtonSize, 0, u7.EmoteButtonSize + 25)
    v43.CellPadding = UDim2.new(0, u7.EmoteButtonPadding, 0, u7.EmoteButtonPadding)
    v43.SortOrder = Enum.SortOrder.LayoutOrder
    v43.HorizontalAlignment = Enum.HorizontalAlignment.Center
    v43.Parent = v42
    local v44 = Instance.new("UIPadding")
    v44.PaddingTop = UDim.new(0, 8)
    v44.PaddingBottom = UDim.new(0, 8)
    v44.Parent = v42
    return v42
end
function u5._generateEmoteButtons(p45, p46) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    p45.emoteButtons = {}
    for v47, v48 in ipairs(u4.Emotes) do
        local v49 = p45:_createEmoteButton(v48, v47)
        v49.Parent = p46
        p45.emoteButtons[v48.Name] = v49
    end
    if #u4.Emotes == 0 then
        local v50 = Instance.new("TextLabel")
        v50.Name = "EmptyLabel"
        v50.Size = UDim2.new(1, 0, 0, 40)
        v50.BackgroundTransparency = 1
        v50.Text = "Aucune emote disponible"
        v50.Font = Enum.Font.SourceSansItalic
        v50.TextSize = 14
        v50.TextColor3 = u6.SubtitleText
        v50.ZIndex = 4
        v50.Parent = p46
    end
end
function u5._createEmoteButton(u51, u52, p53) --[[ Line: 296 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u2
        [4] = u10
        [5] = u11
    --]]
    local v54 = Instance.new("Frame")
    v54.Name = "Emote_" .. u52.Name
    v54.Size = UDim2.new(0, u7.EmoteButtonSize, 0, u7.EmoteButtonSize + 25)
    v54.BackgroundTransparency = 1
    v54.LayoutOrder = p53
    v54.ZIndex = 4
    local u55 = Instance.new("TextButton")
    u55.Name = "Button"
    u55.Size = UDim2.new(0, u7.EmoteButtonSize, 0, u7.EmoteButtonSize)
    u55.Position = UDim2.new(0.5, 0, 0, 0)
    u55.AnchorPoint = Vector2.new(0.5, 0)
    u55.BackgroundColor3 = u6.ButtonBg
    u55.Text = ""
    u55.BorderSizePixel = 0
    u55.AutoButtonColor = false
    u55.ZIndex = 5
    u55.Parent = v54
    local v56 = Instance.new("UICorner")
    v56.CornerRadius = UDim.new(0, 10)
    v56.Parent = u55
    local u57 = Instance.new("UIStroke")
    u57.Name = "Stroke"
    u57.Color = u6.StrokeColor
    u57.Thickness = 1
    u57.Transparency = 0.4
    u57.Parent = u55
    local u58 = Instance.new("ImageLabel")
    u58.Name = "Icon"
    u58.Size = UDim2.new(0.55, 0, 0.55, 0)
    u58.Position = UDim2.new(0.5, 0, 0.5, 0)
    u58.AnchorPoint = Vector2.new(0.5, 0.5)
    u58.BackgroundTransparency = 1
    u58.Image = u52.Icon or "rbxassetid://6031075938"
    u58.ImageColor3 = u6.TitleText
    u58.ScaleType = Enum.ScaleType.Fit
    u58.ZIndex = 6
    u58.Parent = u55
    local v59 = Instance.new("Frame")
    v59.Name = "PlayingIndicator"
    v59.Size = UDim2.new(1, 4, 1, 4)
    v59.Position = UDim2.new(0.5, 0, 0.5, 0)
    v59.AnchorPoint = Vector2.new(0.5, 0.5)
    v59.BackgroundTransparency = 1
    v59.BorderSizePixel = 0
    v59.ZIndex = 4
    v59.Visible = false
    v59.Parent = u55
    local v60 = Instance.new("UICorner")
    v60.CornerRadius = UDim.new(0, 12)
    v60.Parent = v59
    local v61 = Instance.new("UIStroke")
    v61.Color = u6.PlayingGlow
    v61.Thickness = 2
    v61.Parent = v59
    local v62 = Instance.new("TextLabel")
    v62.Name = "NameLabel"
    v62.Size = UDim2.new(1, 0, 0, 20)
    v62.Position = UDim2.new(0, 0, 1, -20)
    v62.BackgroundTransparency = 1
    v62.Text = u52.DisplayName or u52.Name
    v62.Font = Enum.Font.GothamMedium
    v62.TextSize = 11
    v62.TextColor3 = u6.EmoteNameText
    v62.TextTruncate = Enum.TextTruncate.AtEnd
    v62.ZIndex = 5
    v62.Parent = v54
    if u52.Looped then
        local v63 = Instance.new("Frame")
        v63.Name = "LoopBadge"
        v63.Size = UDim2.new(0, 18, 0, 18)
        v63.Position = UDim2.new(1, -4, 0, -4)
        v63.AnchorPoint = Vector2.new(1, 0)
        v63.BackgroundColor3 = u6.AccentColor
        v63.ZIndex = 7
        v63.Parent = u55
        local v64 = Instance.new("UICorner")
        v64.CornerRadius = UDim.new(1, 0)
        v64.Parent = v63
        local v65 = Instance.new("TextLabel")
        v65.Size = UDim2.new(1, 0, 1, 0)
        v65.BackgroundTransparency = 1
        v65.Text = "\226\136\158"
        v65.Font = Enum.Font.GothamBold
        v65.TextSize = 11
        v65.TextColor3 = u6.TitleText
        v65.ZIndex = 8
        v65.Parent = v63
    end
    u55.MouseEnter:Connect(function() --[[ Line: 397 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u55
            [3] = u10
            [4] = u6
            [5] = u57
            [6] = u58
        --]]
        u2:Create(u55, u10, {
            ["BackgroundColor3"] = u6.ButtonHover
        }):Play()
        u2:Create(u57, u10, {
            ["Color"] = u6.StrokeHover,
            ["Transparency"] = 0.2
        }):Play()
        u2:Create(u58, u10, {
            ["Size"] = UDim2.new(0.6, 0, 0.6, 0)
        }):Play()
    end)
    u55.MouseLeave:Connect(function() --[[ Line: 410 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u55
            [3] = u10
            [4] = u6
            [5] = u57
            [6] = u58
        --]]
        u2:Create(u55, u10, {
            ["BackgroundColor3"] = u6.ButtonBg
        }):Play()
        u2:Create(u57, u10, {
            ["Color"] = u6.StrokeColor,
            ["Transparency"] = 0.4
        }):Play()
        u2:Create(u58, u10, {
            ["Size"] = UDim2.new(0.55, 0, 0.55, 0)
        }):Play()
    end)
    u55.Activated:Connect(function() --[[ Line: 423 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u55
            [3] = u11
            [4] = u6
            [5] = u58
            [6] = u10
            [7] = u51
            [8] = u52
        --]]
        u2:Create(u55, u11, {
            ["BackgroundColor3"] = u6.ButtonActive
        }):Play()
        u2:Create(u58, u11, {
            ["Size"] = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        task.delay(0.1, function() --[[ Line: 431 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u55
                [3] = u10
                [4] = u6
                [5] = u58
            --]]
            u2:Create(u55, u10, {
                ["BackgroundColor3"] = u6.ButtonHover
            }):Play()
            u2:Create(u58, u10, {
                ["Size"] = UDim2.new(0.55, 0, 0.55, 0)
            }):Play()
        end)
        if u51.onEmoteSelected then
            u51.onEmoteSelected(u52)
        end
    end)
    return v54
end
function u5._createFooter(_, p66) --[[ Line: 448 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v67 = Instance.new("Frame")
    v67.Name = "Footer"
    v67.Size = UDim2.new(1, 0, 0, 35)
    v67.Position = UDim2.new(0, 0, 1, -35)
    v67.BackgroundColor3 = u6.SectionBg
    v67.BackgroundTransparency = 0.5
    v67.BorderSizePixel = 0
    v67.ZIndex = 3
    v67.Parent = p66
    local v68 = Instance.new("TextLabel")
    v68.Name = "Hint"
    v68.Size = UDim2.new(1, -16, 1, 0)
    v68.Position = UDim2.new(0, 8, 0, 0)
    v68.BackgroundTransparency = 1
    v68.Text = "Bouger annule l\'emote"
    v68.Font = Enum.Font.SourceSans
    v68.TextSize = 12
    v68.TextColor3 = u6.SubtitleText
    v68.TextXAlignment = Enum.TextXAlignment.Center
    v68.ZIndex = 4
    v68.Parent = v67
end
function u5.Open(u69) --[[ Line: 477 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
    --]]
    if not (u69.isOpen or u69.isAnimating) then
        u69.isAnimating = true
        u69.gui.Enabled = true
        u69:_calculateTargetSize()
        u69.mainFrame.Size = UDim2.new(0, 0, 0, 0)
        local v70 = u2:Create(u69.mainFrame, u8, {
            ["Size"] = u69.targetSize
        })
        v70:Play()
        v70.Completed:Connect(function() --[[ Line: 492 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69.isAnimating = false
            u69.isOpen = true
        end)
    end
end
function u5.Close(u71) --[[ Line: 498 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
    --]]
    if u71.isOpen and not u71.isAnimating then
        u71.isAnimating = true
        local v72 = u2:Create(u71.mainFrame, u9, {
            ["Size"] = UDim2.new(0, 0, 0, 0)
        })
        v72:Play()
        v72.Completed:Connect(function() --[[ Line: 508 ]]
            --[[
            Upvalues:
                [1] = u71
            --]]
            u71.gui.Enabled = false
            u71.isAnimating = false
            u71.isOpen = false
        end)
    end
end
function u5.Toggle(p73) --[[ Line: 515 ]]
    if p73.isOpen then
        p73:Close()
    else
        p73:Open()
    end
end
function u5.SetEmotePlaying(p74, p75, p76) --[[ Line: 527 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if p74.currentPlayingEmote and p74.emoteButtons[p74.currentPlayingEmote] then
        local v77 = p74.emoteButtons[p74.currentPlayingEmote]:FindFirstChild("Button")
        local v78 = v77 and v77:FindFirstChild("PlayingIndicator")
        if v78 then
            v78.Visible = false
        end
    end
    if p76 and (p75 and p74.emoteButtons[p75]) then
        p74.currentPlayingEmote = p75
        local v79 = p74.emoteButtons[p75]:FindFirstChild("Button")
        local u80 = v79 and v79:FindFirstChild("PlayingIndicator")
        if u80 then
            u80.Visible = true
            local u81 = u80:FindFirstChild("UIStroke")
            if u81 then
                task.spawn(function() --[[ Line: 548 ]]
                    --[[
                    Upvalues:
                        [1] = u80
                        [2] = u2
                        [3] = u81
                    --]]
                    while u80.Visible do
                        local v82 = {
                            ["Transparency"] = 0.5
                        }
                        u2:Create(u81, TweenInfo.new(0.5), v82):Play()
                        task.wait(0.5)
                        if not u80.Visible then
                            break
                        end
                        local v83 = {
                            ["Transparency"] = 0
                        }
                        u2:Create(u81, TweenInfo.new(0.5), v83):Play()
                        task.wait(0.5)
                    end
                end)
                return
            end
        end
    else
        p74.currentPlayingEmote = nil
    end
end
function u5.IsOpen(p84) --[[ Line: 573 ]]
    return p84.isOpen
end
function u5.SetCallback(p85, p86) --[[ Line: 577 ]]
    p85.onEmoteSelected = p86
end
function u5.Destroy(p87) --[[ Line: 581 ]]
    if p87.gui then
        p87.gui:Destroy()
    end
end
return u5