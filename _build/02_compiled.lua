function defaultArray(d) 
	local t = {}
	local mt = {__index = function (table, key)
	    local v = d()
	    table[key] = v
	    return v
	end}
	setmetatable(t, mt)
	return t
end

function stringConcat(x, y) 
	if x then
	    if y then return x .. y else return x end
	else
	    return y
	end
end

function isInstanceOf(x, A) 
	return x ~= nil and x.__wurst_supertypes[A]
end

__wurst_objectIndexMap = nil
__wurst_number_wrapper_map = nil

function __wurst_objectToIndex(x) 
	if x == nil then
	    return 0
	end
	if type(x) == "number" then
	    if __wurst_number_wrapper_map[x] then
	        x = __wurst_number_wrapper_map[x]
	    else
	        local obj = {__wurst_boxed_number = x}
	        __wurst_number_wrapper_map[x] = obj
	        x = obj
	    end
	end
	if __wurst_objectIndexMap[x] then
	    return __wurst_objectIndexMap[x]
	else
	   local r = __wurst_objectIndexMap.counter + 1
	   __wurst_objectIndexMap.counter = r
	   __wurst_objectIndexMap[r] = x
	   __wurst_objectIndexMap[x] = r
	   return r
	end
end

function __wurst_objectFromIndex(x) 
	if type(x) == "number" then
	    x = __wurst_objectIndexMap[x]
	end
	if type(x) == "table" and x.__wurst_boxed_number then
	    return x.__wurst_boxed_number
	end
	return x
end

__wurst_string_index_map = nil

function __wurst_stringToIndex(x) 
	if x == nil then
	    return 0
	end
	if type(x) ~= "string" then
	    x = tostring(x)
	end
	local id = __wurst_string_index_map.byString[x]
	if id ~= nil then
	    return id
	end
	id = __wurst_string_index_map.counter + 1
	__wurst_string_index_map.counter = id
	__wurst_string_index_map.byString[x] = id
	__wurst_string_index_map.byIndex[id] = x
	return id
end

function __wurst_stringFromIndex(x) 
	local id = tonumber(x)
	if id == nil then
	    return ""
	end
	id = math.tointeger(id)
	if id == nil then
	    return ""
	end
	local s = __wurst_string_index_map.byIndex[id]
	if s == nil then
	    return ""
	end
	return s
end

function intEnsure(x) 
	local n = tonumber(x)
	if n == nil then return 0 end
	local i = math.tointeger(n)
	if i == nil then return 0 end
	return i
end

function boolEnsure(x) 
	if x == nil then return false end
	return x
end

function realEnsure(x) 
	local n = tonumber(x)
	if n == nil then return 0.0 end
	return n
end

function stringEnsure(x) 
	if x == nil then return "" end
	return tostring(x)
end

Angle_RADTODEG = nil
BasicWaves_selectedTarget = nil
BasicWaves_footmen = nil
Basics_ANIMATION_PERIOD = nil
Colors_hexs = nil
Colors_decs = nil
Colors_COLOR_WHITE = nil
Colors_COLOR_BLACK = nil
Colors_COLOR_GOLD = nil
GameTimer_currentTime = nil
Player_players = nil
Player_localPlayer = nil
Printing_DEBUG_MSG_DURATION = nil
String_charset = nil
String_numberset = nil
Table_ht = nil
TypeCasting_typecastdata = nil
hashtable_compiletime = nil
wurst_stack_depth = nil
HashMap = ({})
Table = ({})

function HashMap:create() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=HashMap, }))
	return new_inst
end

