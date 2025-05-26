--!strict
-- There's issues with running this file from windows so idk

local fs = require "@lune/fs"
local process = require "@lune/process"
local stdio = require "@lune/stdio"
local task = require "@lune/task"
local waiter = (require "./Modules/Waiter")(function() task.wait() end)

local colour = stdio.color

local green = colour "green"
local red = colour "red"
local reset = colour "reset"

local normalCores = {}
local libraryCores = {
	"Fusion/init.luau",
	"Red/init.luau",
	"Load.luau",
}
local otherCores = {}
local plugins = {}

local normalCoresDir = "./luau"
local normalPluginsDir = "./terrain plugins"
local outputDir = "./processed"

for _, core in ipairs(fs.readDir(normalCoresDir)) do
	table.insert(
		-- normalCores should be ones with numbers
		if string.match(core, "%d+%.lua") then normalCores else otherCores,
		core
	)
end
for _, core in ipairs(fs.readDir(normalPluginsDir)) do
	table.insert(plugins, core)
end

local pluginsDir = "./Client deployer" -- not here but.. ya get the idea

local function processCores(
	scripts: { string },
	startDir: string,
	endDir: string,
	config: "lines" | "dense",
	libraries: boolean?
)
	local configFile = `{config}.json5`

	local w = waiter(#scripts)

	for i, core in ipairs(scripts) do
		local newCore = if libraries
			then `{10000000 + i}.lua`
			else string.gsub(core, "%.luau$", ".lua")

		task.spawn(function()
			local cmd = process.create("darklua", {
				"process",
				"-c",
				configFile,
				`./{startDir}/{core}`,
				`{endDir}/{newCore}`,
			})

			print(
				if cmd:status().ok
					then `{green}Processed {core}{reset}`
					else `{red}Error processing {core}: {cmd.stderr}{reset}`
			)

			w.finish()
		end)
	end
	w.wait()
end

local args: { { any } } = {
	{ libraryCores, "Libraries", outputDir, "dense", true },
	{
		plugins,
		"terrain plugins",
		`{pluginsDir}/staging/BuiltInPlugins/terrain`,
		"lines",
	},
	{ normalCores, "luau", outputDir, "dense" },
	{ otherCores, "luau", outputDir, "lines" },
}

local w = waiter(#args)

for _, arg in ipairs(args) do
	task.spawn(function()
		processCores(unpack(arg))
		w.finish()
	end)
end

if #process.args == 0 then return end

w.wait()

local totalBytes = 0
for _, core in ipairs(fs.readDir(outputDir)) do
	local file = fs.readFile(`{outputDir}/{core}`)
	if not string.match(core, "%d+%.lua") then continue end
	totalBytes += #file
end

print(`Total: {totalBytes / 1000} kb`)
