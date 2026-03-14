--!strict
local ContentProvider = game:GetService "ContentProvider"

-- don't remove www
local url = ContentProvider.BaseUrl

local BaseUrl = {}

function BaseUrl.path(path: string)
	return url .. path
end

return BaseUrl
