-- Check for table that is shared between executions.
if not shared then
	return warn("No shared, no script.")
end

-- Initialize Luraph globals if they do not exist.
loadstring("getfenv().LPH_NO_VIRTUALIZE = function(...) return ... end")()

getfenv().PP_SCRAMBLE_NUM = function(...)
	return ...
end

getfenv().PP_SCRAMBLE_STR = function(...)
	return ...
end

getfenv().PP_SCRAMBLE_RE_NUM = function(...)
	return ...
end

local BypassEnabled = true 
local AnticheatData = { Disabled = false, Name = "N/A" }

local function Notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

local Adonis = {
    Name = "Adonis",
    Threads = {}
}

function Adonis.Detect()
    if not getreg or not getgc or not debug.info then return false end
    local found = false
    for _, thread in getreg() do
        if typeof(thread) == "thread" and coroutine.status(thread) ~= "dead" then
            local success, source = pcall(function() return debug.info(thread, 1, "s") end)
            if success and source and (source:find(".Core.Anti") or source:find(".Plugins.Anti_Cheat")) then
                table.insert(Adonis.Threads, thread)
                found = true
            end
        end
    end
    return found
end

function Adonis.Bypass()
    for _, thread in Adonis.Threads do pcall(task.cancel, thread) end
    local hookedCount = 0
    for _, obj in getgc(true) do
        if typeof(obj) == "table" then
            if typeof(rawget(obj, "Detected")) == "function" and rawget(obj, "RLocked") ~= nil then
                for _, func in pairs(obj) do
                    if typeof(func) == "function" then
                        local success = pcall(function()
                            hookfunction(func, function(...) return task.wait(9e9) end)
                        end)
                        if success then hookedCount = hookedCount + 1 end
                    end
                end
            end
        end
    end
    for _, thread in Adonis.Threads do
        if coroutine.status(thread) ~= "dead" then return false end
    end
    return hookedCount > 0
end

if BypassEnabled then
    if Adonis.Detect() then
        Notify("2step Security", "Adonis anti-cheat detected! Neutralizing...")
        
        task.wait(1) 
        
        if Adonis.Bypass() then
            AnticheatData.Name = Adonis.Name
            AnticheatData.Disabled = true
            Notify("2step Security", "Adonis neutralized. Proceeding...")
        else
            game.Players.LocalPlayer:Kick("\n[2step]\nFailed to bypass Adonis.\nSecurity shutdown to prevent ban.")
            return
        end
    end
end

-- bridger western bypass



---@module Utility.Profiler
local Profiler = require("Utility/Profiler")

---@module 2STEP
local TwoStep = require("2STEP")

---Find existing instances and initialize the script.
local function initializeScript()
	if shared.TwoStep then
		local ok, err = pcall(shared.TwoStep.detach)
		if not ok then warn("[2STEP] Previous instance cleanup failed: " .. tostring(err)) end
		TwoStep.queued = shared.TwoStep.queued
	end

	shared.TwoStep = TwoStep
	shared.TwoStep.init()
end

---This is called when the initalization errors.
---@param error string
local function onInitializeError(error)
	warn("Failed to initialize.")
	warn(error)
	warn(debug.traceback())
	TwoStep.detach()
end

-- Safely profile and initialize the script aswell as handle errors.
Profiler.run("Main_InitializeScript", function(...)
	return xpcall(initializeScript, onInitializeError, ...)
end)