function HashMap_HashMap_init(this, __wurst_stackPos) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_new_HashMap(__wurst_stackPos1) 
	local this1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	this1 = HashMap:create()
	HashMap_construct_HashMap(this1, "when calling construct_HashMap in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this1
end

function HashMap_construct_HashMap(this2, __wurst_stackPos2) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_construct_Table(this2, "when calling construct_Table in HashMap, line 7")
	HashMap_HashMap_init(this2, "when calling HashMap_init in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table:create1() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=Table, }))
	return new_inst
end

function Table_Table_saveInt(this4, parentKey, value, __wurst_stackPos4) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveInt(Table_ht, __wurst_objectToIndex(this4), parentKey, value, "when calling saveInt in Table, line 44")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_saveString(this6, parentKey2, value2, __wurst_stackPos6) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveString(Table_ht, __wurst_objectToIndex(this6), parentKey2, value2, "when calling saveString in Table, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_init(this8, __wurst_stackPos8) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_new_Table(__wurst_stackPos9) 
	local this9 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	this9 = Table:create1()
	Table_construct_Table(this9, "when calling construct_Table in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this9
end

function Table_construct_Table(this3, __wurst_stackPos3) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_init(this3, "when calling Table_init in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initGlobals(__wurst_stackPos10) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitGlobals(__wurst_stackPos11) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos12) 
	local p = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p = Player(0)
	__wurst_safe_CreateUnit(p, 1214409837, -(126.6), 102.2, 228.600)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos13) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos14) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 47")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos15) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 52")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomPlayerSlots() 
	__wurst_safe_SetPlayerStartLocation(Player(0), 0)
	__wurst_safe_SetPlayerColor(Player(0), ConvertPlayerColor(0))
	__wurst_safe_SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
	__wurst_safe_SetPlayerRaceSelectable(Player(0), true)
	__wurst_safe_SetPlayerController(Player(0), MAP_CONTROL_USER)
end

function main() 
	__wurst_objectIndexMap = ({counter=0, })
	__wurst_number_wrapper_map = ({counter=0, })
	__wurst_string_index_map = ({counter=0, byString=({}), byIndex=({}), })
	Angle_RADTODEG = 0.
	BasicWaves_selectedTarget = nil
	BasicWaves_footmen = nil
	Basics_ANIMATION_PERIOD = 0.
	Colors_hexs = defaultArray(function () 
			return ""
		end)
	Colors_decs = nil
	Colors_COLOR_WHITE = ({0, 0, 0, 0, })
	Colors_COLOR_BLACK = ({0, 0, 0, 0, })
	Colors_COLOR_GOLD = ({0, 0, 0, 0, })
	GameTimer_currentTime = 0.
	Player_players = defaultArray(function () 
			return nil
		end)
	Player_localPlayer = nil
	Printing_DEBUG_MSG_DURATION = 0.
	String_charset = ""
	String_numberset = ""
	Table_ht = nil
	TypeCasting_typecastdata = nil
	hashtable_compiletime = nil
	wurst_stack_depth = 0
	HashMap.HashMap_saveInt = Table_Table_saveInt
	HashMap.HashMap_saveString = Table_Table_saveString
	HashMap.Table_Table_saveInt = Table_Table_saveInt
	HashMap.Table_Table_saveString = Table_Table_saveString
	HashMap.Table_saveInt = Table_Table_saveInt
	HashMap.Table_saveString = Table_Table_saveString
	HashMap.__wurst_supertypes = ({[HashMap] = true, [Table] = true, })
	HashMap.__typeId__ = 2
	Table.Table_Table_saveInt = Table_Table_saveInt
	Table.Table_Table_saveString = Table_Table_saveString
	Table.Table_saveInt = Table_Table_saveInt
	Table.Table_saveString = Table_Table_saveString
	Table.__wurst_supertypes = ({[Table] = true, })
	Table.__typeId__ = 1
	initGlobals("when calling initGlobals")
	initCompiletimeState("when calling initCompiletimeState in blizzard, line 1")
	SetCameraBounds((-(3328.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(3584.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(3328.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(3584.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("LordaeronSummerDay")
	SetAmbientNightSound("LordaeronSummerNight")
	SetMapMusic("Music", true, 0)
	CreateAllUnits("when calling CreateAllUnits in war3map, line 93")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 95")
	do
	  local __wurst_init_ok = xpcall(init_AbilityIds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package AbilityIds.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Real, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Real.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Integer, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Integer.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Angle, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Angle.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Maths, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Maths.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_String, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package String.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Vectors, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Vectors.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Destructable, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Destructable.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Player, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Player.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Printing, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Printing.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_MagicFunctions, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package MagicFunctions.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Basics, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Basics.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_GameTimer, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package GameTimer.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ErrorHandling, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package ErrorHandling.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Matrices, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Matrices.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Quaternion, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Quaternion.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Table, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Table.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Force, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Force.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Playercolor, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Playercolor.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Colors, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Colors.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Framehandle, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Framehandle.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Group, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Group.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Lightning, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Lightning.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_WeatherEffects, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package WeatherEffects.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_TypeCasting, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package TypeCasting.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_HashList, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package HashList.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_EventHelper, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package EventHelper.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_BasicWaves, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package BasicWaves.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Hello, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Hello.")
	  end
	end
end

function config() 
	SetMapName("TRIGSTR_008")
	SetMapDescription("")
	SetPlayers(1)
	SetTeams(1)
	__wurst_safe_SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
	DefineStartLocation(0, -(128.0), 64.0)
	InitCustomPlayerSlots()
	__wurst_safe_SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
	InitGenericPlayerSlots()
end

function init_AbilityIds(__wurst_stackPos17) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos20) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this10, __wurst_stackPos46) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this10[1] * Angle_RADTODEG)
end

function init_BasicWaves(__wurst_stackPos44) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	BasicWaves_selectedTarget = nil
	BasicWaves_footmen = CreateGroup()
	setupWaveSpawn("when calling setupWaveSpawn in BasicWaves, line 38")
	setupAttackPlayer("when calling setupAttackPlayer in BasicWaves, line 39")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createPlayerUnit(p1, unitID, number, unitGroup, __wurst_stackPos49) 
	local i = nil
	local temp = nil
	local u = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i = 0
	temp = (number - 1)
	while true do
		if (i > temp) then
			break
		end
		u = createUnit(p1, unitID, ({0., 0., }), ({0., }), "when calling createUnit in BasicWaves, line 14")
		group_add(unitGroup, "when calling add in BasicWaves, line 15", u)
		i = (i + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnWave(__wurst_stackPos52) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	createPlayerUnit(Player_players[1], 1751543663, 5, BasicWaves_footmen, "when calling createPlayerUnit in BasicWaves, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupWaveSpawn(__wurst_stackPos47) 
	local receiver = nil
	local receiver1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver, Player_players[0], "-spawn", true, "when calling registerPlayerChatEvent in BasicWaves, line 22")
	receiver1 = receiver
	trigger_addAction(receiver1, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 23")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves(__wurst_stackPos55) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAttackPlayer(__wurst_stackPos48) 
	local receiver2 = nil
	local receiver3 = nil
	local receiver4 = nil
	local receiver5 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver2 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver2, Player_players[0], EVENT_PLAYER_UNIT_SELECTED, nil, "when calling registerPlayerUnitEvent in BasicWaves, line 28")
	receiver3 = receiver2
	trigger_addAction(receiver3, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 29")
	receiver4 = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver4, Player_players[0], "-attack", true, "when calling registerPlayerChatEvent in BasicWaves, line 33")
	receiver5 = receiver4
	trigger_addAction(receiver5, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves2(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 34")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves1(__wurst_stackPos57) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	BasicWaves_selectedTarget = GetTriggerUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves2(__wurst_stackPos58) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 35")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Basics(__wurst_stackPos28) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos36) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Colors_hexs[0] = "0"
	Colors_hexs[1] = "1"
	Colors_hexs[2] = "2"
	Colors_hexs[3] = "3"
	Colors_hexs[4] = "4"
	Colors_hexs[5] = "5"
	Colors_hexs[6] = "6"
	Colors_hexs[7] = "7"
	Colors_hexs[8] = "8"
	Colors_hexs[9] = "9"
	Colors_hexs[10] = "A"
	Colors_hexs[11] = "B"
	Colors_hexs[12] = "C"
	Colors_hexs[13] = "D"
	Colors_hexs[14] = "E"
	Colors_hexs[15] = "F"
	Colors_decs = Table_new_Table("when calling new_Table in Colors, line 15")
	Colors_COLOR_WHITE = ({255, 255, 255, 255, })
	Colors_COLOR_BLACK = ({0, 0, 0, 0, })
	Colors_COLOR_GOLD = ({255, 204, 0, 255, })
	colorA_toColorString(Colors_COLOR_WHITE, "when calling toColorString in Colors, line 21")
	colorA_toColorString(Colors_COLOR_BLACK, "when calling toColorString in Colors, line 22")
	colorA_toColorString(Colors_COLOR_GOLD, "when calling toColorString in Colors, line 23")
	initializeTable("when calling initializeTable in Colors, line 282")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function colorA_toColorString(this16, __wurst_stackPos60) 
	local stackTrace_tempReturn = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this16[4], "when calling toHex in Colors, line 194")), toHex(this16[1], "when calling toHex in Colors, line 194")), toHex(this16[2], "when calling toHex in Colors, line 194")), toHex(this16[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function toHex(number1, __wurst_stackPos62) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number1 // 16)
	secondpart = (number1 - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos61) 
	local i1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i1 = 0
	while true do
		if (i1 > 15) then
			break
		end
		Table_Table_saveInt(Colors_decs, string_getHash(stringEnsure(Colors_hexs[i1]), "when calling getHash in Colors, line 279"), i1, "when calling saveInt in Colors, line 279")
		i1 = (i1 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Destructable(__wurst_stackPos24) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos30) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos43) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Force(__wurst_stackPos34) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos37) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos29) 
	local receiver6 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver6 = CreateTimer()
	timer_start(receiver6, 100000., nil, "when calling start in GameTimer, line 7")
	timer_startPeriodic(CreateTimer(), Basics_ANIMATION_PERIOD, function (...) 
			xpcall(function (...) 
					bridge_code__startPeriodic_GameTimer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in GameTimer, line 15")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__startPeriodic_GameTimer(__wurst_stackPos66) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos38) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this11, __wurst_stackPos51, ...) 
	local i2 = nil
	local u1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i2 = 0
	local __args = table.pack(...)
	for i3=1,__args.n do
	u1 = __args[i3]
	if __wurst_safe_GroupAddUnit(this11, u1) then
		i2 = (i2 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i2
end

function group_targetOrder(this15, order, targetWidget, __wurst_stackPos59) 
	local stackTrace_tempReturn1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = __wurst_safe_GroupTargetOrder(this15, order, targetWidget)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function init_HashList(__wurst_stackPos42) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveInt(this5, parentKey1, childKey, value1, __wurst_stackPos5) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveInteger(this5, parentKey1, childKey, value1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveString(this7, parentKey3, childKey1, value3, __wurst_stackPos7) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveStr(this7, parentKey3, childKey1, value3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Hello(__wurst_stackPos45) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	print1("Hello World", "when calling print in Hello, line 9")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Integer(__wurst_stackPos19) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos39) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos27) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Maths(__wurst_stackPos21) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Matrices(__wurst_stackPos31) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos25) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Player_localPlayer = GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos68) 
	local i4 = nil
	local temp1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i4 = 0
	temp1 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i4 > temp1) then
			break
		end
		Player_players[i4] = Player(i4)
		i4 = (i4 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Playercolor(__wurst_stackPos35) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos26) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Printing_DEBUG_MSG_DURATION = 45.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print1(msg, __wurst_stackPos67) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos32) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos18) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_String(__wurst_stackPos22) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this20, __wurst_stackPos69) 
	local stackTrace_tempReturn2 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = StringLength(this20)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function string_getHash(this17, __wurst_stackPos63) 
	local stackTrace_tempReturn3 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = StringHash(this17)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function init_Table(__wurst_stackPos33) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_start(this18, time, timerCallBack, __wurst_stackPos64) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this18, time, false, timerCallBack)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_startPeriodic(this19, time1, timerCallBack1, __wurst_stackPos65) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this19, time1, true, timerCallBack1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_addAction(this13, actionFunc, __wurst_stackPos54) 
	local stackTrace_tempReturn4 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = __wurst_safe_TriggerAddAction(this13, actionFunc)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function trigger_registerPlayerChatEvent(this12, whichPlayer6, chatMessageToDetect, exactMatchOnly, __wurst_stackPos53) 
	local stackTrace_tempReturn5 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = __wurst_safe_TriggerRegisterPlayerChatEvent(this12, whichPlayer6, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function trigger_registerPlayerUnitEvent(this14, whichPlayer7, whichPlayerUnitEvent, filter, __wurst_stackPos56) 
	local stackTrace_tempReturn6 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this14, whichPlayer7, whichPlayerUnitEvent, filter)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function init_TypeCasting(__wurst_stackPos41) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos70) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createUnit(p2, unitId, pos, facing, __wurst_stackPos50) 
	local stackTrace_tempReturn7 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = __wurst_safe_CreateUnit(p2, unitId, pos[1], pos[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function init_Vectors(__wurst_stackPos23) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_WeatherEffects(__wurst_stackPos40) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos16) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos71) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_InitHashtable()
	__wurst_InitHashtable()
	hashtable_compiletime = __wurst_InitHashtable()
	__wurst_InitHashtable()
	__wurst_SaveInteger(hashtable_compiletime, 1, -242600650, 0)
	__wurst_SaveInteger(hashtable_compiletime, 1, 1132341824, 1)
	__wurst_SaveInteger(hashtable_compiletime, 1, -647782241, 2)
	__wurst_SaveInteger(hashtable_compiletime, 1, -854572045, 3)
	__wurst_SaveInteger(hashtable_compiletime, 1, -680649701, 4)
	__wurst_SaveInteger(hashtable_compiletime, 1, -943650483, 5)
	__wurst_SaveInteger(hashtable_compiletime, 1, -671760605, 6)
	__wurst_SaveInteger(hashtable_compiletime, 1, 349230650, 7)
	__wurst_SaveInteger(hashtable_compiletime, 1, -1894922563, 8)
	__wurst_SaveInteger(hashtable_compiletime, 1, -1474492777, 9)
	__wurst_SaveInteger(hashtable_compiletime, 1, -1587459251, 10)
	__wurst_SaveInteger(hashtable_compiletime, 1, -1676716706, 11)
	__wurst_SaveInteger(hashtable_compiletime, 1, -1559655710, 12)
	__wurst_SaveInteger(hashtable_compiletime, 1, -1663695754, 13)
	__wurst_SaveInteger(hashtable_compiletime, 1, 597637742, 14)
	__wurst_SaveInteger(hashtable_compiletime, 1, 789744696, 15)
	__wurst_SaveStr(hashtable_compiletime, 2, 0, "")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function bridge_code__addAction_BasicWaves() 
	code__addAction_BasicWaves("via function reference BasicWaves, line 23")
