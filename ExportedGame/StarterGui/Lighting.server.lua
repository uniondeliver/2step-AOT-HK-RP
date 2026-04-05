-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

wait(2)
local u1 = game:GetService("TweenService")
local u2 = {
    ["Desert"] = {
        {
            0,
            5.8,
            Color3.fromRGB(96, 106, 130),
            Color3.fromRGB(52, 51, 81),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(6, 7, 15),
            2400,
            0,
            Color3.fromRGB(0, 0, 0)
        },
        {
            5.8,
            6.8,
            Color3.fromRGB(130, 96, 72),
            Color3.fromRGB(81, 81, 81),
            Color3.fromRGB(255, 129, 25),
            Color3.fromRGB(255, 129, 25),
            Color3.fromRGB(160, 214, 255),
            5500,
            1.5,
            Color3.fromRGB(199, 188, 166)
        },
        {
            7,
            8.4,
            Color3.fromRGB(121, 104, 89),
            Color3.fromRGB(81, 81, 81),
            Color3.fromRGB(255, 232, 193),
            Color3.fromRGB(255, 232, 187),
            Color3.fromRGB(160, 214, 255),
            100000,
            5,
            Color3.fromRGB(199, 188, 166)
        },
        {
            16.8,
            17.5,
            Color3.fromRGB(130, 96, 72),
            Color3.fromRGB(81, 81, 81),
            Color3.fromRGB(255, 129, 25),
            Color3.fromRGB(255, 129, 25),
            Color3.fromRGB(160, 214, 255),
            5500,
            1.81,
            Color3.fromRGB(199, 188, 166)
        },
        {
            17.6,
            18.5,
            Color3.fromRGB(96, 106, 130),
            Color3.fromRGB(52, 51, 81),
            Color3.fromRGB(16, 167, 0),
            Color3.fromRGB(0, 46, 255),
            Color3.fromRGB(43, 41, 65),
            2400,
            1,
            Color3.fromRGB(0, 0, 0)
        },
        {
            19,
            24,
            Color3.fromRGB(96, 106, 130),
            Color3.fromRGB(52, 51, 81),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(6, 7, 15),
            2400,
            0,
            Color3.fromRGB(0, 0, 0)
        }
    },
    ["Plains"] = {
        {
            0,
            5.8,
            Color3.fromRGB(4, 3, 9),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(4, 4, 6),
            2400,
            1
        },
        {
            5.8,
            6.8,
            Color3.fromRGB(25, 25, 60),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(255, 226, 0),
            Color3.fromRGB(0, 17, 255),
            Color3.fromRGB(76, 80, 55),
            2400,
            1
        },
        {
            7,
            8.4,
            Color3.fromRGB(216, 216, 216),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(251, 255, 174),
            Color3.fromRGB(98, 255, 70),
            Color3.fromRGB(212, 242, 255),
            2400,
            1
        },
        {
            16.8,
            17.5,
            Color3.fromRGB(114, 103, 127),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(255, 0, 4),
            Color3.fromRGB(0, 46, 255),
            Color3.fromRGB(191, 163, 145),
            2400,
            1
        },
        {
            17.6,
            18.5,
            Color3.fromRGB(17, 15, 38),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(16, 167, 0),
            Color3.fromRGB(0, 46, 255),
            Color3.fromRGB(43, 41, 65),
            2400,
            1
        },
        {
            19,
            24,
            Color3.fromRGB(4, 3, 9),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(4, 4, 6),
            2400,
            1
        }
    }
}
function SetTime(p3)
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    u1:Create(game.Lighting, TweenInfo.new(10), {
        ["OutdoorAmbient"] = u2[p3][3]
    }):Play()
    u1:Create(game.Lighting, TweenInfo.new(10), {
        ["Ambient"] = u2[p3][4]
    }):Play()
    u1:Create(game.Lighting, TweenInfo.new(10), {
        ["ColorShift_Top"] = u2[p3][5]
    }):Play()
    u1:Create(game.Lighting, TweenInfo.new(10), {
        ["ColorShift_Bottom"] = u2[p3][6]
    }):Play()
    u1:Create(game.Lighting, TweenInfo.new(2), {
        ["Brightness"] = u2[p3][9]
    }):Play()
