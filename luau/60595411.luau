--!strict
-- RbxUtility
print "[Mercury]: Loaded corescript 60595411"

local News = require "../Modules/New"
local New = News.New
local Hydrate = News.Hydrate

local Terrain = workspace.Terrain

local RbxUtility = {}

-- Fuq json

function RbxUtility.DecodeJSON()
	error 'RbxUtility.DecodeJSON has been removed, please use game:GetService("HttpService"):JSONDecode() instead.'
end

function RbxUtility.EncodeJSON()
	error 'RbxUtility.EncodeJSON has been removed, please use game:GetService("HttpService"):JSONEncode() instead.'
end

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--------------------------------------------Terrain Utilities Begin-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- makes a wedge at location x, y, z
-- sets cell x, y, z to default material if parameter is provided, if not sets cell x, y, z to be whatever material it previously w
-- returns true if made a wedge, false if the cell remains a block
function RbxUtility.MakeWedge(x, y, z, _)
	return Terrain:AutowedgeCell(x, y, z)
end

function RbxUtility.SelectTerrainRegion(
	regionToSelect: Region3,
	colour: BrickColor,
	selectEmptyCells: boolean,
	selectionParent: Instance
)
	local terrain = workspace:FindFirstChild "Terrain" :: Terrain
	if not terrain then
		return
	end

	assert(regionToSelect)
	assert(colour)

	-- can't use typeof
	if not (regionToSelect.CFrame and regionToSelect.Size) then
		error(
			`regionToSelect (first arg), should be of type Region3, but is type {type(
				regionToSelect
			)}`
		)
	end
	if not (colour.Number and colour.r and colour.Color) then
		error(
			`color (second arg), should be of type BrickColor, but is type {type(
				colour
			)}`
		)
	end

	-- frequently used terrain calls (speeds up call, no lookup necessary)
	local GetCell = terrain.GetCell
	local WorldToCellPreferSolid = terrain.WorldToCellPreferSolid
	local CellCenterToWorld = terrain.CellCenterToWorld
	local emptyMaterial = Enum.CellMaterial.Empty

	-- container for all adornments, passed back to user
	local selectionContainer = New "Model" {
		Name = "SelectionContainer",
		Archivable = false,
		Parent = selectionParent or workspace,
	}

	local updateSelection -- function we return to allow user to update selection
	local currentKeepAliveTag -- a tag that determines whether adorns should be destroyed
	local aliveCounter = 0 -- helper for currentKeepAliveTag
	local lastRegion -- used to stop updates that do nothing
	local adornments: {
		[Vector3int16]: {
			SelectionPart: BasePart,
			SelectionBox: SelectionBox,
			KeepAlive: number,
		},
		SelectionPart: BasePart?,
		SelectionBox: SelectionBox?,
	} = {} -- contains all adornments
	local reusableAdorns = {}

	local selectionPart = New "Part" {
		Name = "SelectionPart",
		Transparency = 1,
		Anchored = true,
		Locked = true,
		CanCollide = false,
		Size = Vector3.new(4.2, 4.2, 4.2),
	}

	local selectionBox = Instance.new "SelectionBox"

	-- helper function that creates the basis for a selection box
	local function createAdornment(theColour)
		local selectionPartClone
		local selectionBoxClone

		if #reusableAdorns > 0 then
			selectionPartClone = reusableAdorns[1]["part"]
			selectionBoxClone = reusableAdorns[1]["box"]
			table.remove(reusableAdorns, 1)

			selectionBoxClone.Visible = true
		else
			selectionPartClone = Hydrate(selectionPart:Clone()) {
				Archivable = false,
			}

			selectionBoxClone = Hydrate(selectionBox:Clone()) {
				Archivable = false,
				Adornee = selectionPartClone,
				Parent = selectionContainer,
			}
		end

		if theColour then
			selectionBoxClone.Color = theColour
		end

		return selectionPartClone, selectionBoxClone
	end

	-- iterates through all current adornments and deletes any that don't have latest tag
	local function cleanUpAdornments()
		for cellPos, adornTable in pairs(adornments) do
			if adornTable.KeepAlive ~= currentKeepAliveTag then -- old news, we should get rid of this
				adornTable.SelectionBox.Visible = false
				table.insert(reusableAdorns, {
					part = adornTable.SelectionPart,
					box = adornTable.SelectionBox,
				})
				adornments[cellPos] = nil
			end
		end
	end

	-- helper function to update tag
	local function incrementAliveCounter()
		aliveCounter += 1
		aliveCounter %= 1000000
		return aliveCounter
	end

	-- finds full cells in region and adorns each cell with a box, with the argument color
	local function adornFullCellsInRegion(region: Region3, newColour: BrickColor)
		local regionBegin = region.CFrame.p
			- (region.Size / 2)
			+ Vector3.new(2, 2, 2)
		local regionEnd = region.CFrame.p
			+ (region.Size / 2)
			- Vector3.new(2, 2, 2)

		local cellPosBegin = WorldToCellPreferSolid(terrain, regionBegin)
		local cellPosEnd = WorldToCellPreferSolid(terrain, regionEnd)

		currentKeepAliveTag = incrementAliveCounter()
		for y = cellPosBegin.Y, cellPosEnd.Y do
			for z = cellPosBegin.Z, cellPosEnd.Z do
				for x = cellPosBegin.X, cellPosEnd.X do
					local cellMaterial = GetCell(terrain, x, y, z)

					if cellMaterial ~= emptyMaterial then
						local cframePos = CellCenterToWorld(terrain, x, y, z)
						local cellPos = Vector3int16.new(x, y, z)

						local updated = false
						for cellPosAdorn, adornTable in pairs(adornments) do
							if cellPosAdorn == cellPos then
								adornTable.KeepAlive = currentKeepAliveTag
								if newColour then
									adornTable.SelectionBox.Color = newColour
								end
								updated = true
								break
							end
						end

						if not updated then
							selectionPart, selectionBox =
								createAdornment(newColour)
							selectionPart.Size = Vector3.new(4, 4, 4)
							selectionPart.CFrame = CFrame.new(cframePos)
							local adornTable = {
								SelectionPart = selectionPart,
								SelectionBox = selectionBox,
								KeepAlive = currentKeepAliveTag,
							}
							adornments[cellPos] = adornTable
						end
					end
				end
			end
		end
		cleanUpAdornments()
	end

	------------------------------------- setup code ------------------------------
	lastRegion = regionToSelect

	if selectEmptyCells then -- use one big selection to represent the area selected
		selectionPart, selectionBox = createAdornment(colour)

		selectionPart.Size = regionToSelect.Size
		selectionPart.CFrame = regionToSelect.CFrame

		adornments.SelectionPart = selectionPart
		adornments.SelectionBox = selectionBox

		function updateSelection(newRegion: Region3, newColour)
			if newRegion and newRegion ~= lastRegion then
				lastRegion = newRegion
				selectionPart.Size = newRegion.Size
				selectionPart.CFrame = newRegion.CFrame
			end
			if newColour then
				selectionBox.Color = newColour
			end
		end
	else -- use individual cell adorns to represent the area selected
		adornFullCellsInRegion(regionToSelect, colour)
		function updateSelection(newRegion: Region3, newColour)
			if newRegion and newRegion ~= lastRegion then
				lastRegion = newRegion
				adornFullCellsInRegion(newRegion, newColour)
			end
		end
	end

	local function destroyFunc()
		updateSelection = nil
		if selectionContainer then
			selectionContainer:Destroy()
		end
		adornments = {}
	end

	return updateSelection, destroyFunc