end

function bridge_code__addAction_BasicWaves1() 
	code__addAction_BasicWaves1("via function reference BasicWaves, line 29")
end

function bridge_code__addAction_BasicWaves2() 
	code__addAction_BasicWaves2("via function reference BasicWaves, line 34")
end

function bridge_code__startPeriodic_GameTimer() 
	code__startPeriodic_GameTimer("via function reference GameTimer, line 15")
end

function bridge_initCompiletimeState_0() 
	initCompiletimeState_0("via ExecuteFunc in function initCompiletimeState")
end

function __wurst_safe_DisplayTimedTextToPlayer(toPlayer, x2, y2, duration, message) 
	if (toPlayer == nil) then
		return nil
	end
	DisplayTimedTextToPlayer(toPlayer, x2, y2, duration, message)
end

function __wurst_safe_GetLocationY(whichLocation) 
	if (whichLocation == nil) then
		return 0.0
	end
	return GetLocationY(whichLocation)
end

function __wurst_safe_GetLocationX(whichLocation1) 
	if (whichLocation1 == nil) then
		return 0.0
	end
	return GetLocationX(whichLocation1)
end

function __wurst_safe_GetUnitX(whichUnit1) 
	if (whichUnit1 == nil) then
		return 0.0
	end
	return GetUnitX(whichUnit1)
