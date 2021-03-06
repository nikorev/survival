include("shared.lua")

function svModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "sv" then
			Error("[CLI] Loaded serverside module "..v.."\n")
			include("survival/gamemode/"..v)
		end
	end
end
svModules()

local function AddClModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,3) == "cli" then
			Error("[CLI] Loaded clientside module "..v.."\n")
			AddCSLuaFile("survival/gamemode/"..v)
		end
	end
end
hook.Add("Initialize", "Cl_Modules_Hook", AddClModules) 


local function AddShModules()
	for k,v in pairs(file.Find("survival/gamemode/*.lua", "LUA")) do
		if string.sub(v,1,2) == "sh" then 
			Error("[CLI] Loaded shared module "..v.."\n")
			AddCSLuaFile(v)
			include(v)
		end
	end
end
AddShModules()

local function AutoFastDL()
	for k,v in pairs(file.Find("gamemode/content/*", "GAME")) do
		resource.AddFile("gamemode/content/"..v)
	end
end
hook.Add("Initialize", "AutoFastDL", AutoFastDL)

resource.AddFile("materials/blurgm.vmt")
resource.AddFile("materials/heaxagon_pattern_v2.png") 
resource.AddFile("materials/Bloody_Impact.ttf") 