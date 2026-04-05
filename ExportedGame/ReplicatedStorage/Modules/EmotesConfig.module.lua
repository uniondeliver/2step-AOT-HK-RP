-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u12 = {
    ["Settings"] = {
        ["ToggleKey"] = Enum.KeyCode.N,
        ["GridColumns"] = 3,
        ["EmoteButtonSize"] = 80,
        ["EmoteButtonPadding"] = 10,
        ["OpenDuration"] = 0.35,
        ["CloseDuration"] = 0.25
    },
    ["Colors"] = {
        ["MainBg"] = Color3.fromRGB(18, 18, 20),
        ["SectionBg"] = Color3.fromRGB(16, 16, 20),
        ["ButtonBg"] = Color3.fromRGB(25, 25, 30),
        ["ButtonHover"] = Color3.fromRGB(35, 35, 42),
        ["ButtonActive"] = Color3.fromRGB(45, 45, 55),
        ["TitleText"] = Color3.fromRGB(220, 220, 225),
        ["SubtitleText"] = Color3.fromRGB(140, 140, 145),
        ["EmoteNameText"] = Color3.fromRGB(200, 200, 205),
        ["StrokeColor"] = Color3.fromRGB(80, 80, 90),
        ["StrokeHover"] = Color3.fromRGB(120, 120, 130),
        ["AccentColor"] = Color3.fromRGB(100, 130, 180),
        ["PlayingGlow"] = Color3.fromRGB(80, 180, 120)
    },
    ["Emotes"] = {
        {
            ["Name"] = "Sit 1",
            ["AnimationId"] = "rbxassetid://100512661416782",
            ["Looped"] = true,
            ["Command"] = "/sit"
        },
        {
            ["Name"] = "Salut",
            ["AnimationId"] = "rbxassetid://93075188511823",
            ["Looped"] = true,
            ["Command"] = "/salute"
        },
        {
            ["Name"] = "Sit 2",
            ["AnimationId"] = "rbxassetid://110812750392396",
            ["Looped"] = true,
            ["Command"] = "/sit2"
        },
        {
            ["Name"] = "Lean",
            ["AnimationId"] = "rbxassetid://87145733024597",
            ["Looped"] = true,
            ["Command"] = "/lean"
        },
        {
            ["Name"] = "Repos",
            ["AnimationId"] = "rbxassetid://74045455163544",
            ["Looped"] = true,
            ["Command"] = "/repos",
            ["Movable"] = true
        },
        {
            ["Name"] = "Sit 3",
            ["AnimationId"] = "rbxassetid://128821210536871",
            ["Looped"] = true,
            ["Command"] = "/sit3"
        },
        {
            ["Name"] = "Oui",
            ["AnimationId"] = "rbxassetid://110978547272943",
            ["Looped"] = false,
            ["Command"] = "/oui",
            ["Movable"] = true
        },
        {
            ["Name"] = "Non",
            ["AnimationId"] = "rbxassetid://99291501875263",
            ["Looped"] = false,
            ["Command"] = "/non",
            ["Movable"] = true
        },
        {
            ["Name"] = "Ledge Sit",
            ["AnimationId"] = "rbxassetid://111715595699038",
            ["Looped"] = true,
            ["Command"] = "/ledgesit"
        },
        {
            ["Name"] = "Ledge Sit 2",
            ["AnimationId"] = "rbxassetid://85799523601966",
            ["Looped"] = true,
            ["Command"] = "/ledgesit2"
        },
        {
            ["Name"] = "Crouch",
            ["AnimationId"] = "rbxassetid://97985095089000",
            ["Looped"] = true,
            ["Command"] = "/Crouch"
        },
        {
            ["Name"] = "Lay",
            ["AnimationId"] = "rbxassetid://105478999632302",
            ["Looped"] = true,
            ["Command"] = "/lay"
        },
        {
            ["Name"] = "Think",
            ["AnimationId"] = "rbxassetid://73927230198596",
            ["Looped"] = true,
            ["Command"] = "/think",
            ["Movable"] = true
        },
        {
            ["Name"] = "Jerk",
            ["AnimationId"] = "rbxassetid://98302569679319",
            ["Looped"] = true,
            ["Command"] = "/jerk3",
            ["Movable"] = true
        },
        {
            ["Name"] = "Kneel",
            ["AnimationId"] = "rbxassetid://113967254324409",
            ["Looped"] = true,
            ["Command"] = "/kneel"
        },
        {
            ["Name"] = "Shake",
            ["AnimationId"] = "rbxassetid://134084141122488",
            ["Looped"] = true,
            ["Command"] = "/shake"
        },
        {
            ["Name"] = "Trauma",
            ["AnimationId"] = "rbxassetid://115735417475042",
            ["Looped"] = true,
            ["Command"] = "/trauma"
        },
        {
            ["Name"] = "Trauma 2",
            ["AnimationId"] = "rbxassetid://113600747909479",
            ["Looped"] = true,
            ["Command"] = "/trauma2"
        },
        {
            ["Name"] = "Chair Sit",
            ["AnimationId"] = "rbxassetid://135431810615867",
            ["Looped"] = true,
            ["Command"] = "/chairsit"
        },
        {
            ["Name"] = "Table Sit",
            ["AnimationId"] = "rbxassetid://135027553400711",
            ["Looped"] = true,
            ["Command"] = "/tablesit"
        },
        {
            ["Name"] = "Lean 2",
            ["AnimationId"] = "rbxassetid://134252974692804",
            ["Looped"] = true,
            ["Command"] = "/lean2"
        },
        {
            ["Name"] = "Table Sit 2",
            ["AnimationId"] = "rbxassetid://71604935403683",
            ["Looped"] = true,
            ["Command"] = "/tablesit2"
        },
        {
            ["Name"] = "Chair Sit 2",
            ["AnimationId"] = "rbxassetid://75601411028073",
            ["Looped"] = true,
            ["Command"] = "/chairsit2"
        },
        {
            ["Name"] = "Cross Arm",
            ["AnimationId"] = "rbxassetid://138715409462889",
            ["Looped"] = true,
            ["Command"] = "/crossarm",
            ["Movable"] = true
        },
        {
            ["Name"] = "Proud",
            ["AnimationId"] = "rbxassetid://116520465120910",
            ["Looped"] = true,
            ["Command"] = "/proud"
        },
        {
            ["Name"] = "Lay 2",
            ["AnimationId"] = "rbxassetid://88052939118289",
            ["Looped"] = true,
            ["Command"] = "/lay2"
        },
        {
            ["Name"] = "Lay 3",
            ["AnimationId"] = "rbxassetid://99170978371557",
            ["Looped"] = true,
            ["Command"] = "/lay3"
        },
        {
            ["Name"] = "Bored",
            ["AnimationId"] = "rbxassetid://102430987420168",
            ["Looped"] = true,
            ["Command"] = "/bored"
        },
        {
            ["Name"] = "Sheepish",
            ["AnimationId"] = "rbxassetid://74975514468558",
            ["Looped"] = true,
            ["Command"] = "/sheepish",
            ["Movable"] = true
        },
        {
            ["Name"] = "Ledge Lay",
            ["AnimationId"] = "rbxassetid://119279510764296",
            ["Looped"] = true,
            ["Command"] = "/ledgelay"
        },
        {
            ["Name"] = "Ledge Sit 3",
            ["AnimationId"] = "rbxassetid://139239245213425",
            ["Looped"] = true,
            ["Command"] = "/ledgesit3"
        },
        {
            ["Name"] = "Hug",
            ["AnimationId"] = "rbxassetid://76770454801697",
            ["Looped"] = true,
            ["Command"] = "/hug"
        },
        {
            ["Name"] = "Shy",
            ["AnimationId"] = "rbxassetid://84454464722924",
            ["Looped"] = true,
            ["Command"] = "/shy"
        },
        {
            ["Name"] = "Pushup",
            ["AnimationId"] = "rbxassetid://104822857570867",
            ["Looped"] = true,
            ["Command"] = "/pushup"
        },
        {
            ["Name"] = "Exhausted",
            ["AnimationId"] = "rbxassetid://94932305093433",
            ["Looped"] = true,
            ["Command"] = "/exhausted"
        },
        {
            ["Name"] = "End",
            ["AnimationId"] = "rbxassetid://0",
            ["Looped"] = true,
            ["Command"] = "/end"
        },
        {
            ["Name"] = "Bored 2",
            ["AnimationId"] = "rbxassetid://131308244045485",
            ["Looped"] = true,
            ["Command"] = "/bored2"
        },
        {
            ["Name"] = "Lean3",
            ["AnimationId"] = "rbxassetid://108272196240878",
            ["Looped"] = true,
            ["Command"] = "/lean3"
        },
        {
            ["Name"] = "Wallsit",
            ["AnimationId"] = "rbxassetid://104045474993733",
            ["Looped"] = true,
            ["Command"] = "/wallsit"
        },
        {
            ["Name"] = "Look Over",
            ["AnimationId"] = "rbxassetid://86034848399521",
            ["Looped"] = true,
            ["Command"] = "/lookover"
        },
        {
            ["Name"] = "Look Over 2",
            ["AnimationId"] = "rbxassetid://87260509974635",
            ["Looped"] = true,
            ["Command"] = "/lookover2"
        },
        {
            ["Name"] = "Point",
            ["AnimationId"] = "rbxassetid://126335873300210",
            ["Looped"] = true,
            ["Command"] = "/point",
            ["Movable"] = true
        },
        {
            ["Name"] = "Peak",
            ["AnimationId"] = "rbxassetid://139490017766329",
            ["Looped"] = true,
            ["Command"] = "/peak"
        },
        {
            ["Name"] = "",
            ["AnimationId"] = "rbxassetid://",
            ["Looped"] = true,
            ["Command"] = "/"
        }
    },
    ["GetEmoteByName"] = function(p1) --[[ Name: GetEmoteByName, Line 321 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        for _, v2 in ipairs(u12.Emotes) do
            if v2.Name == p1 then
                return v2
            end
        end
        return nil
    end,
    ["GetEmoteByCommand"] = function(p3) --[[ Name: GetEmoteByCommand, Line 330 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        for _, v4 in ipairs(u12.Emotes) do
            if v4.Command and v4.Command:lower() == p3:lower() then
                return v4
            end
        end
        return nil
    end,
    ["GetEmotesByCategory"] = function(p5) --[[ Name: GetEmotesByCategory, Line 339 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v6 = {}
        for _, v7 in ipairs(u12.Emotes) do
            if v7.Category == p5 then
                table.insert(v6, v7)
            end
        end
        return v6
    end,
    ["GetCategories"] = function() --[[ Name: GetCategories, Line 349 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v8 = {}
        local v9 = {}
        for _, v10 in ipairs(u12.Emotes) do
            if v10.Category and not v8[v10.Category] then
                v8[v10.Category] = true
                local v11 = v10.Category
                table.insert(v9, v11)
            end
        end
        return v9
    end
}
return u12