end

function __wurst_safe_GetUnitY(whichUnit2) 
	if (whichUnit2 == nil) then
		return 0.0
	end
	return GetUnitY(whichUnit2)
end

function __wurst_safe_TriggerEvaluate(whichTrigger3) 
	if (whichTrigger3 == nil) then
		return false
	end
	return TriggerEvaluate(whichTrigger3)
end

function __wurst_safe_TriggerExecute(whichTrigger4) 
	if (whichTrigger4 == nil) then
		return nil
	end
	TriggerExecute(whichTrigger4)
end

function __wurst_safe_TriggerExecuteBJ(trig, checkConditions) 
	if (trig == nil) then
		return false
	end
	return TriggerExecuteBJ(trig, checkConditions)
end

function __wurst_safe_TimerStart(whichTimer, timeout, periodic, handlerFunc) 
	if (whichTimer == nil) then
		return nil
	end
	TimerStart(whichTimer, timeout, periodic, handlerFunc)
end

function __wurst_safe_PauseTimer(whichTimer1) 
	if (whichTimer1 == nil) then
		return nil
	end
	PauseTimer(whichTimer1)
end

function __wurst_safe_DestroyTimer(whichTimer2) 
	if (whichTimer2 == nil) then
		return nil
	end
	DestroyTimer(whichTimer2)
