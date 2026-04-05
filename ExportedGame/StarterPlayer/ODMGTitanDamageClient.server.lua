-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("RunService")
local u4 = game:GetService("Workspace")
local u5 = v1.LocalPlayer
local v6 = v2:WaitForChild("Remotes"):WaitForChild("ODMG")
local u7 = v6:WaitForChild("SetAttackState")
local u8 = v6:WaitForChild("ReportTitanHit")
local u9 = u4:WaitForChild("AliveTitans")
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = false
local u16 = {}
local u17 = {
    ["Left"] = {},
    ["Right"] = {}
}
local u18 = false
local u19 = 0
local u20 = RaycastParams.new()
u20.FilterType = Enum.RaycastFilterType.Exclude
u20.IgnoreWater = true
local function u27() --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u4
        [4] = u20
    --]]
    local v21 = {}
    if u10 then
        local v22 = u10
        table.insert(v21, v22)
    end
    if u11 then
        local v23 = u11
        table.insert(v21, v23)
    end
    local v24 = u4:FindFirstChild("Storage")
    if v24 then
        local v25 = v24:FindFirstChild("Hooks")
        local v26 = v24:FindFirstChild("VFX")
        if v25 then
            table.insert(v21, v25)
        end
        if v26 then
            table.insert(v21, v26)
        end
    end
    u20.FilterDescendantsInstances = v21
end
local function u35(p28) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u12
        [4] = u13
        [5] = u14
        [6] = u27
        [7] = u16
        [8] = u17
        [9] = u18
        [10] = u19
        [11] = u15
    --]]
    local v29 = p28:WaitForChild("ODMG", 15)
    if not v29 then
        return false
    end
    local v30 = v29:WaitForChild("Model", 10)
    if not v30 then
        return false
    end
    local v31 = v30:WaitForChild("LeftSword", 10)
    local v32 = v30:WaitForChild("RightSword", 10)
    if not (v31 and v32) then
        return false
    end
    local v33 = v31:WaitForChild("Blade", 10)
    local v34 = v32:WaitForChild("Blade", 10)
    if not (v33 and v34) then
        return false
    end
    u10 = p28
    u11 = v29
    u12 = v30
    u13 = v33
    u14 = v34
    u27()
    u16 = {}
    u17.Left = {}
    u17.Right = {}
    u18 = false
    u19 = 0
    u15 = true
    return true
end
local function u38(p36) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if not (p36 and p36:IsA("BasePart")) then
        return nil
    end
    local v37 = p36:FindFirstAncestorOfClass("Model")
    while v37 do
        if v37.Parent == u9 then
            return v37
        end
        v37 = v37.Parent and v37.Parent:FindFirstAncestorOfClass("Model") or nil
    end
    return nil
end
local function u52(p39, p40) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u20
        [3] = u38
        [4] = u16
        [5] = u8
    --]]
    if p39 and p39.Parent then
        local v41 = p39.Size
        local v42, v43
        if v41.X >= v41.Y and v41.X >= v41.Z then
            v42 = p39.CFrame.RightVector
            v43 = v41.X
        elseif v41.Y >= v41.X and v41.Y >= v41.Z then
            v42 = p39.CFrame.UpVector
            v43 = v41.Y
        else
            v42 = p39.CFrame.LookVector
            v43 = v41.Z
        end
        for v44 = 1, 5 do
            local v45 = (v44 - 1) / 4
            local v46 = -v43 / 2 + v45 * v43
            local v47 = p39.Position + v42 * v46
            local v48 = p40[v44] or v47
            local v49 = v47 - v48
            if v49.Magnitude > 0.05 then
                local v50 = u4:Raycast(v48, v49, u20)
                if v50 and v50.Instance then
                    local v51 = u38(v50.Instance)
                    if v51 and not u16[v51] then
                        u16[v51] = true
                        u8:FireServer(v50.Instance, v50.Position, v50.Normal)
                    end
                end
            end
            p40[v44] = v47
        end
    end