end

-----------------------------Terrain Utilities End-----------------------------

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Signal class begin------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--[[
A 'Signal' object identical to the internal RBXScriptSignal object in it's public API and semantics. This function
can be used to create "custom events" for user-made code.
API:
Method :connect( function handler )
	Arguments:   The function to connect to.
	Returns:     A new connection object which can be used to disconnect the connection
	Description: Connects this signal to the function specified by |handler|. That is, when |fire( ... )| is called for
	             the signal the |handler| will be called with the arguments given to |fire( ... )|. Note, the functions
	             connected to a signal are called in NO PARTICULAR ORDER, so connecting one function after another does
	             NOT mean that the first will be called before the second as a result of a call to |fire|.

Method :disconnect()
	Arguments:   None
	Returns:     None
	Description: Disconnects all of the functions connected to this signal.

Method :fire( ... )
	Arguments:   Any arguments are accepted
	Returns:     None
	Description: Calls all of the currently connected functions with the given arguments.

Method :wait()
	Arguments:   None
	Returns:     The arguments given to fire
	Description: This call blocks until
]]

function RbxUtility.CreateSignal()
	local this = {}

	local mBindableEvent = Instance.new "BindableEvent"
	local mAllCns = {} --all connection objects returned by mBindableEvent::connect

	--main functions
	function this:connect(func)
		if self ~= this then
			error("connect must be called with `:`, not `.`", 2)
		end
		if type(func) ~= "function" then
			error(
				"Argument #1 of connect must be a function, got a "
					.. type(func),
				2
			)
		end
		local cn = mBindableEvent.Event:connect(func)
		mAllCns[cn] = true
		local pubCn = {}
		function pubCn.disconnect(_)
			cn:disconnect()
			mAllCns[cn] = nil
		end
		pubCn.Disconnect = pubCn.disconnect

		return pubCn
	end

	function this:disconnect()
		if self ~= this then
			error("disconnect must be called with `:`, not `.`", 2)
		end
		for cn, _ in pairs(mAllCns) do
			cn:disconnect()
			mAllCns[cn] = nil
		end
	end

	function this:wait()
		if self ~= this then
			error("wait must be called with `:`, not `.`", 2)
		end
		return mBindableEvent.Event:wait()
	end

	function this:fire(...)
		if self ~= this then
			error("fire must be called with `:`, not `.`", 2)
		end
		mBindableEvent:Fire(...)
	end

	this.Connect = this.connect
	this.Disconnect = this.disconnect
	this.Wait = this.wait
	this.Fire = this.fire

	return this