end

function __wurst_safe_GetFloatGameState(whichFloatGameState) 
	if (whichFloatGameState == nil) then
		return 0.0
	end
	return GetFloatGameState(whichFloatGameState)
end

function __wurst_safe_StartSound(soundHandle) 
	if (soundHandle == nil) then
		return nil
	end
	StartSound(soundHandle)
end

function __wurst_safe_DistanceBetweenPoints(locA, locB) 
	if (locA == nil) then
		return 0.0
	end
	if (locB == nil) then
		return 0.0
	end
	return DistanceBetweenPoints(locA, locB)
end

function __wurst_safe_RemoveLocation(whichLocation2) 
	if (whichLocation2 == nil) then
		return nil
	end
	RemoveLocation(whichLocation2)
end

function __wurst_safe_TriggerRegisterTimerExpireEvent(whichTrigger5, t) 
	if (whichTrigger5 == nil) then
		return nil
	end
	if (t == nil) then
		return nil
	end
	return TriggerRegisterTimerExpireEvent(whichTrigger5, t)
end

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger2, whichPlayer9, whichPlayerUnitEvent1, filter1) 
	if (whichTrigger2 == nil) then
		return nil
	end
	if (whichPlayer9 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger2, whichPlayer9, whichPlayerUnitEvent1, filter1)
