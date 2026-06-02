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
gg_unit_cp00_0008 = nil
gg_unit_hwtw_0003 = nil
gg_unit_cp00_0011 = nil
gg_unit_cp00_0006 = nil
gg_unit_cp00_0007 = nil
gg_unit_cp00_0014 = nil
gg_unit_cp00_0005 = nil
gg_unit_cp00_0013 = nil
gg_unit_cp00_0018 = nil
gg_unit_cp00_0010 = nil
gg_unit_cp00_0009 = nil
gg_unit_cp00_0015 = nil
gg_unit_cp00_0019 = nil
gg_unit_cp00_0012 = nil
gg_unit_cp00_0017 = nil
gg_unit_cp00_0016 = nil
gg_unit_etol_0001 = nil
Abilities_cloudOfFog = nil
Angle_RADTODEG = nil
BasicWaves_selectedTarget = nil
BasicWaves_footmen = nil
BasicWaves_spawn1 = nil
Basics_ANIMATION_PERIOD = nil
Basics_DUMMY_PLAYER = nil
BitSet_BITSET_SIZE = nil
BitSet_pows = nil
Bloom_HEALING_CLOUD_ID = nil
Bloom_CLOUD_UNIT_ID = nil
Bloom_CLOUD_RADIUS = nil
Bloom_CLOUD_HEAL = nil
Bloom_CLOUD_DURATION = nil
Bloom_HEAL_INTERVAL = nil
CenariusCharacter_CENARIUS_CHARACTER_ID = nil
ClosureEvents_EVENT_PLAYER_CHAT_FILTER = nil
ClosureEvents_leaveTrig = nil
ClosureEvents_keyTrig = nil
ClosureEvents_eventidToIndex = nil
ClosureEvents_eventTypeCounter = nil
EventListener_castMap = nil
EventListener_castMapCasters = nil
EventListener_generalListenersFirsts = nil
EventListener_unitListenersFirsts = nil
EventListener_useMouseEvents = nil
ClosureForGroups_tempCallbacks = nil
ClosureForGroups_tempCallbacksUntil = nil
ClosureForGroups_callbackMode = nil
ClosureForGroups_countLimits = nil
ClosureForGroups_countIters = nil
ClosureForGroups_stopRequested = nil
ClosureForGroups_tempCallbacksCount = nil
ClosureForGroups_MODE_NORMAL = nil
ClosureForGroups_MODE_COUNTED = nil
ClosureTimers_x = nil
Colors_hexs = nil
Colors_decs = nil
Colors_COLOR_WHITE = nil
Colors_COLOR_BLACK = nil
Colors_COLOR_GOLD = nil
ControlPoint_controlPoints = nil
ControlPoint_controlPointValue = nil
DamageEvent_DETECT_NATIVE_ABILITIES = nil
DamageEvent_DAMAGE_ELEMENT_ATTACK = nil
DamageEvent_nextDamageId = nil
DamageEvent_nextDamageType = nil
DamageEvent_nextDamageElement = nil
DamageEvent_abort = nil
DamageEvent_firstListeners = nil
DamageEvent_maxPriority = nil
DamageEvent_firstUnreducedListeners = nil
DamageEvent_maxUnreducedPriority = nil
DamageInstance_current = nil
DamageInstance_stack = nil
DamageInstance_count = nil
ErrorHandling_MUTE_ERROR_DURATION = nil
ErrorHandling_PRIMARY_ERROR_KEY = nil
ErrorHandling_HT = nil
ErrorHandling_lastError = nil
ErrorHandling_suppressErrorMessages = nil
Execute_executeForce = nil
Execute_tempCallbacksSuccess = nil
Execute_tempCallbacks = nil
Execute_tempCallbacksCount = nil
GameTimer_currentTime = nil
GroupUtils_GROUP_NUMBER_LIMIT = nil
GroupUtils_START_CREATE_GROUPS = nil
GroupUtils_used = nil
GroupUtils_stack = nil
GroupUtils_numStack = nil
GroupUtils_numTotal = nil
GroupUtils_shownMaxError = nil
Group_ENUM_GROUP = nil
HashList_ht = nil
HashList_occurences = nil
Integer_INT_MAX = nil
Integer_INT_MIN = nil
Invigorate_seedlingCount = nil
Invigorate_INVIGORATE_ID = nil
Invigorate_MAX_SEEDLING_STACKS = nil
MagicFunctions_compiletime = nil
MapBounds_playableMapRect = nil
MapBounds_boundRect = nil
MapBounds_boundRegion = nil
MapBounds_playableMin = nil
MapBounds_playableMax = nil
MapBounds_boundMin = nil
MapBounds_boundMax = nil
OnUnitEnterLeave_eventTrigger = nil
OnUnitEnterLeave_preplacedUnits = nil
OnUnitEnterLeave_tempUnits = nil
OnUnitEnterLeave_tempUnitsCount = nil
OnUnitEnterLeave_ABILITY_ID = nil
OrderIds_undefend = nil
Player_players = nil
Player_localPlayer = nil
Preloader_autoFinish = nil
Preloader_dumg = nil
Preloader_dum = nil
Printing_DEBUG_LEVEL = nil
Printing_DEBUG_MSG_DURATION = nil
RegisterEvents_t = nil
RegisterEvents_onCastMap = nil
ShieldBash_MY_ABILITY_ID = nil
ShieldBash_MY_ICON_ABILITY_ID = nil
ShieldBash_ARMOR_BONUS = nil
ShieldBash_REFLECT_CHANCE = nil
ShieldBash_REFLECT_DAMAGE = nil
ShieldBash_REFLECT_SFX = nil
String_charset = nil
String_numberset = nil
SummonTreant_SUMMON_TREANT_ID = nil
SummonTreant_TREANT_UNIT_ID = nil
SummonTreant_TREANT_DURATION = nil
Table_ht = nil
TimerUtils_freeTimers = nil
TimerUtils_freeTimersCount = nil
TimerUtils_timerData = nil
TimerUtils_HELD = nil
TypeCasting_typecastdata = nil
TypeCasting_R2I_PRECISION = nil
UnitIds_huntress = nil
UnitIds_keeperofthegrove = nil
UnitIds_shade = nil
UnitIndexer_onIndexTrigger = nil
UnitIndexer_onDeindexTrigger = nil
UnitIndexer_tempUnits = nil
UnitIndexer_tempUnitsCount = nil
hashtable_compiletime = nil
hashtable_compiletime1 = nil
hashtable_compiletime2 = nil
hashtable_compiletime3 = nil
wurst_stack_depth = nil
wurst_stack = nil
CallbackPeriodic_doPeriodically_Bloom = ({})
CallbackSingle_doAfter_Bloom = ({})
OnCastListener_onCast_Bloom = ({})
OnCastListener_onCast_CenariusCharacter = ({})
OnCastListener_onCast_CenariusCharacter1 = ({})
CallbackSingle_doAfter_onCast_CenariusCharacter = ({})
CallbackSingle_nullTimer_ClosureEvents = ({})
EventListener = ({})
OnCastListener = ({})
ForGroupCallback = ({})
ForGroupCallbackUntil = ({})
CallbackPeriodic = ({})
CallbackSingle = ({})
EventListener_add_DamageEvent = ({})
EventListener_add_DamageEvent1 = ({})
DamageElement = ({})
DamageInstance = ({})
DamageListener = ({})
ForForceCallback = ({})
ForForceCallback_execute_GroupUtils = ({})
GroupIterator = ({})
HashMap = ({})
CallbackSingle_doAfter_Invigorate = ({})
IdGenerator = ({})
CallbackSingle_nullTimer_OnUnitEnterLeave = ({})
ForGroupCallback_forEachFrom_Preloader = ({})
CallbackSingle_nullTimer_Preloader = ({})
DamageListener_addListener_ShieldBash = ({})
Table = ({})
UnitIndex = ({})

function CallbackPeriodic_doPeriodically_Bloom:create() 
	local new_inst = ({CallbackPeriodic_t=nil, pos=({0., 0., }), owner=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_Bloom, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom(this, cb, __wurst_stackPos) 
	local iterator = nil
	local u = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRange(Group_ENUM_GROUP, this.pos, Bloom_CLOUD_RADIUS, nil, "when calling enumUnitsInRange in Bloom, line 61")
	iterator = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 62")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator, "when calling hasNext in Bloom, line 62")) then
			break
		end
		u = GroupIterator_GroupIterator_next(iterator, "when calling next in Bloom, line 62")
		if (unit_isAlive(u, "when calling isAlive in Bloom, line 63") and player_isAllyOf(unit_getOwner(u, "when calling getOwner in Bloom, line 63"), this.owner, "when calling isAllyOf in Bloom, line 63")) then
			unit_addHP(u, Bloom_CLOUD_HEAL, "when calling addHP in Bloom, line 64")
			flashEffect("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u, "origin", "when calling flashEffect in Bloom, line 65")
		end
	end
	GroupIterator_GroupIterator_close(iterator, "when calling close in Bloom, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_Bloom:create1() 
	local new_inst = ({CallbackSingle_t=nil, healTimer=nil, cloud=nil, sfx=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_Bloom, }))
	return new_inst
end

function CallbackSingle_doAfter_Bloom_call_doAfter_Bloom(this10, __wurst_stackPos11) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos11
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this10.healTimer, "when calling destroyCallbackPeriodic in Bloom, line 68")
	unit_kill(this10.cloud, "when calling kill in Bloom, line 69")
	effect_destr(this10.sfx, "when calling destr in Bloom, line 70")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Bloom:create2() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Bloom, }))
	return new_inst
end

