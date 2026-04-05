-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = workspace.CurrentCamera
game:GetService("RunService")
local v1 = script.Parent.Wind:WaitForChild("Direction").Value
local v2 = script.Parent.Wind:WaitForChild("Speed").Value
local _ = script.Parent.Wind:WaitForChild("Power").Value
require(script.WindLines):Init({
    ["Direction"] = v1,
    ["Speed"] = v2,
    ["Lifetime"] = 4,
    ["SpawnRate"] = 7
})