end

function __wurst_safe_TriggerRegisterGameStateEvent(whichTrigger6, whichState, opcode, limitval) 
	if (whichTrigger6 == nil) then
		return nil
	end
	if (whichState == nil) then
		return nil
	end
	if (opcode == nil) then
		return nil
	end
	return TriggerRegisterGameStateEvent(whichTrigger6, whichState, opcode, limitval)
end

function __wurst_safe_StopSound(soundHandle1, killWhenDone, fadeOut) 
	if (soundHandle1 == nil) then
		return nil
	end
	StopSound(soundHandle1, killWhenDone, fadeOut)
end

function __wurst_safe_GetItemTypeId(i5) 
	if (i5 == nil) then
		return 0
	end
	return GetItemTypeId(i5)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level)
end

function __wurst_safe_GroupAddUnit(whichGroup, whichUnit) 
	if (whichGroup == nil) then
		return false
	end
	if (whichUnit == nil) then
		return false
	end
	return GroupAddUnit(whichGroup, whichUnit)
end

function __wurst_GetEnumUnit() 
	if GetEnumUnit ~= nil then
	    local u = GetEnumUnit()
	    if u ~= nil then return u end
	end
	if __wurst_enumUnit_override ~= nil then return __wurst_enumUnit_override end
	return nil
end

function __wurst_ForGroup(whichGroup, callback) 
	if ForGroup == nil then return end
	local units = {}
	local count = 0
	local prev = __wurst_enumUnit_override
	ForGroup(whichGroup, function()
	    count = count + 1
	    units[count] = __wurst_GetEnumUnit()
	end)
	for i = 1, count do
	    __wurst_enumUnit_override = units[i]
	    callback()
	end
	__wurst_enumUnit_override = prev
end

function __wurst_safe_UnitSuspendDecay(whichUnit3, suspend) 
	if (whichUnit3 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit3, suspend)
end

function __wurst_safe_GetUnitState(whichUnit4, whichUnitState) 
	if (whichUnit4 == nil) then
		return 0.0
	end
	if (whichUnitState == nil) then
		return 0.0
	end
	return GetUnitState(whichUnit4, whichUnitState)
end

function __wurst_safe_SetUnitTimeScale(whichUnit5, timeScale) 
	if (whichUnit5 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit5, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit6, whichAnimation) 
	if (whichUnit6 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit6, whichAnimation)
end

function __wurst_safe_DestroyGroup(whichGroup3) 
	if (whichGroup3 == nil) then
		return nil
	end
	DestroyGroup(whichGroup3)
end