function OnCastListener_onCast_Bloom_fire_onCast_Bloom(this14, caster, __wurst_stackPos15) 
	local iterator1 = nil
	local u1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos15
	wurst_stack_depth = (wurst_stack_depth + 1)
	print1("Healing Cloud cast!", "when calling print in Bloom, line 75")
	group_enumUnitsInRect(Group_ENUM_GROUP, bj_mapInitialPlayableArea, nil, "when calling enumUnitsInRect in Bloom, line 76")
	iterator1 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 77")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator1, "when calling hasNext in Bloom, line 77")) then
			break
		end
		u1 = GroupIterator_GroupIterator_next(iterator1, "when calling next in Bloom, line 77")
		if unit_hasAbility(u1, 1114793322, "when calling hasAbility in Bloom, line 78") then
			print1(stringConcat("Spawning cloud on ", unit_getName(u1, "when calling getName in Bloom, line 79")), "when calling print in Bloom, line 79")
			spawnCloud(unit_getOwner(caster, "when calling getOwner in Bloom, line 80"), unit_getPos(u1, "when calling getPos in Bloom, line 80"), "when calling spawnCloud in Bloom, line 80")
		end
	end
	GroupIterator_GroupIterator_close(iterator1, "when calling close in Bloom, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_CenariusCharacter:create3() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_CenariusCharacter, }))
	return new_inst
end

function OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter(this19, caster1, __wurst_stackPos22) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos22
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventData_getSpellTargetUnit("when calling getSpellTargetUnit in CenariusCharacter, line 19")
	addSeedlingStack("when calling addSeedlingStack in CenariusCharacter, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_CenariusCharacter1:create4() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_CenariusCharacter1, }))
	return new_inst
end

function tupleCopy(t) 
	return ({t[1], t[2], })
end

function OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1(this20, caster2, __wurst_stackPos25) 
	local pos2 = ({0., 0., })
	local stacks = nil
	local i = nil
	local temp = nil
	local treant = nil
	local clVar = nil
	local temp123 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos25
	wurst_stack_depth = (wurst_stack_depth + 1)
	print1(stringConcat("Seedling count: ", int_toString(getSeedlingCount("when calling getSeedlingCount in CenariusCharacter, line 23"), "when calling toString in CenariusCharacter, line 23")), "when calling print in CenariusCharacter, line 23")
	if (getSeedlingCount("when calling getSeedlingCount in CenariusCharacter, line 25") <= 0) then
		print1("No seedling stacks available!", "when calling print in CenariusCharacter, line 26")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	pos2 = tupleCopy(unit_getPos(caster2, "when calling getPos in CenariusCharacter, line 29"))
	stacks = getSeedlingCount("when calling getSeedlingCount in CenariusCharacter, line 30")
	i = 1
	temp = stacks
	while true do
		if (i > temp) then
			break
		end
		treant = createUnit(unit_getOwner(caster2, "when calling getOwner in CenariusCharacter, line 33"), SummonTreant_TREANT_UNIT_ID, pos2, ({0., }), "when calling createUnit in CenariusCharacter, line 33")
		temp123 = SummonTreant_TREANT_DURATION
		clVar = CallbackSingle_doAfter_onCast_CenariusCharacter:create5()
		CallbackSingle_construct_CallbackSingle(clVar, "when calling construct_CallbackSingle in CenariusCharacter, line 34")
		clVar.treant = treant
		doAfter(temp123, clVar, "when calling doAfter in CenariusCharacter, line 34")
		i = (i + 1)
	end
	Invigorate_seedlingCount = 0
	print1("Done. Seedling stacks set to 0.", "when calling print in CenariusCharacter, line 39")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_CenariusCharacter:create5() 
	local new_inst = ({CallbackSingle_t=nil, treant=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_CenariusCharacter, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter(this23, __wurst_stackPos31) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos31
	wurst_stack_depth = (wurst_stack_depth + 1)
	if unit_isAlive(this23.treant, "when calling isAlive in CenariusCharacter, line 35") then
		unit_kill(this23.treant, "when calling kill in CenariusCharacter, line 36")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_ClosureEvents:create6() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_ClosureEvents, }))
	return new_inst
end

function CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents(this24, __wurst_stackPos32) 
	local i1 = nil
	local temp1 = nil
	local receiver = nil
	local receiver1 = nil
	local receiver2 = nil
	local receiver3 = nil
	local receiver4 = nil
	local receiver5 = nil
	local receiver6 = nil
	local receiver7 = nil
	local receiver8 = nil
	local receiver9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos32
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addAction(ClosureEvents_leaveTrig, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_nullTimer_ClosureEvents(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ClosureEvents, line 307")
	trigger_addAction(ClosureEvents_keyTrig, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_nullTimer_ClosureEvents1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ClosureEvents, line 308")
	i1 = 0
	temp1 = (bj_MAX_PLAYERS - 1)
	while true do
		if (i1 > temp1) then
			break
		end
		trigger_registerPlayerEvent(ClosureEvents_leaveTrig, Player_players[i1], EVENT_PLAYER_LEAVE, "when calling registerPlayerEvent in ClosureEvents, line 311")
		receiver = ClosureEvents_keyTrig
		trigger_registerPlayerEvent(receiver, Player_players[i1], EVENT_PLAYER_ARROW_DOWN_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 312")
		receiver1 = receiver
		trigger_registerPlayerEvent(receiver1, Player_players[i1], EVENT_PLAYER_ARROW_DOWN_UP, "when calling registerPlayerEvent in ClosureEvents, line 313")
		receiver2 = receiver1
		trigger_registerPlayerEvent(receiver2, Player_players[i1], EVENT_PLAYER_ARROW_UP_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 314")
		receiver3 = receiver2
		trigger_registerPlayerEvent(receiver3, Player_players[i1], EVENT_PLAYER_ARROW_UP_UP, "when calling registerPlayerEvent in ClosureEvents, line 315")
		receiver4 = receiver3
		trigger_registerPlayerEvent(receiver4, Player_players[i1], EVENT_PLAYER_ARROW_LEFT_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 316")
		receiver5 = receiver4
		trigger_registerPlayerEvent(receiver5, Player_players[i1], EVENT_PLAYER_ARROW_LEFT_UP, "when calling registerPlayerEvent in ClosureEvents, line 317")
		receiver6 = receiver5
		trigger_registerPlayerEvent(receiver6, Player_players[i1], EVENT_PLAYER_ARROW_RIGHT_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 318")
		receiver7 = receiver6
		trigger_registerPlayerEvent(receiver7, Player_players[i1], EVENT_PLAYER_ARROW_RIGHT_UP, "when calling registerPlayerEvent in ClosureEvents, line 319")
		receiver8 = receiver7
		trigger_registerPlayerEvent(receiver8, Player_players[i1], EVENT_PLAYER_END_CINEMATIC, "when calling registerPlayerEvent in ClosureEvents, line 320")
		receiver9 = receiver8
		trigger_registerPlayerChatEvent(receiver9, Player_players[i1], "", false, "when calling registerPlayerChatEvent in ClosureEvents, line 321")
		i1 = (i1 + 1)
	end
	registerPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, nil, function (...) 
			xpcall(function (...) 
					bridge_code__registerPlayerUnitEvent_nullTimer_ClosureEvents(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, nil, "when calling registerPlayerUnitEvent in ClosureEvents, line 323")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener:create7() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener, }))
	return new_inst
end

function EventListener_EventListener_onEvent(this28, __wurst_stackPos38) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos38
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_EventListener_init(this29, __wurst_stackPos39) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos39
	wurst_stack_depth = (wurst_stack_depth + 1)
	this29.EventListener_eventId = 0
	this29.EventListener_uid = -1
	this29.EventListener_next = nil
	this29.EventListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_construct_EventListener(this30, __wurst_stackPos40) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos40
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_EventListener_init(this30, "when calling EventListener_init in ClosureEvents, line 108")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_EventListener_onDestroy(this31, __wurst_stackPos41) 
	local listener = nil
	local listener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos41
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (this31.EventListener_uid < 0) then
		listener = EventListener_generalListenersFirsts[this31.EventListener_eventId]
		if (listener == this31) then
			EventListener_generalListenersFirsts[this31.EventListener_eventId] = this31.EventListener_next
		elseif not((this31.EventListener_prev == nil)) then
			this31.EventListener_prev.EventListener_next = this31.EventListener_next
		end
	else
		listener1 = EventListener_unitListenersFirsts[this31.EventListener_uid]
		if (listener1 == this31) then
			EventListener_unitListenersFirsts[this31.EventListener_uid] = this31.EventListener_next
		elseif not((this31.EventListener_prev == nil)) then
			this31.EventListener_prev.EventListener_next = this31.EventListener_next
		end
	end
	if not((this31.EventListener_next == nil)) then
		this31.EventListener_next.EventListener_prev = this31.EventListener_prev
	end
	this31.EventListener_next = nil
	this31.EventListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_destroyEventListener(this32, __wurst_stackPos42) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos42
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_EventListener_onDestroy(this32, "when calling EventListener_onDestroy in ClosureEvents, line 225")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener:create8() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener, }))
	return new_inst
end

function OnCastListener_OnCastListener_fire(this33, caster3, __wurst_stackPos43) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos43
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_OnCastListener_init(this34, __wurst_stackPos44) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos44
	wurst_stack_depth = (wurst_stack_depth + 1)
	this34.OnCastListener_next = nil
	this34.OnCastListener_prev = nil
	this34.OnCastListener_eventUnit = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_construct_OnCastListener(this35, __wurst_stackPos45) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos45
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnCastListener_OnCastListener_init(this35, "when calling OnCastListener_init in ClosureEvents, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_OnCastListener_onDestroy(this36, __wurst_stackPos46) 
	local index = nil
	local listener2 = nil
	local listener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos46
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((this36.OnCastListener_eventUnit == nil)) then
		index = unit_getIndex(this36.OnCastListener_eventUnit, "when calling getIndex in ClosureEvents, line 60")
		listener2 = EventListener_castMapCasters[index]
		if (listener2 == this36) then
			if not((this36.OnCastListener_next == nil)) then
				EventListener_castMapCasters[index] = this36.OnCastListener_next
			else
				EventListener_castMapCasters[index] = nil
			end
		elseif not((this36.OnCastListener_prev == nil)) then
			this36.OnCastListener_prev.OnCastListener_next = this36.OnCastListener_next
		end
	else
		listener3 = HashMap_HashMap_get(EventListener_castMap, this36.OnCastListener_abilId, "when calling get in ClosureEvents, line 70")
		if (listener3 == this36) then
			if not((this36.OnCastListener_next == nil)) then
				HashMap_HashMap_put(EventListener_castMap, this36.OnCastListener_abilId, this36.OnCastListener_next, "when calling put in ClosureEvents, line 73")
			else
				HashMap_HashMap_remove(EventListener_castMap, this36.OnCastListener_abilId, "when calling remove in ClosureEvents, line 75")
			end
		elseif not((this36.OnCastListener_prev == nil)) then
			this36.OnCastListener_prev.OnCastListener_next = this36.OnCastListener_next
		end
	end
	if not((this36.OnCastListener_next == nil)) then
		this36.OnCastListener_next.OnCastListener_prev = this36.OnCastListener_prev
	end
	this36.OnCastListener_next = nil
	this36.OnCastListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_destroyOnCastListener(this41, __wurst_stackPos51) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos51
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnCastListener_OnCastListener_onDestroy(this41, "when calling OnCastListener_onDestroy in ClosureEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback:create9() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback, }))
	return new_inst
end

function ForGroupCallback_ForGroupCallback_callback(this42, u2, __wurst_stackPos52) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos52
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback_destroyForGroupCallback(this43, __wurst_stackPos53) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos53
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallbackUntil:create10() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallbackUntil, }))
	return new_inst
end

function ForGroupCallbackUntil_ForGroupCallbackUntil_callback(this44, u3, __wurst_stackPos54) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos54
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic:create11() 
	local new_inst = ({CallbackPeriodic_t=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic, }))
	return new_inst
end

function CallbackPeriodic_CallbackPeriodic_start(this45, whichTimer, time, __wurst_stackPos55) 
	local receiver10 = nil
	local receiver11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos55
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver10 = whichTimer
	timer_setData(receiver10, __wurst_objectToIndex(this45), "when calling setData in ClosureTimers, line 158")
	receiver11 = receiver10
	timer_startPeriodic(receiver11, time, function (...) 
			xpcall(function (...) 
					bridge_CallbackPeriodic_staticCallback(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in ClosureTimers, line 159")
	this45.CallbackPeriodic_t = receiver11
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_call(this48, cb2, __wurst_stackPos58) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos58
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_init(this49, __wurst_stackPos59) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos59
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_construct_CallbackPeriodic(this50, __wurst_stackPos60) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos60
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_init(this50, "when calling CallbackPeriodic_init in ClosureTimers, line 151")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_onDestroy(this51, __wurst_stackPos61) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos61
	wurst_stack_depth = (wurst_stack_depth + 1)
	timer_release(this51.CallbackPeriodic_t, "when calling release in ClosureTimers, line 166")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_destroyCallbackPeriodic(this11, __wurst_stackPos12) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos12
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_onDestroy(this11, "when calling CallbackPeriodic_onDestroy in ClosureTimers, line 165")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle:create12() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle, }))
	return new_inst
end

function CallbackSingle_CallbackSingle_start(this53, whichTimer1, time2, __wurst_stackPos63) 
	local receiver12 = nil
	local receiver13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos63
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver12 = whichTimer1
	timer_setData(receiver12, __wurst_objectToIndex(this53), "when calling setData in ClosureTimers, line 134")
	receiver13 = receiver12
	timer_start(receiver13, time2, function (...) 
			xpcall(function (...) 
					bridge_code__start_CallbackSingle_ClosureTimers(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling start in ClosureTimers, line 135")
	this53.CallbackSingle_t = receiver13
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_call(this55, __wurst_stackPos65) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos65
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_construct_CallbackSingle(this22, __wurst_stackPos29) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos29
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_init(this22, "when calling CallbackSingle_init in ClosureTimers, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_destroyCallbackSingle(this57, __wurst_stackPos67) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos67
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_onDestroy(this57, "when calling CallbackSingle_onDestroy in ClosureTimers, line 147")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_init(this56, __wurst_stackPos66) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos66
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_onDestroy(this58, __wurst_stackPos68) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos68
	wurst_stack_depth = (wurst_stack_depth + 1)
	timer_release(this58.CallbackSingle_t, "when calling release in ClosureTimers, line 148")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent:create13() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent(this59, __wurst_stackPos69) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos69
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onUnreducedDamage("when calling onUnreducedDamage in DamageEvent, line 476")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent1:create14() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent1, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent1(this60, __wurst_stackPos71) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos71
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onDamage("when calling onDamage in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement:create15() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=DamageElement, }))
	return new_inst
end

function DamageElement_new_DamageElement(name, color, __wurst_stackPos73) 
	local this61 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos73
	wurst_stack_depth = (wurst_stack_depth + 1)
	this61 = DamageElement:create15()
	DamageElement_construct_DamageElement(this61, name, color, "when calling construct_DamageElement in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this61
end

function DamageElement_DamageElement_init(this63, __wurst_stackPos75) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos75
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement_construct_DamageElement(this62, name1, color1, __wurst_stackPos74) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos74
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageElement_DamageElement_init(this62, "when calling DamageElement_init in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance:create16() 
	local new_inst = ({DamageInstance_source=nil, DamageInstance_target=nil, DamageInstance_amount=0., DamageInstance_nativeAttackType=nil, DamageInstance_nativeDamageType=nil, DamageInstance_nativeWeaponType=nil, })
	setmetatable(new_inst, ({__index=DamageInstance, }))
	return new_inst
end

function DamageInstance_DamageInstance_setReducedAmount(this64, amount, __wurst_stackPos76) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos76
	wurst_stack_depth = (wurst_stack_depth + 1)
	this64.DamageInstance_amount = amount
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_init(this65, __wurst_stackPos77) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos77
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_new_DamageInstance(id1, source, target1, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType, damageElement, __wurst_stackPos78) 
	local this66 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos78
	wurst_stack_depth = (wurst_stack_depth + 1)
	this66 = DamageInstance:create16()
	DamageInstance_construct_DamageInstance(this66, id1, source, target1, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType, damageElement, "when calling construct_DamageInstance in DamageEvent, line 133")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this66
end

function DamageInstance_construct_DamageInstance(this67, id2, source1, target2, unreducedAmount1, nativeAttackType1, nativeDamageType1, nativeWeaponType1, damageType1, damageElement1, __wurst_stackPos79) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos79
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_init(this67, "when calling DamageInstance_init in DamageEvent, line 133")
	this67.DamageInstance_source = source1
	this67.DamageInstance_target = target2
	this67.DamageInstance_amount = unreducedAmount1
	this67.DamageInstance_nativeAttackType = nativeAttackType1
	this67.DamageInstance_nativeDamageType = nativeDamageType1
	this67.DamageInstance_nativeWeaponType = nativeWeaponType1
	DamageInstance_count = (DamageInstance_count + 1)
	DamageInstance_stack[DamageInstance_count] = this67
	DamageInstance_current = this67
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_onDestroy(this68, __wurst_stackPos80) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos80
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_count = (DamageInstance_count - 1)
	DamageInstance_current = DamageInstance_stack[DamageInstance_count]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_destroyDamageInstance(this69, __wurst_stackPos81) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos81
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_onDestroy(this69, "when calling DamageInstance_onDestroy in DamageEvent, line 162")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener:create17() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener, }))
	return new_inst
end

function DamageListener_DamageListener_onEvent(this70, __wurst_stackPos82) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos82
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_DamageListener_init(this71, __wurst_stackPos83) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos83
	wurst_stack_depth = (wurst_stack_depth + 1)
	this71.DamageListener_next = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_construct_DamageListener(this72, __wurst_stackPos84) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos84
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageListener_DamageListener_init(this72, "when calling DamageListener_init in DamageEvent, line 431")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback:create18() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForForceCallback, }))
	return new_inst
end

function ForForceCallback_ForForceCallback_run(this73, __wurst_stackPos85) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos85
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_destroyForForceCallback(this74, __wurst_stackPos86) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos86
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_execute_GroupUtils:create19() 
	local new_inst = ({createNow=0, })
	setmetatable(new_inst, ({__index=ForForceCallback_execute_GroupUtils, }))
	return new_inst
end

function ForForceCallback_execute_GroupUtils_run_execute_GroupUtils(this75, __wurst_stackPos87) 
	local i2 = nil
	local temp2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos87
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_numTotal = (GroupUtils_numTotal + this75.createNow)
	i2 = 1
	temp2 = this75.createNow
	while true do
		if (i2 > temp2) then
			break
		end
		push(CreateGroup(), "when calling push in GroupUtils, line 93")
		i2 = (i2 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator:create20() 
	local new_inst = ({GroupIterator_g=nil, GroupIterator_i=0, GroupIterator_n=0, })
	setmetatable(new_inst, ({__index=GroupIterator, }))
	return new_inst
end

function GroupIterator_GroupIterator_hasNext(this3, __wurst_stackPos3) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos3
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this3.GroupIterator_i < this3.GroupIterator_n)
end

function GroupIterator_GroupIterator_next(this4, __wurst_stackPos4) 
	local u4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos4
	wurst_stack_depth = (wurst_stack_depth + 1)
	u4 = group_get(this4.GroupIterator_g, this4.GroupIterator_i, "when calling get in Group, line 128")
	this4.GroupIterator_i = (this4.GroupIterator_i + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return u4
end

function GroupIterator_GroupIterator_close(this9, __wurst_stackPos10) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos10
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_destroyGroupIterator(this9, "when calling destroyGroupIterator in Group, line 133")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_destroyGroupIterator(this77, __wurst_stackPos90) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos90
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_onDestroy(this77, "when calling GroupIterator_onDestroy in Group, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_init(this79, __wurst_stackPos92) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos92
	wurst_stack_depth = (wurst_stack_depth + 1)
	this79.GroupIterator_i = 0
	this79.GroupIterator_n = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_new_GroupIterator(source2, __wurst_stackPos93) 
	local this80 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos93
	wurst_stack_depth = (wurst_stack_depth + 1)
	this80 = GroupIterator:create20()
	GroupIterator_construct_GroupIterator(this80, source2, "when calling construct_GroupIterator in Group, line 119")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this80
end

function GroupIterator_construct_GroupIterator(this81, source3, __wurst_stackPos94) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos94
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_init(this81, "when calling GroupIterator_init in Group, line 119")
	this81.GroupIterator_g = CreateGroup()
	group_add(this81.GroupIterator_g, "when calling add in Group, line 121", source3)
	this81.GroupIterator_n = group_size(this81.GroupIterator_g, "when calling size in Group, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_onDestroy(this78, __wurst_stackPos91) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos91
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_clear(this78.GroupIterator_g, "when calling clear in Group, line 136")
	group_destr(this78.GroupIterator_g, "when calling destr in Group, line 137")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap:create21() 
	local new_inst = ({HashMap_size=0, })
	setmetatable(new_inst, ({__index=HashMap, }))
	return new_inst
end

function HashMap_HashMap_has(this86, key3, __wurst_stackPos99) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos99
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Table_Table_hasInt(this86, __wurst_objectToIndex(key3), "when calling hasInt in HashMap, line 14")
end

function HashMap_HashMap_put(this39, key1, value, __wurst_stackPos49) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos49
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not(HashMap_HashMap_has(this39, key1, "when calling has in HashMap, line 18")) then
		this39.HashMap_size = (this39.HashMap_size + 1)
	end
	Table_Table_saveInt(this39, __wurst_objectToIndex(key1), __wurst_objectToIndex(value), "when calling saveInt in HashMap, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_HashMap_get(this38, key, __wurst_stackPos48) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos48
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return __wurst_objectFromIndex(Table_Table_loadInt(this38, __wurst_objectToIndex(key), "when calling loadInt in HashMap, line 24"))
end

function HashMap_HashMap_remove(this40, key2, __wurst_stackPos50) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos50
	wurst_stack_depth = (wurst_stack_depth + 1)
	if HashMap_HashMap_has(this40, key2, "when calling has in HashMap, line 28") then
		this40.HashMap_size = (this40.HashMap_size - 1)
	end
	Table_Table_removeInt(this40, __wurst_objectToIndex(key2), "when calling removeInt in HashMap, line 30")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_HashMap_init(this91, __wurst_stackPos104) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos104
	wurst_stack_depth = (wurst_stack_depth + 1)
	this91.HashMap_size = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_new_HashMap(__wurst_stackPos105) 
	local this92 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos105
	wurst_stack_depth = (wurst_stack_depth + 1)
	this92 = HashMap:create21()
	HashMap_construct_HashMap(this92, "when calling construct_HashMap in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this92
end

function HashMap_construct_HashMap(this93, __wurst_stackPos106) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos106
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_construct_Table(this93, "when calling construct_Table in HashMap, line 7")
	HashMap_HashMap_init(this93, "when calling HashMap_init in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_Invigorate:create22() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_Invigorate, }))
	return new_inst
end

function CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate(this95, __wurst_stackPos108) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos108
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount > 0) then
		Invigorate_seedlingCount = (Invigorate_seedlingCount - 1)
		print1(stringConcat("Seedling stack expired. Remaining: ", int_toString(Invigorate_seedlingCount, "when calling toString in Invigorate, line 28")), "when calling print in Invigorate, line 28")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator:create23() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=IdGenerator, }))
	return new_inst
end

function IdGenerator_new_IdGenerator(start, __wurst_stackPos109) 
	local this96 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos109
	wurst_stack_depth = (wurst_stack_depth + 1)
	this96 = IdGenerator:create23()
	IdGenerator_construct_IdGenerator(this96, start, "when calling construct_IdGenerator in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this96
end

function IdGenerator_IdGenerator_init(this98, __wurst_stackPos111) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos111
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator_construct_IdGenerator(this97, start1, __wurst_stackPos110) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos110
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_IdGenerator_init(this97, "when calling IdGenerator_init in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_OnUnitEnterLeave:create24() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_OnUnitEnterLeave, }))
	return new_inst
end

function CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave(this99, __wurst_stackPos112) 
	local receiver14 = nil
	local count = nil
	local i3 = nil
	local temp3 = nil
	local receiver15 = nil
	local receiver16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos112
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver14 = CreateTrigger()
	trigger_registerEnterRegion(receiver14, MapBounds_boundRegion, __wurst_safe_Filter(function (...) 
			xpcall(function (...) 
					bridge_code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end), "when calling registerEnterRegion in OnUnitEnterLeave, line 68")
	registerPlayerUnitEvent1(EVENT_PLAYER_UNIT_ISSUED_ORDER, function (...) 
			xpcall(function (...) 
					bridge_code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling registerPlayerUnitEvent in OnUnitEnterLeave, line 71")
	group_enumUnitsInRect1(OnUnitEnterLeave_preplacedUnits, MapBounds_boundRect, "when calling enumUnitsInRect in OnUnitEnterLeave, line 79")
	count = group_size(OnUnitEnterLeave_preplacedUnits, "when calling size in OnUnitEnterLeave, line 80")
	i3 = 0
	temp3 = (count - 1)
	while true do
		if (i3 > temp3) then
			break
		end
		prepareUnit(group_get(OnUnitEnterLeave_preplacedUnits, i3, "when calling get in OnUnitEnterLeave, line 82"), "when calling prepareUnit in OnUnitEnterLeave, line 82")
		i3 = (i3 + 1)
	end
	receiver15 = OnUnitEnterLeave_preplacedUnits
	group_clear(receiver15, "when calling clear in OnUnitEnterLeave, line 83")
	receiver16 = receiver15
	group_destr(receiver16, "when calling destr in OnUnitEnterLeave, line 83")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback_forEachFrom_Preloader:create25() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback_forEachFrom_Preloader, }))
	return new_inst
end

function ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader(this102, u6, __wurst_stackPos117) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos117
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(u6, "when calling remove in Preloader, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_Preloader:create26() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_Preloader, }))
	return new_inst
end

function CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader(this104, __wurst_stackPos119) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos119
	wurst_stack_depth = (wurst_stack_depth + 1)
	finishPreload("when calling finishPreload in Preloader, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_addListener_ShieldBash:create27() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener_addListener_ShieldBash, }))
	return new_inst
end

function DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash(this105, __wurst_stackPos121) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos121
	wurst_stack_depth = (wurst_stack_depth + 1)
	onDamageTaken("when calling onDamageTaken in ShieldBash, line 81")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table:create28() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=Table, }))
	return new_inst
end

function Table_Table_hasInt(this87, parentKey, __wurst_stackPos100) 
	local stackTrace_tempReturn = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos100
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = hashtable_hasInt(Table_ht, __wurst_objectToIndex(this87), parentKey, "when calling hasInt in Table, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function Table_Table_removeInt(this90, parentKey3, __wurst_stackPos103) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos103
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_RemoveSavedInteger(Table_ht, __wurst_objectToIndex(this90), parentKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadInt(this89, parentKey2, __wurst_stackPos102) 
	local stackTrace_tempReturn1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos102
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = hashtable_loadInt(Table_ht, __wurst_objectToIndex(this89), parentKey2, "when calling loadInt in Table, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function Table_Table_saveInt(this88, parentKey1, value1, __wurst_stackPos101) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos101
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveInt(Table_ht, __wurst_objectToIndex(this88), parentKey1, value1, "when calling saveInt in Table, line 44")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_saveString(this109, parentKey8, value3, __wurst_stackPos126) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos126
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveString(Table_ht, __wurst_objectToIndex(this109), parentKey8, value3, "when calling saveString in Table, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadTrigger(this111, parentKey10, __wurst_stackPos128) 
	local stackTrace_tempReturn2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos128
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = hashtable_loadTriggerHandle(Table_ht, __wurst_objectToIndex(this111), parentKey10, "when calling loadTriggerHandle in Table, line 113")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function Table_Table_saveFogState(this113, parentKey12, value5, __wurst_stackPos130) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos130
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveFogStateHandle(Table_ht, __wurst_objectToIndex(this113), parentKey12, value5, "when calling saveFogStateHandle in Table, line 170")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_init(this115, __wurst_stackPos132) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos132
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_new_Table(__wurst_stackPos133) 
	local this116 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos133
	wurst_stack_depth = (wurst_stack_depth + 1)
	this116 = Table:create28()
	Table_construct_Table(this116, "when calling construct_Table in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this116
end

function Table_construct_Table(this94, __wurst_stackPos107) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos107
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_init(this94, "when calling Table_init in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex:create29() 
	local new_inst = ({UnitIndex__unit=nil, })
	setmetatable(new_inst, ({__index=UnitIndex, }))
	return new_inst
end

function UnitIndex_new_UnitIndex(whichUnit, __wurst_stackPos134) 
	local this117 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos134
	wurst_stack_depth = (wurst_stack_depth + 1)
	this117 = UnitIndex:create29()
	UnitIndex_construct_UnitIndex(this117, whichUnit, "when calling construct_UnitIndex in UnitIndexer, line 175")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this117
end

function UnitIndex_destroyUnitIndex(this119, __wurst_stackPos136) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos136
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_onDestroy(this119, "when calling UnitIndex_onDestroy in UnitIndexer, line 182")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_init(this121, __wurst_stackPos138) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos138
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_construct_UnitIndex(this118, whichUnit1, __wurst_stackPos135) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos135
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_init(this118, "when calling UnitIndex_init in UnitIndexer, line 175")
	this118.UnitIndex__unit = whichUnit1
	unit_setUserData(this118.UnitIndex__unit, __wurst_objectToIndex(this118), "when calling setUserData in UnitIndexer, line 177")
	pushUnit(whichUnit1, "when calling pushUnit in UnitIndexer, line 178")
	trigger_evaluate(UnitIndexer_onIndexTrigger, "when calling evaluate in UnitIndexer, line 179")
	popUnit("when calling popUnit in UnitIndexer, line 180")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_onDestroy(this120, __wurst_stackPos137) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos137
	wurst_stack_depth = (wurst_stack_depth + 1)
	pushUnit(this120.UnitIndex__unit, "when calling pushUnit in UnitIndexer, line 183")
	trigger_evaluate(UnitIndexer_onDeindexTrigger, "when calling evaluate in UnitIndexer, line 184")
	popUnit("when calling popUnit in UnitIndexer, line 185")
	unit_setUserData(this120.UnitIndex__unit, 0, "when calling setUserData in UnitIndexer, line 186")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initGlobals(__wurst_stackPos143) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos143
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
	gg_unit_cp00_0008 = nil
	gg_unit_hwtw_0003 = nil
	gg_unit_cp00_0011 = nil
	gg_unit_cp00_0006 = nil
	gg_unit_cp00_0007 = nil
	gg_unit_cp00_0014 = nil
	gg_unit_cp00_0005 = nil
	gg_unit_cp00_0013 = nil
	gg_unit_cp00_0018 = nil
	gg_unit_cp00_0010 = nil
	gg_unit_cp00_0009 = nil
	gg_unit_cp00_0015 = nil
	gg_unit_cp00_0019 = nil
	gg_unit_cp00_0012 = nil
	gg_unit_cp00_0017 = nil
	gg_unit_cp00_0016 = nil
	gg_unit_etol_0001 = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitGlobals(__wurst_stackPos144) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos144
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

function CreateBuildingsForPlayer0(__wurst_stackPos145) 
	local p4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos145
	wurst_stack_depth = (wurst_stack_depth + 1)
	p4 = Player(0)
	gg_unit_etol_0001 = __wurst_safe_BlzCreateUnitWithSkin(p4, 1702129516, 1472.0, -(128.0), 270.000, 1702129516)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1701670775, 992.0, 32.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p4, 1700884333, 1664.0, -(704.0), 270.000, 1700884333)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos146) 
	local p5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos146
	wurst_stack_depth = (wurst_stack_depth + 1)
	p5 = Player(0)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1751871081, 1179.1, -(783.8), 90.000, 1751871081)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1751871081, 1052.9, -(792.5), 90.000, 1751871081)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1702061422, 957.7, -(387.4), 69.117, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1702061422, 1066.0, -(511.7), 192.530, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1160785969, 713.0, -(408.7), 159.098, 1160785969)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1164666213, 611.6, -(730.9), 152.000, 1164666213)
	__wurst_safe_BlzCreateUnitWithSkin(p5, 1752196449, 137.5, -(977.8), 341.340, 2019849581)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer1(__wurst_stackPos147) 
	local p6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos147
	wurst_stack_depth = (wurst_stack_depth + 1)
	p6 = Player(1)
	gg_unit_hwtw_0003 = __wurst_safe_BlzCreateUnitWithSkin(p6, 1752659063, -(4736.0), -(5760.0), 270.000, 1752659063)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostileBuildings(__wurst_stackPos148) 
	local p7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos148
	wurst_stack_depth = (wurst_stack_depth + 1)
	p7 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	gg_unit_cp00_0005 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, 1088.0, -(3584.0), 270.000, 1668296752)
	gg_unit_cp00_0006 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, 5376.0, -(896.0), 270.000, 1668296752)
	gg_unit_cp00_0007 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, 3904.0, 3840.0, 270.000, 1668296752)
	gg_unit_cp00_0008 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, 1216.0, -(448.0), 270.000, 1668296752)
	gg_unit_cp00_0009 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(5760.0), 3328.0, 270.000, 1668296752)
	gg_unit_cp00_0010 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(6016.0), -(2496.0), 270.000, 1668296752)
	gg_unit_cp00_0011 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(2688.0), 3072.0, 270.000, 1668296752)
	gg_unit_cp00_0012 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(4544.0), 320.0, 270.000, 1668296752)
	gg_unit_cp00_0013 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(3392.0), -(3200.0), 270.000, 1668296752)
	gg_unit_cp00_0014 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(2240.0), 5376.0, 270.000, 1668296752)
	gg_unit_cp00_0015 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(320.0), 4352.0, 270.000, 1668296752)
	gg_unit_cp00_0016 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(1408.0), -(384.0), 270.000, 1668296752)
	gg_unit_cp00_0017 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, -(1280.0), -(3328.0), 270.000, 1668296752)
	gg_unit_cp00_0018 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, 3264.0, -(1216.0), 270.000, 1668296752)
	gg_unit_cp00_0019 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1668296752, 1664.0, 3776.0, 270.000, 1668296752)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostile(__wurst_stackPos149) 
	local p8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos149
	wurst_stack_depth = (wurst_stack_depth + 1)
	p8 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207724, 3231.4, -(876.6), 78.335, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207724, 3365.2, -(918.6), 34.883, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207731, 3240.0, -(1013.5), 213.724, 1852207731)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853059186, -(1049.9), -(3101.3), 45.652, 1853059186)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853059186, -(889.8), -(3235.0), 37.961, 1853059186)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853059952, -(1108.3), -(3467.5), 68.554, 1853059952)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853125236, 262.1, -(3852.5), 54.470, 1853125236)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060200, -(5759.6), -(2337.7), 41.299, 1853060200)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060204, -(5605.5), -(2353.4), 117.876, 1853060204)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060204, -(5633.8), -(2157.0), 200.770, 1853060204)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060204, -(5835.2), -(2095.7), 75.566, 1853060204)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060211, -(5460.5), -(2277.5), 187.268, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060211, -(5453.3), -(2092.9), 280.742, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060211, -(5603.0), -(1981.1), 109.405, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853060211, -(5849.6), -(2004.7), 145.079, 1853060211)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853320295, -(1483.1), -(688.7), 34.308, 1853320295)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853320308, -(1592.8), -(632.4), 30.080, 1853320308)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1853320308, -(1454.7), -(780.7), 19.573, 1853320308)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207713, 5541.8, -(926.4), 164.432, 1852207713)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207724, 5187.4, -(1075.3), 165.269, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207724, 5125.9, -(880.8), 181.638, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207724, 5135.2, -(682.5), 253.285, 1852207724)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852207717, 5312.7, -(723.8), 264.573, 1852207717)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852270642, 1184.2, -(3594.4), 143.208, 1852270642)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852270641, 1397.8, -(3429.9), 179.640, 1852270641)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852270641, 1033.7, -(3799.2), 110.286, 1852270641)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852270641, 1335.9, -(3694.9), 153.903, 1852270641)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1848651824, 422.5, -(52.9), 184.565, 1848651824)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassiveBuildings(__wurst_stackPos150) 
	local p9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos150
	wurst_stack_depth = (wurst_stack_depth + 1)
	p9 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1852207665, 5312.0, -(512.0), 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1852207666, 5632.0, -(512.0), 270.000, 1852207666)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos151) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos151
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateBuildingsForPlayer0("when calling CreateBuildingsForPlayer0 in war3map, line 214")
	CreateBuildingsForPlayer1("when calling CreateBuildingsForPlayer1 in war3map, line 215")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos152) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos152
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 220")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos153) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos153
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateNeutralHostileBuildings("when calling CreateNeutralHostileBuildings in war3map, line 225")
	CreateNeutralPassiveBuildings("when calling CreateNeutralPassiveBuildings in war3map, line 226")
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 227")
	CreateNeutralHostile("when calling CreateNeutralHostile in war3map, line 228")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 229")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateRegions(__wurst_stackPos154) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos154
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_rct_Region_000 = Rect(-(4960.0), -(6336.0), -(4512.0), -(5984.0))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_init_Actions(__wurst_stackPos155) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos155
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

