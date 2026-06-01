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

gg_rct_Region_000 = nil
gg_rct_Region_001 = nil
gg_rct_Region_002 = nil
gg_trg_init = nil
gg_unit_htow_0001 = nil
gg_unit_hchs_0006 = nil
gg_unit_hwtw_0003 = nil
gg_unit_cp00_0008 = nil
Angle_RADTODEG = nil
BasicWaves_selectedTarget = nil
BasicWaves_footmen = nil
BasicWaves_spawn1 = nil
Basics_ANIMATION_PERIOD = nil
Colors_hexs = nil
Colors_decs = nil
Colors_COLOR_WHITE = nil
Colors_COLOR_BLACK = nil
Colors_COLOR_GOLD = nil
ControlPoint_controlPoints = nil
ControlPoint_controlPointValue = nil
GameTimer_currentTime = nil
Player_players = nil
String_charset = nil
String_numberset = nil
Table_ht = nil
TypeCasting_typecastdata = nil
heroSelect_hero1Region = nil
heroSelect_heroSpawnRegion = nil
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
	gg_rct_Region_000 = nil
	gg_rct_Region_001 = nil
	gg_rct_Region_002 = nil
	gg_trg_init = nil
	gg_unit_htow_0001 = nil
	gg_unit_hchs_0006 = nil
	gg_unit_hwtw_0003 = nil
	gg_unit_cp00_0008 = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitGlobals(__wurst_stackPos11) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer0(__wurst_stackPos12) 
	local p = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p = Player(0)
	gg_unit_htow_0001 = __wurst_safe_BlzCreateUnitWithSkin(p, 1752461175, 192.0, 0.0, 270.000, 1752461175)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos13) 
	local p1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p1 = Player(0)
	__wurst_safe_BlzCreateUnitWithSkin(p1, 1751871081, 291.0, 497.7, 90.000, 1751871081)
	__wurst_safe_BlzCreateUnitWithSkin(p1, 1751871081, 86.2, 491.1, 90.000, 1751871081)
	gg_unit_hchs_0006 = __wurst_safe_BlzCreateUnitWithSkin(p1, 1751345267, 128.2, -(2886.6), 181.708, 1751345267)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer1(__wurst_stackPos14) 
	local p2 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p2 = Player(1)
	gg_unit_hwtw_0003 = __wurst_safe_BlzCreateUnitWithSkin(p2, 1752659063, 192.0, 1152.0, 270.000, 1752659063)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostileBuildings(__wurst_stackPos15) 
	local p3 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p3 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	gg_unit_cp00_0008 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, 192.0, 704.0, 270.000, 1668296752)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassiveBuildings(__wurst_stackPos16) 
	local p4 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p4 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852010352, 128.0, -(3072.0), 270.000, 1852010352)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassive(__wurst_stackPos17) 
	local p5 = nil
	local u = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p5 = Player(PLAYER_NEUTRAL_PASSIVE)
	u = nil
	u = __wurst_safe_BlzCreateUnitWithSkin(p5, 1160785968, 132.7, -(3209.0), 90.000, 1160785968)
	__wurst_safe_SetUnitColor(u, ConvertPlayerColor(0))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos18) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateBuildingsForPlayer0("when calling CreateBuildingsForPlayer0 in war3map, line 124")
	CreateBuildingsForPlayer1("when calling CreateBuildingsForPlayer1 in war3map, line 125")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos19) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 130")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos20) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateNeutralHostileBuildings("when calling CreateNeutralHostileBuildings in war3map, line 135")
	CreateNeutralPassiveBuildings("when calling CreateNeutralPassiveBuildings in war3map, line 136")
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 137")
	CreateNeutralPassive("when calling CreateNeutralPassive in war3map, line 138")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 139")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateRegions(__wurst_stackPos21) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_rct_Region_000 = Rect(-(192.0), 2272.0, 256.0, 2624.0)
	gg_rct_Region_001 = Rect(32.0, -(3168.0), 224.0, -(2976.0))
	gg_rct_Region_002 = Rect(0.0, 128.0, 384.0, 448.0)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_init_Actions(__wurst_stackPos22) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitTrig_init(__wurst_stackPos23) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_init = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_init, function (...) 
			xpcall(function (...) 
					bridge_Trig_init_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomTriggers(__wurst_stackPos24) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	InitTrig_init("when calling InitTrig_init in war3map, line 180")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function RunInitializationTriggers(__wurst_stackPos25) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_ConditionalTriggerExecute(gg_trg_init)
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
	gg_rct_Region_000 = nil
	gg_rct_Region_001 = nil
	gg_rct_Region_002 = nil
	gg_trg_init = nil
	gg_unit_htow_0001 = nil
	gg_unit_hchs_0006 = nil
	gg_unit_hwtw_0003 = nil
	gg_unit_cp00_0008 = nil
	Angle_RADTODEG = 0.
	BasicWaves_selectedTarget = nil
	BasicWaves_footmen = nil
	BasicWaves_spawn1 = ({0., 0., })
	Basics_ANIMATION_PERIOD = 0.
	Colors_hexs = defaultArray(function () 
			return ""
		end)
	Colors_decs = nil
	Colors_COLOR_WHITE = ({0, 0, 0, 0, })
	Colors_COLOR_BLACK = ({0, 0, 0, 0, })
	Colors_COLOR_GOLD = ({0, 0, 0, 0, })
	ControlPoint_controlPoints = nil
	ControlPoint_controlPointValue = 0
	GameTimer_currentTime = 0.
	Player_players = defaultArray(function () 
			return nil
		end)
	String_charset = ""
	String_numberset = ""
	Table_ht = nil
	TypeCasting_typecastdata = nil
	heroSelect_hero1Region = nil
	heroSelect_heroSpawnRegion = nil
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
	CreateRegions("when calling CreateRegions in war3map, line 225")
	CreateAllUnits("when calling CreateAllUnits in war3map, line 226")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 228")
	InitCustomTriggers("when calling InitCustomTriggers in war3map, line 229")
	RunInitializationTriggers("when calling RunInitializationTriggers in war3map, line 230")
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
	  local __wurst_init_ok = xpcall(init_MagicFunctions, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package MagicFunctions.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Table, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Table.")
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
	  local __wurst_init_ok = xpcall(init_Force, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Force.")
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
	  local __wurst_init_ok = xpcall(init_Printing, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package Printing.")
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
	  local __wurst_init_ok = xpcall(init_HashList, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package HashList.")
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
	  local __wurst_init_ok = xpcall(init_TimerUtils, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package TimerUtils.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ClosureTimers, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package ClosureTimers.")
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
	  local __wurst_init_ok = xpcall(init_ControlPoint, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package ControlPoint.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_heroSelect, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package heroSelect.")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_winLoss, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package winLoss.")
	  end
	end
end

function config() 
	SetMapName("TRIGSTR_008")
	SetMapDescription("")
	SetPlayers(1)
	SetTeams(1)
	__wurst_safe_SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
	DefineStartLocation(0, 192.0, 0.0)
	InitCustomPlayerSlots()
	__wurst_safe_SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
	InitGenericPlayerSlots()
end

function init_AbilityIds(__wurst_stackPos27) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos30) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this10, __wurst_stackPos60) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this10[1] * Angle_RADTODEG)
end

function tupleCopy(t) 
	return ({t[1], t[2], })
end

function init_BasicWaves(__wurst_stackPos56) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	BasicWaves_selectedTarget = nil
	BasicWaves_footmen = CreateGroup()
	BasicWaves_spawn1 = tupleCopy(rect_getCenter(gg_rct_Region_000, "when calling getCenter in BasicWaves, line 12"))
	startingCameraPosition("when calling startingCameraPosition in BasicWaves, line 56")
	setupWaveSpawn("when calling setupWaveSpawn in BasicWaves, line 57")
	setupAttackPlayer("when calling setupAttackPlayer in BasicWaves, line 58")
	setupBuildingDeathTrigger("when calling setupBuildingDeathTrigger in BasicWaves, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createPlayerUnit(p6, unitID, number, unitGroup, __wurst_stackPos66) 
	local i = nil
	local temp = nil
	local u1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i = 0
	temp = (number - 1)
	while true do
		if (i > temp) then
			break
		end
		u1 = createUnit(p6, unitID, BasicWaves_spawn1, ({0., }), "when calling createUnit in BasicWaves, line 16")
		group_add(unitGroup, "when calling add in BasicWaves, line 17", u1)
		i = (i + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnWave(__wurst_stackPos69) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	createPlayerUnit(Player_players[1], 1751543663, 5, BasicWaves_footmen, "when calling createPlayerUnit in BasicWaves, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupWaveSpawn(__wurst_stackPos63) 
	local receiver = nil
	local receiver1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver, Player_players[0], "-spawn", true, "when calling registerPlayerChatEvent in BasicWaves, line 24")
	receiver1 = receiver
	trigger_addAction(receiver1, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves(__wurst_stackPos72) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 26")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAttackPlayer(__wurst_stackPos64) 
	local receiver2 = nil
	local receiver3 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	BasicWaves_selectedTarget = gg_unit_htow_0001
	receiver2 = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver2, Player_players[0], "-attack", true, "when calling registerPlayerChatEvent in BasicWaves, line 32")
	receiver3 = receiver2
	trigger_addAction(receiver3, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves1(__wurst_stackPos73) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 34")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupBuildingDeathTrigger(__wurst_stackPos65) 
	local receiver4 = nil
	local receiver5 = nil
	local receiver6 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver4 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver4, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in BasicWaves, line 38")
	receiver5 = receiver4
	trigger_addCondition(receiver5, __wurst_safe_Condition(function (...) 
			local tempRes = nil
			xpcall(function (...) 
					tempRes = bridge_code__Condition_addCondition_addAction_BasicWaves(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			return tempRes
		end), "when calling addCondition in BasicWaves, line 39")
	receiver6 = receiver5
	trigger_addAction(receiver6, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves2(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 40")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Condition_addCondition_addAction_BasicWaves(__wurst_stackPos77) 
	local stackTrace_tempReturn = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = (GetTriggerUnit() == gg_unit_hwtw_0003)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function code__addAction_BasicWaves2(__wurst_stackPos78) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 41")
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 42")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function startingCameraPosition(__wurst_stackPos62) 
	local u2 = ({0., 0., })
	wurst_stack_depth = (wurst_stack_depth + 1)
	u2 = ({__wurst_safe_GetUnitX(gg_unit_hchs_0006), __wurst_safe_GetUnitY(gg_unit_hchs_0006), })
	__wurst_safe_SetCameraPositionForPlayer(Player_players[0], u2[1], u2[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function waveTimer(__wurst_stackPos79) 
	local countdown = nil
	local d = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	countdown = CreateTimer()
	d = timer_createTimerDialog(countdown, "when calling createTimerDialog in BasicWaves, line 50")
	timerdialog_setTitle(d, "Next Wave:", "when calling setTitle in BasicWaves, line 51")
	timerdialog_display(d, true, "when calling display in BasicWaves, line 52")
	__wurst_safe_TimerStart(countdown, 10., true, function (...) 
			xpcall(function (...) 
					bridge_spawnWave(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Basics(__wurst_stackPos42) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureTimers(__wurst_stackPos54) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos40) 
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

function colorA_toColorString(this21, __wurst_stackPos83) 
	local stackTrace_tempReturn1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this21[4], "when calling toHex in Colors, line 194")), toHex(this21[1], "when calling toHex in Colors, line 194")), toHex(this21[2], "when calling toHex in Colors, line 194")), toHex(this21[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function toHex(number1, __wurst_stackPos85) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number1 // 16)
	secondpart = (number1 - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos84) 
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

function init_ControlPoint(__wurst_stackPos57) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	ControlPoint_controlPoints = CreateGroup()
	ControlPoint_controlPointValue = 30
	setupKillOwnership(gg_unit_cp00_0008, "when calling setupKillOwnership in ControlPoint, line 29")
	incomeTimer("when calling incomeTimer in ControlPoint, line 30")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function incomeTimer(__wurst_stackPos88) 
	local countdown1 = nil
	local d1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	countdown1 = CreateTimer()
	d1 = timer_createTimerDialog(countdown1, "when calling createTimerDialog in ControlPoint, line 7")
	timerdialog_setTitle(d1, "Next Income:", "when calling setTitle in ControlPoint, line 8")
	timerdialog_display(d1, true, "when calling display in ControlPoint, line 9")
	__wurst_safe_TimerStart(countdown1, 10., true, function (...) 
			xpcall(function (...) 
					bridge_income(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function income(__wurst_stackPos89) 
	local p8 = nil
	local points = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p8 = Player_players[0]
	points = group_size(ControlPoint_controlPoints, "when calling size in ControlPoint, line 14")
	player_addGold(p8, (points * ControlPoint_controlPointValue), "when calling addGold in ControlPoint, line 15")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupKillOwnership(u3, __wurst_stackPos87) 
	local receiver7 = nil
	local receiver8 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver7 = CreateTrigger()
	trigger_registerUnitEvent(receiver7, u3, EVENT_UNIT_DEATH, "when calling registerUnitEvent in ControlPoint, line 19")
	receiver8 = receiver7
	trigger_addAction(receiver8, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_ControlPoint(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ControlPoint, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_ControlPoint(__wurst_stackPos93) 
	local killer = nil
	local dead = nil
	local temp_tuple = ({0., 0., })
	local temp_tuple1 = ({0., 0., })
	local temp52 = nil
	local temp53 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	killer = GetKillingUnit()
	dead = GetTriggerUnit()
	if not((killer == nil)) then
		temp53 = unit_getOwner(killer, "when calling getOwner in ControlPoint, line 24")
		temp_tuple = tupleCopy(unit_getPos(dead, "when calling getPos in ControlPoint, line 24"))
		temp52 = temp_tuple[1]
		temp_tuple1 = tupleCopy(unit_getPos(dead, "when calling getPos in ControlPoint, line 24"))
		createUnit(temp53, 1668296752, ({temp52, temp_tuple1[2], }), ({0., }), "when calling createUnit in ControlPoint, line 24")
		group_add(ControlPoint_controlPoints, "when calling add in ControlPoint, line 25", dead)
		__wurst_safe_SetUnitOwner(dead, unit_getOwner(killer, "when calling getOwner in ControlPoint, line 26"), true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Destructable(__wurst_stackPos37) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos44) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos55) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Force(__wurst_stackPos35) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos48) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos43) 
	local receiver9 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver9 = CreateTimer()
	timer_start(receiver9, 100000., nil, "when calling start in GameTimer, line 7")
	timer_startPeriodic(CreateTimer(), Basics_ANIMATION_PERIOD, function (...) 
			xpcall(function (...) 
					bridge_code__startPeriodic_GameTimer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in GameTimer, line 15")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__startPeriodic_GameTimer(__wurst_stackPos98) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos49) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this12, __wurst_stackPos68, ...) 
	local i2 = nil
	local u4 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i2 = 0
	local __args = table.pack(...)
	for i3=1,__args.n do
	u4 = __args[i3]
	if __wurst_safe_GroupAddUnit(this12, u4) then
		i2 = (i2 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i2
end

function group_remove(this30, __wurst_stackPos99, ...) 
	local i4 = nil
	local u5 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i4 = 0
	local __args1 = table.pack(...)
	for i5=1,__args1.n do
	u5 = __args1[i5]
	if __wurst_safe_GroupRemoveUnit(this30, u5) then
		i4 = (i4 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i4
end

function group_size(this23, __wurst_stackPos90) 
	local stackTrace_tempReturn2 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = __wurst_safe_BlzGroupGetSize(this23)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function group_isEmpty(this31, __wurst_stackPos100) 
	local stackTrace_tempReturn3 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = not(group_hasNext(this31, "when calling hasNext in Group, line 70"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function group_hasNext(this32, __wurst_stackPos101) 
	local stackTrace_tempReturn4 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = not((__wurst_safe_FirstOfGroup(this32) == nil))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function group_targetOrder(this15, order, targetWidget, __wurst_stackPos74) 
	local stackTrace_tempReturn5 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = __wurst_safe_GroupTargetOrder(this15, order, targetWidget)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function init_HashList(__wurst_stackPos45) 
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

function init_Integer(__wurst_stackPos29) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos50) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos31) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Maths(__wurst_stackPos33) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Matrices(__wurst_stackPos46) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos38) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos102) 
	local i6 = nil
	local temp1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i6 = 0
	temp1 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i6 > temp1) then
			break
		end
		Player_players[i6] = Player(i6)
		i6 = (i6 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addGold(this24, val, __wurst_stackPos91) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_addState(this24, PLAYER_STATE_RESOURCE_GOLD, val, "when calling addState in Player, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addState(this33, state, val1, __wurst_stackPos103) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this33, state, (player_getState(this33, state, "when calling getState in Player, line 31") + val1))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_getState(this34, state1, __wurst_stackPos104) 
	local stackTrace_tempReturn6 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = __wurst_safe_GetPlayerState(this34, state1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function init_Playercolor(__wurst_stackPos39) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos41) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos47) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos28) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function rect_getCenter(this11, __wurst_stackPos61) 
	local stackTrace_tempReturn7 = ({0., 0., })
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = ({rect_getCenterX(this11, "when calling getCenterX in Rect, line 16"), rect_getCenterY(this11, "when calling getCenterY in Rect, line 16"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function rect_getCenterX(this35, __wurst_stackPos105) 
	local stackTrace_tempReturn8 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn8 = __wurst_safe_GetRectCenterX(this35)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn8
end

function rect_getCenterY(this36, __wurst_stackPos106) 
	local stackTrace_tempReturn9 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn9 = __wurst_safe_GetRectCenterY(this36)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn9
end

function init_String(__wurst_stackPos34) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this37, __wurst_stackPos107) 
	local stackTrace_tempReturn10 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn10 = StringLength(this37)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn10
end

function string_getHash(this22, __wurst_stackPos86) 
	local stackTrace_tempReturn11 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn11 = StringHash(this22)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn11
end

function init_Table(__wurst_stackPos32) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_createTimerDialog(this18, __wurst_stackPos80) 
	local stackTrace_tempReturn12 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn12 = __wurst_safe_CreateTimerDialog(this18)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn12
end

function timerdialog_setTitle(this19, title, __wurst_stackPos81) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogSetTitle(this19, title)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timerdialog_display(this20, display, __wurst_stackPos82) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogDisplay(this20, display)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TimerUtils(__wurst_stackPos53) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_new_Table("when calling new_Table in TimerUtils, line 13")
	HashMap_new_HashMap("when calling new_HashMap in TimerUtils, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_start(this28, time, timerCallBack, __wurst_stackPos96) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this28, time, false, timerCallBack)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_startPeriodic(this29, time1, timerCallBack1, __wurst_stackPos97) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this29, time1, true, timerCallBack1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_addAction(this14, actionFunc1, __wurst_stackPos71) 
	local stackTrace_tempReturn13 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn13 = __wurst_safe_TriggerAddAction(this14, actionFunc1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn13
end

function trigger_addCondition(this17, condition, __wurst_stackPos76) 
	local stackTrace_tempReturn14 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn14 = __wurst_safe_TriggerAddCondition(this17, condition)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn14
end

function trigger_registerEnterRegion(this38, whichRegion, filter1, __wurst_stackPos108) 
	local stackTrace_tempReturn15 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn15 = __wurst_safe_TriggerRegisterEnterRegion(this38, whichRegion, filter1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn15
end

function trigger_registerPlayerChatEvent(this13, whichPlayer6, chatMessageToDetect, exactMatchOnly, __wurst_stackPos70) 
	local stackTrace_tempReturn16 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn16 = __wurst_safe_TriggerRegisterPlayerChatEvent(this13, whichPlayer6, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn16
end

function trigger_registerPlayerUnitEvent(this16, whichPlayer7, whichPlayerUnitEvent, filter, __wurst_stackPos75) 
	local stackTrace_tempReturn17 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn17 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this16, whichPlayer7, whichPlayerUnitEvent, filter)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn17
end

function trigger_registerUnitEvent(this25, whichUnit3, whichEvent, __wurst_stackPos92) 
	local stackTrace_tempReturn18 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn18 = __wurst_safe_TriggerRegisterUnitEvent(this25, whichUnit3, whichEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn18
end

function init_TypeCasting(__wurst_stackPos52) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos109) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getTypeId(this39, __wurst_stackPos110) 
	local stackTrace_tempReturn19 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn19 = __wurst_safe_GetUnitTypeId(this39)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn19
end

function createUnit(p7, unitId, pos, facing, __wurst_stackPos67) 
	local stackTrace_tempReturn20 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn20 = __wurst_safe_CreateUnit(p7, unitId, pos[1], pos[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn20
end

function unit_getOwner(this26, __wurst_stackPos94) 
	local stackTrace_tempReturn21 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn21 = __wurst_safe_GetOwningPlayer(this26)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn21
end

function unit_getPos(this27, __wurst_stackPos95) 
	local stackTrace_tempReturn22 = ({0., 0., })
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn22 = ({unit_getX(this27, "when calling getX in Unit, line 249"), unit_getY(this27, "when calling getY in Unit, line 249"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn22
end

function unit_getX(this40, __wurst_stackPos111) 
	local stackTrace_tempReturn23 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn23 = __wurst_safe_GetUnitX(this40)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn23
end

function unit_getY(this41, __wurst_stackPos112) 
	local stackTrace_tempReturn24 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn24 = __wurst_safe_GetUnitY(this41)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn24
end

function unit_remove(this42, __wurst_stackPos113) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RemoveUnit(this42)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Vectors(__wurst_stackPos36) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_WeatherEffects(__wurst_stackPos51) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_heroSelect(__wurst_stackPos58) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	heroSelect_hero1Region = gg_rct_Region_001
	heroSelect_heroSpawnRegion = gg_rct_Region_002
	rect_getCenter(heroSelect_hero1Region, "when calling getCenter in heroSelect, line 6")
	setupRegionTrigger("when calling setupRegionTrigger in heroSelect, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupRegionTrigger(__wurst_stackPos114) 
	local reg = nil
	local receiver10 = nil
	local receiver11 = nil
	local receiver12 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	reg = CreateRegion()
	__wurst_safe_RegionAddRect(reg, heroSelect_hero1Region)
	receiver10 = CreateTrigger()
	trigger_registerEnterRegion(receiver10, reg, nil, "when calling registerEnterRegion in heroSelect, line 12")
	receiver11 = receiver10
	trigger_addCondition(receiver11, __wurst_safe_Condition(function (...) 
			local tempRes = nil
			xpcall(function (...) 
					tempRes = bridge_code__Condition_addCondition_addAction_heroSelect(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			return tempRes
		end), "when calling addCondition in heroSelect, line 13")
	receiver12 = receiver11
	trigger_addAction(receiver12, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_heroSelect(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in heroSelect, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Condition_addCondition_addAction_heroSelect(__wurst_stackPos115) 
	local stackTrace_tempReturn25 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn25 = (unit_getTypeId(GetTriggerUnit(), "when calling getTypeId in heroSelect, line 13") == 1751345267)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn25
end

function code__addAction_heroSelect(__wurst_stackPos116) 
	local u6 = nil
	local temp_tuple2 = ({0., 0., })
	local temp_tuple3 = ({0., 0., })
	local temp56 = nil
	local temp57 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	u6 = GetTriggerUnit()
	unit_remove(u6, "when calling remove in heroSelect, line 16")
	createUnit(Player_players[0], 1160785968, rect_getCenter(heroSelect_heroSpawnRegion, "when calling getCenter in heroSelect, line 17"), ({0., }), "when calling createUnit in heroSelect, line 17")
	temp56 = Player_players[0]
	temp_tuple2 = tupleCopy(rect_getCenter(heroSelect_heroSpawnRegion, "when calling getCenter in heroSelect, line 18"))
	temp57 = temp_tuple2[1]
	temp_tuple3 = tupleCopy(rect_getCenter(heroSelect_heroSpawnRegion, "when calling getCenter in heroSelect, line 18"))
	__wurst_safe_SetCameraPositionForPlayer(temp56, temp57, temp_tuple3[2])
	waveTimer("when calling waveTimer in heroSelect, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_winLoss(__wurst_stackPos59) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	setupDefeatCondition("when calling setupDefeatCondition in winLoss, line 26")
	setupVictoryCondition("when calling setupVictoryCondition in winLoss, line 27")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupVictoryCondition(__wurst_stackPos118) 
	local receiver13 = nil
	local receiver14 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver13 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver13, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 12")
	receiver14 = receiver13
	trigger_addAction(receiver14, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 13")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss(__wurst_stackPos119) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_remove(BasicWaves_footmen, "when calling remove in winLoss, line 14", GetTriggerUnit())
	if group_isEmpty(BasicWaves_footmen, "when calling isEmpty in winLoss, line 15") then
		__wurst_safe_CustomVictoryBJ(Player_players[0], true, true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupDefeatCondition(__wurst_stackPos117) 
	local receiver15 = nil
	local receiver16 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver15 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver15, Player_players[0], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 20")
	receiver16 = receiver15
	trigger_addAction(receiver16, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss1(__wurst_stackPos120) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (GetTriggerUnit() == gg_unit_htow_0001) then
		__wurst_safe_CustomDefeatBJ(Player_players[0], "You have been defeated!")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos26) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos121) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_InitHashtable()
	__wurst_InitHashtable()
	__wurst_InitHashtable()
	hashtable_compiletime = __wurst_InitHashtable()
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

function bridge_Trig_init_Actions() 
	Trig_init_Actions("via function reference war3map, line 175")
end

function bridge_code__addAction_BasicWaves() 
	code__addAction_BasicWaves("via function reference BasicWaves, line 25")
end

function bridge_code__addAction_BasicWaves1() 
	code__addAction_BasicWaves1("via function reference BasicWaves, line 33")
end

function bridge_code__Condition_addCondition_addAction_BasicWaves() 
	local bridge_return = nil
	bridge_return = code__Condition_addCondition_addAction_BasicWaves("via function reference BasicWaves, line 39")
	return bridge_return
end

function bridge_code__addAction_BasicWaves2() 
	code__addAction_BasicWaves2("via function reference BasicWaves, line 40")
end

function bridge_spawnWave() 
	spawnWave("via function reference BasicWaves, line 53")
end

function bridge_income() 
	income("via function reference ControlPoint, line 10")
end

function bridge_code__addAction_ControlPoint() 
	code__addAction_ControlPoint("via function reference ControlPoint, line 20")
end

function bridge_code__startPeriodic_GameTimer() 
	code__startPeriodic_GameTimer("via function reference GameTimer, line 15")
end

function bridge_code__Condition_addCondition_addAction_heroSelect() 
	local bridge_return1 = nil
	bridge_return1 = code__Condition_addCondition_addAction_heroSelect("via function reference heroSelect, line 13")
	return bridge_return1
end

function bridge_code__addAction_heroSelect() 
	code__addAction_heroSelect("via function reference heroSelect, line 14")
end

function bridge_code__addAction_winLoss() 
	code__addAction_winLoss("via function reference winLoss, line 13")
end

function bridge_code__addAction_winLoss1() 
	code__addAction_winLoss1("via function reference winLoss, line 21")
end

function bridge_initCompiletimeState_0() 
	initCompiletimeState_0("via ExecuteFunc in function initCompiletimeState")
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

function __wurst_safe_TriggerEvaluate(whichTrigger6) 
	if (whichTrigger6 == nil) then
		return false
	end
	return TriggerEvaluate(whichTrigger6)
end

function __wurst_safe_TriggerExecute(whichTrigger7) 
	if (whichTrigger7 == nil) then
		return nil
	end
	TriggerExecute(whichTrigger7)
end

function __wurst_safe_TriggerExecuteBJ(trig1, checkConditions) 
	if (trig1 == nil) then
		return false
	end
	return TriggerExecuteBJ(trig1, checkConditions)
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

function __wurst_safe_TriggerRegisterTimerExpireEvent(whichTrigger8, t1) 
	if (whichTrigger8 == nil) then
		return nil
	end
	if (t1 == nil) then
		return nil
	end
	return TriggerRegisterTimerExpireEvent(whichTrigger8, t1)
end

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger4, whichPlayer13, whichPlayerUnitEvent1, filter3) 
	if (whichTrigger4 == nil) then
		return nil
	end
	if (whichPlayer13 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger4, whichPlayer13, whichPlayerUnitEvent1, filter3)
end

function __wurst_safe_TriggerRegisterGameStateEvent(whichTrigger9, whichState, opcode, limitval) 
	if (whichTrigger9 == nil) then
		return nil
	end
	if (whichState == nil) then
		return nil
	end
	if (opcode == nil) then
		return nil
	end
	return TriggerRegisterGameStateEvent(whichTrigger9, whichState, opcode, limitval)
end

function __wurst_safe_TriggerRegisterEnterRegion(whichTrigger2, whichRegion1, filter2) 
	if (whichTrigger2 == nil) then
		return nil
	end
	if (whichRegion1 == nil) then
		return nil
	end
	return TriggerRegisterEnterRegion(whichTrigger2, whichRegion1, filter2)
end

function __wurst_safe_RegionAddRect(whichRegion2, r) 
	if (whichRegion2 == nil) then
		return nil
	end
	if (r == nil) then
		return nil
	end
	RegionAddRect(whichRegion2, r)
end

function __wurst_safe_StopSound(soundHandle1, killWhenDone, fadeOut) 
	if (soundHandle1 == nil) then
		return nil
	end
	StopSound(soundHandle1, killWhenDone, fadeOut)
end

function __wurst_safe_VolumeGroupSetVolume(vgroup, scale) 
	if (vgroup == nil) then
		return nil
	end
	VolumeGroupSetVolume(vgroup, scale)
end

function __wurst_safe_GetRectCenterX(whichRect) 
	if (whichRect == nil) then
		return 0.0
	end
	return GetRectCenterX(whichRect)
end

function __wurst_safe_GetRectCenterY(whichRect1) 
	if (whichRect1 == nil) then
		return 0.0
	end
	return GetRectCenterY(whichRect1)
end

function __wurst_safe_GetItemTypeId(i7) 
	if (i7 == nil) then
		return 0
	end
	return GetItemTypeId(i7)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level)
end

function __wurst_safe_GroupAddUnit(whichGroup, whichUnit5) 
	if (whichGroup == nil) then
		return false
	end
	if (whichUnit5 == nil) then
		return false
	end
	return GroupAddUnit(whichGroup, whichUnit5)
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

function __wurst_safe_UnitSuspendDecay(whichUnit11, suspend) 
	if (whichUnit11 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit11, suspend)
end

function __wurst_safe_GetUnitState(whichUnit12, whichUnitState) 
	if (whichUnit12 == nil) then
		return 0.0
	end
	if (whichUnitState == nil) then
		return 0.0
	end
	return GetUnitState(whichUnit12, whichUnitState)
end

function __wurst_safe_SetUnitTimeScale(whichUnit13, timeScale) 
	if (whichUnit13 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit13, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit14, whichAnimation) 
	if (whichUnit14 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit14, whichAnimation)
end

function __wurst_safe_DestroyGroup(whichGroup6) 
	if (whichGroup6 == nil) then
		return nil
	end
	DestroyGroup(whichGroup6)
end

function __wurst_safe_TriggerAddAction(whichTrigger, actionFunc) 
	if (whichTrigger == nil) then
		return nil
	end
	return TriggerAddAction(whichTrigger, actionFunc)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit15) 
	if (whichUnit15 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit15)
end

function __wurst_safe_IsUnitType(whichUnit16, whichUnitType) 
	if (whichUnit16 == nil) then
		return false
	end
	if (whichUnitType == nil) then
		return false
	end
	return IsUnitType(whichUnit16, whichUnitType)
end

function __wurst_safe_GetUnitTypeId(whichUnit8) 
	if (whichUnit8 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit8)
end

function __wurst_safe_FirstOfGroup(whichGroup3) 
	if (whichGroup3 == nil) then
		return nil
	end
	return FirstOfGroup(whichGroup3)
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

function __wurst_safe_GetPlayerController(whichPlayer16) 
	if (whichPlayer16 == nil) then
		return nil
	end
	return GetPlayerController(whichPlayer16)
end

function __wurst_safe_GetOwningPlayer(whichUnit9) 
	if (whichUnit9 == nil) then
		return nil
	end
	return GetOwningPlayer(whichUnit9)
end

function __wurst_safe_CreateUnit(id1, unitid1, x3, y3, face1) 
	if (id1 == nil) then
		return nil
	end
	return CreateUnit(id1, unitid1, x3, y3, face1)
end

function __wurst_safe_RemoveUnit(whichUnit10) 
	if (whichUnit10 == nil) then
		return nil
	end
	RemoveUnit(whichUnit10)
end

function __wurst_safe_AddItemToStock(whichUnit17, itemId, currentStock, stockMax) 
	if (whichUnit17 == nil) then
		return nil
	end
	AddItemToStock(whichUnit17, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit18, itemId1) 
	if (whichUnit18 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit18, itemId1)
end

function __wurst_safe_GetDestructableX(d2) 
	if (d2 == nil) then
		return 0.0
	end
	return GetDestructableX(d2)
end

function __wurst_safe_GetDestructableY(d3) 
	if (d3 == nil) then
		return 0.0
	end
	return GetDestructableY(d3)
end

function __wurst_safe_GetDestructableLoc(whichDestructable) 
	if (whichDestructable == nil) then
		return nil
	end
	return GetDestructableLoc(whichDestructable)
end

function __wurst_safe_GroupRemoveUnit(whichGroup1, whichUnit6) 
	if (whichGroup1 == nil) then
		return false
	end
	if (whichUnit6 == nil) then
		return false
	end
	return GroupRemoveUnit(whichGroup1, whichUnit6)
end

function __wurst_safe_ForceAddPlayer(whichForce, whichPlayer17) 
	if (whichForce == nil) then
		return nil
	end
	if (whichPlayer17 == nil) then
		return nil
	end
	ForceAddPlayer(whichForce, whichPlayer17)
end

function __wurst_safe_ForceEnumPlayers(whichForce1, filter4) 
	if (whichForce1 == nil) then
		return nil
	end
	ForceEnumPlayers(whichForce1, filter4)
end

function __wurst_safe_IsUnitAliveBJ(whichUnit19) 
	if (whichUnit19 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit19)
end

function __wurst_safe_DialogDisplay(whichPlayer18, whichDialog2, flag) 
	if (whichPlayer18 == nil) then
		return nil
	end
	if (whichDialog2 == nil) then
		return nil
	end
	DialogDisplay(whichPlayer18, whichDialog2, flag)
end

function __wurst_safe_DialogSetMessage(whichDialog3, messageText) 
	if (whichDialog3 == nil) then
		return nil
	end
	DialogSetMessage(whichDialog3, messageText)
end

function __wurst_safe_DialogAddButton(whichDialog4, buttonText, hotkey) 
	if (whichDialog4 == nil) then
		return nil
	end
	return DialogAddButton(whichDialog4, buttonText, hotkey)
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

function __wurst_safe_SetUnitOwner(whichUnit4, whichPlayer9, changeColor) 
	if (whichUnit4 == nil) then
		return nil
	end
	if (whichPlayer9 == nil) then
		return nil
	end
	SetUnitOwner(whichUnit4, whichPlayer9, changeColor)
end

function __wurst_safe_DisplayTimedTextFromPlayer(toPlayer, x4, y4, duration, message1) 
	if (toPlayer == nil) then
		return nil
	end
	DisplayTimedTextFromPlayer(toPlayer, x4, y4, duration, message1)
end

function __wurst_safe_TriggerRegisterDialogButtonEvent(whichTrigger10, whichButton) 
	if (whichTrigger10 == nil) then
		return nil
	end
	if (whichButton == nil) then
		return nil
	end
	return TriggerRegisterDialogButtonEvent(whichTrigger10, whichButton)
end

function __wurst_safe_StartSoundForPlayerBJ(whichPlayer19, soundHandle2) 
	if (whichPlayer19 == nil) then
		return nil
	end
	if (soundHandle2 == nil) then
		return nil
	end
	StartSoundForPlayerBJ(whichPlayer19, soundHandle2)
end

function __wurst_safe_AllowVictoryDefeat(gameResult) 
	if (gameResult == nil) then
		return false
	end
	return AllowVictoryDefeat(gameResult)
end

function __wurst_safe_RemovePlayer(whichPlayer20, gameResult1) 
	if (whichPlayer20 == nil) then
		return nil
	end
	if (gameResult1 == nil) then
		return nil
	end
	RemovePlayer(whichPlayer20, gameResult1)
end

function __wurst_safe_SetGameDifficulty(whichdifficulty) 
	if (whichdifficulty == nil) then
		return nil
	end
	SetGameDifficulty(whichdifficulty)
end

function __wurst_safe_VolumeGroupSetVolumeForPlayerBJ(whichPlayer21, vgroup1, scale1) 
	if (whichPlayer21 == nil) then
		return nil
	end
	if (vgroup1 == nil) then
		return nil
	end
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer21, vgroup1, scale1)
end

function __wurst_safe_CustomVictoryDialogBJ(whichPlayer22) 
	if (whichPlayer22 == nil) then
		return nil
	end
	CustomVictoryDialogBJ(whichPlayer22)
end

function __wurst_safe_CustomVictorySkipBJ(whichPlayer23) 
	if (whichPlayer23 == nil) then
		return nil
	end
	CustomVictorySkipBJ(whichPlayer23)
end

function __wurst_safe_CustomDefeatDialogBJ(whichPlayer24, message2) 
	if (whichPlayer24 == nil) then
		return nil
	end
	CustomDefeatDialogBJ(whichPlayer24, message2)
end

function __wurst_safe_CreateTimerDialog(t) 
	if (t == nil) then
		return nil
	end
	return CreateTimerDialog(t)
end

function __wurst_safe_TimerDialogSetTitle(whichDialog, title1) 
	if (whichDialog == nil) then
		return nil
	end
	TimerDialogSetTitle(whichDialog, title1)
end

function __wurst_safe_TimerDialogDisplay(whichDialog1, display1) 
	if (whichDialog1 == nil) then
		return nil
	end
	TimerDialogDisplay(whichDialog1, display1)
end

function __wurst_safe_PingMinimapForPlayer(whichPlayer25, x5, y5, duration1) 
	if (whichPlayer25 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer25, x5, y5, duration1)
end

function __wurst_safe_UnitAddIndicator(whichUnit20, red, green, blue, alpha) 
	if (whichUnit20 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit20, red, green, blue, alpha)
end

function __wurst_safe_RescueUnitBJ(whichUnit21, rescuer, changeColor1) 
	if (whichUnit21 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit21, rescuer, changeColor1)
end

function __wurst_safe_SetPlayerTechMaxAllowed(whichPlayer26, techid, maximum) 
	if (whichPlayer26 == nil) then
		return nil
	end
	SetPlayerTechMaxAllowed(whichPlayer26, techid, maximum)
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

function __wurst_safe_GetPlayerSlotState(whichPlayer27) 
	if (whichPlayer27 == nil) then
		return nil
	end
	return GetPlayerSlotState(whichPlayer27)
end

function __wurst_safe_GetPlayerState(whichPlayer11, whichPlayerState1) 
	if (whichPlayer11 == nil) then
		return 0
	end
	if (whichPlayerState1 == nil) then
		return 0
	end
	return GetPlayerState(whichPlayer11, whichPlayerState1)
end

function __wurst_safe_GetPlayerId(whichPlayer28) 
	if (whichPlayer28 == nil) then
		return 0
	end
	return GetPlayerId(whichPlayer28)
end

function __wurst_safe_SetUnitColor(whichUnit, whichColor) 
	if (whichUnit == nil) then
		return nil
	end
	if (whichColor == nil) then
		return nil
	end
	SetUnitColor(whichUnit, whichColor)
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

function __wurst_safe_GroupTargetOrder(whichGroup4, order1, targetWidget1) 
	if (whichGroup4 == nil) then
		return false
	end
	if (targetWidget1 == nil) then
		return false
	end
	return GroupTargetOrder(whichGroup4, order1, targetWidget1)
end

function __wurst_safe_SetCameraPositionForPlayer(whichPlayer8, x1, y1) 
	if (whichPlayer8 == nil) then
		return nil
	end
	SetCameraPositionForPlayer(whichPlayer8, x1, y1)
end

function __wurst_safe_SetPlayerTeam(whichPlayer29, whichTeam) 
	if (whichPlayer29 == nil) then
		return nil
	end
	SetPlayerTeam(whichPlayer29, whichTeam)
end

function __wurst_safe_Filter(func1) 
	return Filter(func1)
end

function __wurst_safe_GetPlayerTechResearched(whichPlayer30, techid1, specificonly) 
	if (whichPlayer30 == nil) then
		return false
	end
	return GetPlayerTechResearched(whichPlayer30, techid1, specificonly)
end

function __wurst_safe_GroupEnumUnitsOfType(whichGroup7, unitname, filter5) 
	if (whichGroup7 == nil) then
		return nil
	end
	GroupEnumUnitsOfType(whichGroup7, unitname, filter5)
end

function __wurst_safe_UpdateEachStockBuilding(iType, iLevel) 
	if (iType == nil) then
		return nil
	end
	UpdateEachStockBuilding(iType, iLevel)
end

function __wurst_safe_BlzCreateUnitWithSkin(id, unitid, x, y, face, skinId) 
	if (id == nil) then
		return nil
	end
	return BlzCreateUnitWithSkin(id, unitid, x, y, face, skinId)
end

function __wurst_safe_ConditionalTriggerExecute(trig) 
	if (trig == nil) then
		return nil
	end
	ConditionalTriggerExecute(trig)
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

function __wurst_safe_Condition(func) 
	return Condition(func)
end

function __wurst_safe_BlzGroupGetSize(whichGroup2) 
	if (whichGroup2 == nil) then
		return 0
	end
	return BlzGroupGetSize(whichGroup2)
end

function __wurst_safe_TriggerAddCondition(whichTrigger1, condition1) 
	if (whichTrigger1 == nil) then
		return nil
	end
	return TriggerAddCondition(whichTrigger1, condition1)
end

function __wurst_safe_TriggerRegisterPlayerChatEvent(whichTrigger3, whichPlayer12, chatMessageToDetect1, exactMatchOnly1) 
	if (whichTrigger3 == nil) then
		return nil
	end
	if (whichPlayer12 == nil) then
		return nil
	end
	return TriggerRegisterPlayerChatEvent(whichTrigger3, whichPlayer12, chatMessageToDetect1, exactMatchOnly1)
end

function __wurst_safe_TriggerRegisterUnitEvent(whichTrigger5, whichUnit7, whichEvent1) 
	if (whichTrigger5 == nil) then
		return nil
	end
	if (whichUnit7 == nil) then
		return nil
	end
	if (whichEvent1 == nil) then
		return nil
	end
	return TriggerRegisterUnitEvent(whichTrigger5, whichUnit7, whichEvent1)
end

function __wurst_safe_CustomVictoryBJ(whichPlayer14, showDialog, showScores) 
	if (whichPlayer14 == nil) then
		return nil
	end
	CustomVictoryBJ(whichPlayer14, showDialog, showScores)
end

function __wurst_safe_CustomDefeatBJ(whichPlayer15, message) 
	if (whichPlayer15 == nil) then
		return nil
	end
	CustomDefeatBJ(whichPlayer15, message)
end

