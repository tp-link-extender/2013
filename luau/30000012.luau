--!strict
-- Script Context./Libraries/LibraryRegistration/LibraryRegist
print "[Mercury]: Loaded corescript 60595695"

local RunService = game:GetService "RunService"

-- Library Registration Script
-- This script is used to register RbxLua libraries on game servers, so game scripts have
-- access to all of the libraries (otherwise only local scripts do)

local ScriptContext

for _ = 1, 4 do
	ScriptContext = game:GetService "ScriptContext"
	if ScriptContext then
		break
	end
	RunService.Heartbeat:wait()
end

if not ScriptContext then
	print "[Mercury]: Failed to find ScriptContext, libraries did not load"
	return
end

for name, id in pairs {
	Fusion = 10000001,
	Red = 10000002,
	Load = 10000003,
	Gui = 30000004,
	Utility = 30000011,
	Stamper = 30000013,
} do
	ScriptContext:RegisterLibrary("Libraries/Rbx" .. name, tostring(id))
end
ScriptContext:LibraryRegistrationComplete()