function __wurst_safe_TriggerAddAction(whichTrigger, actionFunc1) 
	if (whichTrigger == nil) then
		return nil
	end
	return TriggerAddAction(whichTrigger, actionFunc1)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit7) 
	if (whichUnit7 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit7)
end

function __wurst_safe_IsUnitType(whichUnit8, whichUnitType) 
	if (whichUnit8 == nil) then
		return false
	end
	if (whichUnitType == nil) then
		return false
	end
	return IsUnitType(whichUnit8, whichUnitType)
end

function __wurst_safe_GetUnitTypeId(whichUnit9) 
	if (whichUnit9 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit9)
end

function __wurst_safe_SetPlayerState(whichPlayer10, whichPlayerState, value7) 
	if (whichPlayer10 == nil) then
		return nil
	end
	if (whichPlayerState == nil) then
		return nil
	end
	SetPlayerState(whichPlayer10, whichPlayerState, value7)
end

function __wurst_safe_GetPlayerController(whichPlayer11) 
	if (whichPlayer11 == nil) then
		return nil
	end
	return GetPlayerController(whichPlayer11)
end

function __wurst_safe_GetOwningPlayer(whichUnit10) 
	if (whichUnit10 == nil) then
		return nil
	end
	return GetOwningPlayer(whichUnit10)
end

function __wurst_safe_CreateUnit(id, unitid, x, y, face) 
	if (id == nil) then
		return nil
	end
	return CreateUnit(id, unitid, x, y, face)
end

function __wurst_safe_AddItemToStock(whichUnit11, itemId, currentStock, stockMax) 
	if (whichUnit11 == nil) then
		return nil
	end
	AddItemToStock(whichUnit11, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit12, itemId1) 
	if (whichUnit12 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit12, itemId1)
end

function __wurst_safe_GetDestructableX(d) 
	if (d == nil) then
		return 0.0
	end
	return GetDestructableX(d)
end

function __wurst_safe_GetDestructableY(d1) 
	if (d1 == nil) then
		return 0.0
	end
	return GetDestructableY(d1)
end

function __wurst_safe_GetDestructableLoc(whichDestructable) 
	if (whichDestructable == nil) then
		return nil
	end
	return GetDestructableLoc(whichDestructable)
end

function __wurst_safe_ForceAddPlayer(whichForce, whichPlayer12) 
	if (whichForce == nil) then
		return nil
	end
	if (whichPlayer12 == nil) then
		return nil
	end
	ForceAddPlayer(whichForce, whichPlayer12)
end

function __wurst_safe_ForceEnumPlayers(whichForce1, filter2) 
	if (whichForce1 == nil) then
		return nil
	end
	ForceEnumPlayers(whichForce1, filter2)
end

function __wurst_safe_IsUnitAliveBJ(whichUnit13) 
	if (whichUnit13 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit13)
end

function __wurst_safe_SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value8) 
	if (sourcePlayer == nil) then
		return nil
	end
	if (otherPlayer == nil) then
		return nil
	end
	if (whichAllianceSetting == nil) then
		return nil
	end
	SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value8)
end

function __wurst_safe_SetUnitOwner(whichUnit14, whichPlayer13, changeColor) 
	if (whichUnit14 == nil) then
		return nil
	end
	if (whichPlayer13 == nil) then
		return nil
	end
	SetUnitOwner(whichUnit14, whichPlayer13, changeColor)
end

function __wurst_safe_PingMinimapForPlayer(whichPlayer14, x3, y3, duration1) 
	if (whichPlayer14 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer14, x3, y3, duration1)
end

function __wurst_safe_UnitAddIndicator(whichUnit15, red, green, blue, alpha) 
	if (whichUnit15 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit15, red, green, blue, alpha)
end

function __wurst_safe_RescueUnitBJ(whichUnit16, rescuer, changeColor1) 
	if (whichUnit16 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit16, rescuer, changeColor1)
end

function __wurst_safe_SetPlayerTechMaxAllowed(whichPlayer15, techid, maximum) 
	if (whichPlayer15 == nil) then
		return nil
	end
	SetPlayerTechMaxAllowed(whichPlayer15, techid, maximum)
end

function __wurst_InitHashtable() 
	return { __wurst_ht_int = {}, __wurst_ht_bool = {}, __wurst_ht_real = {}, __wurst_ht_str = {}, __wurst_ht_handle = {} }