end
local function u53() --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u19
    --]]
    u16 = {}
    u17.Left = {}
    u17.Right = {}
    u19 = os.clock() + 0.08
end
local function u54() --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u19
    --]]
    u16 = {}
    u17.Left = {}
    u17.Right = {}
    u19 = 0
end
u5.CharacterAdded:Connect(function(u55) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u35
    --]]
    task.wait(0.5)
    u15 = false
    task.spawn(function() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u35
        --]]
        for _ = 1, 5 do
            if not (u55 and u55.Parent) then
                return
            end
            if u35(u55) then
                return
            end
            task.wait(3)
        end
    end)
end)
if u5.Character then
    task.spawn(function() --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
            [3] = u35
        --]]
        task.wait(1)
        local u56 = u5.Character
        u15 = false
        task.spawn(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u35
            --]]
            for _ = 1, 5 do
                if not (u56 and u56.Parent) then
                    return
                end
                if u35(u56) then
                    return
                end
                task.wait(3)
            end
        end)
    end)
end
u5.CharacterRemoving:Connect(function() --[[ Line: 219 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u11
        [4] = u12
        [5] = u13
        [6] = u14
    --]]
    u15 = false
    u10 = nil
    u11 = nil
    u12 = nil
    u13 = nil
    u14 = nil
end)
local function u61(u57) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u35
        [3] = u11
        [4] = u12
        [5] = u13
        [6] = u14
    --]]
    u57.ChildAdded:Connect(function(p58) --[[ Line: 230 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u57
            [3] = u35
        --]]
        if p58.Name == "ODMG" and not u15 then
            task.wait(0.5)
            local u59 = u57
            u15 = false
            task.spawn(function() --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u59
                    [2] = u35
                --]]
                for _ = 1, 5 do
                    if not (u59 and u59.Parent) then
                        return
                    end
                    if u35(u59) then
                        return
                    end
                    task.wait(3)
                end
            end)
        end
    end)
    u57.ChildRemoved:Connect(function(p60) --[[ Line: 237 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u11
            [3] = u12
            [4] = u13
            [5] = u14
        --]]
        if p60.Name == "ODMG" then
            u15 = false
            u11 = nil
            u12 = nil
            u13 = nil
            u14 = nil
        end
    end)
end
u5.CharacterAdded:Connect(function(u62) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u35
        [3] = u61
    --]]
    task.wait(0.5)
    u15 = false
    task.spawn(function() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u35
        --]]
        for _ = 1, 5 do
            if not (u62 and u62.Parent) then
                return
            end
            if u35(u62) then
                return
            end
            task.wait(3)
        end
    end)
    u61(u62)
end)
if u5.Character then
    task.spawn(function() --[[ Line: 257 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
            [3] = u35
            [4] = u61
        --]]
        task.wait(1)
        local u63 = u5.Character
        u15 = false
        task.spawn(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u63
                [2] = u35
            --]]
            for _ = 1, 5 do
                if not (u63 and u63.Parent) then
                    return
                end
                if u35(u63) then
                    return
                end
                task.wait(3)
            end
        end)
        u61(u5.Character)
    end)
end
v3.RenderStepped:Connect(function() --[[ Line: 264 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u11
        [4] = u18
        [5] = u7
        [6] = u53
        [7] = u54
        [8] = u19
        [9] = u52
        [10] = u13
        [11] = u17
        [12] = u14
    --]]
    if u15 then
        if u10 and u10.Parent then
            if u11 and u11.Parent then
                local v64
                if u11 and u11.Parent then
                    v64 = u11:GetAttribute("Attacking") == true
                else
                    v64 = false
                end
                if v64 ~= u18 then
                    u18 = v64
                    u7:FireServer(v64)
                    if v64 then
                        u53()
                    else
                        u54()
                    end
                end
                if v64 and u19 <= os.clock() then
                    u52(u13, u17.Left)
                    u52(u14, u17.Right)
                end
            else
                u15 = false
            end
        else
            u15 = false
            return
        end
    else
        return
    end
end)