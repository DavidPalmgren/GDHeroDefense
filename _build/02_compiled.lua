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

udg_townHall = nil
udg_watchTower = nil
udg_heroSelector = nil
udg_controlPoint_001 = nil
udg_controlPoint_002 = nil
udg_controlPoint_009 = nil
udg_controlPoint_010 = nil
udg_controlPoint_011 = nil
udg_controlPoint_012 = nil
udg_controlPoint_013 = nil
udg_controlPoint_014 = nil
udg_controlPoint_015 = nil
udg_controlPoint_003 = nil
udg_controlPoint_004 = nil
udg_controlPoint_005 = nil
udg_controlPoint_006 = nil
udg_controlPoint_007 = nil
udg_controlPoint_008 = nil
gg_rct_Region_000 = nil
gg_trg_init = nil
gg_unit_hwtw_0003 = nil
gg_unit_cp00_0008 = nil
gg_unit_cp00_0016 = nil
gg_unit_cp00_0017 = nil
gg_unit_cp00_0005 = nil
gg_unit_cp00_0018 = nil
gg_unit_cp00_0006 = nil
gg_unit_cp00_0019 = nil
gg_unit_cp00_0007 = nil
gg_unit_cp00_0015 = nil
gg_unit_cp00_0011 = nil
gg_unit_cp00_0014 = nil
gg_unit_cp00_0009 = nil
gg_unit_cp00_0012 = nil
gg_unit_cp00_0010 = nil
gg_unit_cp00_0013 = nil
gg_unit_etol_0001 = nil
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
Player_localPlayer = nil
Printing_DEBUG_MSG_DURATION = nil
String_charset = nil
String_numberset = nil
Table_ht = nil
TypeCasting_typecastdata = nil
hashtable_compiletime = nil
wurst_stack_depth = nil
GroupIterator = ({})
HashMap = ({})
Table = ({})

function GroupIterator:create() 
	local new_inst = ({GroupIterator_g=nil, GroupIterator_i=0, GroupIterator_n=0, })
	setmetatable(new_inst, ({__index=GroupIterator, }))
	return new_inst
end

function GroupIterator_GroupIterator_hasNext(this, __wurst_stackPos) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this.GroupIterator_i < this.GroupIterator_n)
end

function GroupIterator_GroupIterator_next(this1, __wurst_stackPos1) 
	local u = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	u = group_get(this1.GroupIterator_g, this1.GroupIterator_i, "when calling get in Group, line 128")
	this1.GroupIterator_i = (this1.GroupIterator_i + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return u
end

function GroupIterator_GroupIterator_close(this3, __wurst_stackPos3) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_destroyGroupIterator(this3, "when calling destroyGroupIterator in Group, line 133")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_destroyGroupIterator(this4, __wurst_stackPos4) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_onDestroy(this4, "when calling GroupIterator_onDestroy in Group, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_init(this6, __wurst_stackPos6) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	this6.GroupIterator_i = 0
	this6.GroupIterator_n = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_new_GroupIterator(source, __wurst_stackPos7) 
	local this7 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	this7 = GroupIterator:create()
	GroupIterator_construct_GroupIterator(this7, source, "when calling construct_GroupIterator in Group, line 119")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this7
end

function GroupIterator_construct_GroupIterator(this8, source1, __wurst_stackPos8) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_init(this8, "when calling GroupIterator_init in Group, line 119")
	this8.GroupIterator_g = CreateGroup()
	group_add(this8.GroupIterator_g, "when calling add in Group, line 121", source1)
	this8.GroupIterator_n = group_size(this8.GroupIterator_g, "when calling size in Group, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_onDestroy(this5, __wurst_stackPos5) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_clear(this5.GroupIterator_g, "when calling clear in Group, line 136")
	group_destr(this5.GroupIterator_g, "when calling destr in Group, line 137")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap:create1() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=HashMap, }))
	return new_inst
end