end

------------------------------------------------- Sigal class End ------------------------------------------------------
-- this ones my favourite - Heliodex
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------Create Function Begins---------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--[[
A "Create" function for easy creation of Mercury instances. The function accepts a string which is the classname of
the object to be created. The function then returns another function which either accepts accepts no arguments, in
which case it simply creates an object of the given type, or a table argument that may contain several types of data,
in which case it mutates the object in varying ways depending on the nature of the aggregate data. These are the
type of data and what operation each will perform:
1) A string key mapping to some value:
      Key-Value pairs in this form will be treated as properties of the object, and will be assigned in NO PARTICULAR
      ORDER. If the order in which properties is assigned matter, then they must be assigned somewhere else than the
      |Create| call's body.

2) An integral key mapping to another Instance:
      Normal numeric keys mapping to Instances will be treated as children if the object being created, and will be
      parented to it. This allows nice recursive calls to Create to create a whole hierarchy of objects without a
      need for temporary variables to store references to those objects.

3) A key which is a value returned from Create.Event( eventname ), and a value which is a function function
      The Create.E( string ) function provides a limited way to connect to signals inside of a Create hierarchy
      for those who really want such a functionality. The name of the event whose name is passed to
      Create.E( string )

4) A key which is the Create function itself, and a value which is a function
      The function will be run with the argument of the object itself after all other initialization of the object is
      done by create. This provides a way to do arbitrary things involving the object from withing the create
      hierarchy.
      Note: This function is called SYNCHRONOUSLY, that means that you should only so initialization in
      it, not stuff which requires waiting, as the Create call will block until it returns. While waiting in the
      constructor callback function is possible, it is probably not a good design choice.
      Note: Since the constructor function is called after all other initialization, a Create block cannot have two
      constructor functions, as it would not be possible to call both of them last, also, this would be unnecessary.


