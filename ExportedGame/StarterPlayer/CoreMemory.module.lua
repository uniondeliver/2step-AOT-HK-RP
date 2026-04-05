-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Modules")
require(v1:WaitForChild("Tools"):WaitForChild("CameraShaker"))
game:GetService("Lighting")
local _ = workspace.CurrentCamera
return {
    ["hasOdmg"] = false,
    ["odmgFolder"] = nil,
    ["odmgEnabled"] = false,
    ["firstPerson"] = true,
    ["smoothCameraEnabled"] = true,
    ["defaultFieldOfView"] = 50,
    ["cameraTilt"] = 0
}