function HashMap_HashMap_init(this13, __wurst_stackPos13) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_new_HashMap(__wurst_stackPos14) 
	local this14 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	this14 = HashMap:create1()
	HashMap_construct_HashMap(this14, "when calling construct_HashMap in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this14
end

function HashMap_construct_HashMap(this15, __wurst_stackPos15) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_construct_Table(this15, "when calling construct_Table in HashMap, line 7")
	HashMap_HashMap_init(this15, "when calling HashMap_init in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table:create2() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=Table, }))
	return new_inst
end

function Table_Table_saveInt(this17, parentKey, value, __wurst_stackPos17) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveInt(Table_ht, __wurst_objectToIndex(this17), parentKey, value, "when calling saveInt in Table, line 44")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_saveString(this19, parentKey2, value2, __wurst_stackPos19) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveString(Table_ht, __wurst_objectToIndex(this19), parentKey2, value2, "when calling saveString in Table, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_init(this21, __wurst_stackPos21) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_new_Table(__wurst_stackPos22) 
	local this22 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	this22 = Table:create2()
	Table_construct_Table(this22, "when calling construct_Table in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this22
end

function Table_construct_Table(this16, __wurst_stackPos16) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_init(this16, "when calling Table_init in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initGlobals(__wurst_stackPos23) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_townHall = nil
	udg_watchTower = nil
	udg_heroSelector = nil
	udg_controlPoint_001 = nil
	udg_controlPoint_002 = nil
	udg_controlPoint_009 = nil
	udg_controlPoint_010 = nil
	udg_controlPoint_011 = nil
	udg_controlPoint_012 = nil
	udg_controlPoint_013 = nil
	udg_controlPoint_014 = nil
	udg_controlPoint_015 = nil
	udg_controlPoint_003 = nil
	udg_controlPoint_004 = nil
	udg_controlPoint_005 = nil
	udg_controlPoint_006 = nil
	udg_controlPoint_007 = nil
	udg_controlPoint_008 = nil
	gg_rct_Region_000 = nil
	gg_trg_init = nil
	gg_unit_hwtw_0003 = nil
	gg_unit_cp00_0008 = nil
	gg_unit_cp00_0016 = nil
	gg_unit_cp00_0017 = nil
	gg_unit_cp00_0005 = nil
	gg_unit_cp00_0018 = nil
	gg_unit_cp00_0006 = nil
	gg_unit_cp00_0019 = nil
	gg_unit_cp00_0007 = nil
	gg_unit_cp00_0015 = nil
	gg_unit_cp00_0011 = nil
	gg_unit_cp00_0014 = nil
	gg_unit_cp00_0009 = nil
	gg_unit_cp00_0012 = nil
	gg_unit_cp00_0010 = nil
	gg_unit_cp00_0013 = nil
	gg_unit_etol_0001 = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitGlobals(__wurst_stackPos24) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_townHall = nil
	udg_watchTower = nil
	udg_controlPoint_001 = nil
	udg_controlPoint_002 = nil
	udg_controlPoint_009 = nil
	udg_controlPoint_010 = nil
	udg_controlPoint_011 = nil
	udg_controlPoint_012 = nil
	udg_controlPoint_013 = nil
	udg_controlPoint_014 = nil
	udg_controlPoint_015 = nil
	udg_controlPoint_003 = nil
	udg_controlPoint_004 = nil
	udg_controlPoint_005 = nil
	udg_controlPoint_006 = nil
	udg_controlPoint_007 = nil
	udg_controlPoint_008 = nil
	CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer0(__wurst_stackPos25) 
	local p = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p = Player(0)
	gg_unit_etol_0001 = __wurst_safe_BlzCreateUnitWithSkin(p, 1702129516, 1472.0, -(128.0), 270.000, 1702129516)
	__wurst_safe_BlzCreateUnitWithSkin(p, 1701670775, 992.0, 32.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p, 1700884333, 1664.0, -(704.0), 270.000, 1700884333)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos26) 
	local p1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p1 = Player(0)
	__wurst_safe_BlzCreateUnitWithSkin(p1, 1751871081, 1316.0, -(786.8), 90.000, 1751871081)
	__wurst_safe_BlzCreateUnitWithSkin(p1, 1751871081, 858.8, -(778.3), 90.000, 1751871081)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer1(__wurst_stackPos27) 
	local p2 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p2 = Player(1)
	gg_unit_hwtw_0003 = __wurst_safe_BlzCreateUnitWithSkin(p2, 1752659063, -(4736.0), -(5760.0), 270.000, 1752659063)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostileBuildings(__wurst_stackPos28) 
	local p3 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p3 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	gg_unit_cp00_0005 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, 1088.0, -(3584.0), 270.000, 1668296752)
	gg_unit_cp00_0006 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, 5376.0, -(896.0), 270.000, 1668296752)
	gg_unit_cp00_0007 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, 3904.0, 3840.0, 270.000, 1668296752)
	gg_unit_cp00_0008 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, 1216.0, -(448.0), 270.000, 1668296752)
	gg_unit_cp00_0009 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(5760.0), 3328.0, 270.000, 1668296752)
	gg_unit_cp00_0010 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(6016.0), -(2496.0), 270.000, 1668296752)
	gg_unit_cp00_0011 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(2688.0), 3072.0, 270.000, 1668296752)
	gg_unit_cp00_0012 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(4544.0), 320.0, 270.000, 1668296752)
	gg_unit_cp00_0013 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(3392.0), -(3200.0), 270.000, 1668296752)
	gg_unit_cp00_0014 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(2240.0), 5376.0, 270.000, 1668296752)
	gg_unit_cp00_0015 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(320.0), 4352.0, 270.000, 1668296752)
	gg_unit_cp00_0016 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(1408.0), -(384.0), 270.000, 1668296752)
	gg_unit_cp00_0017 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, -(1280.0), -(3328.0), 270.000, 1668296752)
	gg_unit_cp00_0018 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, 3264.0, -(1216.0), 270.000, 1668296752)
	gg_unit_cp00_0019 = __wurst_safe_BlzCreateUnitWithSkin(p3, 1668296752, 1664.0, 3776.0, 270.000, 1668296752)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostile(__wurst_stackPos29) 
	local p4 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p4 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207724, 3231.4, -(876.6), 78.335, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207724, 3365.2, -(918.6), 34.883, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207731, 3240.0, -(1013.5), 213.724, 1852207731)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853059186, -(1049.9), -(3101.3), 45.652, 1853059186)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853059186, -(889.8), -(3235.0), 37.961, 1853059186)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853059952, -(1108.3), -(3467.5), 68.554, 1853059952)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853125236, 262.1, -(3852.5), 54.470, 1853125236)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060200, -(5759.6), -(2337.7), 41.299, 1853060200)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060204, -(5605.5), -(2353.4), 117.876, 1853060204)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060204, -(5633.8), -(2157.0), 200.770, 1853060204)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060204, -(5835.2), -(2095.7), 75.566, 1853060204)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060211, -(5460.5), -(2277.5), 187.268, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060211, -(5453.3), -(2092.9), 280.742, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060211, -(5603.0), -(1981.1), 109.405, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853060211, -(5849.6), -(2004.7), 145.079, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853320295, -(1483.1), -(688.7), 34.308, 1853320295)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853320308, -(1592.8), -(632.4), 30.080, 1853320308)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1853320308, -(1454.7), -(780.7), 19.573, 1853320308)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207713, 5541.8, -(926.4), 164.432, 1852207713)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207724, 5187.4, -(1075.3), 165.269, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207724, 5125.9, -(880.8), 181.638, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207724, 5135.2, -(682.5), 253.285, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852207717, 5312.7, -(723.8), 264.573, 1852207717)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852270642, 1184.2, -(3594.4), 143.208, 1852270642)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852270641, 1397.8, -(3429.9), 179.640, 1852270641)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852270641, 1033.7, -(3799.2), 110.286, 1852270641)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1852270641, 1335.9, -(3694.9), 153.903, 1852270641)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassiveBuildings(__wurst_stackPos30) 
	local p5 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	p5 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1852207665, 5312.0, -(512.0), 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1852207666, 5632.0, -(512.0), 270.000, 1852207666)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos31) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateBuildingsForPlayer0("when calling CreateBuildingsForPlayer0 in war3map, line 208")
	CreateBuildingsForPlayer1("when calling CreateBuildingsForPlayer1 in war3map, line 209")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos32) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 214")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos33) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateNeutralHostileBuildings("when calling CreateNeutralHostileBuildings in war3map, line 219")
	CreateNeutralPassiveBuildings("when calling CreateNeutralPassiveBuildings in war3map, line 220")
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 221")
	CreateNeutralHostile("when calling CreateNeutralHostile in war3map, line 222")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 223")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateRegions(__wurst_stackPos34) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_rct_Region_000 = Rect(-(4960.0), -(6336.0), -(4512.0), -(5984.0))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_init_Actions(__wurst_stackPos35) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_controlPoint_001 = gg_unit_cp00_0008
	udg_controlPoint_002 = gg_unit_cp00_0016
	udg_controlPoint_003 = gg_unit_cp00_0017
	udg_controlPoint_004 = gg_unit_cp00_0005
	udg_controlPoint_005 = gg_unit_cp00_0018
	udg_controlPoint_006 = gg_unit_cp00_0006
	udg_controlPoint_007 = gg_unit_cp00_0019
	udg_controlPoint_008 = gg_unit_cp00_0007
	udg_controlPoint_009 = gg_unit_cp00_0015
	udg_controlPoint_010 = gg_unit_cp00_0011
	udg_controlPoint_011 = gg_unit_cp00_0014
	udg_controlPoint_012 = gg_unit_cp00_0009
	udg_controlPoint_013 = gg_unit_cp00_0012
	udg_controlPoint_014 = gg_unit_cp00_0010
	udg_controlPoint_015 = gg_unit_cp00_0013
	udg_watchTower = gg_unit_hwtw_0003
	udg_townHall = gg_unit_etol_0001
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitTrig_init(__wurst_stackPos36) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_init = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_init, function (...) 
			xpcall(function (...) 
					bridge_Trig_init_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomTriggers(__wurst_stackPos37) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	InitTrig_init("when calling InitTrig_init in war3map, line 275")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function RunInitializationTriggers(__wurst_stackPos38) 
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
	udg_townHall = nil
	udg_watchTower = nil
	udg_heroSelector = nil
	udg_controlPoint_001 = nil
	udg_controlPoint_002 = nil
	udg_controlPoint_009 = nil
	udg_controlPoint_010 = nil
	udg_controlPoint_011 = nil
	udg_controlPoint_012 = nil
	udg_controlPoint_013 = nil
	udg_controlPoint_014 = nil
	udg_controlPoint_015 = nil
	udg_controlPoint_003 = nil
	udg_controlPoint_004 = nil
	udg_controlPoint_005 = nil
	udg_controlPoint_006 = nil
	udg_controlPoint_007 = nil
	udg_controlPoint_008 = nil
	gg_rct_Region_000 = nil
	gg_trg_init = nil
	gg_unit_hwtw_0003 = nil
	gg_unit_cp00_0008 = nil
	gg_unit_cp00_0016 = nil
	gg_unit_cp00_0017 = nil
	gg_unit_cp00_0005 = nil
	gg_unit_cp00_0018 = nil
	gg_unit_cp00_0006 = nil
	gg_unit_cp00_0019 = nil
	gg_unit_cp00_0007 = nil
	gg_unit_cp00_0015 = nil
	gg_unit_cp00_0011 = nil
	gg_unit_cp00_0014 = nil
	gg_unit_cp00_0009 = nil
	gg_unit_cp00_0012 = nil
	gg_unit_cp00_0010 = nil
	gg_unit_cp00_0013 = nil
	gg_unit_etol_0001 = nil
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
	Player_localPlayer = nil
	Printing_DEBUG_MSG_DURATION = 0.
	String_charset = ""
	String_numberset = ""
	Table_ht = nil
	TypeCasting_typecastdata = nil
	hashtable_compiletime = nil
	wurst_stack_depth = 0
	GroupIterator.GroupIterator_destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.__wurst_supertypes = ({[GroupIterator] = true, })
	GroupIterator.__typeId__ = 1
	HashMap.HashMap_saveInt = Table_Table_saveInt
	HashMap.HashMap_saveString = Table_Table_saveString
	HashMap.Table_Table_saveInt = Table_Table_saveInt
	HashMap.Table_Table_saveString = Table_Table_saveString
	HashMap.Table_saveInt = Table_Table_saveInt
	HashMap.Table_saveString = Table_Table_saveString
	HashMap.__wurst_supertypes = ({[HashMap] = true, [Table] = true, })
	HashMap.__typeId__ = 3
	Table.Table_Table_saveInt = Table_Table_saveInt
	Table.Table_Table_saveString = Table_Table_saveString
	Table.Table_saveInt = Table_Table_saveInt
	Table.Table_saveString = Table_Table_saveString
	Table.__wurst_supertypes = ({[Table] = true, })
	Table.__typeId__ = 2
	initGlobals("when calling initGlobals")
	initCompiletimeState("when calling initCompiletimeState in blizzard, line 1")
	SetCameraBounds((-(7424.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(7680.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(7424.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(7680.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("AshenvaleDay")
	SetAmbientNightSound("AshenvaleNight")
	SetMapMusic("Music", true, 0)
	CreateRegions("when calling CreateRegions in war3map, line 320")
	CreateAllUnits("when calling CreateAllUnits in war3map, line 321")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 323")
	InitCustomTriggers("when calling InitCustomTriggers in war3map, line 324")
	RunInitializationTriggers("when calling RunInitializationTriggers in war3map, line 325")
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
	  local __wurst_init_ok = xpcall(init_ControlPoint, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    BJDebugMsg("Could not initialize package ControlPoint.")
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
	DefineStartLocation(0, 1472.0, -(128.0))
	InitCustomPlayerSlots()
	__wurst_safe_SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
	InitGenericPlayerSlots()
end

function init_AbilityIds(__wurst_stackPos40) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos43) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this23, __wurst_stackPos70) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this23[1] * Angle_RADTODEG)
end

function tupleCopy(t) 
	return ({t[1], t[2], })
end

function init_BasicWaves(__wurst_stackPos67) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	BasicWaves_selectedTarget = nil
	BasicWaves_footmen = CreateGroup()
	BasicWaves_spawn1 = tupleCopy(rect_getCenter(gg_rct_Region_000, "when calling getCenter in BasicWaves, line 11"))
	startingCameraPosition("when calling startingCameraPosition in BasicWaves, line 55")
	setupWaveSpawn("when calling setupWaveSpawn in BasicWaves, line 56")
	setupAttackPlayer("when calling setupAttackPlayer in BasicWaves, line 57")
	setupBuildingDeathTrigger("when calling setupBuildingDeathTrigger in BasicWaves, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createPlayerUnit(p6, unitID, number, unitGroup, __wurst_stackPos76) 
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
		u1 = createUnit(p6, unitID, BasicWaves_spawn1, ({0., }), "when calling createUnit in BasicWaves, line 15")
		group_add1(unitGroup, "when calling add in BasicWaves, line 16", u1)
		i = (i + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnWave(__wurst_stackPos79) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	createPlayerUnit(Player_players[1], 1751543663, 1, BasicWaves_footmen, "when calling createPlayerUnit in BasicWaves, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupWaveSpawn(__wurst_stackPos73) 
	local receiver = nil
	local receiver1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver, Player_players[0], "-spawn", true, "when calling registerPlayerChatEvent in BasicWaves, line 23")
	receiver1 = receiver
	trigger_addAction(receiver1, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves(__wurst_stackPos82) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAttackPlayer(__wurst_stackPos74) 
	local receiver2 = nil
	local receiver3 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	BasicWaves_selectedTarget = udg_townHall
	receiver2 = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver2, Player_players[0], "-attack", true, "when calling registerPlayerChatEvent in BasicWaves, line 30")
	receiver3 = receiver2
	trigger_addAction(receiver3, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 31")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves1(__wurst_stackPos83) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 32")
	print1(group_size(BasicWaves_footmen, "when calling size in BasicWaves, line 33"), "when calling print in BasicWaves, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupBuildingDeathTrigger(__wurst_stackPos75) 
	local receiver4 = nil
	local receiver5 = nil
	local receiver6 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver4 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver4, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in BasicWaves, line 37")
	receiver5 = receiver4
	trigger_addCondition(receiver5, __wurst_safe_Condition(function (...) 
			local tempRes = nil
			xpcall(function (...) 
					tempRes = bridge_code__Condition_addCondition_addAction_BasicWaves(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			return tempRes
		end), "when calling addCondition in BasicWaves, line 38")
	receiver6 = receiver5
	trigger_addAction(receiver6, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves2(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 39")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Condition_addCondition_addAction_BasicWaves(__wurst_stackPos88) 
	local stackTrace_tempReturn = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = (GetTriggerUnit() == udg_watchTower)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function code__addAction_BasicWaves2(__wurst_stackPos89) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 40")
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function startingCameraPosition(__wurst_stackPos72) 
	local u2 = ({0., 0., })
	wurst_stack_depth = (wurst_stack_depth + 1)
	u2 = ({__wurst_safe_GetUnitX(udg_heroSelector), __wurst_safe_GetUnitY(udg_heroSelector), })
	__wurst_safe_SetCameraPositionForPlayer(Player_players[0], u2[1], u2[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Basics(__wurst_stackPos51) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos59) 
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

function colorA_toColorString(this31, __wurst_stackPos90) 
	local stackTrace_tempReturn1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this31[4], "when calling toHex in Colors, line 194")), toHex(this31[1], "when calling toHex in Colors, line 194")), toHex(this31[2], "when calling toHex in Colors, line 194")), toHex(this31[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function toHex(number1, __wurst_stackPos92) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number1 // 16)
	secondpart = (number1 - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos91) 
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

function init_ControlPoint(__wurst_stackPos68) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	ControlPoint_controlPoints = CreateGroup()
	ControlPoint_controlPointValue = 30
	setupAllControlPoints("when calling setupAllControlPoints in ControlPoint, line 55")
	incomeTimer("when calling incomeTimer in ControlPoint, line 56")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function incomeTimer(__wurst_stackPos95) 
	local countdown = nil
	local d = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	countdown = CreateTimer()
	d = timer_createTimerDialog(countdown, "when calling createTimerDialog in ControlPoint, line 8")
	timerdialog_setTitle(d, "Next Income:", "when calling setTitle in ControlPoint, line 9")
	timerdialog_display(d, true, "when calling display in ControlPoint, line 10")
	__wurst_safe_TimerStart(countdown, 10., true, function (...) 
			xpcall(function (...) 
					bridge_income(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function income(__wurst_stackPos99) 
	local iterator = nil
	local u3 = nil
	local p8 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterator = group_iterator(ControlPoint_controlPoints, "when calling iterator in ControlPoint, line 14")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator, "when calling hasNext in ControlPoint, line 14")) then
			break
		end
		u3 = GroupIterator_GroupIterator_next(iterator, "when calling next in ControlPoint, line 14")
		p8 = unit_getOwner(u3, "when calling getOwner in ControlPoint, line 15")
		player_addGold(p8, ControlPoint_controlPointValue, "when calling addGold in ControlPoint, line 16")
	end
	GroupIterator_GroupIterator_close(iterator, "when calling close in ControlPoint, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupCaptureOnHalf(target, __wurst_stackPos103) 
	local receiver7 = nil
	local receiver8 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver7 = CreateTrigger()
	trigger_registerUnitEvent(receiver7, target, EVENT_UNIT_DAMAGED, "when calling registerUnitEvent in ControlPoint, line 20")
	receiver8 = receiver7
	trigger_addAction(receiver8, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_ControlPoint(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ControlPoint, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_ControlPoint(__wurst_stackPos105) 
	local u4 = nil
	local attacker = nil
	local hp = nil
	local maxHp = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	u4 = GetTriggerUnit()
	attacker = GetEventDamageSource()
	hp = __wurst_safe_GetUnitState(u4, UNIT_STATE_LIFE)
	maxHp = __wurst_safe_GetUnitState(u4, UNIT_STATE_MAX_LIFE)
	if ((hp / maxHp) <= 0.5) then
		group_remove(ControlPoint_controlPoints, "when calling remove in ControlPoint, line 27", u4)
		__wurst_safe_SetUnitOwner(u4, unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 28"), true)
		__wurst_safe_SetUnitState(u4, UNIT_STATE_LIFE, maxHp)
		group_add1(ControlPoint_controlPoints, "when calling add in ControlPoint, line 30", u4)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAllControlPoints(__wurst_stackPos94) 
	local u5 = nil
	local iterator1 = nil
	local cp = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	u5 = CreateGroup()
	group_add1(u5, "when calling add in ControlPoint, line 34", udg_controlPoint_001, udg_controlPoint_002, udg_controlPoint_003, udg_controlPoint_004, udg_controlPoint_005, udg_controlPoint_006, udg_controlPoint_007, udg_controlPoint_008, udg_controlPoint_009, udg_controlPoint_010, udg_controlPoint_011, udg_controlPoint_012, udg_controlPoint_013, udg_controlPoint_014, udg_controlPoint_015)
	iterator1 = group_iterator(u5, "when calling iterator in ControlPoint, line 50")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator1, "when calling hasNext in ControlPoint, line 50")) then
			break
		end
		cp = GroupIterator_GroupIterator_next(iterator1, "when calling next in ControlPoint, line 50")
		setupCaptureOnHalf(cp, "when calling setupCaptureOnHalf in ControlPoint, line 51")
		print2("Control Point set up.", "when calling print in ControlPoint, line 52")
	end
	GroupIterator_GroupIterator_close(iterator1, "when calling close in ControlPoint, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Destructable(__wurst_stackPos47) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos53) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos66) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Force(__wurst_stackPos57) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos60) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos52) 
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

function code__startPeriodic_GameTimer(__wurst_stackPos110) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos61) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this9, __wurst_stackPos9, ...) 
	local i2 = nil
	local g = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i2 = 0
	local __args = table.pack(...)
	for i3=1,__args.n do
	g = __args[i3]
	i2 = (i2 + __wurst_safe_BlzGroupAddGroupFast(g, this9))
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i2
end

function group_clear(this11, __wurst_stackPos11) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupClear(this11)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add1(this25, __wurst_stackPos78, ...) 
	local i4 = nil
	local u6 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i4 = 0
	local __args1 = table.pack(...)
	for i5=1,__args1.n do
	u6 = __args1[i5]
	if __wurst_safe_GroupAddUnit(this25, u6) then
		i4 = (i4 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i4
end

function group_remove(this40, __wurst_stackPos106, ...) 
	local i6 = nil
	local u7 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i6 = 0
	local __args2 = table.pack(...)
	for i7=1,__args2.n do
	u7 = __args2[i7]
	if __wurst_safe_GroupRemoveUnit(this40, u7) then
		i6 = (i6 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i6
end

function group_destr(this12, __wurst_stackPos12) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyGroup(this12)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_size(this10, __wurst_stackPos10) 
	local stackTrace_tempReturn2 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = __wurst_safe_BlzGroupGetSize(this10)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function group_isEmpty(this43, __wurst_stackPos111) 
	local stackTrace_tempReturn3 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = not(group_hasNext(this43, "when calling hasNext in Group, line 70"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function group_hasNext(this44, __wurst_stackPos112) 
	local stackTrace_tempReturn4 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = not((__wurst_safe_FirstOfGroup(this44) == nil))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function group_get(this2, index, __wurst_stackPos2) 
	local stackTrace_tempReturn5 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = __wurst_safe_BlzGroupUnitAt(this2, index)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function group_targetOrder(this28, order, targetWidget, __wurst_stackPos84) 
	local stackTrace_tempReturn6 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = __wurst_safe_GroupTargetOrder(this28, order, targetWidget)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function group_iterator(this36, __wurst_stackPos100) 
	local stackTrace_tempReturn7 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = GroupIterator_new_GroupIterator(this36, "when calling new_GroupIterator in Group, line 141")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function init_HashList(__wurst_stackPos65) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveInt(this18, parentKey1, childKey, value1, __wurst_stackPos18) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveInteger(this18, parentKey1, childKey, value1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveString(this20, parentKey3, childKey1, value3, __wurst_stackPos20) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveStr(this20, parentKey3, childKey1, value3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Integer(__wurst_stackPos42) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos62) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos50) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Maths(__wurst_stackPos44) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Matrices(__wurst_stackPos54) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos48) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Player_localPlayer = GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos113) 
	local i8 = nil
	local temp1 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	i8 = 0
	temp1 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i8 > temp1) then
			break
		end
		Player_players[i8] = Player(i8)
		i8 = (i8 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setGold(this45, val1, __wurst_stackPos114) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this45, PLAYER_STATE_RESOURCE_GOLD, val1, "when calling setState in Player, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setState(this46, state, val2, __wurst_stackPos115) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this46, state, val2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addGold(this38, val, __wurst_stackPos102) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_addState(this38, PLAYER_STATE_RESOURCE_GOLD, val, "when calling addState in Player, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addState(this47, state1, val3, __wurst_stackPos116) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this47, state1, (player_getState(this47, state1, "when calling getState in Player, line 31") + val3))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setLumber(this49, val4, __wurst_stackPos118) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this49, PLAYER_STATE_RESOURCE_LUMBER, val4, "when calling setState in Player, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_getState(this48, state2, __wurst_stackPos117) 
	local stackTrace_tempReturn8 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn8 = __wurst_safe_GetPlayerState(this48, state2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn8
end

function init_Playercolor(__wurst_stackPos58) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos49) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Printing_DEBUG_MSG_DURATION = 45.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print2(msg1, __wurst_stackPos107) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print1(msg, __wurst_stackPos85) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	print2(tostring(msg), "when calling print in Printing, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos55) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos41) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function rect_getCenter(this24, __wurst_stackPos71) 
	local stackTrace_tempReturn9 = ({0., 0., })
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn9 = ({rect_getCenterX(this24, "when calling getCenterX in Rect, line 16"), rect_getCenterY(this24, "when calling getCenterY in Rect, line 16"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn9
end

function rect_getCenterX(this50, __wurst_stackPos119) 
	local stackTrace_tempReturn10 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn10 = __wurst_safe_GetRectCenterX(this50)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn10
end

function rect_getCenterY(this51, __wurst_stackPos120) 
	local stackTrace_tempReturn11 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn11 = __wurst_safe_GetRectCenterY(this51)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn11
end

function init_String(__wurst_stackPos45) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this52, __wurst_stackPos121) 
	local stackTrace_tempReturn12 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn12 = StringLength(this52)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn12
end

function string_getHash(this32, __wurst_stackPos93) 
	local stackTrace_tempReturn13 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn13 = StringHash(this32)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn13
end

function init_Table(__wurst_stackPos56) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_createTimerDialog(this33, __wurst_stackPos96) 
	local stackTrace_tempReturn14 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn14 = __wurst_safe_CreateTimerDialog(this33)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn14
end

function timerdialog_setTitle(this34, title, __wurst_stackPos97) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogSetTitle(this34, title)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timerdialog_display(this35, display, __wurst_stackPos98) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogDisplay(this35, display)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_start(this41, time, timerCallBack, __wurst_stackPos108) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this41, time, false, timerCallBack)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_startPeriodic(this42, time1, timerCallBack1, __wurst_stackPos109) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this42, time1, true, timerCallBack1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_addAction(this27, actionFunc1, __wurst_stackPos81) 
	local stackTrace_tempReturn15 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn15 = __wurst_safe_TriggerAddAction(this27, actionFunc1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn15
end

function trigger_addCondition(this30, condition, __wurst_stackPos87) 
	local stackTrace_tempReturn16 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn16 = __wurst_safe_TriggerAddCondition(this30, condition)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn16
end

function trigger_registerPlayerChatEvent(this26, whichPlayer6, chatMessageToDetect, exactMatchOnly, __wurst_stackPos80) 
	local stackTrace_tempReturn17 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn17 = __wurst_safe_TriggerRegisterPlayerChatEvent(this26, whichPlayer6, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn17
end

function trigger_registerPlayerUnitEvent(this29, whichPlayer7, whichPlayerUnitEvent, filter, __wurst_stackPos86) 
	local stackTrace_tempReturn18 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn18 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this29, whichPlayer7, whichPlayerUnitEvent, filter)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn18
end

function trigger_registerUnitEvent(this39, whichUnit2, whichEvent, __wurst_stackPos104) 
	local stackTrace_tempReturn19 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn19 = __wurst_safe_TriggerRegisterUnitEvent(this39, whichUnit2, whichEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn19
end

function init_TypeCasting(__wurst_stackPos64) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos122) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createUnit(p7, unitId, pos, facing, __wurst_stackPos77) 
	local stackTrace_tempReturn20 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn20 = __wurst_safe_CreateUnit(p7, unitId, pos[1], pos[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn20
end

function unit_getOwner(this37, __wurst_stackPos101) 
	local stackTrace_tempReturn21 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn21 = __wurst_safe_GetOwningPlayer(this37)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn21
end

function init_Vectors(__wurst_stackPos46) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_WeatherEffects(__wurst_stackPos63) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_winLoss(__wurst_stackPos69) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	setupDefeatCondition("when calling setupDefeatCondition in winLoss, line 26")
	setupVictoryCondition("when calling setupVictoryCondition in winLoss, line 27")
	player_setGold(Player_players[0], 1000, "when calling setGold in winLoss, line 28")
	player_setLumber(Player_players[0], 1000, "when calling setLumber in winLoss, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupVictoryCondition(__wurst_stackPos124) 
	local receiver10 = nil
	local receiver11 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver10 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver10, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 12")
	receiver11 = receiver10
	trigger_addAction(receiver11, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 13")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss(__wurst_stackPos125) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_remove(BasicWaves_footmen, "when calling remove in winLoss, line 14", GetTriggerUnit())
	if group_isEmpty(BasicWaves_footmen, "when calling isEmpty in winLoss, line 15") then
		__wurst_safe_CustomVictoryBJ(Player_players[0], true, true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupDefeatCondition(__wurst_stackPos123) 
	local receiver12 = nil
	local receiver13 = nil
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver12 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver12, Player_players[0], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 20")
	receiver13 = receiver12
	trigger_addAction(receiver13, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() BJDebugMsg(tostring(err)) end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss1(__wurst_stackPos126) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (GetTriggerUnit() == udg_townHall) then
		__wurst_safe_CustomDefeatBJ(Player_players[0], "You have been defeated!")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos39) 
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos127) 
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

function bridge_Trig_init_Actions() 
	Trig_init_Actions("via function reference war3map, line 270")
end

function bridge_code__addAction_BasicWaves() 
	code__addAction_BasicWaves("via function reference BasicWaves, line 24")
end

function bridge_code__addAction_BasicWaves1() 
	code__addAction_BasicWaves1("via function reference BasicWaves, line 31")
end

function bridge_code__Condition_addCondition_addAction_BasicWaves() 
	local bridge_return = nil
	bridge_return = code__Condition_addCondition_addAction_BasicWaves("via function reference BasicWaves, line 38")
	return bridge_return
end

function bridge_code__addAction_BasicWaves2() 
	code__addAction_BasicWaves2("via function reference BasicWaves, line 39")
end

function bridge_income() 
	income("via function reference ControlPoint, line 11")
end

function bridge_code__addAction_ControlPoint() 
	code__addAction_ControlPoint("via function reference ControlPoint, line 21")
end

function bridge_code__startPeriodic_GameTimer() 
	code__startPeriodic_GameTimer("via function reference GameTimer, line 15")
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

function __wurst_safe_DisplayTimedTextToPlayer(toPlayer, x3, y3, duration, message) 
	if (toPlayer == nil) then
		return nil
	end
	DisplayTimedTextToPlayer(toPlayer, x3, y3, duration, message)
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

function __wurst_safe_TriggerEvaluate(whichTrigger5) 
	if (whichTrigger5 == nil) then
		return false
	end
	return TriggerEvaluate(whichTrigger5)
end

function __wurst_safe_TriggerExecute(whichTrigger6) 
	if (whichTrigger6 == nil) then
		return nil
	end
	TriggerExecute(whichTrigger6)
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

function __wurst_safe_TriggerRegisterTimerExpireEvent(whichTrigger7, t1) 
	if (whichTrigger7 == nil) then
		return nil
	end
	if (t1 == nil) then
		return nil
	end
	return TriggerRegisterTimerExpireEvent(whichTrigger7, t1)
end

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger3, whichPlayer13, whichPlayerUnitEvent1, filter1) 
	if (whichTrigger3 == nil) then
		return nil
	end
	if (whichPlayer13 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger3, whichPlayer13, whichPlayerUnitEvent1, filter1)
end

function __wurst_safe_TriggerRegisterGameStateEvent(whichTrigger8, whichState, opcode, limitval) 
	if (whichTrigger8 == nil) then
		return nil
	end
	if (whichState == nil) then
		return nil
	end
	if (opcode == nil) then
		return nil
	end
	return TriggerRegisterGameStateEvent(whichTrigger8, whichState, opcode, limitval)
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

function __wurst_safe_GetItemTypeId(i9) 
	if (i9 == nil) then
		return 0
	end
	return GetItemTypeId(i9)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level)
end

function __wurst_safe_GroupClear(whichGroup1) 
	if (whichGroup1 == nil) then
		return nil
	end
	GroupClear(whichGroup1)
end

function __wurst_safe_GroupAddUnit(whichGroup2, whichUnit6) 
	if (whichGroup2 == nil) then
		return false
	end
	if (whichUnit6 == nil) then
		return false
	end
	return GroupAddUnit(whichGroup2, whichUnit6)
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

function __wurst_safe_UnitSuspendDecay(whichUnit10, suspend) 
	if (whichUnit10 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit10, suspend)
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

function __wurst_safe_SetUnitTimeScale(whichUnit11, timeScale) 
	if (whichUnit11 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit11, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit12, whichAnimation) 
	if (whichUnit12 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit12, whichAnimation)
end

function __wurst_safe_DestroyGroup(whichGroup4) 
	if (whichGroup4 == nil) then
		return nil
	end
	DestroyGroup(whichGroup4)
end

function __wurst_safe_TriggerAddAction(whichTrigger, actionFunc) 
	if (whichTrigger == nil) then
		return nil
	end
	return TriggerAddAction(whichTrigger, actionFunc)
end

function __wurst_safe_SetUnitState(whichUnit5, whichUnitState1, newVal) 
	if (whichUnit5 == nil) then
		return nil
	end
	if (whichUnitState1 == nil) then
		return nil
	end
	SetUnitState(whichUnit5, whichUnitState1, newVal)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit13) 
	if (whichUnit13 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit13)
end

function __wurst_safe_IsUnitType(whichUnit14, whichUnitType) 
	if (whichUnit14 == nil) then
		return false
	end
	if (whichUnitType == nil) then
		return false
	end
	return IsUnitType(whichUnit14, whichUnitType)
end

function __wurst_safe_GetUnitTypeId(whichUnit15) 
	if (whichUnit15 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit15)
end

function __wurst_safe_FirstOfGroup(whichGroup6) 
	if (whichGroup6 == nil) then
		return nil
	end
	return FirstOfGroup(whichGroup6)
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

function __wurst_safe_CreateUnit(id1, unitid1, x4, y4, face1) 
	if (id1 == nil) then
		return nil
	end
	return CreateUnit(id1, unitid1, x4, y4, face1)
end

function __wurst_safe_AddItemToStock(whichUnit16, itemId, currentStock, stockMax) 
	if (whichUnit16 == nil) then
		return nil
	end
	AddItemToStock(whichUnit16, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit17, itemId1) 
	if (whichUnit17 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit17, itemId1)
end

function __wurst_safe_GetDestructableX(d1) 
	if (d1 == nil) then
		return 0.0
	end
	return GetDestructableX(d1)
end

function __wurst_safe_GetDestructableY(d2) 
	if (d2 == nil) then
		return 0.0
	end
	return GetDestructableY(d2)
end

function __wurst_safe_GetDestructableLoc(whichDestructable) 
	if (whichDestructable == nil) then
		return nil
	end
	return GetDestructableLoc(whichDestructable)
end

function __wurst_safe_GroupRemoveUnit(whichGroup3, whichUnit7) 
	if (whichGroup3 == nil) then
		return false
	end
	if (whichUnit7 == nil) then
		return false
	end
	return GroupRemoveUnit(whichGroup3, whichUnit7)
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

function __wurst_safe_ForceEnumPlayers(whichForce1, filter2) 
	if (whichForce1 == nil) then
		return nil
	end
	ForceEnumPlayers(whichForce1, filter2)
end

function __wurst_safe_IsUnitAliveBJ(whichUnit18) 
	if (whichUnit18 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit18)
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

function __wurst_safe_DisplayTimedTextFromPlayer(toPlayer1, x5, y5, duration1, message2) 
	if (toPlayer1 == nil) then
		return nil
	end
	DisplayTimedTextFromPlayer(toPlayer1, x5, y5, duration1, message2)
end

function __wurst_safe_TriggerRegisterDialogButtonEvent(whichTrigger9, whichButton) 
	if (whichTrigger9 == nil) then
		return nil
	end
	if (whichButton == nil) then
		return nil
	end
	return TriggerRegisterDialogButtonEvent(whichTrigger9, whichButton)
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

function __wurst_safe_CustomDefeatDialogBJ(whichPlayer24, message3) 
	if (whichPlayer24 == nil) then
		return nil
	end
	CustomDefeatDialogBJ(whichPlayer24, message3)
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

function __wurst_safe_PingMinimapForPlayer(whichPlayer25, x6, y6, duration2) 
	if (whichPlayer25 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer25, x6, y6, duration2)
end

function __wurst_safe_UnitAddIndicator(whichUnit19, red, green, blue, alpha) 
	if (whichUnit19 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit19, red, green, blue, alpha)
end

function __wurst_safe_RescueUnitBJ(whichUnit20, rescuer, changeColor1) 
	if (whichUnit20 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit20, rescuer, changeColor1)
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

function __wurst_safe_SetPlayerColor(whichPlayer1, color) 
	if (whichPlayer1 == nil) then
		return nil
	end
	if (color == nil) then
		return nil
	end
	SetPlayerColor(whichPlayer1, color)
end

function __wurst_safe_GroupTargetOrder(whichGroup8, order1, targetWidget1) 
	if (whichGroup8 == nil) then
		return false
	end
	if (targetWidget1 == nil) then
		return false
	end
	return GroupTargetOrder(whichGroup8, order1, targetWidget1)
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

function __wurst_safe_GroupEnumUnitsOfType(whichGroup10, unitname, filter3) 
	if (whichGroup10 == nil) then
		return nil
	end
	GroupEnumUnitsOfType(whichGroup10, unitname, filter3)
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

function __wurst_safe_BlzGroupAddGroupFast(whichGroup, addGroup) 
	if (whichGroup == nil) then
		return 0
	end
	if (addGroup == nil) then
		return 0
	end
	return BlzGroupAddGroupFast(whichGroup, addGroup)
end

function __wurst_safe_BlzGroupGetSize(whichGroup5) 
	if (whichGroup5 == nil) then
		return 0
	end
	return BlzGroupGetSize(whichGroup5)
end

function __wurst_safe_BlzGroupUnitAt(whichGroup7, index1) 
	if (whichGroup7 == nil) then
		return nil
	end
	return BlzGroupUnitAt(whichGroup7, index1)
end

function __wurst_safe_TriggerAddCondition(whichTrigger1, condition1) 
	if (whichTrigger1 == nil) then
		return nil
	end
	return TriggerAddCondition(whichTrigger1, condition1)
end

function __wurst_safe_TriggerRegisterPlayerChatEvent(whichTrigger2, whichPlayer12, chatMessageToDetect1, exactMatchOnly1) 
	if (whichTrigger2 == nil) then
		return nil
	end
	if (whichPlayer12 == nil) then
		return nil
	end
	return TriggerRegisterPlayerChatEvent(whichTrigger2, whichPlayer12, chatMessageToDetect1, exactMatchOnly1)
end

function __wurst_safe_TriggerRegisterUnitEvent(whichTrigger4, whichUnit8, whichEvent1) 
	if (whichTrigger4 == nil) then
		return nil
	end
	if (whichUnit8 == nil) then
		return nil
	end
	if (whichEvent1 == nil) then
		return nil
	end
	return TriggerRegisterUnitEvent(whichTrigger4, whichUnit8, whichEvent1)
end

function __wurst_safe_CustomVictoryBJ(whichPlayer14, showDialog, showScores) 
	if (whichPlayer14 == nil) then
		return nil
	end
	CustomVictoryBJ(whichPlayer14, showDialog, showScores)
end

function __wurst_safe_CustomDefeatBJ(whichPlayer15, message1) 
	if (whichPlayer15 == nil) then
		return nil
	end
	CustomDefeatBJ(whichPlayer15, message1)
end