end
game.ReplicatedStorage:WaitForChild("Mathf")
local u4 = require(game.ReplicatedStorage.Mathf)
local u5 = game.Lighting
function GetTimes()
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5.TimeOfDay
    local v7 = string.sub(v6, 1, 2)
    local v8 = tonumber(v7)
    local v9 = u5.TimeOfDay
    local v10 = string.sub(v9, 4, 5)
    local v11 = tonumber(v10)
    local v12 = u5.TimeOfDay
    local v13 = string.sub(v12, 7, 8)
    local v14 = tonumber(v13)
    return v8 + v11 / 60 + v14 / 60 / 60
end
local _ = u5.OutdoorAmbient
local u15 = u5.Ambient
function SetColors(p16)
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u1
        [4] = u15
    --]]
    local v17 = GetTimes()
    if p16 then
        local v18 = u2.Desert[1][3]
        local v19 = u2.Desert[1][4]
        local v20 = u2.Desert[1][5]
        local v21 = u2.Desert[1][6]
        local v22 = u2.Desert[1][7]
        local v23 = u2.Desert[1][8]
        local v24 = u2.Desert[1][9]
        local v25 = u2.Desert[1][10]
        for _, v26 in ipairs(u2.Desert) do
            if v26[1] <= v17 then
                local v27 = u4.PercentBetween(v17, v26[1], v26[2])
                v18 = u4.LerpColor3(v18, v26[3], v27)
                v19 = u4.LerpColor3(v19, v26[4], v27)
                v20 = u4.LerpColor3(v20, v26[5], v27)
                v21 = u4.LerpColor3(v21, v26[6], v27)
                v22 = u4.LerpColor3(v22, v26[7], v27)
                v23 = u4.Lerp(v23, v26[8], v27)
                v24 = u4.Lerp(v24, v26[9], v27)
                v25 = u4.LerpColor3(v25, v26[10], v27)
            end
        end
        game.Lighting.FogColor = v22
        game.Lighting.FogEnd = v23
        u1:Create(game.Lighting, TweenInfo.new(10), {
            ["Ambient"] = v19
        }):Play()
        u1:Create(game.Lighting, TweenInfo.new(4), {
            ["ColorShift_Top"] = v20
        }):Play()
        u1:Create(game.Lighting, TweenInfo.new(4), {
            ["ColorShift_Bottom"] = v21
        }):Play()
        local v28 = {
            ["Brightness"] = v24,
            ["OutdoorAmbient"] = v18,
            ["Ambient"] = u15
        }
        u1:Create(game.Lighting, TweenInfo.new(2), v28):Play()
    end
end
local u29 = true
local u30 = workspace:WaitForChild("Dynamic_Lights")
local u31 = false
function update()
    --[[
    Upvalues:
        [1] = u5
        [2] = u29
        [3] = u30
        [4] = u31
    --]]
    if u5:getMinutesAfterMidnight() >= 1140 then
        if u29 then
            u29 = false
        end
    elseif u5:getMinutesAfterMidnight() >= 390 and not u29 then
        u29 = true
    end
    if u30 and u31 then
        for _, v32 in pairs(u30:GetDescendants()) do
            if v32:IsA("BasePart") then
                local v33 = v32:FindFirstChildOfClass("PointLight")
                if u5:getMinutesAfterMidnight() >= 1080 then
                    v32.Material = Enum.Material.Neon
                    v32.Color = Color3.fromRGB(227, 162, 125)
                    if v33 then
                        v33.Enabled = true
                    end
                elseif u5:getMinutesAfterMidnight() >= 390 then
                    v32.Material = Enum.Material.Glass
                    v32.Color = Color3.fromRGB(55, 68, 83)
                    if v33 then
                        v33.Enabled = false
                    end
                end
            end
        end
    end
end
game:GetService("RunService").Heartbeat:connect(function() --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    if u31 == true then
        u31 = false
    elseif u31 == false then
        u31 = true
    end
    SetColors(true)
    update()
end)