end

function __wurst_SaveInteger(h, p, c, i) 
	local t = h.__wurst_ht_int
	if t == nil then t = {}; h.__wurst_ht_int = t end
	if not t[p] then t[p] = {} end t[p][c] = i
end

function __wurst_SaveStr(h, p, c, i) 
	local t = h.__wurst_ht_str
	if t == nil then t = {}; h.__wurst_ht_str = t end
	if not t[p] then t[p] = {} end t[p][c] = i
end

function __wurst_safe_GetPlayerSlotState(whichPlayer16) 
	if (whichPlayer16 == nil) then
		return nil
	end
	return GetPlayerSlotState(whichPlayer16)
end

function __wurst_safe_GetPlayerId(whichPlayer17) 
	if (whichPlayer17 == nil) then
		return 0
	end
	return GetPlayerId(whichPlayer17)
end

function __wurst_safe_SetPlayerColor(whichPlayer1, color) 
	if (whichPlayer1 == nil) then
		return nil
	end
	if (color == nil) then
		return nil
	end
	SetPlayerColor(whichPlayer1, color)
end

function __wurst_safe_GroupTargetOrder(whichGroup1, order1, targetWidget1) 
	if (whichGroup1 == nil) then
		return false
	end
	if (targetWidget1 == nil) then
		return false
	end
	return GroupTargetOrder(whichGroup1, order1, targetWidget1)
end

function __wurst_safe_SetPlayerTeam(whichPlayer18, whichTeam) 
	if (whichPlayer18 == nil) then
		return nil
	end
	SetPlayerTeam(whichPlayer18, whichTeam)
end

function __wurst_safe_Filter(func) 
	return Filter(func)
end

function __wurst_safe_GetPlayerTechResearched(whichPlayer19, techid1, specificonly) 
	if (whichPlayer19 == nil) then
		return false
	end
	return GetPlayerTechResearched(whichPlayer19, techid1, specificonly)
end

function __wurst_safe_GroupEnumUnitsOfType(whichGroup4, unitname, filter3) 
	if (whichGroup4 == nil) then
		return nil
	end
	GroupEnumUnitsOfType(whichGroup4, unitname, filter3)
end

function __wurst_safe_UpdateEachStockBuilding(iType, iLevel) 
	if (iType == nil) then
		return nil
	end
	UpdateEachStockBuilding(iType, iLevel)
end

function __wurst_safe_SetPlayerStartLocation(whichPlayer, startLocIndex) 
	if (whichPlayer == nil) then
		return nil
	end
	SetPlayerStartLocation(whichPlayer, startLocIndex)
end

function __wurst_safe_SetPlayerRacePreference(whichPlayer2, whichRacePreference) 
	if (whichPlayer2 == nil) then
		return nil
	end
	if (whichRacePreference == nil) then
		return nil
	end
	SetPlayerRacePreference(whichPlayer2, whichRacePreference)
end

function __wurst_safe_SetPlayerRaceSelectable(whichPlayer3, value4) 
	if (whichPlayer3 == nil) then
		return nil
	end
	SetPlayerRaceSelectable(whichPlayer3, value4)
end

function __wurst_safe_SetPlayerController(whichPlayer4, controlType) 
	if (whichPlayer4 == nil) then
		return nil
	end
	if (controlType == nil) then
		return nil
	end
	SetPlayerController(whichPlayer4, controlType)
end

function __wurst_safe_SetGamePlacement(whichPlacementType) 
	if (whichPlacementType == nil) then
		return nil
	end
	SetGamePlacement(whichPlacementType)
end

function __wurst_safe_SetPlayerSlotAvailable(whichPlayer5, control) 
	if (whichPlayer5 == nil) then
		return nil
	end
	if (control == nil) then
		return nil
	end
	SetPlayerSlotAvailable(whichPlayer5, control)
end

function __wurst_safe_TriggerRegisterPlayerChatEvent(whichTrigger1, whichPlayer8, chatMessageToDetect1, exactMatchOnly1) 
	if (whichTrigger1 == nil) then
		return nil
	end
	if (whichPlayer8 == nil) then
		return nil
	end
	return TriggerRegisterPlayerChatEvent(whichTrigger1, whichPlayer8, chatMessageToDetect1, exactMatchOnly1)
end