Some example usages:

A simple example which uses the Create function to create a model object and assign two of it's properties.
local model = Create'Model'{
    Name = 'A New model',
    Parent = workspace,
}


An example where a larger hierarchy of object is made. After the call the hierarchy will look like this:
Model_Container
 |-ObjectValue
 |  |
 |  `-BoolValueChild
 `-IntValue

local model = Create'Model'{
    Name = 'Model_Container',
    Create'ObjectValue'{
        Create'BoolValue'{
            Name = 'BoolValueChild',
        },
    },
    Create'IntValue'{},
}


An example using the event syntax:

local part = Create'Part'{
    [Create.E'Touched'] = function(part)
        print("I was touched by "..part.Name)
    end,
}


An example using the general constructor syntax:

local model = Create'Part'{
    [Create] = function(this)
        print("Constructor running!")
        this.Name = GetGlobalFoosAndBars(this)
    end,
}


Note: It is also perfectly legal to save a reference to the function returned by a call Create, this will not cause
      any unexpected behavior. EG:
      local partCreatingFunction = Create'Part'
      local part = partCreatingFunction()
]]

local Create_PrivImpl

-- create the functor:
RbxUtility.Create = setmetatable({}, {
	__call = function(_, ...)
		return Create_PrivImpl(...)
	end,
})

-- the Create function need to be created as a functor, not a function, in order to support the Create.E syntax, so it
-- will be created in several steps rather than as a single function declaration.
function Create_PrivImpl(objectType: string)
	if type(objectType) ~= "string" then
		error("Argument of Create must be a string", 2)
	end
	--return the proxy function that gives us the nice Create'string'{data} syntax
	--The first function call is a function call using Lua's single-string-argument syntax
	--The second function call is using Lua's single-table-argument syntax
	--Both can be chained together for the nice effect.
	return function(dat: { [string | number | { any } | any]: any })
		--default to nothing, to handle the no argument given case
		dat = dat or {}

		--make the object to mutate
		local obj = Instance.new(objectType)
		local parent

		--stored constructor function to be called after other initialization
		local ctor

		for k, v in pairs(dat) do
			--add property
			if type(k) == "string" then
				if k == "Parent" then
					-- Parent should always be set last, setting the Parent of a new object
					-- immediately makes performance worse for all subsequent property updates.
					parent = v
				else
					obj[k] = v
				end

			--add child
			elseif type(k) == "number" then
				if type(v) ~= "userdata" then
					error(
						`Bad entry in Create body: Numeric keys must be paired with children, got a: {v}`
					)
				end
				v.Parent = obj

			--event connect
			elseif type(k) == "table" and k.__eventname then
				if type(v) ~= "function" then
					error(
						`Bad entry in Create body: Key \`[Create.E'{k.__eventname}']\` must have a function value, got: {v}`,
						2
					)
				end
				obj[k.__eventname]:connect(v)

			--define constructor function
			elseif k == RbxUtility.Create then
				if type(v) ~= "function" then
					error(
						`Bad entry in Create body: Key \`[Create]\` should be paired with a constructor function, got: {v}`,
						2
					)
				elseif ctor then
					--ctor already exists, only one allowed
					error(
						"Bad entry in Create body: Only one constructor function is allowed",
						2
					)
				end
				ctor = v
			else
				error(`Bad entry ({k} => {v}) in Create body`, 2)
			end
		end

		--apply constructor function if it exists
		if ctor then
			ctor(obj)
		end

		if parent then
			obj.Parent = parent
		end

		--return the completed object
		return obj
	end
end



--and create the "Event.E" syntax stub. Really it's just a stub to construct a table which our Create
--function can recognize as special.
function RbxUtility.Create.E(eventName)
	return { __eventname = eventName }
end

