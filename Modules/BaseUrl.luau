--!strict
local ContentProvider = game:GetService "ContentProvider"

-- remove www
local url = string.gsub(ContentProvider.BaseUrl, "www.", "")

local BaseUrl = {}

function BaseUrl.path(path: string)
	return url .. path
end

return BaseUrl