function InitTrig_init(__wurst_stackPos156) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos156
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_init = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_init, function (...) 
			xpcall(function (...) 
					bridge_Trig_init_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomTriggers(__wurst_stackPos157) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos157
	wurst_stack_depth = (wurst_stack_depth + 1)
	InitTrig_init("when calling InitTrig_init in war3map, line 281")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function RunInitializationTriggers(__wurst_stackPos158) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos158
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
	gg_unit_cp00_0008 = nil
	gg_unit_hwtw_0003 = nil
	gg_unit_cp00_0011 = nil
	gg_unit_cp00_0006 = nil
	gg_unit_cp00_0007 = nil
	gg_unit_cp00_0014 = nil
	gg_unit_cp00_0005 = nil
	gg_unit_cp00_0013 = nil
	gg_unit_cp00_0018 = nil
	gg_unit_cp00_0010 = nil
	gg_unit_cp00_0009 = nil
	gg_unit_cp00_0015 = nil
	gg_unit_cp00_0019 = nil
	gg_unit_cp00_0012 = nil
	gg_unit_cp00_0017 = nil
	gg_unit_cp00_0016 = nil
	gg_unit_etol_0001 = nil
	Abilities_cloudOfFog = ""
	Angle_RADTODEG = 0.
	BasicWaves_selectedTarget = nil
	BasicWaves_footmen = nil
	BasicWaves_spawn1 = ({0., 0., })
	Basics_ANIMATION_PERIOD = 0.
	Basics_DUMMY_PLAYER = nil
	BitSet_BITSET_SIZE = 0
	BitSet_pows = defaultArray(function () 
			return 0
		end)
	Bloom_HEALING_CLOUD_ID = 0
	Bloom_CLOUD_UNIT_ID = 0
	Bloom_CLOUD_RADIUS = 0.
	Bloom_CLOUD_HEAL = 0.
	Bloom_CLOUD_DURATION = 0.
	Bloom_HEAL_INTERVAL = 0.
	CenariusCharacter_CENARIUS_CHARACTER_ID = 0
	ClosureEvents_EVENT_PLAYER_CHAT_FILTER = nil
	ClosureEvents_leaveTrig = nil
	ClosureEvents_keyTrig = nil
	ClosureEvents_eventidToIndex = defaultArray(function () 
			return 0
		end)
	ClosureEvents_eventTypeCounter = 0
	EventListener_castMap = nil
	EventListener_castMapCasters = defaultArray(function () 
			return nil
		end)
	EventListener_generalListenersFirsts = defaultArray(function () 
			return nil
		end)
	EventListener_unitListenersFirsts = defaultArray(function () 
			return nil
		end)
	EventListener_useMouseEvents = false
	ClosureForGroups_tempCallbacks = defaultArray(function () 
			return nil
		end)
	ClosureForGroups_tempCallbacksUntil = defaultArray(function () 
			return nil
		end)
	ClosureForGroups_callbackMode = defaultArray(function () 
			return 0
		end)
	ClosureForGroups_countLimits = defaultArray(function () 
			return 0
		end)
	ClosureForGroups_countIters = defaultArray(function () 
			return 0
		end)
	ClosureForGroups_stopRequested = defaultArray(function () 
			return false
		end)
	ClosureForGroups_tempCallbacksCount = 0
	ClosureForGroups_MODE_NORMAL = 0
	ClosureForGroups_MODE_COUNTED = 0
	ClosureTimers_x = 0
	Colors_hexs = defaultArray(function () 
			return ""
		end)
	Colors_decs = nil
	Colors_COLOR_WHITE = ({0, 0, 0, 0, })
	Colors_COLOR_BLACK = ({0, 0, 0, 0, })
	Colors_COLOR_GOLD = ({0, 0, 0, 0, })
	ControlPoint_controlPoints = nil
	ControlPoint_controlPointValue = 0
	DamageEvent_DETECT_NATIVE_ABILITIES = false
	DamageEvent_DAMAGE_ELEMENT_ATTACK = nil
	DamageEvent_nextDamageId = 0
	DamageEvent_nextDamageType = 0
	DamageEvent_nextDamageElement = nil
	DamageEvent_abort = false
	DamageEvent_firstListeners = defaultArray(function () 
			return nil
		end)
	DamageEvent_maxPriority = 0
	DamageEvent_firstUnreducedListeners = defaultArray(function () 
			return nil
		end)
	DamageEvent_maxUnreducedPriority = 0
	DamageInstance_current = nil
	DamageInstance_stack = defaultArray(function () 
			return nil
		end)
	DamageInstance_count = 0
	ErrorHandling_MUTE_ERROR_DURATION = 0
	ErrorHandling_PRIMARY_ERROR_KEY = 0
	ErrorHandling_HT = nil
	ErrorHandling_lastError = ""
	ErrorHandling_suppressErrorMessages = false
	Execute_executeForce = nil
	Execute_tempCallbacksSuccess = defaultArray(function () 
			return false
		end)
	Execute_tempCallbacks = defaultArray(function () 
			return nil
		end)
	Execute_tempCallbacksCount = 0
	GameTimer_currentTime = 0.
	GroupUtils_GROUP_NUMBER_LIMIT = 0
	GroupUtils_START_CREATE_GROUPS = 0
	GroupUtils_used = nil
	GroupUtils_stack = defaultArray(function () 
			return nil
		end)
	GroupUtils_numStack = 0
	GroupUtils_numTotal = 0
	GroupUtils_shownMaxError = false
	Group_ENUM_GROUP = nil
	HashList_ht = nil
	HashList_occurences = nil
	Integer_INT_MAX = 0
	Integer_INT_MIN = 0
	Invigorate_seedlingCount = 0
	Invigorate_INVIGORATE_ID = 0
	Invigorate_MAX_SEEDLING_STACKS = 0
	MagicFunctions_compiletime = false
	MapBounds_playableMapRect = nil
	MapBounds_boundRect = nil
	MapBounds_boundRegion = nil
	MapBounds_playableMin = ({0., 0., })
	MapBounds_playableMax = ({0., 0., })
	MapBounds_boundMin = ({0., 0., })
	MapBounds_boundMax = ({0., 0., })
	OnUnitEnterLeave_eventTrigger = nil
	OnUnitEnterLeave_preplacedUnits = nil
	OnUnitEnterLeave_tempUnits = defaultArray(function () 
			return nil
		end)
	OnUnitEnterLeave_tempUnitsCount = 0
	OnUnitEnterLeave_ABILITY_ID = 0
	OrderIds_undefend = 0
	Player_players = defaultArray(function () 
			return nil
		end)
	Player_localPlayer = nil
	Preloader_autoFinish = false
	Preloader_dumg = nil
	Preloader_dum = nil
	Printing_DEBUG_LEVEL = 0
	Printing_DEBUG_MSG_DURATION = 0.
	RegisterEvents_t = defaultArray(function () 
			return nil
		end)
	RegisterEvents_onCastMap = nil
	ShieldBash_MY_ABILITY_ID = 0
	ShieldBash_MY_ICON_ABILITY_ID = 0
	ShieldBash_ARMOR_BONUS = 0
	ShieldBash_REFLECT_CHANCE = 0.
	ShieldBash_REFLECT_DAMAGE = 0.
	ShieldBash_REFLECT_SFX = ""
	String_charset = ""
	String_numberset = ""
	SummonTreant_SUMMON_TREANT_ID = 0
	SummonTreant_TREANT_UNIT_ID = 0
	SummonTreant_TREANT_DURATION = 0.
	Table_ht = nil
	TimerUtils_freeTimers = defaultArray(function () 
			return nil
		end)
	TimerUtils_freeTimersCount = 0
	TimerUtils_timerData = nil
	TimerUtils_HELD = 0
	TypeCasting_typecastdata = nil
	TypeCasting_R2I_PRECISION = 0.
	UnitIds_huntress = 0
	UnitIds_keeperofthegrove = 0
	UnitIds_shade = 0
	UnitIndexer_onIndexTrigger = nil
	UnitIndexer_onDeindexTrigger = nil
	UnitIndexer_tempUnits = defaultArray(function () 
			return nil
		end)
	UnitIndexer_tempUnitsCount = 0
	hashtable_compiletime = nil
	hashtable_compiletime1 = nil
	hashtable_compiletime2 = nil
	hashtable_compiletime3 = nil
	wurst_stack_depth = 0
	wurst_stack = defaultArray(function () 
			return ""
		end)
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_Bloom_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_Bloom_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Bloom.call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Bloom.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_Bloom] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_Bloom.__typeId__ = 2
	CallbackSingle_doAfter_Bloom.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Bloom.CallbackSingle_call = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_Bloom_call = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_Bloom_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_Bloom_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Bloom.call = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Bloom.__wurst_supertypes = ({[CallbackSingle_doAfter_Bloom] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_Bloom.__typeId__ = 4
	OnCastListener_onCast_Bloom.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.__wurst_supertypes = ({[OnCastListener_onCast_Bloom] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Bloom.__typeId__ = 25
	OnCastListener_onCast_CenariusCharacter.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter.__typeId__ = 26
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter1] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter1.__typeId__ = 27
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_call = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_call = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CenariusCharacter.call = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CenariusCharacter.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_CenariusCharacter] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_CenariusCharacter.__typeId__ = 6
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_call = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_nullTimer_ClosureEvents_call = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_nullTimer_ClosureEvents_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_nullTimer_ClosureEvents_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_ClosureEvents.call = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_ClosureEvents.__wurst_supertypes = ({[CallbackSingle_nullTimer_ClosureEvents] = true, [CallbackSingle] = true, })
	CallbackSingle_nullTimer_ClosureEvents.__typeId__ = 7
	EventListener.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener.destroyEventListener = EventListener_destroyEventListener
	EventListener.__wurst_supertypes = ({[EventListener] = true, })
	EventListener.__typeId__ = 14
	OnCastListener.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.__wurst_supertypes = ({[OnCastListener] = true, })
	OnCastListener.__typeId__ = 24
	ForGroupCallback.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.__wurst_supertypes = ({[ForGroupCallback] = true, })
	ForGroupCallback.__typeId__ = 19
	ForGroupCallbackUntil.__wurst_supertypes = ({[ForGroupCallbackUntil] = true, })
	ForGroupCallbackUntil.__typeId__ = 21
	CallbackPeriodic.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic.__wurst_supertypes = ({[CallbackPeriodic] = true, })
	CallbackPeriodic.__typeId__ = 1
	CallbackSingle.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle.__wurst_supertypes = ({[CallbackSingle] = true, })
	CallbackSingle.__typeId__ = 3
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.__wurst_supertypes = ({[EventListener_add_DamageEvent] = true, [EventListener] = true, })
	EventListener_add_DamageEvent.__typeId__ = 15
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.__wurst_supertypes = ({[EventListener_add_DamageEvent1] = true, [EventListener] = true, })
	EventListener_add_DamageEvent1.__typeId__ = 16
	DamageElement.__wurst_supertypes = ({[DamageElement] = true, })
	DamageElement.__typeId__ = 10
	DamageInstance.DamageInstance_DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.DamageInstance_destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.__wurst_supertypes = ({[DamageInstance] = true, })
	DamageInstance.__typeId__ = 11
	DamageListener.__wurst_supertypes = ({[DamageListener] = true, })
	DamageListener.__typeId__ = 12
	ForForceCallback.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.__wurst_supertypes = ({[ForForceCallback] = true, })
	ForForceCallback.__typeId__ = 17
	ForForceCallback_execute_GroupUtils.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.ForForceCallback_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.__wurst_supertypes = ({[ForForceCallback_execute_GroupUtils] = true, [ForForceCallback] = true, })
	ForForceCallback_execute_GroupUtils.__typeId__ = 18
	GroupIterator.GroupIterator_destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.__wurst_supertypes = ({[GroupIterator] = true, })
	GroupIterator.__typeId__ = 22
	HashMap.HashMap_HashMap_get = HashMap_HashMap_get
	HashMap.HashMap_HashMap_has = HashMap_HashMap_has
	HashMap.HashMap_HashMap_put = HashMap_HashMap_put
	HashMap.HashMap_HashMap_remove = HashMap_HashMap_remove
	HashMap.HashMap_get = HashMap_HashMap_get
	HashMap.HashMap_has = HashMap_HashMap_has
	HashMap.HashMap_hasInt = Table_Table_hasInt
	HashMap.HashMap_loadInt = Table_Table_loadInt
	HashMap.HashMap_loadTrigger = Table_Table_loadTrigger
	HashMap.HashMap_put = HashMap_HashMap_put
	HashMap.HashMap_remove = HashMap_HashMap_remove
	HashMap.HashMap_removeInt = Table_Table_removeInt
	HashMap.HashMap_saveFogState = Table_Table_saveFogState
	HashMap.HashMap_saveInt = Table_Table_saveInt
	HashMap.HashMap_saveString = Table_Table_saveString
	HashMap.Table_Table_hasInt = Table_Table_hasInt
	HashMap.Table_Table_loadInt = Table_Table_loadInt
	HashMap.Table_Table_loadTrigger = Table_Table_loadTrigger
	HashMap.Table_Table_removeInt = Table_Table_removeInt
	HashMap.Table_Table_saveFogState = Table_Table_saveFogState
	HashMap.Table_Table_saveInt = Table_Table_saveInt
	HashMap.Table_Table_saveString = Table_Table_saveString
	HashMap.Table_get = HashMap_HashMap_get
	HashMap.Table_has = HashMap_HashMap_has
	HashMap.Table_hasInt = Table_Table_hasInt
	HashMap.Table_loadInt = Table_Table_loadInt
	HashMap.Table_loadTrigger = Table_Table_loadTrigger
	HashMap.Table_put = HashMap_HashMap_put
	HashMap.Table_remove = HashMap_HashMap_remove
	HashMap.Table_removeInt = Table_Table_removeInt
	HashMap.Table_saveFogState = Table_Table_saveFogState
	HashMap.Table_saveInt = Table_Table_saveInt
	HashMap.Table_saveString = Table_Table_saveString
	HashMap.__wurst_supertypes = ({[HashMap] = true, [Table] = true, })
	HashMap.__typeId__ = 29
	CallbackSingle_doAfter_Invigorate.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.CallbackSingle_call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.__wurst_supertypes = ({[CallbackSingle_doAfter_Invigorate] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_Invigorate.__typeId__ = 5
	IdGenerator.__wurst_supertypes = ({[IdGenerator] = true, })
	IdGenerator.__typeId__ = 23
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_nullTimer_OnUnitEnterLeave_call = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_nullTimer_OnUnitEnterLeave_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_nullTimer_OnUnitEnterLeave_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_OnUnitEnterLeave.call = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_OnUnitEnterLeave.__wurst_supertypes = ({[CallbackSingle_nullTimer_OnUnitEnterLeave] = true, [CallbackSingle] = true, })
	CallbackSingle_nullTimer_OnUnitEnterLeave.__typeId__ = 8
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.__wurst_supertypes = ({[ForGroupCallback_forEachFrom_Preloader] = true, [ForGroupCallback] = true, })
	ForGroupCallback_forEachFrom_Preloader.__typeId__ = 20
	CallbackSingle_nullTimer_Preloader.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_Preloader.CallbackSingle_call = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_nullTimer_Preloader_call = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_nullTimer_Preloader_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_Preloader.CallbackSingle_nullTimer_Preloader_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_Preloader.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_Preloader.call = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_Preloader.__wurst_supertypes = ({[CallbackSingle_nullTimer_Preloader] = true, [CallbackSingle] = true, })
	CallbackSingle_nullTimer_Preloader.__typeId__ = 9
	DamageListener_addListener_ShieldBash.DamageListener_addListener_ShieldBash_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.DamageListener_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.__wurst_supertypes = ({[DamageListener_addListener_ShieldBash] = true, [DamageListener] = true, })
	DamageListener_addListener_ShieldBash.__typeId__ = 13
	Table.Table_Table_hasInt = Table_Table_hasInt
	Table.Table_Table_loadInt = Table_Table_loadInt
	Table.Table_Table_loadTrigger = Table_Table_loadTrigger
	Table.Table_Table_removeInt = Table_Table_removeInt
	Table.Table_Table_saveFogState = Table_Table_saveFogState
	Table.Table_Table_saveInt = Table_Table_saveInt
	Table.Table_Table_saveString = Table_Table_saveString
	Table.Table_hasInt = Table_Table_hasInt
	Table.Table_loadInt = Table_Table_loadInt
	Table.Table_loadTrigger = Table_Table_loadTrigger
	Table.Table_removeInt = Table_Table_removeInt
	Table.Table_saveFogState = Table_Table_saveFogState
	Table.Table_saveInt = Table_Table_saveInt
	Table.Table_saveString = Table_Table_saveString
	Table.__wurst_supertypes = ({[Table] = true, })
	Table.__typeId__ = 28
	UnitIndex.UnitIndex_destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.__wurst_supertypes = ({[UnitIndex] = true, })
	UnitIndex.__typeId__ = 30
	initGlobals("when calling initGlobals")
	initCompiletimeState("when calling initCompiletimeState in blizzard, line 1")
	SetCameraBounds((-(7424.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(7680.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(7424.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(7680.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("AshenvaleDay")
	SetAmbientNightSound("AshenvaleNight")
	SetMapMusic("Music", true, 0)
	CreateRegions("when calling CreateRegions in war3map, line 326")
	CreateAllUnits("when calling CreateAllUnits in war3map, line 327")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 329")
	InitCustomTriggers("when calling InitCustomTriggers in war3map, line 330")
	RunInitializationTriggers("when calling RunInitializationTriggers in war3map, line 331")
	do
	  local __wurst_init_ok = xpcall(init_Abilities, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Abilities.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_AbilityIds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package AbilityIds.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Real, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Real.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Integer, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Integer.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_BitSet, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package BitSet.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Angle, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Angle.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Maths, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Maths.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_String, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package String.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Vectors, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Vectors.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Destructable, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Destructable.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Player, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Player.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Printing, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Printing.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_MagicFunctions, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package MagicFunctions.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Basics, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Basics.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_GameTimer, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package GameTimer.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ErrorHandling, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ErrorHandling.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Matrices, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Matrices.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Quaternion, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Quaternion.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Table, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Table.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Force, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Force.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Playercolor, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Playercolor.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Colors, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Colors.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Framehandle, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Framehandle.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Group, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Group.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Lightning, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Lightning.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_WeatherEffects, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package WeatherEffects.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_TypeCasting, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package TypeCasting.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_HashList, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package HashList.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_EventHelper, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package EventHelper.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ClosureForGroups, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ClosureForGroups.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_LinkedList, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package LinkedList.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ObjectIds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ObjectIds.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_TargetsAllowed, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package TargetsAllowed.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_AbilityObjEditing, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package AbilityObjEditing.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_BasicWaves, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package BasicWaves.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Icons, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Icons.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_TimerUtils, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package TimerUtils.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ClosureTimers, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ClosureTimers.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_UnitIds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package UnitIds.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_MapBounds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package MapBounds.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Preloader, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Preloader.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ObjectIdGenerator, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ObjectIdGenerator.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_RegisterEvents, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package RegisterEvents.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Orders, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Orders.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_OnUnitEnterLeave, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package OnUnitEnterLeave.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_UnitIndexer, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package UnitIndexer.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ClosureEvents, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ClosureEvents.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Execute, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Execute.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_GroupUtils, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package GroupUtils.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Invigorate, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Invigorate.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_BuffIds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package BuffIds.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_UI, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package UI.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Bloom, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Bloom.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_SummonTreant, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package SummonTreant.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_CenariusCharacter, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package CenariusCharacter.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ControlPoint, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ControlPoint.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_DamageEvent, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package DamageEvent.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ShieldBash, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ShieldBash.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_winLoss, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package winLoss.", "<lua error>")
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

function init_Abilities(__wurst_stackPos160) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos160
	wurst_stack_depth = (wurst_stack_depth + 1)
	Abilities_cloudOfFog = "Abilities\\Spells\\Human\\CloudOfFog\\CloudOfFog.mdx"
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityIds(__wurst_stackPos161) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos161
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityObjEditing(__wurst_stackPos193) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos193
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos165) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos165
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this124, __wurst_stackPos219) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos219
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this124[1] * Angle_RADTODEG)
end

function init_BasicWaves(__wurst_stackPos194) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos194
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

function createPlayerUnit(p10, unitID, number, unitGroup, __wurst_stackPos225) 
	local i4 = nil
	local temp4 = nil
	local u8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos225
	wurst_stack_depth = (wurst_stack_depth + 1)
	i4 = 0
	temp4 = (number - 1)
	while true do
		if (i4 > temp4) then
			break
		end
		u8 = createUnit(p10, unitID, BasicWaves_spawn1, ({0., }), "when calling createUnit in BasicWaves, line 15")
		group_add1(unitGroup, "when calling add in BasicWaves, line 16", u8)
		i4 = (i4 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnWave(__wurst_stackPos227) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos227
	wurst_stack_depth = (wurst_stack_depth + 1)
	createPlayerUnit(Player_players[1], 1751543663, 1, BasicWaves_footmen, "when calling createPlayerUnit in BasicWaves, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupWaveSpawn(__wurst_stackPos222) 
	local receiver17 = nil
	local receiver18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos222
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver17 = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver17, Player_players[0], "-spawn", true, "when calling registerPlayerChatEvent in BasicWaves, line 23")
	receiver18 = receiver17
	trigger_addAction(receiver18, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves(__wurst_stackPos228) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos228
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAttackPlayer(__wurst_stackPos223) 
	local receiver19 = nil
	local receiver20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos223
	wurst_stack_depth = (wurst_stack_depth + 1)
	BasicWaves_selectedTarget = udg_townHall
	receiver19 = CreateTrigger()
	trigger_registerPlayerChatEvent(receiver19, Player_players[0], "-attack", true, "when calling registerPlayerChatEvent in BasicWaves, line 30")
	receiver20 = receiver19
	trigger_addAction(receiver20, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 31")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_BasicWaves1(__wurst_stackPos229) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos229
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 32")
	print2(group_size(BasicWaves_footmen, "when calling size in BasicWaves, line 33"), "when calling print in BasicWaves, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupBuildingDeathTrigger(__wurst_stackPos224) 
	local receiver21 = nil
	local receiver22 = nil
	local receiver23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos224
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver21 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver21, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in BasicWaves, line 37")
	receiver22 = receiver21
	trigger_addCondition(receiver22, __wurst_safe_Condition(function (...) 
			local tempRes = nil
			xpcall(function (...) 
					tempRes = bridge_code__Condition_addCondition_addAction_BasicWaves(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			return tempRes
		end), "when calling addCondition in BasicWaves, line 38")
	receiver23 = receiver22
	trigger_addAction(receiver23, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_BasicWaves2(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in BasicWaves, line 39")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Condition_addCondition_addAction_BasicWaves(__wurst_stackPos234) 
	local stackTrace_tempReturn3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos234
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = (GetTriggerUnit() == udg_watchTower)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function code__addAction_BasicWaves2(__wurst_stackPos235) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos235
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 40")
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function startingCameraPosition(__wurst_stackPos221) 
	local u9 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos221
	wurst_stack_depth = (wurst_stack_depth + 1)
	u9 = ({__wurst_safe_GetUnitX(udg_heroSelector), __wurst_safe_GetUnitY(udg_heroSelector), })
	__wurst_safe_SetCameraPositionForPlayer(Player_players[0], u9[1], u9[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Basics(__wurst_stackPos173) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos173
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	Basics_DUMMY_PLAYER = Player_players[PLAYER_NEUTRAL_PASSIVE]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_BitSet(__wurst_stackPos164) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos164
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_BITSET_SIZE = 32
	initPows("when calling initPows in BitSet, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPows(__wurst_stackPos236) 
	local allPows = nil
	local i5 = nil
	local temp5 = nil
	local i6 = nil
	local temp6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos236
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_pows[0] = 1
	allPows = 1
	i5 = 1
	temp5 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i5 > temp5) then
			break
		end
		BitSet_pows[i5] = (intEnsure(BitSet_pows[(i5 - 1)]) * 2)
		allPows = int_bitOr(allPows, intEnsure(BitSet_pows[i5]), "when calling bitOr in BitSet, line 17")
		i5 = (i5 + 1)
	end
	i6 = 0
	temp6 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i6 > temp6) then
			break
		end
		int_bitXor(allPows, intEnsure(BitSet_pows[i6]), "when calling bitXor in BitSet, line 19")
		i6 = (i6 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Bloom(__wurst_stackPos212) 
	local clVar1 = nil
	local iterator2 = nil
	local u10 = nil
	local temp102 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos212
	wurst_stack_depth = (wurst_stack_depth + 1)
	Bloom_HEALING_CLOUD_ID = intEnsure(1095577654)
	Bloom_CLOUD_UNIT_ID = 1752196449
	Bloom_CLOUD_RADIUS = 256.
	Bloom_CLOUD_HEAL = 30.
	Bloom_CLOUD_DURATION = 10.
	Bloom_HEAL_INTERVAL = 1.
	temp102 = Bloom_HEALING_CLOUD_ID
	clVar1 = OnCastListener_onCast_Bloom:create2()
	OnCastListener_construct_OnCastListener(clVar1, "when calling construct_OnCastListener in Bloom, line 74")
	EventListener_onCast(temp102, clVar1, "when calling onCast in Bloom, line 74")
	group_enumUnitsOfType(Group_ENUM_GROUP, 1164666213, nil, "when calling enumUnitsOfType in Bloom, line 82")
	iterator2 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 83")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator2, "when calling hasNext in Bloom, line 83")) then
			break
		end
		u10 = GroupIterator_GroupIterator_next(iterator2, "when calling next in Bloom, line 83")
		__wurst_safe_UnitAddAbility(u10, Bloom_HEALING_CLOUD_ID)
	end
	GroupIterator_GroupIterator_close(iterator2, "when calling close in Bloom, line 83")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnCloud(owner, pos1, __wurst_stackPos20) 
	local cloud = nil
	local sfx = nil
	local healTimer = nil
	local clVar2 = nil
	local clVar3 = nil
	local temp103 = nil
	local temp104 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos20
	wurst_stack_depth = (wurst_stack_depth + 1)
	cloud = createUnit(owner, Bloom_CLOUD_UNIT_ID, pos1, ({0., }), "when calling createUnit in Bloom, line 46")
	unit_setInvulnerable(cloud, true, "when calling setInvulnerable in Bloom, line 47")
	unit_pause(cloud, "when calling pause in Bloom, line 48")
	unit_setVertexColor(cloud, 0, 0, 0, 0, "when calling setVertexColor in Bloom, line 49")
	unit_addAbility(cloud, 1097625443, "when calling addAbility in Bloom, line 50")
	unit_setPathing(cloud, false, "when calling setPathing in Bloom, line 51")
	sfx = widget_addEffect(cloud, Abilities_cloudOfFog, "origin", "when calling addEffect in Bloom, line 56")
	effect_setScale(sfx, 1.5, "when calling setScale in Bloom, line 57")
	effect_setColor(sfx, 0, 255, 0, "when calling setColor in Bloom, line 58")
	temp103 = Bloom_HEAL_INTERVAL
	clVar2 = CallbackPeriodic_doPeriodically_Bloom:create()
	CallbackPeriodic_construct_CallbackPeriodic(clVar2, "when calling construct_CallbackPeriodic in Bloom, line 60")
	clVar2.pos = tupleCopy(pos1)
	clVar2.owner = owner
	healTimer = doPeriodically(temp103, clVar2, "when calling doPeriodically in Bloom, line 60")
	temp104 = Bloom_CLOUD_DURATION
	clVar3 = CallbackSingle_doAfter_Bloom:create1()
	CallbackSingle_construct_CallbackSingle(clVar3, "when calling construct_CallbackSingle in Bloom, line 67")
	clVar3.healTimer = healTimer
	clVar3.cloud = cloud
	clVar3.sfx = sfx
	doAfter(temp104, clVar3, "when calling doAfter in Bloom, line 67")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_BuffIds(__wurst_stackPos210) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos210
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CenariusCharacter(__wurst_stackPos214) 
	local iterator3 = nil
	local u11 = nil
	local clVar4 = nil
	local clVar5 = nil
	local temp105 = nil
	local temp106 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos214
	wurst_stack_depth = (wurst_stack_depth + 1)
	CenariusCharacter_CENARIUS_CHARACTER_ID = UnitIds_keeperofthegrove
	group_enumUnitsOfType(Group_ENUM_GROUP, CenariusCharacter_CENARIUS_CHARACTER_ID, nil, "when calling enumUnitsOfType in CenariusCharacter, line 13")
	iterator3 = group_iterator(Group_ENUM_GROUP, "when calling iterator in CenariusCharacter, line 14")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator3, "when calling hasNext in CenariusCharacter, line 14")) then
			break
		end
		u11 = GroupIterator_GroupIterator_next(iterator3, "when calling next in CenariusCharacter, line 14")
		__wurst_safe_UnitAddAbility(u11, Invigorate_INVIGORATE_ID)
		__wurst_safe_UnitAddAbility(u11, SummonTreant_SUMMON_TREANT_ID)
	end
	GroupIterator_GroupIterator_close(iterator3, "when calling close in CenariusCharacter, line 14")
	temp105 = Invigorate_INVIGORATE_ID
	clVar4 = OnCastListener_onCast_CenariusCharacter:create3()
	OnCastListener_construct_OnCastListener(clVar4, "when calling construct_OnCastListener in CenariusCharacter, line 18")
	EventListener_onCast(temp105, clVar4, "when calling onCast in CenariusCharacter, line 18")
	temp106 = SummonTreant_SUMMON_TREANT_ID
	clVar5 = OnCastListener_onCast_CenariusCharacter1:create4()
	OnCastListener_construct_OnCastListener(clVar5, "when calling construct_OnCastListener in CenariusCharacter, line 22")
	EventListener_onCast(temp106, clVar5, "when calling onCast in CenariusCharacter, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureEvents(__wurst_stackPos206) 
	local clVar6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos206
	wurst_stack_depth = (wurst_stack_depth + 1)
	ClosureEvents_EVENT_PLAYER_CHAT_FILTER = ConvertPlayerEvent(96)
	EventListener_castMap = HashMap_new_HashMap("when calling new_HashMap in ClosureEvents, line 109")
	EventListener_useMouseEvents = false
	ClosureEvents_leaveTrig = CreateTrigger()
	ClosureEvents_keyTrig = CreateTrigger()
	ClosureEvents_eventTypeCounter = 0
	onUnitDeindex(function (...) 
			xpcall(function (...) 
					bridge_code__onUnitDeindex_ClosureEvents(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling onUnitDeindex in ClosureEvents, line 304")
	clVar6 = CallbackSingle_nullTimer_ClosureEvents:create6()
	CallbackSingle_construct_CallbackSingle(clVar6, "when calling construct_CallbackSingle in ClosureEvents, line 306")
	nullTimer(clVar6, "when calling nullTimer in ClosureEvents, line 306")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function fireEvents(_u, __wurst_stackPos252) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos252
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function eventid_toIntId(this141, __wurst_stackPos253) 
	local id5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos253
	wurst_stack_depth = (wurst_stack_depth + 1)
	id5 = intEnsure(ClosureEvents_eventidToIndex[handle_getHandleId(this141, "when calling getHandleId in ClosureEvents, line 248")])
	if (id5 == 0) then
		id5 = registerEventId(this141, "when calling registerEventId in ClosureEvents, line 250")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return id5
end

function registerEventId(evnt, __wurst_stackPos255) 
	local eventId = nil
	local i7 = nil
	local temp7 = nil
	local receiver24 = nil
	local receiver25 = nil
	local receiver26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos255
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId = handle_getHandleId(evnt, "when calling getHandleId in ClosureEvents, line 257")
	ClosureEvents_eventTypeCounter = (ClosureEvents_eventTypeCounter + 1)
	ClosureEvents_eventidToIndex[eventId] = ClosureEvents_eventTypeCounter
	if (evnt == EVENT_UNIT_DAMAGED) then
		ClosureEvents_eventidToIndex[handle_getHandleId(EVENT_PLAYER_UNIT_DAMAGED, "when calling getHandleId in ClosureEvents, line 261")] = ClosureEvents_eventTypeCounter
		registerPlayerUnitEvent1(EVENT_PLAYER_UNIT_DAMAGED, function (...) 
				xpcall(function (...) 
						bridge_EventListener_generalEventCallback(...)
					end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			end, "when calling registerPlayerUnitEvent in ClosureEvents, line 262")
	elseif (evnt == EVENT_PLAYER_UNIT_DAMAGED) then
		ClosureEvents_eventidToIndex[handle_getHandleId(EVENT_UNIT_DAMAGED, "when calling getHandleId in ClosureEvents, line 264")] = ClosureEvents_eventTypeCounter
		registerPlayerUnitEvent1(EVENT_PLAYER_UNIT_DAMAGED, function (...) 
				xpcall(function (...) 
						bridge_EventListener_generalEventCallback1(...)
					end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			end, "when calling registerPlayerUnitEvent in ClosureEvents, line 265")
	elseif eventid_isPlayerunitEvent(evnt, "when calling isPlayerunitEvent in ClosureEvents, line 266") then
		registerPlayerUnitEvent1(ConvertPlayerUnitEvent(eventId), function (...) 
				xpcall(function (...) 
						bridge_EventListener_generalEventCallback2(...)
					end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			end, "when calling registerPlayerUnitEvent in ClosureEvents, line 267")
	elseif (((not((evnt == EVENT_PLAYER_LEAVE)) and not((evnt == ClosureEvents_EVENT_PLAYER_CHAT_FILTER))) and not(eventid_isKeyboardEvent(evnt, "when calling isKeyboardEvent in ClosureEvents, line 268"))) and not(eventid_isMouseEvent(evnt, "when calling isMouseEvent in ClosureEvents, line 268"))) then
		error1(stringConcat(stringConcat("registering handleid: ", int_toString(eventId, "when calling toString in ClosureEvents, line 269")), " non-playerunitevent. Except EVENT_PLAYER_LEAVE these are not supported right now."), "when calling error in ClosureEvents, line 269")
	end
	if (eventid_isMouseEvent(evnt, "when calling isMouseEvent in ClosureEvents, line 270") and not(EventListener_useMouseEvents)) then
		EventListener_useMouseEvents = true
		i7 = 0
		temp7 = (bj_MAX_PLAYERS - 1)
		while true do
			if (i7 > temp7) then
				break
			end
			receiver24 = ClosureEvents_keyTrig
			trigger_registerPlayerEvent(receiver24, Player_players[i7], EVENT_PLAYER_MOUSE_UP, "when calling registerPlayerEvent in ClosureEvents, line 273")
			receiver25 = receiver24
			trigger_registerPlayerEvent(receiver25, Player_players[i7], EVENT_PLAYER_MOUSE_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 274")
			receiver26 = receiver25
			trigger_registerPlayerEvent(receiver26, Player_players[i7], EVENT_PLAYER_MOUSE_MOVE, "when calling registerPlayerEvent in ClosureEvents, line 275")
			i7 = (i7 + 1)
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureEvents_eventTypeCounter
end

function unregisterEventsForUnit(u12, __wurst_stackPos259) 
	local index2 = nil
	local listener5 = nil
	local t = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos259
	wurst_stack_depth = (wurst_stack_depth + 1)
	if fireEvents(u12, "when calling fireEvents in ClosureEvents, line 279") then
		index2 = unit_getIndex(u12, "when calling getIndex in ClosureEvents, line 280")
		unregisterEvents(index2, "when calling unregisterEvents in ClosureEvents, line 281")
		if not((EventListener_castMapCasters[index2] == nil)) then
			listener5 = EventListener_castMapCasters[index2]
			EventListener_castMapCasters[index2] = nil
			while true do
				if not(not((listener5 == nil))) then
					break
				end
				t = listener5
				listener5 = listener5.OnCastListener_next
				OnCastListener_destroyOnCastListener(t, "when calling destroyOnCastListener in ClosureEvents, line 288")
			end
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unregisterEvents(id6, __wurst_stackPos260) 
	local listener6 = nil
	local t1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos260
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (id6 > 0) then
		if not((EventListener_unitListenersFirsts[id6] == nil)) then
			Log_trace(stringConcat("unregister unit has listeners. startid: ", int_toString(id6, "when calling toString in ClosureEvents, line 293")), "when calling trace in ClosureEvents, line 293")
			listener6 = EventListener_unitListenersFirsts[id6]
			EventListener_unitListenersFirsts[id6] = nil
			while true do
				if not(not((listener6 == nil))) then
					break
				end
				t1 = listener6
				listener6 = listener6.EventListener_next
				EventListener_destroyEventListener(t1, "when calling destroyEventListener in ClosureEvents, line 299")
			end
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onUnitDeindex_ClosureEvents(__wurst_stackPos262) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos262
	wurst_stack_depth = (wurst_stack_depth + 1)
	unregisterEventsForUnit(getIndexingUnit("when calling getIndexingUnit in ClosureEvents, line 304"), "when calling unregisterEventsForUnit in ClosureEvents, line 304")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents(__wurst_stackPos264) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos264
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 307")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents1(__wurst_stackPos266) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos266
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 308")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_ClosureEvents(__wurst_stackPos267) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos267
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_onSpellEffect("when calling onSpellEffect in ClosureEvents, line 323")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add(eventId1, listener7, __wurst_stackPos269) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos269
	wurst_stack_depth = (wurst_stack_depth + 1)
	listener7.EventListener_eventId = eventid_toIntId(eventId1, "when calling toIntId in ClosureEvents, line 123")
	if not((EventListener_generalListenersFirsts[listener7.EventListener_eventId] == nil)) then
		EventListener_generalListenersFirsts[listener7.EventListener_eventId].EventListener_prev = listener7
		listener7.EventListener_next = EventListener_generalListenersFirsts[listener7.EventListener_eventId]
	end
	EventListener_generalListenersFirsts[listener7.EventListener_eventId] = listener7
	wurst_stack_depth = (wurst_stack_depth - 1)
	return listener7
end

function EventListener_addSpellInternal(u13, abilId1, listener8, __wurst_stackPos270) 
	local index3 = nil
	local entry = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos270
	wurst_stack_depth = (wurst_stack_depth + 1)
	listener8.OnCastListener_abilId = abilId1
	if not((u13 == nil)) then
		listener8.OnCastListener_eventUnit = u13
		index3 = unit_getIndex(u13, "when calling getIndex in ClosureEvents, line 170")
		if not((EventListener_castMapCasters[index3] == nil)) then
			EventListener_castMapCasters[index3].OnCastListener_prev = listener8
			listener8.OnCastListener_next = EventListener_castMapCasters[index3]
		end
		EventListener_castMapCasters[index3] = listener8
	else
		entry = HashMap_HashMap_get(EventListener_castMap, abilId1, "when calling get in ClosureEvents, line 176")
		if not((entry == nil)) then
			entry.OnCastListener_prev = listener8
			listener8.OnCastListener_next = entry
		end
		HashMap_HashMap_put(EventListener_castMap, abilId1, listener8, "when calling put in ClosureEvents, line 181")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return listener8
end

function EventListener_onCast(abilId, listener4, __wurst_stackPos239) 
	local stackTrace_tempReturn4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos239
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = EventListener_addSpellInternal(nil, abilId, listener4, "when calling addSpellInternal in ClosureEvents, line 155")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function EventListener_generalEventCallback(__wurst_stackPos265) 
	local trigUnit = nil
	local id7 = nil
	local index4 = nil
	local listener9 = nil
	local nextListener = nil
	local globalListener = nil
	local nextListener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos265
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit = GetTriggerUnit()
	id7 = eventid_toIntId(GetTriggerEventId(), "when calling toIntId in ClosureEvents, line 186")
	if not((trigUnit == nil)) then
		index4 = unit_getIndex(trigUnit, "when calling getIndex in ClosureEvents, line 189")
		if (index4 > 0) then
			listener9 = EventListener_unitListenersFirsts[index4]
			if (not((listener9 == nil)) and fireEvents(trigUnit, "when calling fireEvents in ClosureEvents, line 192")) then
				while true do
					if not(not((listener9 == nil))) then
						break
					end
					nextListener = listener9.EventListener_next
					if (listener9.EventListener_eventId == id7) then
						listener9:onEvent1("when calling onEvent in ClosureEvents, line 196")
					end
					listener9 = nextListener
				end
			end
		end
	end
	globalListener = EventListener_generalListenersFirsts[id7]
	if not((globalListener == nil)) then
		while true do
			if not(not((globalListener == nil))) then
				break
			end
			nextListener1 = globalListener.EventListener_next
			globalListener:onEvent1("when calling onEvent in ClosureEvents, line 203")
			globalListener = nextListener1
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_onSpellEffect(__wurst_stackPos268) 
	local trigUnit1 = nil
	local abilId2 = nil
	local caster4 = nil
	local index5 = nil
	local listener10 = nil
	local nextListener2 = nil
	local nextListener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos268
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit1 = GetTriggerUnit()
	abilId2 = GetSpellAbilityId()
	caster4 = GetSpellAbilityUnit()
	index5 = unit_getIndex(trigUnit1, "when calling getIndex in ClosureEvents, line 210")
	listener10 = EventListener_castMapCasters[index5]
	while true do
		if not(not((listener10 == nil))) then
			break
		end
		nextListener2 = listener10.OnCastListener_next
		if ((listener10.OnCastListener_abilId == -1) or (listener10.OnCastListener_abilId == abilId2)) then
			listener10:fire(caster4, "when calling fire in ClosureEvents, line 215")
		end
		listener10 = nextListener2
	end
	listener10 = HashMap_HashMap_get(EventListener_castMap, abilId2, "when calling get in ClosureEvents, line 218")
	while true do
		if not(not((listener10 == nil))) then
			break
		end
		nextListener3 = listener10.OnCastListener_next
		if ((listener10.OnCastListener_eventUnit == nil) or (listener10.OnCastListener_eventUnit == trigUnit1)) then
			listener10:fire(caster4, "when calling fire in ClosureEvents, line 222")
		end
		listener10 = nextListener3
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureForGroups(__wurst_stackPos189) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos189
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateGroup()
	ClosureForGroups_tempCallbacksCount = 0
	__wurst_safe_Filter(function (...) 
			xpcall(function (...) 
					bridge_code__Filter_ClosureForGroups(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	ClosureForGroups_MODE_NORMAL = 0
	ClosureForGroups_MODE_COUNTED = 1
	Rect(0., 0., 0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Filter_ClosureForGroups(__wurst_stackPos271) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos271
	wurst_stack_depth = (wurst_stack_depth + 1)
	filterCallback(GetFilterUnit(), "when calling filterCallback in ClosureForGroups, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function filterCallback(filter6, __wurst_stackPos272) 
	local idx = nil
	local mode = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos272
	wurst_stack_depth = (wurst_stack_depth + 1)
	idx = (ClosureForGroups_tempCallbacksCount - 1)
	mode = intEnsure(ClosureForGroups_callbackMode[idx])
	if (mode == ClosureForGroups_MODE_NORMAL) then
		currentCallback("when calling currentCallback in ClosureForGroups, line 30"):callback(filter6, "when calling callback in ClosureForGroups, line 30")
	elseif (mode == ClosureForGroups_MODE_COUNTED) then
		if (intEnsure(ClosureForGroups_countIters[idx]) < intEnsure(ClosureForGroups_countLimits[idx])) then
			currentCallback("when calling currentCallback in ClosureForGroups, line 33"):callback(filter6, "when calling callback in ClosureForGroups, line 33")
		end
		ClosureForGroups_countIters[idx] = (intEnsure(ClosureForGroups_countIters[idx]) + 1)
	elseif not(boolEnsure(ClosureForGroups_stopRequested[idx])) then
		if not(currentCallbackUntil("when calling currentCallbackUntil in ClosureForGroups, line 36"):ForGroupCallbackUntil_callback(filter6, "when calling callback in ClosureForGroups, line 36")) then
			ClosureForGroups_stopRequested[idx] = true
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function currentCallback(__wurst_stackPos273) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos273
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacks[(ClosureForGroups_tempCallbacksCount - 1)]
end

function currentCallbackUntil(__wurst_stackPos274) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos274
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacksUntil[(ClosureForGroups_tempCallbacksCount - 1)]
end

function group_forEachFrom(this146, cb5, __wurst_stackPos275) 
	local u14 = nil
	local from = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos275
	wurst_stack_depth = (wurst_stack_depth + 1)
	from = this146
	while true do
		if not(group_hasNext(from, "when calling hasNext in ClosureForGroups, line 80")) then
			break
		end
		u14 = group_next(from, "when calling next in ClosureForGroups, line 80")
		cb5:callback(u14, "when calling callback in ClosureForGroups, line 81")
	end
	ForGroupCallback_destroyForGroupCallback(cb5, "when calling destroyForGroupCallback in ClosureForGroups, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureTimers(__wurst_stackPos197) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos197
	wurst_stack_depth = (wurst_stack_depth + 1)
	ClosureTimers_x = 200
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_doAfter(this149, timeToWait1, cb6, __wurst_stackPos278) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos278
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_start(cb6, this149, timeToWait1, "when calling start in ClosureTimers, line 17")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb6
end

function doAfter(timeToWait, cb1, __wurst_stackPos30) 
	local stackTrace_tempReturn5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos30
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = timer_doAfter(getTimer("when calling getTimer in ClosureTimers, line 28"), timeToWait, cb1, "when calling doAfter in ClosureTimers, line 28")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function nullTimer(cb4, __wurst_stackPos251) 
	local stackTrace_tempReturn6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos251
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = doAfter(0., cb4, "when calling doAfter in ClosureTimers, line 51")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function timer_doPeriodically(this150, time5, cb7, __wurst_stackPos280) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos280
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_start(cb7, this150, time5, "when calling start in ClosureTimers, line 63")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb7
end

function doPeriodically(time4, cb3, __wurst_stackPos249) 
	local stackTrace_tempReturn7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos249
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = timer_doPeriodically(getTimer("when calling getTimer in ClosureTimers, line 75"), time4, cb3, "when calling doPeriodically in ClosureTimers, line 75")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function CallbackPeriodic_staticCallback(__wurst_stackPos281) 
	local cb8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos281
	wurst_stack_depth = (wurst_stack_depth + 1)
	cb8 = __wurst_objectFromIndex(timer_getData(GetExpiredTimer(), "when calling getData in ClosureTimers, line 162"))
	cb8:call(cb8, "when calling call in ClosureTimers, line 163")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__start_CallbackSingle_ClosureTimers(__wurst_stackPos283) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos283
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_staticCallback("when calling staticCallback in ClosureTimers, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_staticCallback(__wurst_stackPos284) 
	local t2 = nil
	local cb9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos284
	wurst_stack_depth = (wurst_stack_depth + 1)
	t2 = GetExpiredTimer()
	cb9 = __wurst_objectFromIndex(timer_getData(t2, "when calling getData in ClosureTimers, line 140"))
	cb9:call1("when calling call in ClosureTimers, line 141")
	CallbackSingle_destroyCallbackSingle(cb9, "when calling destroyCallbackSingle in ClosureTimers, line 142")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos181) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos181
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

function colorA_toColorString(this152, __wurst_stackPos285) 
	local stackTrace_tempReturn8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos285
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn8 = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this152[4], "when calling toHex in Colors, line 194")), toHex(this152[1], "when calling toHex in Colors, line 194")), toHex(this152[2], "when calling toHex in Colors, line 194")), toHex(this152[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn8
end

function toHex(number1, __wurst_stackPos287) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos287
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number1 // 16)
	secondpart = (number1 - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos286) 
	local i8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos286
	wurst_stack_depth = (wurst_stack_depth + 1)
	i8 = 0
	while true do
		if (i8 > 15) then
			break
		end
		Table_Table_saveInt(Colors_decs, string_getHash(stringEnsure(Colors_hexs[i8]), "when calling getHash in Colors, line 279"), i8, "when calling saveInt in Colors, line 279")
		i8 = (i8 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ControlPoint(__wurst_stackPos215) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos215
	wurst_stack_depth = (wurst_stack_depth + 1)
	ControlPoint_controlPoints = CreateGroup()
	ControlPoint_controlPointValue = 30
	setupAllControlPoints("when calling setupAllControlPoints in ControlPoint, line 54")
	incomeTimer("when calling incomeTimer in ControlPoint, line 55")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function incomeTimer(__wurst_stackPos290) 
	local countdown = nil
	local d = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos290
	wurst_stack_depth = (wurst_stack_depth + 1)
	countdown = CreateTimer()
	d = timer_createTimerDialog(countdown, "when calling createTimerDialog in ControlPoint, line 8")
	timerdialog_setTitle(d, "Next Income:", "when calling setTitle in ControlPoint, line 9")
	timerdialog_display(d, true, "when calling display in ControlPoint, line 10")
	__wurst_safe_TimerStart(countdown, 10., true, function (...) 
			xpcall(function (...) 
					bridge_income(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function income(__wurst_stackPos294) 
	local iterator4 = nil
	local u15 = nil
	local p11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos294
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterator4 = group_iterator(ControlPoint_controlPoints, "when calling iterator in ControlPoint, line 14")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator4, "when calling hasNext in ControlPoint, line 14")) then
			break
		end
		u15 = GroupIterator_GroupIterator_next(iterator4, "when calling next in ControlPoint, line 14")
		p11 = unit_getOwner(u15, "when calling getOwner in ControlPoint, line 15")
		player_addGold(p11, ControlPoint_controlPointValue, "when calling addGold in ControlPoint, line 16")
	end
	GroupIterator_GroupIterator_close(iterator4, "when calling close in ControlPoint, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupCaptureOnHalf(target3, __wurst_stackPos296) 
	local receiver27 = nil
	local receiver28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos296
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver27 = CreateTrigger()
	trigger_registerUnitEvent(receiver27, target3, EVENT_UNIT_DAMAGED, "when calling registerUnitEvent in ControlPoint, line 20")
	receiver28 = receiver27
	trigger_addAction(receiver28, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_ControlPoint(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ControlPoint, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_ControlPoint(__wurst_stackPos298) 
	local u16 = nil
	local attacker = nil
	local hp = nil
	local maxHp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos298
	wurst_stack_depth = (wurst_stack_depth + 1)
	u16 = GetTriggerUnit()
	attacker = GetEventDamageSource()
	hp = __wurst_safe_GetUnitState(u16, UNIT_STATE_LIFE)
	maxHp = __wurst_safe_GetUnitState(u16, UNIT_STATE_MAX_LIFE)
	if ((hp / maxHp) <= 0.5) then
		group_remove(ControlPoint_controlPoints, "when calling remove in ControlPoint, line 27", u16)
		__wurst_safe_SetUnitOwner(u16, unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 28"), true)
		__wurst_safe_SetUnitState(u16, UNIT_STATE_LIFE, maxHp)
		group_add1(ControlPoint_controlPoints, "when calling add in ControlPoint, line 30", u16)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAllControlPoints(__wurst_stackPos289) 
	local u17 = nil
	local iterator5 = nil
	local cp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos289
	wurst_stack_depth = (wurst_stack_depth + 1)
	u17 = CreateGroup()
	group_add1(u17, "when calling add in ControlPoint, line 34", udg_controlPoint_001, udg_controlPoint_002, udg_controlPoint_003, udg_controlPoint_004, udg_controlPoint_005, udg_controlPoint_006, udg_controlPoint_007, udg_controlPoint_008, udg_controlPoint_009, udg_controlPoint_010, udg_controlPoint_011, udg_controlPoint_012, udg_controlPoint_013, udg_controlPoint_014, udg_controlPoint_015)
	iterator5 = group_iterator(u17, "when calling iterator in ControlPoint, line 50")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator5, "when calling hasNext in ControlPoint, line 50")) then
			break
		end
		cp = GroupIterator_GroupIterator_next(iterator5, "when calling next in ControlPoint, line 50")
		setupCaptureOnHalf(cp, "when calling setupCaptureOnHalf in ControlPoint, line 51")
	end
	GroupIterator_GroupIterator_close(iterator5, "when calling close in ControlPoint, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DamageEvent(__wurst_stackPos216) 
	local clVar7 = nil
	local clVar8 = nil
	local temp109 = nil
	local temp110 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos216
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_DETECT_NATIVE_ABILITIES = true
	DamageEvent_DAMAGE_ELEMENT_ATTACK = DamageElement_new_DamageElement("Physical", ({223, 59, 33, 255, }), "when calling new_DamageElement in DamageEvent, line 72")
	DamageInstance_current = nil
	DamageInstance_count = 0
	DamageEvent_nextDamageId = 0
	DamageEvent_nextDamageType = 4
	DamageEvent_nextDamageElement = nil
	DamageEvent_abort = false
	DamageEvent_maxPriority = 0
	DamageEvent_maxUnreducedPriority = 0
	temp109 = EVENT_PLAYER_UNIT_DAMAGING
	clVar7 = EventListener_add_DamageEvent:create13()
	EventListener_construct_EventListener(clVar7, "when calling construct_EventListener in DamageEvent, line 476")
	EventListener_add(temp109, clVar7, "when calling add in DamageEvent, line 476")
	temp110 = EVENT_PLAYER_UNIT_DAMAGED
	clVar8 = EventListener_add_DamageEvent1:create14()
	EventListener_construct_EventListener(clVar8, "when calling construct_EventListener in DamageEvent, line 477")
	EventListener_add(temp110, clVar8, "when calling add in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onUnreducedDamage(__wurst_stackPos70) 
	local amount1 = nil
	local attackType = nil
	local dmg = nil
	local i9 = nil
	local temp8 = nil
	local listener11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos70
	wurst_stack_depth = (wurst_stack_depth + 1)
	amount1 = GetEventDamage()
	attackType = BlzGetEventAttackType()
	if (DamageEvent_nextDamageType == 4) then
		if (DamageEvent_DETECT_NATIVE_ABILITIES and (attackType == ATTACK_TYPE_NORMAL)) then
			DamageEvent_nextDamageType = 1
		else
			DamageEvent_nextDamageType = 0
			DamageEvent_nextDamageElement = DamageEvent_DAMAGE_ELEMENT_ATTACK
		end
	end
	dmg = DamageInstance_new_DamageInstance(DamageEvent_nextDamageId, GetEventDamageSource(), GetTriggerUnit(), amount1, attackType, BlzGetEventDamageType(), BlzGetEventWeaponType(), DamageEvent_nextDamageType, DamageEvent_nextDamageElement, "when calling new_DamageInstance in DamageEvent, line 196")
	DamageEvent_nextDamageId = 0
	DamageEvent_nextDamageType = 4
	DamageEvent_nextDamageElement = nil
	i9 = 0
	temp8 = DamageEvent_maxUnreducedPriority
	while true do
		if (i9 > temp8) then
			break
		end
		listener11 = DamageEvent_firstUnreducedListeners[i9]
		while true do
			if not(not((listener11 == nil))) then
				break
			end
			listener11:onEvent("when calling onEvent in DamageEvent, line 205")
			if DamageEvent_abort then
				dmg.DamageInstance_amount = 0.
				if true then
					break
				end
			else
				listener11 = listener11.DamageListener_next
			end
		end
		if DamageEvent_abort then
			if true then
				break
			end
		end
		i9 = (i9 + 1)
	end
	__wurst_safe_BlzSetEventAttackType(dmg.DamageInstance_nativeAttackType)
	__wurst_safe_BlzSetEventDamageType(dmg.DamageInstance_nativeDamageType)
	__wurst_safe_BlzSetEventWeaponType(dmg.DamageInstance_nativeWeaponType)
	BlzSetEventDamage(dmg.DamageInstance_amount)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onDamage(__wurst_stackPos72) 
	local dmg1 = nil
	local i10 = nil
	local temp9 = nil
	local listener12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos72
	wurst_stack_depth = (wurst_stack_depth + 1)
	dmg1 = DamageInstance_current
	if not(DamageEvent_abort) then
		DamageInstance_DamageInstance_setReducedAmount(dmg1, GetEventDamage(), "when calling setReducedAmount in DamageEvent, line 222")
		i10 = 0
		temp9 = DamageEvent_maxPriority
		while true do
			if (i10 > temp9) then
				break
			end
			listener12 = DamageEvent_firstListeners[i10]
			while true do
				if not(not((listener12 == nil))) then
					break
				end
				listener12:onEvent("when calling onEvent in DamageEvent, line 226")
				if DamageEvent_abort then
					dmg1.DamageInstance_amount = 0.
					if true then
						break
					end
				else
					listener12 = listener12.DamageListener_next
				end
			end
			if DamageEvent_abort then
				if true then
					break
				end
			end
			i10 = (i10 + 1)
		end
		__wurst_safe_BlzSetEventAttackType(dmg1.DamageInstance_nativeAttackType)
		__wurst_safe_BlzSetEventDamageType(dmg1.DamageInstance_nativeDamageType)
		__wurst_safe_BlzSetEventWeaponType(dmg1.DamageInstance_nativeWeaponType)
		BlzSetEventDamage(dmg1.DamageInstance_amount)
	end
	DamageInstance_destroyDamageInstance(dmg1, "when calling destroyDamageInstance in DamageEvent, line 240")
	DamageEvent_abort = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_addListener(listener13, __wurst_stackPos300) 
	local stackTrace_tempReturn9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos300
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn9 = DamageEvent_addListener1(DamageEvent_maxPriority, listener13, "when calling addListener in DamageEvent, line 248")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn9
end

function DamageEvent_addListener1(priority, listener14, __wurst_stackPos301) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos301
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((DamageEvent_firstListeners[priority] == nil)) then
		listener14.DamageListener_next = DamageEvent_firstListeners[priority]
	end
	DamageEvent_firstListeners[priority] = listener14
	if (DamageEvent_maxPriority < priority) then
		DamageEvent_maxPriority = priority
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return listener14
end

function DamageEvent_getSource(__wurst_stackPos302) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos302
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_source
end

function DamageEvent_getTarget(__wurst_stackPos303) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos303
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_target
end

function init_Destructable(__wurst_stackPos169) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos169
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_destr(this13, __wurst_stackPos14) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos14
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyEffect(this13)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_setScale(this139, scale, __wurst_stackPos247) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos247
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectScale(this139, scale)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect(path, target, attachPointName, __wurst_stackPos9) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos9
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(addEffect(path, target, attachPointName, "when calling addEffect in Effect, line 29"), "when calling destr in Effect, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect(path1, target4, attachPointName1, __wurst_stackPos304) 
	local stackTrace_tempReturn10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos304
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn10 = __wurst_safe_AddSpecialEffectTarget(path1, target4, attachPointName1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn10
end

function effect_setColor(this140, r1, g2, b1, __wurst_stackPos248) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos248
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectColor(this140, r1, g2, b1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos175) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos175
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_MUTE_ERROR_DURATION = 60
	ErrorHandling_PRIMARY_ERROR_KEY = -1
	ErrorHandling_HT = hashtable_compiletime
	ErrorHandling_lastError = ""
	ErrorHandling_suppressErrorMessages = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function error1(msg1, __wurst_stackPos34) 
	local hash = nil
	local stacktraceStr = nil
	local stacktraceIndex = nil
	local stacktraceLimit = nil
	local stacktraceStr1 = nil
	local stacktraceIndex1 = nil
	local stacktraceLimit1 = nil
	local temp113 = nil
	local temp114 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos34
	wurst_stack_depth = (wurst_stack_depth + 1)
	if MagicFunctions_compiletime then
		compileError(stringConcat("ERROR: ", msg1), "when calling compileError in ErrorHandling, line 45")
	elseif true then
		ErrorHandling_lastError = msg1
	else
		if not(ErrorHandling_suppressErrorMessages) then
			hash = string_getHash(msg1, "when calling getHash in ErrorHandling, line 53")
			if hashtable_hasInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling hasInt in ErrorHandling, line 54") then
				if ((hashtable_loadInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling loadInt in ErrorHandling, line 56") + ErrorHandling_MUTE_ERROR_DURATION) < GameTimer_currentTime) then
					temp113 = msg1
					stacktraceStr = " Stacktrace:"
					stacktraceIndex = wurst_stack_depth
					stacktraceLimit = 0
					while true do
						stacktraceIndex = (stacktraceIndex - 1)
						stacktraceLimit = (stacktraceLimit + 1)
						if (stacktraceLimit > 20) then
							break
						end
						if (stacktraceIndex < 0) then
							break
						end
						stacktraceStr = stringConcat(stacktraceStr, stringConcat("\n   ", stringEnsure(wurst_stack[stacktraceIndex])))
					end
					if (stacktraceStr == " Stacktrace:") then
						stacktraceStr = " Stacktrace: <none>"
					end
					Log_error(stringConcat(temp113, stacktraceStr), "when calling error in ErrorHandling, line 58")
					hashtable_saveInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, real_toInt(GameTimer_currentTime, "when calling toInt in ErrorHandling, line 59"), "when calling saveInt in ErrorHandling, line 59")
					hashtable_saveBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, false, "when calling saveBoolean in ErrorHandling, line 60")
				elseif hashtable_hasBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling hasBoolean in ErrorHandling, line 61") then
					if not(hashtable_loadBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling loadBoolean in ErrorHandling, line 62")) then
						Log_error("|cffFF3A29Excessive repeating errors are being omitted", "when calling error in ErrorHandling, line 63")
						hashtable_saveBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, true, "when calling saveBoolean in ErrorHandling, line 64")
					end
				else
					Log_error("|cffFF3A29Excessive repeating errors are being omitted", "when calling error in ErrorHandling, line 66")
					hashtable_saveBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, true, "when calling saveBoolean in ErrorHandling, line 67")
				end
			else
				hashtable_saveInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, real_toInt(GameTimer_currentTime, "when calling toInt in ErrorHandling, line 69"), "when calling saveInt in ErrorHandling, line 69")
				temp114 = stringConcat("Message: ", msg1)
				stacktraceStr1 = " Stacktrace:"
				stacktraceIndex1 = wurst_stack_depth
				stacktraceLimit1 = 0
				while true do
					stacktraceIndex1 = (stacktraceIndex1 - 1)
					stacktraceLimit1 = (stacktraceLimit1 + 1)
					if (stacktraceLimit1 > 20) then
						break
					end
					if (stacktraceIndex1 < 0) then
						break
					end
					stacktraceStr1 = stringConcat(stacktraceStr1, stringConcat("\n   ", stringEnsure(wurst_stack[stacktraceIndex1])))
				end
				if (stacktraceStr1 == " Stacktrace:") then
					stacktraceStr1 = " Stacktrace: <none>"
				end
				Log_error(stringConcat(temp114, stacktraceStr1), "when calling error in ErrorHandling, line 70")
			end
		end
		ErrorHandling_lastError = msg1
		error("__wurst_abort_thread", 0)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos188) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos188
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function eventid_isPlayerunitEvent(this143, __wurst_stackPos256) 
	local eventId2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos256
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId2 = handle_getHandleId(this143, "when calling getHandleId in EventHelper, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((((eventId2 >= 18) and (eventId2 <= 51)) or ((eventId2 >= 269) and (eventId2 <= 277))) or (eventId2 == 315)) or (eventId2 == 308))
end

function eventid_isKeyboardEvent(this144, __wurst_stackPos257) 
	local eventId3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos257
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId3 = handle_getHandleId(this144, "when calling getHandleId in EventHelper, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((eventId3 >= 261) and (eventId3 <= 268)) or (eventId3 == 17))
end

function eventid_isMouseEvent(this145, __wurst_stackPos258) 
	local eventId4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos258
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId4 = handle_getHandleId(this145, "when calling getHandleId in EventHelper, line 61")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((eventId4 >= 305) and (eventId4 <= 307))
end

function EventData_getSpellTargetUnit(__wurst_stackPos23) 
	local stackTrace_tempReturn11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos23
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn11 = GetSpellTargetUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn11
end

function init_Execute(__wurst_stackPos207) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos207
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_executeForce = CreateForce()
	force_addPlayer(Execute_executeForce, Player_localPlayer, "when calling addPlayer in Execute, line 15")
	Execute_tempCallbacksCount = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function executeCurrentCallback(__wurst_stackPos312) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos312
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_lastError = ""
	getCurrentCallback("when calling getCurrentCallback in Execute, line 19"):run("when calling run in Execute, line 19")
	setCurrentCallbackSuccess(true, "when calling setCurrentCallbackSuccess in Execute, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getCurrentCallback(__wurst_stackPos313) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos313
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Execute_tempCallbacks[(Execute_tempCallbacksCount - 1)]
end

function setCurrentCallbackSuccess(value10, __wurst_stackPos314) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos314
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksSuccess[(Execute_tempCallbacksCount - 1)] = value10
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushCallback(c1, __wurst_stackPos315) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos315
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacks[Execute_tempCallbacksCount] = c1
	Execute_tempCallbacksSuccess[Execute_tempCallbacksCount] = false
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popCallback(__wurst_stackPos316) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos316
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount - 1)
	ForForceCallback_destroyForForceCallback(Execute_tempCallbacks[Execute_tempCallbacksCount], "when calling destroyForForceCallback in Execute, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function isLastCallbackSuccessful(__wurst_stackPos317) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos317
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return boolEnsure(Execute_tempCallbacksSuccess[Execute_tempCallbacksCount])
end

function execute(c2, __wurst_stackPos318) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos318
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not(try(c2, "when calling try in Execute, line 78")) then
		error1(stringConcat("execute: thread has crashed. caused by:\n| - ", ErrorHandling_lastError), "when calling error in Execute, line 79")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function try(c3, __wurst_stackPos319) 
	local suppressErrors = nil
	local stackTrace_tempReturn12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos319
	wurst_stack_depth = (wurst_stack_depth + 1)
	pushCallback(c3, "when calling pushCallback in Execute, line 96")
	suppressErrors = ErrorHandling_suppressErrorMessages
	ErrorHandling_suppressErrorMessages = true
	force_forEach(Execute_executeForce, function (...) 
			xpcall(function (...) 
					bridge_executeCurrentCallback(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling forEach in Execute, line 99")
	ErrorHandling_suppressErrorMessages = suppressErrors
	popCallback("when calling popCallback in Execute, line 101")
	stackTrace_tempReturn12 = isLastCallbackSuccessful("when calling isLastCallbackSuccessful in Execute, line 102")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn12
end

function init_Force(__wurst_stackPos179) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos179
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_addPlayer(this164, whichPlayer11, __wurst_stackPos311) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos311
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_ForceAddPlayer(this164, whichPlayer11)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_forEach(this165, callback, __wurst_stackPos320) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos320
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_ForForce(this165, callback)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos182) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos182
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos174) 
	local receiver29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos174
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver29 = CreateTimer()
	timer_start(receiver29, 100000., nil, "when calling start in GameTimer, line 7")
	timer_startPeriodic(CreateTimer(), Basics_ANIMATION_PERIOD, function (...) 
			xpcall(function (...) 
					bridge_code__startPeriodic_GameTimer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in GameTimer, line 15")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__startPeriodic_GameTimer(__wurst_stackPos321) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos321
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos183) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos183
	wurst_stack_depth = (wurst_stack_depth + 1)
	Group_ENUM_GROUP = CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GroupUtils(__wurst_stackPos208) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos208
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_GROUP_NUMBER_LIMIT = 1024
	GroupUtils_START_CREATE_GROUPS = 64
	GroupUtils_used = HashMap_new_HashMap("when calling new_HashMap in GroupUtils, line 30")
	GroupUtils_numStack = 0
	GroupUtils_numTotal = 0
	GroupUtils_shownMaxError = false
	initialize("when calling initialize in GroupUtils, line 104")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createGroups(number2, __wurst_stackPos323) 
	local maxCreatePerCycle = nil
	local actualLimit = nil
	local numTarget = nil
	local overflow = nil
	local toCreate = nil
	local createNow = nil
	local clVar9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos323
	wurst_stack_depth = (wurst_stack_depth + 1)
	maxCreatePerCycle = 256
	actualLimit = max("when calling max in GroupUtils, line 81", (JASS_MAX_ARRAY_SIZE - 1), GroupUtils_GROUP_NUMBER_LIMIT)
	numTarget = (GroupUtils_numTotal + number2)
	overflow = max("when calling max in GroupUtils, line 83", 0, (numTarget - actualLimit))
	toCreate = max("when calling max in GroupUtils, line 84", 0, (numTarget - overflow))
	while true do
		if not((toCreate > 0)) then
			break
		end
		createNow = min("when calling min in GroupUtils, line 87", toCreate, maxCreatePerCycle)
		toCreate = (toCreate - createNow)
		clVar9 = ForForceCallback_execute_GroupUtils:create19()
		clVar9.createNow = createNow
		execute(clVar9, "when calling execute in GroupUtils, line 90")
	end
	if ((GroupUtils_numTotal >= GroupUtils_GROUP_NUMBER_LIMIT) and not(GroupUtils_shownMaxError)) then
		Log_warn(stringConcat(stringConcat(stringConcat("Maximum number of GroupUtils groups (", int_toString(GroupUtils_GROUP_NUMBER_LIMIT, "when calling toString in GroupUtils, line 96")), ") created. "), "All newly created groups will be non-recyclable."), "when calling warn in GroupUtils, line 96")
		GroupUtils_shownMaxError = true
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function push(g, __wurst_stackPos88) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos88
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_stack[GroupUtils_numStack] = g
	HashMap_HashMap_put(GroupUtils_used, __wurst_objectToIndex(GroupUtils_stack[GroupUtils_numStack]), booleanToIndex(false, "when calling booleanToIndex in GroupUtils, line 118"), "when calling put in GroupUtils, line 118")
	GroupUtils_numStack = (GroupUtils_numStack + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initialize(__wurst_stackPos322) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos322
	wurst_stack_depth = (wurst_stack_depth + 1)
	createGroups(GroupUtils_START_CREATE_GROUPS, "when calling createGroups in GroupUtils, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRange(this1, pos, range, filter, __wurst_stackPos1) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos1
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsInRange(this1, pos[1], pos[2], range, filter)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRect1(this101, rec1, __wurst_stackPos115) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos115
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRect(this101, rec1, nil, "when calling enumUnitsInRect in Group, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRect(this15, rec, filter1, __wurst_stackPos17) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos17
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsInRect(this15, rec, filter1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsOfType(this132, id4, filter5, __wurst_stackPos240) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos240
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsOfType(this132, UnitId2String(id4), filter5)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this82, __wurst_stackPos95, ...) 
	local i11 = nil
	local g4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos95
	wurst_stack_depth = (wurst_stack_depth + 1)
	i11 = 0
	local __args = table.pack(...)
	for i12=1,__args.n do
	g4 = __args[i12]
	i11 = (i11 + __wurst_safe_BlzGroupAddGroupFast(g4, this82))
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i11
end

function group_clear(this84, __wurst_stackPos97) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos97
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupClear(this84)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add1(this126, __wurst_stackPos226, ...) 
	local i13 = nil
	local u19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos226
	wurst_stack_depth = (wurst_stack_depth + 1)
	i13 = 0
	local __args1 = table.pack(...)
	for i14=1,__args1.n do
	u19 = __args1[i14]
	if __wurst_safe_GroupAddUnit(this126, u19) then
		i13 = (i13 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i13
end

function group_remove(this159, __wurst_stackPos299, ...) 
	local i15 = nil
	local u20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos299
	wurst_stack_depth = (wurst_stack_depth + 1)
	i15 = 0
	local __args2 = table.pack(...)
	for i16=1,__args2.n do
	u20 = __args2[i16]
	if __wurst_safe_GroupRemoveUnit(this159, u20) then
		i15 = (i15 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i15
end

function group_destr(this85, __wurst_stackPos98) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos98
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyGroup(this85)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_size(this83, __wurst_stackPos96) 
	local stackTrace_tempReturn13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos96
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn13 = __wurst_safe_BlzGroupGetSize(this83)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn13
end

function group_isEmpty(this166, __wurst_stackPos328) 
	local stackTrace_tempReturn14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos328
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn14 = not(group_hasNext(this166, "when calling hasNext in Group, line 70"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn14
end

function group_hasNext(this147, __wurst_stackPos276) 
	local stackTrace_tempReturn15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos276
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn15 = not((__wurst_safe_FirstOfGroup(this147) == nil))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn15
end

function group_get(this76, index1, __wurst_stackPos89) 
	local stackTrace_tempReturn16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos89
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn16 = __wurst_safe_BlzGroupUnitAt(this76, index1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn16
end

function group_targetOrder(this127, order, targetWidget, __wurst_stackPos230) 
	local stackTrace_tempReturn17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos230
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn17 = __wurst_safe_GroupTargetOrder(this127, order, targetWidget)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn17
end

function group_iterator(this2, __wurst_stackPos2) 
	local stackTrace_tempReturn18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos2
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn18 = GroupIterator_new_GroupIterator(this2, "when calling new_GroupIterator in Group, line 141")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn18
end

function group_next(this148, __wurst_stackPos277) 
	local iterUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos277
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterUnit = __wurst_safe_FirstOfGroup(this148)
	__wurst_safe_GroupRemoveUnit(this148, iterUnit)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return iterUnit
end

function init_HashList(__wurst_stackPos187) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos187
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashList_ht = hashtable_compiletime2
	HashList_occurences = hashtable_compiletime3
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_hasBoolean(this162, parentKey15, childKey8, __wurst_stackPos309) 
	local stackTrace_tempReturn19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos309
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn19 = __wurst_HaveSavedBoolean(this162, parentKey15, childKey8)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn19
end

function hashtable_hasInt(this106, parentKey4, childKey, __wurst_stackPos123) 
	local stackTrace_tempReturn20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos123
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn20 = __wurst_HaveSavedInteger(this106, parentKey4, childKey)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn20
end

function hashtable_loadBoolean(this163, parentKey16, childKey9, __wurst_stackPos310) 
	local stackTrace_tempReturn21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos310
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn21 = __wurst_LoadBoolean(this163, parentKey16, childKey9)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn21
end

function hashtable_loadInt(this107, parentKey6, childKey2, __wurst_stackPos124) 
	local stackTrace_tempReturn22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos124
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn22 = __wurst_LoadInteger(this107, parentKey6, childKey2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn22
end

function hashtable_loadTriggerHandle(this112, parentKey11, childKey5, __wurst_stackPos129) 
	local stackTrace_tempReturn23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos129
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn23 = __wurst_LoadTriggerHandle(this112, parentKey11, childKey5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn23
end

function hashtable_saveBoolean(this161, parentKey14, childKey7, value9, __wurst_stackPos308) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos308
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveBoolean(this161, parentKey14, childKey7, value9)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveFogStateHandle(this114, parentKey13, childKey6, value6, __wurst_stackPos131) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos131
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveFogStateHandle(this114, parentKey13, childKey6, value6)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveInt(this108, parentKey7, childKey3, value2, __wurst_stackPos125) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos125
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveInteger(this108, parentKey7, childKey3, value2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveString(this110, parentKey9, childKey4, value4, __wurst_stackPos127) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos127
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveStr(this110, parentKey9, childKey4, value4)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Icons(__wurst_stackPos195) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos195
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Integer(__wurst_stackPos163) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos163
	wurst_stack_depth = (wurst_stack_depth + 1)
	Integer_INT_MAX = 2147483647
	Integer_INT_MIN = -2147483648
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function int_toString(this21, __wurst_stackPos26) 
	local stackTrace_tempReturn24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos26
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn24 = tostring(this21)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn24
end

function int_bitOr(this130, other, __wurst_stackPos237) 
	local stackTrace_tempReturn25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos237
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn25 = BlzBitOr(this130, other)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn25
end

function int_bitXor(this131, other1, __wurst_stackPos238) 
	local stackTrace_tempReturn26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos238
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn26 = BlzBitXor(this131, other1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn26
end

function init_Invigorate(__wurst_stackPos209) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos209
	wurst_stack_depth = (wurst_stack_depth + 1)
	Invigorate_seedlingCount = 0
	Invigorate_INVIGORATE_ID = intEnsure(1095577652)
	Invigorate_MAX_SEEDLING_STACKS = 5
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getSeedlingCount(__wurst_stackPos27) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos27
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Invigorate_seedlingCount
end

function addSeedlingStack(__wurst_stackPos24) 
	local clVar10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos24
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount >= Invigorate_MAX_SEEDLING_STACKS) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	Invigorate_seedlingCount = (Invigorate_seedlingCount + 1)
	print1(stringConcat("Seedling stacks: ", int_toString(Invigorate_seedlingCount, "when calling toString in Invigorate, line 22")), "when calling print in Invigorate, line 22")
	clVar10 = CallbackSingle_doAfter_Invigorate:create22()
	CallbackSingle_construct_CallbackSingle(clVar10, "when calling construct_CallbackSingle in Invigorate, line 25")
	doAfter(12., clVar10, "when calling doAfter in Invigorate, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos184) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos184
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_LinkedList(__wurst_stackPos190) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos190
	wurst_stack_depth = (wurst_stack_depth + 1)
	realToIndex(0., "when calling realToIndex in LinkedList, line 617")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos172) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos172
	wurst_stack_depth = (wurst_stack_depth + 1)
	MagicFunctions_compiletime = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function compileError(msg4, __wurst_stackPos305) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos305
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MapBounds(__wurst_stackPos199) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos199
	wurst_stack_depth = (wurst_stack_depth + 1)
	initMapBounds("when calling initMapBounds in MapBounds, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initMapBounds(__wurst_stackPos330) 
	local cond_result = nil
	local receiver30 = nil
	local cond_result1 = nil
	local receiver31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos330
	wurst_stack_depth = (wurst_stack_depth + 1)
	if MagicFunctions_compiletime then
		cond_result = Rect(-1024., -1024., 1024., 1024.)
	else
		cond_result = GetPlayableMapRect()
	end
	MapBounds_playableMapRect = cond_result
	receiver30 = CreateRegion()
	region_addRect(receiver30, MapBounds_playableMapRect, "when calling addRect in MapBounds, line 49")
	if MagicFunctions_compiletime then
		cond_result1 = Rect(-1536., -1536., 1536., 1536.)
	else
		cond_result1 = GetWorldBounds()
	end
	MapBounds_boundRect = cond_result1
	receiver31 = CreateRegion()
	region_addRect(receiver31, MapBounds_boundRect, "when calling addRect in MapBounds, line 51")
	MapBounds_boundRegion = receiver31
	MapBounds_playableMin = ({rect_getMinX(MapBounds_playableMapRect, "when calling getMinX in MapBounds, line 52"), rect_getMinY(MapBounds_playableMapRect, "when calling getMinY in MapBounds, line 52"), })
	MapBounds_playableMax = ({rect_getMaxX(MapBounds_playableMapRect, "when calling getMaxX in MapBounds, line 53"), rect_getMaxY(MapBounds_playableMapRect, "when calling getMaxY in MapBounds, line 53"), })
	MapBounds_boundMin = ({rect_getMinX(MapBounds_boundRect, "when calling getMinX in MapBounds, line 54"), rect_getMinY(MapBounds_boundRect, "when calling getMinY in MapBounds, line 54"), })
	MapBounds_boundMax = ({rect_getMaxX(MapBounds_boundRect, "when calling getMaxX in MapBounds, line 55"), rect_getMaxY(MapBounds_boundRect, "when calling getMaxY in MapBounds, line 55"), })
	vec2_op_mult(vec2_op_plus(MapBounds_playableMin, MapBounds_playableMax, "when calling op_plus in MapBounds, line 56"), .5, "when calling op_mult in MapBounds, line 56")
	vec2_op_mult(vec2_op_plus(MapBounds_boundMin, MapBounds_boundMax, "when calling op_plus in MapBounds, line 57"), .5, "when calling op_mult in MapBounds, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Maths(__wurst_stackPos166) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos166
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function max(__wurst_stackPos324, ...) 
	local maxNumber = nil
	local cond_result2 = nil
	local number3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos324
	wurst_stack_depth = (wurst_stack_depth + 1)
	maxNumber = Integer_INT_MIN
	local __args3 = table.pack(...)
	for i17=1,__args3.n do
	number3 = __args3[i17]
	if (number3 > maxNumber) then
		cond_result2 = number3
	else
		cond_result2 = maxNumber
	end
	maxNumber = cond_result2
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return maxNumber
end

function min(__wurst_stackPos325, ...) 
	local minNumber = nil
	local cond_result3 = nil
	local number4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos325
	wurst_stack_depth = (wurst_stack_depth + 1)
	minNumber = Integer_INT_MAX
	local __args4 = table.pack(...)
	for i18=1,__args4.n do
	number4 = __args4[i18]
	if (number4 < minNumber) then
		cond_result3 = number4
	else
		cond_result3 = minNumber
	end
	minNumber = cond_result3
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return minNumber
end

function init_Matrices(__wurst_stackPos176) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos176
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIdGenerator(__wurst_stackPos201) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos201
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_new_IdGenerator(2016423984, "when calling new_IdGenerator in ObjectIdGenerator, line 6")
	IdGenerator_new_IdGenerator(1213018160, "when calling new_IdGenerator in ObjectIdGenerator, line 7")
	IdGenerator_new_IdGenerator(1095577648, "when calling new_IdGenerator in ObjectIdGenerator, line 8")
	IdGenerator_new_IdGenerator(1112354864, "when calling new_IdGenerator in ObjectIdGenerator, line 9")
	IdGenerator_new_IdGenerator(1229795376, "when calling new_IdGenerator in ObjectIdGenerator, line 10")
	IdGenerator_new_IdGenerator(1380790320, "when calling new_IdGenerator in ObjectIdGenerator, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIds(__wurst_stackPos191) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos191
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_OnUnitEnterLeave(__wurst_stackPos204) 
	local i19 = nil
	local temp10 = nil
	local clVar11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos204
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_eventTrigger = CreateTrigger()
	OnUnitEnterLeave_preplacedUnits = CreateGroup()
	OnUnitEnterLeave_tempUnitsCount = 0
	OnUnitEnterLeave_ABILITY_ID = intEnsure(1095577649)
	i19 = 0
	temp10 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i19 > temp10) then
			break
		end
		player_setAbilityAvailable(Player_players[i19], OnUnitEnterLeave_ABILITY_ID, false, "when calling setAbilityAvailable in OnUnitEnterLeave, line 64")
		i19 = (i19 + 1)
	end
	clVar11 = CallbackSingle_nullTimer_OnUnitEnterLeave:create24()
	CallbackSingle_construct_CallbackSingle(clVar11, "when calling construct_CallbackSingle in OnUnitEnterLeave, line 66")
	nullTimer(clVar11, "when calling nullTimer in OnUnitEnterLeave, line 66")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushUnit1(u21, __wurst_stackPos339) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos339
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnits[OnUnitEnterLeave_tempUnitsCount] = u21
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit1(__wurst_stackPos340) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos340
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getEnterLeaveUnit(__wurst_stackPos341) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos341
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (OnUnitEnterLeave_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return OnUnitEnterLeave_tempUnits[(OnUnitEnterLeave_tempUnitsCount - 1)]
end

function onEnter(c4, __wurst_stackPos342) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos342
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(OnUnitEnterLeave_eventTrigger, __wurst_safe_Filter(c4), "when calling addCondition in OnUnitEnterLeave, line 46")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onLeave(c5, __wurst_stackPos343) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos343
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addAction(OnUnitEnterLeave_eventTrigger, c5, "when calling addAction in OnUnitEnterLeave, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function prepareUnit(u5, __wurst_stackPos116) 
	local receiver32 = nil
	local receiver33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos116
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver32 = u5
	unit_addAbility(receiver32, OnUnitEnterLeave_ABILITY_ID, "when calling addAbility in OnUnitEnterLeave, line 56")
	receiver33 = receiver32
	unit_makeAbilityPermanent(receiver33, OnUnitEnterLeave_ABILITY_ID, true, "when calling makeAbilityPermanent in OnUnitEnterLeave, line 56")
	pushUnit1(u5, "when calling pushUnit in OnUnitEnterLeave, line 57")
	trigger_evaluate(OnUnitEnterLeave_eventTrigger, "when calling evaluate in OnUnitEnterLeave, line 58")
	popUnit1("when calling popUnit in OnUnitEnterLeave, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave(__wurst_stackPos345) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos345
	wurst_stack_depth = (wurst_stack_depth + 1)
	prepareUnit(GetFilterUnit(), "when calling prepareUnit in OnUnitEnterLeave, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave(__wurst_stackPos346) 
	local leavingUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos346
	wurst_stack_depth = (wurst_stack_depth + 1)
	leavingUnit = GetTriggerUnit()
	if ((unit_getAbilityLevel(leavingUnit, OnUnitEnterLeave_ABILITY_ID, "when calling getAbilityLevel in OnUnitEnterLeave, line 73") == 0) and (GetIssuedOrderId() == OrderIds_undefend)) then
		pushUnit1(leavingUnit, "when calling pushUnit in OnUnitEnterLeave, line 74")
		trigger_execute(OnUnitEnterLeave_eventTrigger, "when calling execute in OnUnitEnterLeave, line 75")
		popUnit1("when calling popUnit in OnUnitEnterLeave, line 76")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Orders(__wurst_stackPos203) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos203
	wurst_stack_depth = (wurst_stack_depth + 1)
	OrderIds_undefend = 852056
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos170) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos170
	wurst_stack_depth = (wurst_stack_depth + 1)
	Player_localPlayer = GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos349) 
	local i20 = nil
	local temp11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos349
	wurst_stack_depth = (wurst_stack_depth + 1)
	i20 = 0
	temp11 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i20 > temp11) then
			break
		end
		Player_players[i20] = Player(i20)
		i20 = (i20 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setGold(this178, val2, __wurst_stackPos350) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos350
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this178, PLAYER_STATE_RESOURCE_GOLD, val2, "when calling setState in Player, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setState(this179, state, val3, __wurst_stackPos351) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos351
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this179, state, val3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addGold(this157, val1, __wurst_stackPos295) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos295
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_addState(this157, PLAYER_STATE_RESOURCE_GOLD, val1, "when calling addState in Player, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addState(this180, state1, val4, __wurst_stackPos352) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos352
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this180, state1, (player_getState(this180, state1, "when calling getState in Player, line 31") + val4))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setLumber(this182, val5, __wurst_stackPos354) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos354
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this182, PLAYER_STATE_RESOURCE_LUMBER, val5, "when calling setState in Player, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_getState(this181, state2, __wurst_stackPos353) 
	local stackTrace_tempReturn27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos353
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn27 = __wurst_safe_GetPlayerState(this181, state2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn27
end

function player_isAllyOf(this6, p, __wurst_stackPos6) 
	local stackTrace_tempReturn28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos6
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn28 = __wurst_safe_IsPlayerAlly(this6, p)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn28
end

function player_setAbilityAvailable(this174, abilityId1, avail, __wurst_stackPos338) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos338
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerAbilityAvailable(this174, abilityId1, avail)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Playercolor(__wurst_stackPos180) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos180
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Preloader(__wurst_stackPos200) 
	local clVar12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos200
	wurst_stack_depth = (wurst_stack_depth + 1)
	Preloader_autoFinish = true
	Preloader_dumg = CreateGroup()
	Preloader_dum = createUnit(Basics_DUMMY_PLAYER, UnitIds_shade, MapBounds_playableMin, ({0., }), "when calling createUnit in Preloader, line 53")
	unit_setInvulnerable(Preloader_dum, true, "when calling setInvulnerable in Preloader, line 54")
	if (Preloader_dum == nil) then
		error1("DUMMY_UNITID not added correctly to the map.", "when calling error in Preloader, line 56")
	end
	if Preloader_autoFinish then
		clVar12 = CallbackSingle_nullTimer_Preloader:create26()
		CallbackSingle_construct_CallbackSingle(clVar12, "when calling construct_CallbackSingle in Preloader, line 58")
		nullTimer(clVar12, "when calling nullTimer in Preloader, line 58")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function finishPreload(__wurst_stackPos120) 
	local clVar13 = nil
	local temp116 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos120
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(Preloader_dum, "when calling remove in Preloader, line 47")
	temp116 = Preloader_dumg
	clVar13 = ForGroupCallback_forEachFrom_Preloader:create25()
	group_forEachFrom(temp116, clVar13, "when calling forEachFrom in Preloader, line 48")
	group_destr(Preloader_dumg, "when calling destr in Preloader, line 49")
	Preloader_dumg = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos171) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos171
	wurst_stack_depth = (wurst_stack_depth + 1)
	Printing_DEBUG_LEVEL = 2
	Printing_DEBUG_MSG_DURATION = 45.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Loglevel_getTag(this183, __wurst_stackPos355) 
	local temp12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos355
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp12 = this183
	if (temp12 == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffADADADtrace|r"
	elseif (temp12 == 1) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cff2685DCdebug|r"
	elseif (temp12 == 2) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFFCC00info|r"
	elseif (temp12 == 3) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffF47E3Ewarning|r"
	else
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFB2700error|r"
	end
end

function printLog(showTo, loglvl, msg7, __wurst_stackPos356) 
	local compositeMsg = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos356
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Printing_DEBUG_LEVEL <= loglvl) then
		compositeMsg = stringConcat(stringConcat(Loglevel_getTag(loglvl, "when calling getTag in Printing, line 81"), " - "), msg7)
		__wurst_safe_DisplayTimedTextToPlayer(showTo, 0., 0., Printing_DEBUG_MSG_DURATION, compositeMsg)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print1(msg, __wurst_stackPos16) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos16
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print2(msg2, __wurst_stackPos231) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos231
	wurst_stack_depth = (wurst_stack_depth + 1)
	print1(tostring(msg2), "when calling print in Printing, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_trace(msg3, __wurst_stackPos261) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos261
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 0, msg3, "when calling printLog in Printing, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_warn(msg6, __wurst_stackPos326) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos326
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 3, msg6, "when calling printLog in Printing, line 45")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_error(msg5, __wurst_stackPos306) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos306
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 4, msg5, "when calling printLog in Printing, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos177) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos177
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos162) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos162
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function real_toInt(this160, __wurst_stackPos307) 
	local stackTrace_tempReturn29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos307
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn29 = R2I(this160)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn29
end

function rect_getMinX(this168, __wurst_stackPos332) 
	local stackTrace_tempReturn30 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos332
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn30 = __wurst_safe_GetRectMinX(this168)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn30
end

function rect_getMaxX(this170, __wurst_stackPos334) 
	local stackTrace_tempReturn31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos334
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn31 = __wurst_safe_GetRectMaxX(this170)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn31
end

function rect_getMinY(this169, __wurst_stackPos333) 
	local stackTrace_tempReturn32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos333
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn32 = __wurst_safe_GetRectMinY(this169)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn32
end

function rect_getMaxY(this171, __wurst_stackPos335) 
	local stackTrace_tempReturn33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos335
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn33 = __wurst_safe_GetRectMaxY(this171)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn33
end

function rect_getCenter(this125, __wurst_stackPos220) 
	local stackTrace_tempReturn34 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos220
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn34 = ({rect_getCenterX(this125, "when calling getCenterX in Rect, line 16"), rect_getCenterY(this125, "when calling getCenterY in Rect, line 16"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn34
end

function rect_getCenterX(this184, __wurst_stackPos357) 
	local stackTrace_tempReturn35 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos357
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn35 = __wurst_safe_GetRectCenterX(this184)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn35
end

function rect_getCenterY(this185, __wurst_stackPos358) 
	local stackTrace_tempReturn36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos358
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn36 = __wurst_safe_GetRectCenterY(this185)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn36
end

function region_addRect(this167, rct, __wurst_stackPos331) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos331
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RegionAddRect(this167, rct)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_RegisterEvents(__wurst_stackPos202) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos202
	wurst_stack_depth = (wurst_stack_depth + 1)
	RegisterEvents_onCastMap = HashMap_new_HashMap("when calling new_HashMap in RegisterEvents, line 55")
	registerPlayerUnitEvent1(EVENT_PLAYER_UNIT_SPELL_EFFECT, function (...) 
			local tempRes = nil
			xpcall(function (...) 
					tempRes = bridge_code__registerPlayerUnitEvent_RegisterEvents(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
			return tempRes
		end, "when calling registerPlayerUnitEvent in RegisterEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function registerPlayerUnitEvent1(p3, c, __wurst_stackPos114) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos114
	wurst_stack_depth = (wurst_stack_depth + 1)
	registerPlayerUnitEvent(p3, nil, c, nil, "when calling registerPlayerUnitEvent in RegisterEvents, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function registerPlayerUnitEvent(p2, filter2, condition, action, __wurst_stackPos37) 
	local hid = nil
	local k = nil
	local cond_result4 = nil
	local temp117 = nil
	local temp118 = nil
	local temp119 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos37
	wurst_stack_depth = (wurst_stack_depth + 1)
	hid = handle_getHandleId(p2, "when calling getHandleId in RegisterEvents, line 17")
	if (RegisterEvents_t[hid] == nil) then
		RegisterEvents_t[hid] = CreateTrigger()
		k = (bj_MAX_PLAYER_SLOTS - 1)
		while true do
			if (k < 0) then
				break
			end
			temp117 = RegisterEvents_t[hid]
			temp118 = Player_players[k]
			temp119 = p2
			if not((filter2 == nil)) then
				cond_result4 = __wurst_safe_Filter(filter2)
			else
				cond_result4 = nil
			end
			trigger_registerPlayerUnitEvent(temp117, temp118, temp119, cond_result4, "when calling registerPlayerUnitEvent in RegisterEvents, line 21")
			k = (k - 1)
		end
	end
	if not((condition == nil)) then
		trigger_addCondition(RegisterEvents_t[hid], __wurst_safe_Filter(condition), "when calling addCondition in RegisterEvents, line 23")
	end
	if not((action == nil)) then
		trigger_addAction(RegisterEvents_t[hid], action, "when calling addAction in RegisterEvents, line 25")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_RegisterEvents(__wurst_stackPos359) 
	local stackTrace_tempReturn37 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos359
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn37 = trigger_evaluate(__wurst_objectFromIndex(intEnsure(HashMap_HashMap_get(RegisterEvents_onCastMap, GetSpellAbilityId(), "when calling get in RegisterEvents, line 58"))), "when calling evaluate in RegisterEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn37
end

function init_ShieldBash(__wurst_stackPos217) 
	local clVar14 = nil
	local iterator6 = nil
	local u22 = nil
	local iterator7 = nil
	local u23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos217
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1112354865)
	ShieldBash_MY_ABILITY_ID = intEnsure(1095577650)
	ShieldBash_MY_ICON_ABILITY_ID = intEnsure(1095577651)
	ShieldBash_ARMOR_BONUS = 4
	ShieldBash_REFLECT_CHANCE = 0.25
	ShieldBash_REFLECT_DAMAGE = 40.
	ShieldBash_REFLECT_SFX = "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl"
	stringConcat(stringConcat(stringConcat(stringConcat("Increases armor by ", int_toString(ShieldBash_ARMOR_BONUS, "when calling toString in ShieldBash, line 21")), " and has a "), int_toString(real_toInt((ShieldBash_REFLECT_CHANCE * 100.), "when calling toInt in ShieldBash, line 21"), "when calling toString in ShieldBash, line 21")), "% chance to retaliate.")
	clVar14 = DamageListener_addListener_ShieldBash:create27()
	DamageListener_construct_DamageListener(clVar14, "when calling construct_DamageListener in ShieldBash, line 80")
	DamageEvent_addListener(clVar14, "when calling addListener in ShieldBash, line 80")
	group_enumUnitsOfType(Group_ENUM_GROUP, 1751871081, nil, "when calling enumUnitsOfType in ShieldBash, line 83")
	iterator6 = group_iterator(Group_ENUM_GROUP, "when calling iterator in ShieldBash, line 84")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator6, "when calling hasNext in ShieldBash, line 84")) then
			break
		end
		u22 = GroupIterator_GroupIterator_next(iterator6, "when calling next in ShieldBash, line 84")
		__wurst_safe_UnitAddAbility(u22, ShieldBash_MY_ABILITY_ID)
		__wurst_safe_UnitAddAbility(u22, ShieldBash_MY_ICON_ABILITY_ID)
	end
	GroupIterator_GroupIterator_close(iterator6, "when calling close in ShieldBash, line 84")
	group_enumUnitsOfType(Group_ENUM_GROUP, UnitIds_huntress, nil, "when calling enumUnitsOfType in ShieldBash, line 88")
	iterator7 = group_iterator(Group_ENUM_GROUP, "when calling iterator in ShieldBash, line 89")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator7, "when calling hasNext in ShieldBash, line 89")) then
			break
		end
		u23 = GroupIterator_GroupIterator_next(iterator7, "when calling next in ShieldBash, line 89")
		__wurst_safe_UnitAddAbility(u23, ShieldBash_MY_ABILITY_ID)
		__wurst_safe_UnitAddAbility(u23, ShieldBash_MY_ICON_ABILITY_ID)
	end
	GroupIterator_GroupIterator_close(iterator7, "when calling close in ShieldBash, line 89")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onDamageTaken(__wurst_stackPos122) 
	local victim = nil
	local attacker1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos122
	wurst_stack_depth = (wurst_stack_depth + 1)
	victim = DamageEvent_getTarget("when calling getTarget in ShieldBash, line 56")
	attacker1 = DamageEvent_getSource("when calling getSource in ShieldBash, line 57")
	if not(unit_hasAbility(victim, ShieldBash_MY_ABILITY_ID, "when calling hasAbility in ShieldBash, line 59")) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	if ((attacker1 == nil) or not(unit_isAlive(attacker1, "when calling isAlive in ShieldBash, line 62"))) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	if (GetRandomReal(0., 1.) > ShieldBash_REFLECT_CHANCE) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	unit_damageTarget(victim, attacker1, ShieldBash_REFLECT_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in ShieldBash, line 68")
	flashEffect(ShieldBash_REFLECT_SFX, attacker1, "origin", "when calling flashEffect in ShieldBash, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_String(__wurst_stackPos167) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos167
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this187, __wurst_stackPos361) 
	local stackTrace_tempReturn38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos361
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn38 = StringLength(this187)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn38
end

function string_getHash(this153, __wurst_stackPos288) 
	local stackTrace_tempReturn39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos288
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn39 = StringHash(this153)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn39
end

function init_SummonTreant(__wurst_stackPos213) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos213
	wurst_stack_depth = (wurst_stack_depth + 1)
	SummonTreant_SUMMON_TREANT_ID = intEnsure(1095577653)
	SummonTreant_TREANT_UNIT_ID = 1701212014
	SummonTreant_TREANT_DURATION = 15.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Table(__wurst_stackPos178) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos178
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TargetsAllowed(__wurst_stackPos192) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos192
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_createTimerDialog(this154, __wurst_stackPos291) 
	local stackTrace_tempReturn40 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos291
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn40 = __wurst_safe_CreateTimerDialog(this154)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn40
end

function timerdialog_setTitle(this155, title, __wurst_stackPos292) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos292
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogSetTitle(this155, title)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timerdialog_display(this156, display, __wurst_stackPos293) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos293
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogDisplay(this156, display)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TimerUtils(__wurst_stackPos196) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos196
	wurst_stack_depth = (wurst_stack_depth + 1)
	TimerUtils_freeTimersCount = 0
	TimerUtils_timerData = Table_new_Table("when calling new_Table in TimerUtils, line 13")
	TimerUtils_HELD = 679645218
	HashMap_new_HashMap("when calling new_HashMap in TimerUtils, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_setData(this46, data, __wurst_stackPos56) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos56
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveInt(TimerUtils_timerData, handle_getTCHandleId(this46, "when calling getTCHandleId in TimerUtils, line 18"), data, "when calling saveInt in TimerUtils, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_getData(this151, __wurst_stackPos282) 
	local stackTrace_tempReturn41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos282
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn41 = Table_Table_loadInt(TimerUtils_timerData, handle_getTCHandleId(this151, "when calling getTCHandleId in TimerUtils, line 22"), "when calling loadInt in TimerUtils, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn41
end

function getTimer(__wurst_stackPos279) 
	local receiver34 = nil
	local stackTrace_tempReturn42 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos279
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (TimerUtils_freeTimersCount > 0) then
		TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount - 1)
		timer_setData(TimerUtils_freeTimers[TimerUtils_freeTimersCount], 0, "when calling setData in TimerUtils, line 30")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return TimerUtils_freeTimers[TimerUtils_freeTimersCount]
	else
		receiver34 = CreateTimer()
		timer_setData(receiver34, 0, "when calling setData in TimerUtils, line 33")
		stackTrace_tempReturn42 = receiver34
		wurst_stack_depth = (wurst_stack_depth - 1)
		return stackTrace_tempReturn42
	end
end

function timer_release(this52, __wurst_stackPos62) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos62
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (this52 == nil) then
		error1("Trying to release a null timer", "when calling error in TimerUtils, line 38")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	if (timer_getData(this52, "when calling getData in TimerUtils, line 40") == TimerUtils_HELD) then
		error1("ReleaseTimer: Double free!", "when calling error in TimerUtils, line 41")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	timer_setData(this52, TimerUtils_HELD, "when calling setData in TimerUtils, line 43")
	timer_pause(this52, "when calling pause in TimerUtils, line 44")
	TimerUtils_freeTimers[TimerUtils_freeTimersCount] = this52
	TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_pause(this189, __wurst_stackPos363) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos363
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseTimer(this189)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_start(this54, time3, timerCallBack1, __wurst_stackPos64) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos64
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this54, time3, false, timerCallBack1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_startPeriodic(this47, time1, timerCallBack, __wurst_stackPos57) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos57
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this47, time1, true, timerCallBack)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_addAction(this25, actionFunc, __wurst_stackPos33) 
	local stackTrace_tempReturn43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos33
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn43 = __wurst_safe_TriggerAddAction(this25, actionFunc)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn43
end

function trigger_addCondition(this129, condition1, __wurst_stackPos233) 
	local stackTrace_tempReturn44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos233
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn44 = __wurst_safe_TriggerAddCondition(this129, condition1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn44
end

function trigger_evaluate(this123, __wurst_stackPos141) 
	local stackTrace_tempReturn45 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos141
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn45 = __wurst_safe_TriggerEvaluate(this123)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn45
end

function trigger_execute(this177, __wurst_stackPos348) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos348
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TriggerExecute(this177)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_registerEnterRegion(this100, whichRegion, filter3, __wurst_stackPos113) 
	local stackTrace_tempReturn46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos113
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn46 = __wurst_safe_TriggerRegisterEnterRegion(this100, whichRegion, filter3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn46
end

function trigger_registerPlayerChatEvent(this27, whichPlayer1, chatMessageToDetect, exactMatchOnly, __wurst_stackPos36) 
	local stackTrace_tempReturn47 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos36
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn47 = __wurst_safe_TriggerRegisterPlayerChatEvent(this27, whichPlayer1, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn47
end

function trigger_registerPlayerEvent(this26, whichPlayer, whichPlayerEvent, __wurst_stackPos35) 
	local stackTrace_tempReturn48 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos35
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn48 = __wurst_safe_TriggerRegisterPlayerEvent(this26, whichPlayer, whichPlayerEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn48
end

function trigger_registerPlayerUnitEvent(this128, whichPlayer8, whichPlayerUnitEvent, filter4, __wurst_stackPos232) 
	local stackTrace_tempReturn49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos232
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn49 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this128, whichPlayer8, whichPlayerUnitEvent, filter4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn49
end

function trigger_registerUnitEvent(this158, whichUnit5, whichEvent, __wurst_stackPos297) 
	local stackTrace_tempReturn50 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos297
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn50 = __wurst_safe_TriggerRegisterUnitEvent(this158, whichUnit5, whichEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn50
end

function init_TypeCasting(__wurst_stackPos186) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos186
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	TypeCasting_R2I_PRECISION = 1000.
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos364) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos364
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function handle_getTCHandleId(this188, __wurst_stackPos362) 
	local stackTrace_tempReturn51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos362
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn51 = GetHandleId(this188)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn51
end

function realToIndex(r4, __wurst_stackPos329) 
	local stackTrace_tempReturn52 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos329
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn52 = real_toInt((r4 * TypeCasting_R2I_PRECISION), "when calling toInt in TypeCasting, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn52
end

function groupToIndex(object, __wurst_stackPos365) 
	return __wurst_objectToIndex(object)
end

function triggerFromIndex(index7, __wurst_stackPos366) 
	return __wurst_objectFromIndex(index7)
end

function booleanToIndex(u18, __wurst_stackPos327) 
	local cond_result5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos327
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	if u18 then
		cond_result5 = 1
	else
		cond_result5 = 0
	end
	return cond_result5
end

function init_UI(__wurst_stackPos211) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos211
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UnitIds(__wurst_stackPos198) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos198
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIds_huntress = 1702061422
	UnitIds_keeperofthegrove = 1164666213
	UnitIds_shade = 1970497636
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UnitIndexer(__wurst_stackPos205) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos205
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_onIndexTrigger = CreateTrigger()
	UnitIndexer_onDeindexTrigger = CreateTrigger()
	UnitIndexer_tempUnitsCount = 0
	onEnter(function (...) 
			xpcall(function (...) 
					bridge_code__onEnter_UnitIndexer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling onEnter in UnitIndexer, line 190")
	onLeave(function (...) 
			xpcall(function (...) 
					bridge_code__onLeave_UnitIndexer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling onLeave in UnitIndexer, line 191")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushUnit(u7, __wurst_stackPos140) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos140
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnits[UnitIndexer_tempUnitsCount] = u7
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit(__wurst_stackPos142) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos142
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function shouldIndex(_u1, __wurst_stackPos367) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos367
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function unit_getIndex(this37, __wurst_stackPos47) 
	local stackTrace_tempReturn53 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos47
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn53 = unit_getUserData(this37, "when calling getUserData in UnitIndexer, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn53
end

function unit_toUnitIndex(this191, __wurst_stackPos369) 
	local instance = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos369
	wurst_stack_depth = (wurst_stack_depth + 1)
	instance = __wurst_objectFromIndex(unit_getUserData(this191, "when calling getUserData in UnitIndexer, line 132"))
	if (instance == nil) then
		instance = UnitIndex_new_UnitIndex(this191, "when calling new_UnitIndex in UnitIndexer, line 135")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return instance
end

function getIndexingUnit(__wurst_stackPos263) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos263
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (UnitIndexer_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return UnitIndexer_tempUnits[(UnitIndexer_tempUnitsCount - 1)]
end

function onUnitDeindex(func2, __wurst_stackPos250) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos250
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(UnitIndexer_onDeindexTrigger, __wurst_safe_Condition(func2), "when calling addCondition in UnitIndexer, line 150")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_deindex(this192, __wurst_stackPos370) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos370
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (unit_getUserData(this192, "when calling getUserData in UnitIndexer, line 160") == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return false
	else
		UnitIndex_destroyUnitIndex(unit_toUnitIndex(this192, "when calling toUnitIndex in UnitIndexer, line 163"), "when calling destroyUnitIndex in UnitIndexer, line 163")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return true
	end
end

function code__onEnter_UnitIndexer(__wurst_stackPos371) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos371
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling shouldIndex in UnitIndexer, line 190") then
		unit_toUnitIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling toUnitIndex in UnitIndexer, line 190")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onLeave_UnitIndexer(__wurst_stackPos372) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos372
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling shouldIndex in UnitIndexer, line 191") then
		unit_deindex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling deindex in UnitIndexer, line 191")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createUnit(p1, unitId, pos3, facing, __wurst_stackPos28) 
	local stackTrace_tempReturn54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos28
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn54 = __wurst_safe_CreateUnit(p1, unitId, pos3[1], pos3[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn54
end

function unit_addAbility(this136, abil, __wurst_stackPos244) 
	local stackTrace_tempReturn55 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos244
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn55 = __wurst_safe_UnitAddAbility(this136, abil)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn55
end

function unit_makeAbilityPermanent(this175, abil1, flag1, __wurst_stackPos344) 
	local stackTrace_tempReturn56 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos344
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn56 = __wurst_safe_UnitMakeAbilityPermanent(this175, flag1, abil1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn56
end

function unit_addHP(this8, val, __wurst_stackPos8) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos8
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_addState(this8, UNIT_STATE_LIFE, val, "when calling addState in Unit, line 81")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addState(this193, state3, value15, __wurst_stackPos373) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos373
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this193, state3, (unit_getState(this193, state3, "when calling getState in Unit, line 96") + value15))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getState(this194, state4, __wurst_stackPos374) 
	local stackTrace_tempReturn57 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos374
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn57 = __wurst_safe_GetUnitState(this194, state4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn57
end

function unit_damageTarget(this186, target5, amount2, attack, ranged, attackType2, damageType3, weaponType1, __wurst_stackPos360) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos360
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_UnitDamageTarget(this186, target5, amount2, attack, ranged, attackType2, damageType3, weaponType1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_kill(this12, __wurst_stackPos13) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos13
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_KillUnit(this12)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getAbilityLevel(this176, id8, __wurst_stackPos347) 
	local stackTrace_tempReturn58 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos347
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn58 = __wurst_safe_GetUnitAbilityLevel(this176, id8)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn58
end

function handle_getHandleId(this142, __wurst_stackPos254) 
	local stackTrace_tempReturn59 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos254
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn59 = GetHandleId(this142)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn59
end

function unit_getName(this17, __wurst_stackPos19) 
	local stackTrace_tempReturn60 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos19
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn60 = __wurst_safe_GetUnitName(this17)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn60
end

function unit_getOwner(this7, __wurst_stackPos7) 
	local stackTrace_tempReturn61 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos7
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn61 = __wurst_safe_GetOwningPlayer(this7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn61
end

function unit_getPos(this18, __wurst_stackPos21) 
	local stackTrace_tempReturn62 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos21
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn62 = ({unit_getX(this18, "when calling getX in Unit, line 249"), unit_getY(this18, "when calling getY in Unit, line 249"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn62
end

function unit_getX(this195, __wurst_stackPos375) 
	local stackTrace_tempReturn63 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos375
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn63 = __wurst_safe_GetUnitX(this195)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn63
end

function unit_getY(this196, __wurst_stackPos376) 
	local stackTrace_tempReturn64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos376
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn64 = __wurst_safe_GetUnitY(this196)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn64
end

function unit_getUserData(this190, __wurst_stackPos368) 
	local stackTrace_tempReturn65 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos368
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn65 = __wurst_safe_GetUnitUserData(this190)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn65
end

function unit_hasAbility(this16, id, __wurst_stackPos18) 
	local stackTrace_tempReturn66 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos18
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn66 = (__wurst_safe_GetUnitAbilityLevel(this16, id) > 0)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn66
end

function unit_isAlive(this5, __wurst_stackPos5) 
	local stackTrace_tempReturn67 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos5
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn67 = UnitAlive(this5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn67
end

if UnitAlive then
else
	UnitAlive = function (id10) 
			error("The native 'UnitAlive' is not implemented.")
		end
end

function unit_pause(this134, __wurst_stackPos242) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos242
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this134, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_remove(this103, __wurst_stackPos118) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos118
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RemoveUnit(this103)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setInvulnerable(this133, flag, __wurst_stackPos241) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos241
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitInvulnerable(this133, flag)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPathing(this137, value8, __wurst_stackPos245) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos245
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPathing(this137, value8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setUserData(this122, data1, __wurst_stackPos139) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos139
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitUserData(this122, data1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setVertexColor(this135, r, g1, b, a, __wurst_stackPos243) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos243
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitVertexColor(this135, r, g1, b, a)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Vectors(__wurst_stackPos168) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos168
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function vec2_op_plus(this173, v, __wurst_stackPos337) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos337
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this173[1] + v[1]), (this173[2] + v[2]), })
end

function vec2_op_mult(this172, factor, __wurst_stackPos336) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos336
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this172[1] * factor), (this172[2] * factor), })
end

function init_WeatherEffects(__wurst_stackPos185) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos185
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widget_addEffect(this138, modelName, attachment, __wurst_stackPos246) 
	local stackTrace_tempReturn68 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos246
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn68 = __wurst_safe_AddSpecialEffectTarget(modelName, this138, attachment)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn68
end

function init_winLoss(__wurst_stackPos218) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos218
	wurst_stack_depth = (wurst_stack_depth + 1)
	setupDefeatCondition("when calling setupDefeatCondition in winLoss, line 26")
	setupVictoryCondition("when calling setupVictoryCondition in winLoss, line 27")
	player_setGold(Player_players[0], 1000, "when calling setGold in winLoss, line 28")
	player_setLumber(Player_players[0], 1000, "when calling setLumber in winLoss, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupVictoryCondition(__wurst_stackPos378) 
	local receiver35 = nil
	local receiver36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos378
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver35 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver35, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 12")
	receiver36 = receiver35
	trigger_addAction(receiver36, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 13")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss(__wurst_stackPos379) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos379
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_remove(BasicWaves_footmen, "when calling remove in winLoss, line 14", GetTriggerUnit())
	if group_isEmpty(BasicWaves_footmen, "when calling isEmpty in winLoss, line 15") then
		__wurst_safe_CustomVictoryBJ(Player_players[0], true, true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupDefeatCondition(__wurst_stackPos377) 
	local receiver37 = nil
	local receiver38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos377
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver37 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver37, Player_players[0], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 20")
	receiver38 = receiver37
	trigger_addAction(receiver38, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss1(__wurst_stackPos380) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos380
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (GetTriggerUnit() == udg_townHall) then
		__wurst_safe_CustomDefeatBJ(Player_players[0], "You have been defeated!")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos159) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos159
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos381) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos381
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_compiletime3 = __wurst_InitHashtable()
	hashtable_compiletime2 = __wurst_InitHashtable()
	hashtable_compiletime1 = __wurst_InitHashtable()
	hashtable_compiletime = __wurst_InitHashtable()
	__wurst_SaveInteger(hashtable_compiletime1, 1, -242600650, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 1, 1132341824, 1)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -647782241, 2)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -854572045, 3)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -680649701, 4)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -943650483, 5)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -671760605, 6)
	__wurst_SaveInteger(hashtable_compiletime1, 1, 349230650, 7)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -1894922563, 8)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -1474492777, 9)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -1587459251, 10)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -1676716706, 11)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -1559655710, 12)
	__wurst_SaveInteger(hashtable_compiletime1, 1, -1663695754, 13)
	__wurst_SaveInteger(hashtable_compiletime1, 1, 597637742, 14)
	__wurst_SaveInteger(hashtable_compiletime1, 1, 789744696, 15)
	__wurst_SaveStr(hashtable_compiletime1, 2, 0, "")
	__wurst_SaveInteger(hashtable_compiletime1, 3, 0, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 1, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 2, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 3, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 4, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 5, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 6, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 7, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 8, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 9, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 10, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 11, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 12, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 13, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 14, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 15, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 16, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 17, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 18, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 19, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 20, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 21, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 22, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 23, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 24, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 25, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 26, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 27, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 28, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 29, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 30, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 31, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 32, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 33, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 34, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 35, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 36, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 37, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 38, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 39, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 40, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 41, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 42, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 43, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 44, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 45, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 46, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 47, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 48, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 49, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 50, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 51, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 52, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 53, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 54, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 55, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 56, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 57, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 58, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 59, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 60, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 61, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 62, 0)
	__wurst_SaveInteger(hashtable_compiletime1, 3, 63, 0)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function bridge_Trig_init_Actions() 
	Trig_init_Actions("via function reference war3map, line 276")
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

function bridge_code__onUnitDeindex_ClosureEvents() 
	code__onUnitDeindex_ClosureEvents("via function reference ClosureEvents, line 304")
end

function bridge_EventListener_generalEventCallback() 
	EventListener_generalEventCallback("via function reference ClosureEvents, line 262")
end

function bridge_EventListener_generalEventCallback1() 
	EventListener_generalEventCallback("via function reference ClosureEvents, line 265")
end

function bridge_EventListener_generalEventCallback2() 
	EventListener_generalEventCallback("via function reference ClosureEvents, line 267")
end

function bridge_code__Filter_ClosureForGroups() 
	code__Filter_ClosureForGroups("via function reference ClosureForGroups, line 21")
end

function bridge_income() 
	income("via function reference ControlPoint, line 11")
end

function bridge_code__addAction_ControlPoint() 
	code__addAction_ControlPoint("via function reference ControlPoint, line 21")
end

function bridge_executeCurrentCallback() 
	executeCurrentCallback("via function reference Execute, line 99")
end

function bridge_code__startPeriodic_GameTimer() 
	code__startPeriodic_GameTimer("via function reference GameTimer, line 15")
end

function bridge_code__registerPlayerUnitEvent_RegisterEvents() 
	local bridge_return1 = nil
	bridge_return1 = code__registerPlayerUnitEvent_RegisterEvents("via function reference RegisterEvents, line 58")
	return bridge_return1
end

function bridge_code__onEnter_UnitIndexer() 
	code__onEnter_UnitIndexer("via function reference UnitIndexer, line 190")
end

function bridge_code__onLeave_UnitIndexer() 
	code__onLeave_UnitIndexer("via function reference UnitIndexer, line 191")
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

function bridge_code__addAction_nullTimer_ClosureEvents() 
	code__addAction_nullTimer_ClosureEvents("via function reference ClosureEvents, line 307")
end

function bridge_code__addAction_nullTimer_ClosureEvents1() 
	code__addAction_nullTimer_ClosureEvents1("via function reference ClosureEvents, line 308")
end

function bridge_code__registerPlayerUnitEvent_nullTimer_ClosureEvents() 
	code__registerPlayerUnitEvent_nullTimer_ClosureEvents("via function reference ClosureEvents, line 323")
end

function bridge_CallbackPeriodic_staticCallback() 
	CallbackPeriodic_staticCallback("via function reference ClosureTimers, line 159")
end

function bridge_code__start_CallbackSingle_ClosureTimers() 
	code__start_CallbackSingle_ClosureTimers("via function reference ClosureTimers, line 135")
end

function bridge_code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave() 
	code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave("via function reference OnUnitEnterLeave, line 68")
end

function bridge_code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave() 
	code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave("via function reference OnUnitEnterLeave, line 71")
end

function __wurst_safe_DisplayTimedTextToPlayer(toPlayer, x5, y4, duration, message) 
	if (toPlayer == nil) then
		return nil
	end
	DisplayTimedTextToPlayer(toPlayer, x5, y4, duration, message)
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

function __wurst_safe_GetRectMinX(whichRect) 
	if (whichRect == nil) then
		return 0.0
	end
	return GetRectMinX(whichRect)
end

function __wurst_safe_GetRectMaxX(whichRect1) 
	if (whichRect1 == nil) then
		return 0.0
	end
	return GetRectMaxX(whichRect1)
end

function __wurst_safe_GetRectMinY(whichRect2) 
	if (whichRect2 == nil) then
		return 0.0
	end
	return GetRectMinY(whichRect2)
end

function __wurst_safe_GetRectMaxY(whichRect3) 
	if (whichRect3 == nil) then
		return 0.0
	end
	return GetRectMaxY(whichRect3)
end

function __wurst_safe_GetUnitX(whichUnit2) 
	if (whichUnit2 == nil) then
		return 0.0
	end
	return GetUnitX(whichUnit2)
end

function __wurst_safe_GetUnitY(whichUnit3) 
	if (whichUnit3 == nil) then
		return 0.0
	end
	return GetUnitY(whichUnit3)
end

function __wurst_safe_TriggerEvaluate(whichTrigger2) 
	if (whichTrigger2 == nil) then
		return false
	end
	return TriggerEvaluate(whichTrigger2)
end

function __wurst_safe_TriggerExecute(whichTrigger3) 
	if (whichTrigger3 == nil) then
		return nil
	end
	TriggerExecute(whichTrigger3)
end

function __wurst_safe_TriggerExecuteBJ(trig1, checkConditions) 
	if (trig1 == nil) then
		return false
	end
	return TriggerExecuteBJ(trig1, checkConditions)
end

function __wurst_safe_TimerStart(whichTimer2, timeout, periodic, handlerFunc) 
	if (whichTimer2 == nil) then
		return nil
	end
	TimerStart(whichTimer2, timeout, periodic, handlerFunc)
end

function __wurst_safe_PauseTimer(whichTimer3) 
	if (whichTimer3 == nil) then
		return nil
	end
	PauseTimer(whichTimer3)
end

function __wurst_safe_DestroyTimer(whichTimer4) 
	if (whichTimer4 == nil) then
		return nil
	end
	DestroyTimer(whichTimer4)
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

function __wurst_safe_TriggerRegisterTimerExpireEvent(whichTrigger9, t4) 
	if (whichTrigger9 == nil) then
		return nil
	end
	if (t4 == nil) then
		return nil
	end
	return TriggerRegisterTimerExpireEvent(whichTrigger9, t4)
end

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger7, whichPlayer19, whichPlayerUnitEvent1, filter11) 
	if (whichTrigger7 == nil) then
		return nil
	end
	if (whichPlayer19 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger7, whichPlayer19, whichPlayerUnitEvent1, filter11)
end

function __wurst_safe_TriggerRegisterPlayerEvent(whichTrigger6, whichPlayer18, whichPlayerEvent1) 
	if (whichTrigger6 == nil) then
		return nil
	end
	if (whichPlayer18 == nil) then
		return nil
	end
	if (whichPlayerEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerEvent(whichTrigger6, whichPlayer18, whichPlayerEvent1)
end

function __wurst_safe_TriggerRegisterGameStateEvent(whichTrigger10, whichState, opcode, limitval) 
	if (whichTrigger10 == nil) then
		return nil
	end
	if (whichState == nil) then
		return nil
	end
	if (opcode == nil) then
		return nil
	end
	return TriggerRegisterGameStateEvent(whichTrigger10, whichState, opcode, limitval)
end

function __wurst_safe_TriggerRegisterEnterRegion(whichTrigger4, whichRegion2, filter10) 
	if (whichTrigger4 == nil) then
		return nil
	end
	if (whichRegion2 == nil) then
		return nil
	end
	return TriggerRegisterEnterRegion(whichTrigger4, whichRegion2, filter10)
end

function __wurst_safe_RegionAddRect(whichRegion1, r5) 
	if (whichRegion1 == nil) then
		return nil
	end
	if (r5 == nil) then
		return nil
	end
	RegionAddRect(whichRegion1, r5)
end

function __wurst_safe_StopSound(soundHandle1, killWhenDone, fadeOut) 
	if (soundHandle1 == nil) then
		return nil
	end
	StopSound(soundHandle1, killWhenDone, fadeOut)
end

function __wurst_safe_VolumeGroupSetVolume(vgroup, scale2) 
	if (vgroup == nil) then
		return nil
	end
	VolumeGroupSetVolume(vgroup, scale2)
end

function __wurst_safe_GetRectCenterX(whichRect4) 
	if (whichRect4 == nil) then
		return 0.0
	end
	return GetRectCenterX(whichRect4)
end

function __wurst_safe_GetRectCenterY(whichRect5) 
	if (whichRect5 == nil) then
		return 0.0
	end
	return GetRectCenterY(whichRect5)
end

function __wurst_safe_AddSpecialEffectTarget(modelName1, targetWidget1, attachPointName2) 
	if (targetWidget1 == nil) then
		return nil
	end
	return AddSpecialEffectTarget(modelName1, targetWidget1, attachPointName2)
end

function __wurst_safe_DestroyEffect(whichEffect) 
	if (whichEffect == nil) then
		return nil
	end
	DestroyEffect(whichEffect)
end

function __wurst_safe_GetUnitAbilityLevel(whichUnit15, abilcode) 
	if (whichUnit15 == nil) then
		return 0
	end
	return GetUnitAbilityLevel(whichUnit15, abilcode)
end

function __wurst_safe_GetItemTypeId(i21) 
	if (i21 == nil) then
		return 0
	end
	return GetItemTypeId(i21)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level)
end

function __wurst_safe_GroupClear(whichGroup4) 
	if (whichGroup4 == nil) then
		return nil
	end
	GroupClear(whichGroup4)
end

function __wurst_safe_GroupAddUnit(whichGroup5, whichUnit9) 
	if (whichGroup5 == nil) then
		return false
	end
	if (whichUnit9 == nil) then
		return false
	end
	return GroupAddUnit(whichGroup5, whichUnit9)
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

function __wurst_safe_UnitSuspendDecay(whichUnit25, suspend) 
	if (whichUnit25 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit25, suspend)
end

function __wurst_safe_GetUnitState(whichUnit6, whichUnitState) 
	if (whichUnit6 == nil) then
		return 0.0
	end
	if (whichUnitState == nil) then
		return 0.0
	end
	return GetUnitState(whichUnit6, whichUnitState)
end

function __wurst_safe_SetUnitTimeScale(whichUnit26, timeScale) 
	if (whichUnit26 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit26, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit27, whichAnimation) 
	if (whichUnit27 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit27, whichAnimation)
end

function __wurst_safe_DestroyGroup(whichGroup7) 
	if (whichGroup7 == nil) then
		return nil
	end
	DestroyGroup(whichGroup7)
end

function __wurst_safe_TriggerAddAction(whichTrigger, actionFunc1) 
	if (whichTrigger == nil) then
		return nil
	end
	return TriggerAddAction(whichTrigger, actionFunc1)
end

function __wurst_safe_SetUnitState(whichUnit8, whichUnitState1, newVal) 
	if (whichUnit8 == nil) then
		return nil
	end
	if (whichUnitState1 == nil) then
		return nil
	end
	SetUnitState(whichUnit8, whichUnitState1, newVal)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit28) 
	if (whichUnit28 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit28)
end

function __wurst_safe_IsUnitType(whichUnit29, whichUnitType) 
	if (whichUnit29 == nil) then
		return false
	end
	if (whichUnitType == nil) then
		return false
	end
	return IsUnitType(whichUnit29, whichUnitType)
end

function __wurst_safe_GetUnitTypeId(whichUnit30) 
	if (whichUnit30 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit30)
end

function __wurst_safe_FirstOfGroup(whichGroup9) 
	if (whichGroup9 == nil) then
		return nil
	end
	return FirstOfGroup(whichGroup9)
end

function __wurst_safe_SetPlayerState(whichPlayer13, whichPlayerState, value14) 
	if (whichPlayer13 == nil) then
		return nil
	end
	if (whichPlayerState == nil) then
		return nil
	end
	SetPlayerState(whichPlayer13, whichPlayerState, value14)
end

function __wurst_safe_PauseUnit(whichUnit19, flag2) 
	if (whichUnit19 == nil) then
		return nil
	end
	PauseUnit(whichUnit19, flag2)
end

function __wurst_safe_GetPlayerController(whichPlayer22) 
	if (whichPlayer22 == nil) then
		return nil
	end
	return GetPlayerController(whichPlayer22)
end

function __wurst_safe_UnitAddAbility(whichUnit4, abilityId) 
	if (whichUnit4 == nil) then
		return false
	end
	return UnitAddAbility(whichUnit4, abilityId)
end

function __wurst_safe_UnitMakeAbilityPermanent(whichUnit12, permanent, abilityId2) 
	if (whichUnit12 == nil) then
		return false
	end
	return UnitMakeAbilityPermanent(whichUnit12, permanent, abilityId2)
end

function __wurst_safe_KillUnit(whichUnit14) 
	if (whichUnit14 == nil) then
		return nil
	end
	KillUnit(whichUnit14)
end

function __wurst_safe_GetOwningPlayer(whichUnit17) 
	if (whichUnit17 == nil) then
		return nil
	end
	return GetOwningPlayer(whichUnit17)
end

function __wurst_safe_CreateUnit(id9, unitid1, x6, y5, face1) 
	if (id9 == nil) then
		return nil
	end
	return CreateUnit(id9, unitid1, x6, y5, face1)
end

function __wurst_safe_RemoveUnit(whichUnit20) 
	if (whichUnit20 == nil) then
		return nil
	end
	RemoveUnit(whichUnit20)
end

function __wurst_safe_AddItemToStock(whichUnit31, itemId, currentStock, stockMax) 
	if (whichUnit31 == nil) then
		return nil
	end
	AddItemToStock(whichUnit31, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit32, itemId1) 
	if (whichUnit32 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit32, itemId1)
end

function __wurst_safe_UnitDamageTarget(whichUnit13, target6, amount3, attack1, ranged1, attackType3, damageType4, weaponType2) 
	if (whichUnit13 == nil) then
		return false
	end
	if (target6 == nil) then
		return false
	end
	if (attackType3 == nil) then
		return false
	end
	if (damageType4 == nil) then
		return false
	end
	if (weaponType2 == nil) then
		return false
	end
	return UnitDamageTarget(whichUnit13, target6, amount3, attack1, ranged1, attackType3, damageType4, weaponType2)
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

function __wurst_safe_GroupEnumUnitsInRect(whichGroup1, r3, filter8) 
	if (whichGroup1 == nil) then
		return nil
	end
	if (r3 == nil) then
		return nil
	end
	GroupEnumUnitsInRect(whichGroup1, r3, filter8)
end

function __wurst_safe_GroupRemoveUnit(whichGroup6, whichUnit10) 
	if (whichGroup6 == nil) then
		return false
	end
	if (whichUnit10 == nil) then
		return false
	end
	return GroupRemoveUnit(whichGroup6, whichUnit10)
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

function __wurst_ForForce(whichForce, callback) 
	if ForForce == nil then return end
	local players = {}
	local count = 0
	local prev = __wurst_enumPlayer_override
	ForForce(whichForce, function()
	    count = count + 1
	    players[count] = __wurst_GetEnumPlayer()
	end)
	for i = 1, count do
	    __wurst_enumPlayer_override = players[i]
	    callback()
	end
	__wurst_enumPlayer_override = prev
end

function __wurst_safe_ForceEnumPlayers(whichForce2, filter12) 
	if (whichForce2 == nil) then
		return nil
	end
	ForceEnumPlayers(whichForce2, filter12)
end

function __wurst_safe_IsUnitAliveBJ(whichUnit33) 
	if (whichUnit33 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit33)
end

function __wurst_safe_SetUnitVertexColor(whichUnit24, red, green, blue, alpha) 
	if (whichUnit24 == nil) then
		return nil
	end
	SetUnitVertexColor(whichUnit24, red, green, blue, alpha)
end

function __wurst_safe_DialogDisplay(whichPlayer23, whichDialog2, flag5) 
	if (whichPlayer23 == nil) then
		return nil
	end
	if (whichDialog2 == nil) then
		return nil
	end
	DialogDisplay(whichPlayer23, whichDialog2, flag5)
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

function __wurst_safe_SetPlayerAlliance(sourcePlayer, otherPlayer1, whichAllianceSetting, value16) 
	if (sourcePlayer == nil) then
		return nil
	end
	if (otherPlayer1 == nil) then
		return nil
	end
	if (whichAllianceSetting == nil) then
		return nil
	end
	SetPlayerAlliance(sourcePlayer, otherPlayer1, whichAllianceSetting, value16)
end

function __wurst_safe_SetUnitOwner(whichUnit7, whichPlayer10, changeColor) 
	if (whichUnit7 == nil) then
		return nil
	end
	if (whichPlayer10 == nil) then
		return nil
	end
	SetUnitOwner(whichUnit7, whichPlayer10, changeColor)
end

function __wurst_safe_DisplayTimedTextFromPlayer(toPlayer1, x7, y6, duration1, message2) 
	if (toPlayer1 == nil) then
		return nil
	end
	DisplayTimedTextFromPlayer(toPlayer1, x7, y6, duration1, message2)
end

function __wurst_safe_TriggerRegisterDialogButtonEvent(whichTrigger11, whichButton) 
	if (whichTrigger11 == nil) then
		return nil
	end
	if (whichButton == nil) then
		return nil
	end
	return TriggerRegisterDialogButtonEvent(whichTrigger11, whichButton)
end

function __wurst_safe_StartSoundForPlayerBJ(whichPlayer24, soundHandle2) 
	if (whichPlayer24 == nil) then
		return nil
	end
	if (soundHandle2 == nil) then
		return nil
	end
	StartSoundForPlayerBJ(whichPlayer24, soundHandle2)
end

function __wurst_safe_AllowVictoryDefeat(gameResult) 
	if (gameResult == nil) then
		return false
	end
	return AllowVictoryDefeat(gameResult)
end

function __wurst_safe_RemovePlayer(whichPlayer25, gameResult1) 
	if (whichPlayer25 == nil) then
		return nil
	end
	if (gameResult1 == nil) then
		return nil
	end
	RemovePlayer(whichPlayer25, gameResult1)
end

function __wurst_safe_SetGameDifficulty(whichdifficulty) 
	if (whichdifficulty == nil) then
		return nil
	end
	SetGameDifficulty(whichdifficulty)
end

function __wurst_safe_VolumeGroupSetVolumeForPlayerBJ(whichPlayer26, vgroup1, scale3) 
	if (whichPlayer26 == nil) then
		return nil
	end
	if (vgroup1 == nil) then
		return nil
	end
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer26, vgroup1, scale3)
end

function __wurst_safe_CustomVictoryDialogBJ(whichPlayer27) 
	if (whichPlayer27 == nil) then
		return nil
	end
	CustomVictoryDialogBJ(whichPlayer27)
end

function __wurst_safe_CustomVictorySkipBJ(whichPlayer28) 
	if (whichPlayer28 == nil) then
		return nil
	end
	CustomVictorySkipBJ(whichPlayer28)
end

function __wurst_safe_CustomDefeatDialogBJ(whichPlayer29, message3) 
	if (whichPlayer29 == nil) then
		return nil
	end
	CustomDefeatDialogBJ(whichPlayer29, message3)
end

function __wurst_safe_CreateTimerDialog(t3) 
	if (t3 == nil) then
		return nil
	end
	return CreateTimerDialog(t3)
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

function __wurst_safe_PingMinimapForPlayer(whichPlayer30, x8, y7, duration2) 
	if (whichPlayer30 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer30, x8, y7, duration2)
end

function __wurst_safe_UnitAddIndicator(whichUnit34, red1, green1, blue1, alpha1) 
	if (whichUnit34 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit34, red1, green1, blue1, alpha1)
end

function __wurst_safe_RescueUnitBJ(whichUnit35, rescuer, changeColor1) 
	if (whichUnit35 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit35, rescuer, changeColor1)
end

function __wurst_safe_SetPlayerTechMaxAllowed(whichPlayer31, techid, maximum) 
	if (whichPlayer31 == nil) then
		return nil
	end
	SetPlayerTechMaxAllowed(whichPlayer31, techid, maximum)
end

function __wurst_safe_SetPlayerAbilityAvailable(whichPlayer16, abilid, avail1) 
	if (whichPlayer16 == nil) then
		return nil
	end
	SetPlayerAbilityAvailable(whichPlayer16, abilid, avail1)
end

function __wurst_InitHashtable() 
	return { __wurst_ht_int = {}, __wurst_ht_bool = {}, __wurst_ht_real = {}, __wurst_ht_str = {}, __wurst_ht_handle = {} }
end

function __wurst_SaveInteger(h, p, c, i) 
	local t = h.__wurst_ht_int
	if t == nil then t = {}; h.__wurst_ht_int = t end
	if not t[p] then t[p] = {} end t[p][c] = i
end

function __wurst_SaveBoolean(h, p, c, i) 
	local t = h.__wurst_ht_bool
	if t == nil then t = {}; h.__wurst_ht_bool = t end
	if not t[p] then t[p] = {} end t[p][c] = i
end

function __wurst_SaveStr(h, p, c, i) 
	local t = h.__wurst_ht_str
	if t == nil then t = {}; h.__wurst_ht_str = t end
	if not t[p] then t[p] = {} end t[p][c] = i
end

function __wurst_SaveFogStateHandle(h, p, c, i) 
	local t = h.__wurst_ht_handle
	if t == nil then t = {}; h.__wurst_ht_handle = t end
	if not t[p] then t[p] = {} end t[p][c] = i
end

function __wurst_LoadInteger(h, p, c) 
	local t = h.__wurst_ht_int
	if t == nil or t[p] == nil then return 0 end
	local v = t[p][c]
	if v == nil then return 0 end
	return v
end

function __wurst_LoadBoolean(h, p, c) 
	local t = h.__wurst_ht_bool
	if t == nil or t[p] == nil then return false end
	local v = t[p][c]
	if v == nil then return false end
	return v
end

function __wurst_LoadTriggerHandle(h, p, c) 
	local t = h.__wurst_ht_handle
	if t == nil or t[p] == nil then return nil end
	return t[p][c]
end

function __wurst_HaveSavedBoolean(h, p, c) 
	local t = h.__wurst_ht_bool
	return t ~= nil and t[p] ~= nil and t[p][c] ~= nil
end

function __wurst_HaveSavedInteger(h, p, c) 
	local t = h.__wurst_ht_int
	return t ~= nil and t[p] ~= nil and t[p][c] ~= nil
end

function __wurst_safe_GetPlayerSlotState(whichPlayer32) 
	if (whichPlayer32 == nil) then
		return nil
	end
	return GetPlayerSlotState(whichPlayer32)
end

function __wurst_safe_GetPlayerState(whichPlayer14, whichPlayerState1) 
	if (whichPlayer14 == nil) then
		return 0
	end
	if (whichPlayerState1 == nil) then
		return 0
	end
	return GetPlayerState(whichPlayer14, whichPlayerState1)
end

function __wurst_safe_GetPlayerId(whichPlayer33) 
	if (whichPlayer33 == nil) then
		return 0
	end
	return GetPlayerId(whichPlayer33)
end

function __wurst_safe_SetPlayerColor(whichPlayer3, color2) 
	if (whichPlayer3 == nil) then
		return nil
	end
	if (color2 == nil) then
		return nil
	end
	SetPlayerColor(whichPlayer3, color2)
end

function __wurst_safe_GroupTargetOrder(whichGroup11, order1, targetWidget2) 
	if (whichGroup11 == nil) then
		return false
	end
	if (targetWidget2 == nil) then
		return false
	end
	return GroupTargetOrder(whichGroup11, order1, targetWidget2)
end

function __wurst_safe_GroupEnumUnitsInRange(whichGroup, x4, y3, radius, filter7) 
	if (whichGroup == nil) then
		return nil
	end
	GroupEnumUnitsInRange(whichGroup, x4, y3, radius, filter7)
end

function __wurst_safe_SetCameraPositionForPlayer(whichPlayer9, x2, y2) 
	if (whichPlayer9 == nil) then
		return nil
	end
	SetCameraPositionForPlayer(whichPlayer9, x2, y2)
end

function __wurst_safe_SetPlayerTeam(whichPlayer34, whichTeam) 
	if (whichPlayer34 == nil) then
		return nil
	end
	SetPlayerTeam(whichPlayer34, whichTeam)
end

function __wurst_safe_Filter(func) 
	return Filter(func)
end

function __wurst_safe_GetPlayerTechResearched(whichPlayer35, techid1, specificonly) 
	if (whichPlayer35 == nil) then
		return false
	end
	return GetPlayerTechResearched(whichPlayer35, techid1, specificonly)
end

function __wurst_safe_GroupEnumUnitsOfType(whichGroup2, unitname, filter9) 
	if (whichGroup2 == nil) then
		return nil
	end
	GroupEnumUnitsOfType(whichGroup2, unitname, filter9)
end

function __wurst_safe_UpdateEachStockBuilding(iType, iLevel) 
	if (iType == nil) then
		return nil
	end
	UpdateEachStockBuilding(iType, iLevel)
end

function __wurst_safe_BlzCreateUnitWithSkin(id3, unitid, x1, y1, face, skinId) 
	if (id3 == nil) then
		return nil
	end
	return BlzCreateUnitWithSkin(id3, unitid, x1, y1, face, skinId)
end

function __wurst_safe_ConditionalTriggerExecute(trig) 
	if (trig == nil) then
		return nil
	end
	ConditionalTriggerExecute(trig)
end

function __wurst_safe_SetPlayerStartLocation(whichPlayer2, startLocIndex) 
	if (whichPlayer2 == nil) then
		return nil
	end
	SetPlayerStartLocation(whichPlayer2, startLocIndex)
end

function __wurst_safe_SetPlayerRacePreference(whichPlayer4, whichRacePreference) 
	if (whichPlayer4 == nil) then
		return nil
	end
	if (whichRacePreference == nil) then
		return nil
	end
	SetPlayerRacePreference(whichPlayer4, whichRacePreference)
end

function __wurst_safe_SetPlayerRaceSelectable(whichPlayer5, value7) 
	if (whichPlayer5 == nil) then
		return nil
	end
	SetPlayerRaceSelectable(whichPlayer5, value7)
end

function __wurst_safe_SetPlayerController(whichPlayer6, controlType) 
	if (whichPlayer6 == nil) then
		return nil
	end
	if (controlType == nil) then
		return nil
	end
	SetPlayerController(whichPlayer6, controlType)
end

function __wurst_safe_SetGamePlacement(whichPlacementType) 
	if (whichPlacementType == nil) then
		return nil
	end
	SetGamePlacement(whichPlacementType)
end

function __wurst_safe_SetPlayerSlotAvailable(whichPlayer7, control) 
	if (whichPlayer7 == nil) then
		return nil
	end
	if (control == nil) then
		return nil
	end
	SetPlayerSlotAvailable(whichPlayer7, control)
end

function __wurst_safe_Condition(func1) 
	return Condition(func1)
end

function __wurst_safe_BlzSetEventAttackType(attackType1) 
	if (attackType1 == nil) then
		return false
	end
	return BlzSetEventAttackType(attackType1)
end

function __wurst_safe_BlzSetEventDamageType(damageType2) 
	if (damageType2 == nil) then
		return false
	end
	return BlzSetEventDamageType(damageType2)
end

function __wurst_safe_BlzSetEventWeaponType(weaponType) 
	if (weaponType == nil) then
		return false
	end
	return BlzSetEventWeaponType(weaponType)
end

function __wurst_safe_BlzSetSpecialEffectScale(whichEffect1, scale1) 
	if (whichEffect1 == nil) then
		return nil
	end
	BlzSetSpecialEffectScale(whichEffect1, scale1)
end

function __wurst_safe_BlzSetSpecialEffectColor(whichEffect2, r2, g3, b2) 
	if (whichEffect2 == nil) then
		return nil
	end
	BlzSetSpecialEffectColor(whichEffect2, r2, g3, b2)
end

function __wurst_safe_BlzGroupAddGroupFast(whichGroup3, addGroup) 
	if (whichGroup3 == nil) then
		return 0
	end
	if (addGroup == nil) then
		return 0
	end
	return BlzGroupAddGroupFast(whichGroup3, addGroup)
end

function __wurst_safe_BlzGroupGetSize(whichGroup8) 
	if (whichGroup8 == nil) then
		return 0
	end
	return BlzGroupGetSize(whichGroup8)
end

function __wurst_safe_BlzGroupUnitAt(whichGroup10, index6) 
	if (whichGroup10 == nil) then
		return nil
	end
	return BlzGroupUnitAt(whichGroup10, index6)
end

function __wurst_RemoveSavedInteger(h, p, c) 
	local t = h.__wurst_ht_int
	if t ~= nil and t[p] then t[p][c] = nil end
end

function __wurst_safe_IsPlayerAlly(whichPlayer15, otherPlayer) 
	if (whichPlayer15 == nil) then
		return false
	end
	if (otherPlayer == nil) then
		return false
	end
	return IsPlayerAlly(whichPlayer15, otherPlayer)
end

function __wurst_safe_TriggerAddCondition(whichTrigger1, condition2) 
	if (whichTrigger1 == nil) then
		return nil
	end
	return TriggerAddCondition(whichTrigger1, condition2)
end

function __wurst_safe_TriggerRegisterPlayerChatEvent(whichTrigger5, whichPlayer17, chatMessageToDetect1, exactMatchOnly1) 
	if (whichTrigger5 == nil) then
		return nil
	end
	if (whichPlayer17 == nil) then
		return nil
	end
	return TriggerRegisterPlayerChatEvent(whichTrigger5, whichPlayer17, chatMessageToDetect1, exactMatchOnly1)
end

function __wurst_safe_TriggerRegisterUnitEvent(whichTrigger8, whichUnit11, whichEvent1) 
	if (whichTrigger8 == nil) then
		return nil
	end
	if (whichUnit11 == nil) then
		return nil
	end
	if (whichEvent1 == nil) then
		return nil
	end
	return TriggerRegisterUnitEvent(whichTrigger8, whichUnit11, whichEvent1)
end

function __wurst_safe_GetUnitName(whichUnit16) 
	if (whichUnit16 == nil) then
		return ""
	end
	return GetUnitName(whichUnit16)
end

function __wurst_safe_GetUnitUserData(whichUnit18) 
	if (whichUnit18 == nil) then
		return 0
	end
	return GetUnitUserData(whichUnit18)
end

function __wurst_safe_SetUnitInvulnerable(whichUnit21, flag3) 
	if (whichUnit21 == nil) then
		return nil
	end
	SetUnitInvulnerable(whichUnit21, flag3)
end

function __wurst_safe_SetUnitPathing(whichUnit22, flag4) 
	if (whichUnit22 == nil) then
		return nil
	end
	SetUnitPathing(whichUnit22, flag4)
end

function __wurst_safe_SetUnitUserData(whichUnit23, data2) 
	if (whichUnit23 == nil) then
		return nil
	end
	SetUnitUserData(whichUnit23, data2)
end

function __wurst_safe_CustomVictoryBJ(whichPlayer20, showDialog, showScores) 
	if (whichPlayer20 == nil) then
		return nil
	end
	CustomVictoryBJ(whichPlayer20, showDialog, showScores)
end

function __wurst_safe_CustomDefeatBJ(whichPlayer21, message1) 
	if (whichPlayer21 == nil) then
		return nil
	end
	CustomDefeatBJ(whichPlayer21, message1)
end

