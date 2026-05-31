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

wurst_stack_depth = nil

function initGlobals(__wurst_stackPos) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitGlobals(__wurst_stackPos1) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos2) 
	local p = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p = Player(0)
	__wurst_safe_CreateUnit(p, 1214409837, -(126.6), 102.2, 228.600)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos3) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos4) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 47")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos5) 
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
	wurst_stack_depth = 0
	initGlobals("when calling initGlobals")
	SetCameraBounds((-(3328.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(3584.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(3328.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(3584.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("LordaeronSummerDay")
	SetAmbientNightSound("LordaeronSummerNight")
	SetMapMusic("Music", true, 0)
	CreateAllUnits("when calling CreateAllUnits in war3map, line 93")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 95")
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

function __wurst_safe_GetUnitX(whichUnit) 
	if (whichUnit == nil) then
		return 0.0
	end
	return GetUnitX(whichUnit)
end

function __wurst_safe_GetUnitY(whichUnit1) 
	if (whichUnit1 == nil) then
		return 0.0
	end
	return GetUnitY(whichUnit1)
end

function __wurst_safe_TriggerEvaluate(whichTrigger) 
	if (whichTrigger == nil) then
		return false
	end
	return TriggerEvaluate(whichTrigger)
end

function __wurst_safe_TriggerExecute(whichTrigger1) 
	if (whichTrigger1 == nil) then
		return nil
	end
	TriggerExecute(whichTrigger1)
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

function __wurst_safe_TriggerRegisterTimerExpireEvent(whichTrigger2, t) 
	if (whichTrigger2 == nil) then
		return nil
	end
	if (t == nil) then
		return nil
	end
	return TriggerRegisterTimerExpireEvent(whichTrigger2, t)
end

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger3, whichPlayer6, whichPlayerUnitEvent, filter) 
	if (whichTrigger3 == nil) then
		return nil
	end
	if (whichPlayer6 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger3, whichPlayer6, whichPlayerUnitEvent, filter)
end

function __wurst_safe_TriggerRegisterGameStateEvent(whichTrigger4, whichState, opcode, limitval) 
	if (whichTrigger4 == nil) then
		return nil
	end
	if (whichState == nil) then
		return nil
	end
	if (opcode == nil) then
		return nil
	end
	return TriggerRegisterGameStateEvent(whichTrigger4, whichState, opcode, limitval)
end

function __wurst_safe_StopSound(soundHandle1, killWhenDone, fadeOut) 
	if (soundHandle1 == nil) then
		return nil
	end
	StopSound(soundHandle1, killWhenDone, fadeOut)
end

function __wurst_safe_GetItemTypeId(i) 
	if (i == nil) then
		return 0
	end
	return GetItemTypeId(i)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level)
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

function __wurst_safe_UnitSuspendDecay(whichUnit2, suspend) 
	if (whichUnit2 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit2, suspend)
end

function __wurst_safe_GetUnitState(whichUnit3, whichUnitState) 
	if (whichUnit3 == nil) then
		return 0.0
	end
	if (whichUnitState == nil) then
		return 0.0
	end
	return GetUnitState(whichUnit3, whichUnitState)
end

function __wurst_safe_SetUnitTimeScale(whichUnit4, timeScale) 
	if (whichUnit4 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit4, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit5, whichAnimation) 
	if (whichUnit5 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit5, whichAnimation)
end

function __wurst_safe_DestroyGroup(whichGroup1) 
	if (whichGroup1 == nil) then
		return nil
	end
	DestroyGroup(whichGroup1)
end

function __wurst_safe_TriggerAddAction(whichTrigger5, actionFunc) 
	if (whichTrigger5 == nil) then
		return nil
	end
	return TriggerAddAction(whichTrigger5, actionFunc)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit6) 
	if (whichUnit6 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit6)
end

function __wurst_safe_IsUnitType(whichUnit7, whichUnitType) 
	if (whichUnit7 == nil) then
		return false
	end
	if (whichUnitType == nil) then
		return false
	end
	return IsUnitType(whichUnit7, whichUnitType)
end

function __wurst_safe_GetUnitTypeId(whichUnit8) 
	if (whichUnit8 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit8)
end

function __wurst_safe_SetPlayerState(whichPlayer7, whichPlayerState, value1) 
	if (whichPlayer7 == nil) then
		return nil
	end
	if (whichPlayerState == nil) then
		return nil
	end
	SetPlayerState(whichPlayer7, whichPlayerState, value1)
end

function __wurst_safe_GetPlayerController(whichPlayer8) 
	if (whichPlayer8 == nil) then
		return nil
	end
	return GetPlayerController(whichPlayer8)
end

function __wurst_safe_GetOwningPlayer(whichUnit9) 
	if (whichUnit9 == nil) then
		return nil
	end
	return GetOwningPlayer(whichUnit9)
end

function __wurst_safe_CreateUnit(id, unitid, x, y, face) 
	if (id == nil) then
		return nil
	end
	return CreateUnit(id, unitid, x, y, face)
end

function __wurst_safe_AddItemToStock(whichUnit10, itemId, currentStock, stockMax) 
	if (whichUnit10 == nil) then
		return nil
	end
	AddItemToStock(whichUnit10, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit11, itemId1) 
	if (whichUnit11 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit11, itemId1)
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

function __wurst_safe_ForceAddPlayer(whichForce, whichPlayer9) 
	if (whichForce == nil) then
		return nil
	end
	if (whichPlayer9 == nil) then
		return nil
	end
	ForceAddPlayer(whichForce, whichPlayer9)
end

function __wurst_safe_ForceEnumPlayers(whichForce1, filter1) 
	if (whichForce1 == nil) then
		return nil
	end
	ForceEnumPlayers(whichForce1, filter1)
end

function __wurst_safe_IsUnitAliveBJ(whichUnit12) 
	if (whichUnit12 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit12)
end

function __wurst_safe_SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value2) 
	if (sourcePlayer == nil) then
		return nil
	end
	if (otherPlayer == nil) then
		return nil
	end
	if (whichAllianceSetting == nil) then
		return nil
	end
	SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value2)
end

function __wurst_safe_SetUnitOwner(whichUnit13, whichPlayer10, changeColor) 
	if (whichUnit13 == nil) then
		return nil
	end
	if (whichPlayer10 == nil) then
		return nil
	end
	SetUnitOwner(whichUnit13, whichPlayer10, changeColor)
end

function __wurst_safe_PingMinimapForPlayer(whichPlayer11, x1, y1, duration) 
	if (whichPlayer11 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer11, x1, y1, duration)
end

function __wurst_safe_UnitAddIndicator(whichUnit14, red, green, blue, alpha) 
	if (whichUnit14 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit14, red, green, blue, alpha)
end

function __wurst_safe_RescueUnitBJ(whichUnit15, rescuer, changeColor1) 
	if (whichUnit15 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit15, rescuer, changeColor1)
end

function __wurst_safe_SetPlayerTechMaxAllowed(whichPlayer12, techid, maximum) 
	if (whichPlayer12 == nil) then
		return nil
	end
	SetPlayerTechMaxAllowed(whichPlayer12, techid, maximum)
end

function __wurst_safe_GetPlayerSlotState(whichPlayer13) 
	if (whichPlayer13 == nil) then
		return nil
	end
	return GetPlayerSlotState(whichPlayer13)
end

function __wurst_safe_GetPlayerId(whichPlayer14) 
	if (whichPlayer14 == nil) then
		return 0
	end
	return GetPlayerId(whichPlayer14)
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

function __wurst_safe_SetPlayerTeam(whichPlayer15, whichTeam) 
	if (whichPlayer15 == nil) then
		return nil
	end
	SetPlayerTeam(whichPlayer15, whichTeam)
end

function __wurst_safe_Filter(func) 
	return Filter(func)
end

function __wurst_safe_GetPlayerTechResearched(whichPlayer16, techid1, specificonly) 
	if (whichPlayer16 == nil) then
		return false
	end
	return GetPlayerTechResearched(whichPlayer16, techid1, specificonly)
end

function __wurst_safe_GroupEnumUnitsOfType(whichGroup2, unitname, filter2) 
	if (whichGroup2 == nil) then
		return nil
	end
	GroupEnumUnitsOfType(whichGroup2, unitname, filter2)
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

function __wurst_safe_SetPlayerRaceSelectable(whichPlayer3, value) 
	if (whichPlayer3 == nil) then
		return nil
	end
	SetPlayerRaceSelectable(whichPlayer3, value)
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