-------------------------------------------------Create function End----------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Documentation Begin-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function RbxUtility.Help(funcNameOrFunc)
	--input argument can be a string or a function.  Should return a description (of arguments and expected side effects)
	if
		funcNameOrFunc == "DecodeJSON"
		or funcNameOrFunc == RbxUtility.DecodeJSON
	then
		return [[Function DecodeJSON.
Arguments: (string).
Side effect: returns a table with all parsed JSON values]]
	elseif
		funcNameOrFunc == "EncodeJSON"
		or funcNameOrFunc == RbxUtility.EncodeJSON
	then
		return [[Function EncodeJSON.
Arguments: (table).
Side effect: returns a string composed of argument table in JSON data format]]
	elseif
		funcNameOrFunc == "MakeWedge"
		or funcNameOrFunc == RbxUtility.MakeWedge
	then
		return [[Function MakeWedge.
Arguments: (x, y, z, [default material]).
Description: Makes a wedge at location x, y, z. Sets cell x, y, z to default material if parameter is provided, if not sets cell x, y, z to be whatever material it previously was. Returns true if made a wedge, false if the cell remains a block]]
	elseif
		funcNameOrFunc == "SelectTerrainRegion"
		or funcNameOrFunc == RbxUtility.SelectTerrainRegion
	then
		return [[Function SelectTerrainRegion.
Arguments: (regionToSelect, color, selectEmptyCells, selectionParent).
Description: Selects all terrain via a series of selection boxes within the regionToSelect (this should be a region3 value). The selection box color is detemined by the color argument (should be a brickcolor value). SelectionParent is the parent that the selection model gets placed to (optional).SelectEmptyCells is bool, when true will select all cells in the region, otherwise we only select non-empty cells. Returns a function that can update the selection, arguments to said function are a new region3 to select, and the adornment color (color arg is optional). Also returns a second function that takes no arguments and destroys the selection]]
	elseif
		funcNameOrFunc == "CreateSignal"
		or funcNameOrFunc == RbxUtility.CreateSignal
	then
		return [[Function CreateSignal.
Arguments: None.
Returns: The newly created Signal object. This object is identical to the RBXScriptSignal class used for events in Objects, but is a Lua-side object so it can be used to create custom events in Lua code. Methods of the Signal object: :connect, :wait, :fire, :disconnect. For more info you can pass the method name to the Help function, or view the wiki page 'for this library. EG: Help "Signal:connect".]]
	elseif funcNameOrFunc == "Signal:connect" then
		return [[Method Signal:connect.
Arguments: (function handler).
Return: A connection object which can be used to disconnect the connection to this handler.
Description: Connectes a handler function to this Signal, so that when |fire| is called the handler function will be called with the arguments passed to |fire|.]]
	end
	if funcNameOrFunc == "Signal:wait" then
		return [[Method Signal:wait.
Arguments: None.
Returns: The arguments passed to the next call to |fire|.
Description: This call does not return until the next call to |fire| is made, at which point it will return the values which were passed as arguments to that |fire| call.]]
	elseif funcNameOrFunc == "Signal:fire" then
		return [[Method Signal:fire.
Arguments: Any number of arguments of any type.
Returns: None.
Description: This call will invoke any connected handler functions, and notify any waiting code attached to this Signal to continue, with the arguments passed to this function. Note: The calls to handlers are made asynchronously, so this call will return immediately regardless of how long it takes the connected handler functions to complete.]]
	elseif funcNameOrFunc == "Signal:disconnect" then
		return [[Method Signal:disconnect.
Arguments: None.
Returns: None.
Description: This call disconnects all handlers attacched to this function, note however, it does NOT make waiting code continue, as is the behavior of normal Mercury events. This method can also be called on the connection object which is returned from Signal:connect to only disconnect a single handler, as opposed to this method, which will disconnect all handlers.]]
	elseif funcNameOrFunc == "Create" then
		return [[Function Create.
Arguments: A table containing information about how to construct a collection of objects.
Returns: The constructed objects.
Descrition: Create is a very powerful function, whose description is too long to fit here, and is best described via example, please see the wiki page for a description of how to use it.]]
	end
	return "No help available for this function"
end

--------------------------------------------Documentation Ends----------------------------------------------------------

return RbxUtility
