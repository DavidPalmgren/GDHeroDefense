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
Abilities_tranquility = nil
Angle_DEGTORAD = nil
Angle_RADTODEG = nil
BasicWaves_selectedTarget = nil
BasicWaves_footmen = nil
BasicWaves_spawn1 = nil
Basics_ANIMATION_PERIOD = nil
Basics_HEIGHT_ENABLER = nil
Basics_DUMMY_PLAYER = nil
BitSet_BITSET_SIZE = nil
BitSet_pows = nil
Bloom_HEALING_CLOUD_ID = nil
Bloom_CLOUD_UNIT_ID = nil
Bloom_CLOUD_RADIUS = nil
Bloom_CLOUD_HEAL = nil
Bloom_CLOUD_DURATION = nil
Bloom_HEAL_INTERVAL = nil
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
ErrorHandling_suppressErrorMessages = nil
GameTimer_currentTime = nil
Group_ENUM_GROUP = nil
HashList_ht = nil
HashList_occurences = nil
InstantDummyCaster_DUMMY_CASTER_UNIT_ID = nil
InstantDummyCaster_DUMMY_ROOT_ABIL_ID = nil
InstantDummyCaster_caster = nil
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
OrderIds_rejuvination = nil
OrderIds_undefend = nil
Player_players = nil
Player_localPlayer = nil
Preloader_autoFinish = nil
Preloader_dumg = nil
Preloader_dum = nil
Printing_DEBUG_LEVEL = nil
Printing_DEBUG_MSG_DURATION = nil
Recycle_RECYCLE_ID = nil
RegisterEvents_t = nil
RegisterEvents_onCastMap = nil
SeedBurst_SEED_BURST_ID = nil
SeedBurst_BURST_DAMAGE = nil
SeedBurst_BURST_RADIUS = nil
SeedBurst_BURST_DELAY = nil
SeedBurst_BURST_SFX = nil
SeedBurst_EXPLOSION_SFX = nil
SeedBurst_INVIGORATE_BUFF_ID = nil
ShieldBash_MY_ABILITY_ID = nil
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
GroupIterator = ({})
HashMap = ({})
CallbackSingle_doAfter_Invigorate = ({})
LLBackIterator = ({})
LLEntry = ({})
LLIterator = ({})
LinkedList = ({})
IdGenerator = ({})
CallbackSingle_nullTimer_OnUnitEnterLeave = ({})
ForGroupCallback_forEachFrom_Preloader = ({})
CallbackSingle_nullTimer_Preloader = ({})
EventListener_add_Recycle = ({})
OnCastListener_onCast_SeedBurst = ({})
CallbackSingle_doAfter_onCast_SeedBurst = ({})
Vec2Wrapper = ({})
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
	group_enumUnitsInRange(Group_ENUM_GROUP, this.pos, Bloom_CLOUD_RADIUS, nil, "when calling enumUnitsInRange in Bloom, line 59")
	iterator = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 60")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator, "when calling hasNext in Bloom, line 60")) then
			break
		end
		u = GroupIterator_GroupIterator_next(iterator, "when calling next in Bloom, line 60")
		if (unit_isAlive(u, "when calling isAlive in Bloom, line 61") and player_isAllyOf(unit_getOwner(u, "when calling getOwner in Bloom, line 61"), this.owner, "when calling isAllyOf in Bloom, line 61")) then
			unit_addHP(u, Bloom_CLOUD_HEAL, "when calling addHP in Bloom, line 62")
			flashEffect("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u, "origin", "when calling flashEffect in Bloom, line 63")
		end
	end
	GroupIterator_GroupIterator_close(iterator, "when calling close in Bloom, line 60")
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
	CallbackPeriodic_destroyCallbackPeriodic(this10.healTimer, "when calling destroyCallbackPeriodic in Bloom, line 67")
	unit_kill(this10.cloud, "when calling kill in Bloom, line 68")
	effect_destr(this10.sfx, "when calling destr in Bloom, line 69")
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
	group_enumUnitsInRect(Group_ENUM_GROUP, bj_mapInitialPlayableArea, nil, "when calling enumUnitsInRect in Bloom, line 74")
	iterator1 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 75")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator1, "when calling hasNext in Bloom, line 75")) then
			break
		end
		u1 = GroupIterator_GroupIterator_next(iterator1, "when calling next in Bloom, line 75")
		if unit_hasAbility(u1, 1114793322, "when calling hasAbility in Bloom, line 76") then
			spawnCloud(unit_getOwner(caster, "when calling getOwner in Bloom, line 77"), unit_getPos(u1, "when calling getPos in Bloom, line 77"), "when calling spawnCloud in Bloom, line 77")
		end
	end
	GroupIterator_GroupIterator_close(iterator1, "when calling close in Bloom, line 75")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_CenariusCharacter:create3() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_CenariusCharacter, }))
	return new_inst
end

function OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter(this18, caster1, __wurst_stackPos20) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos20
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventData_getSpellTargetUnit("when calling getSpellTargetUnit in CenariusCharacter, line 29")
	addSeedlingStack("when calling addSeedlingStack in CenariusCharacter, line 30")
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

function OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1(this19, caster2, __wurst_stackPos23) 
	local pos2 = ({0., 0., })
	local stacks = nil
	local i = nil
	local temp = nil
	local treant = nil
	local clVar = nil
	local temp100 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos23
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (getSeedlingCount("when calling getSeedlingCount in CenariusCharacter, line 35") <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	pos2 = tupleCopy(unit_getPos(caster2, "when calling getPos in CenariusCharacter, line 38"))
	stacks = getSeedlingCount("when calling getSeedlingCount in CenariusCharacter, line 39")
	i = 1
	temp = stacks
	while true do
		if (i > temp) then
			break
		end
		treant = createUnit(unit_getOwner(caster2, "when calling getOwner in CenariusCharacter, line 42"), SummonTreant_TREANT_UNIT_ID, pos2, ({0., }), "when calling createUnit in CenariusCharacter, line 42")
		temp100 = SummonTreant_TREANT_DURATION
		clVar = CallbackSingle_doAfter_onCast_CenariusCharacter:create5()
		CallbackSingle_construct_CallbackSingle(clVar, "when calling construct_CallbackSingle in CenariusCharacter, line 43")
		clVar.treant = treant
		doAfter(temp100, clVar, "when calling doAfter in CenariusCharacter, line 43")
		i = (i + 1)
	end
	Invigorate_seedlingCount = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_CenariusCharacter:create5() 
	local new_inst = ({CallbackSingle_t=nil, treant=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_CenariusCharacter, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter(this21, __wurst_stackPos28) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos28
	wurst_stack_depth = (wurst_stack_depth + 1)
	if unit_isAlive(this21.treant, "when calling isAlive in CenariusCharacter, line 44") then
		unit_kill(this21.treant, "when calling kill in CenariusCharacter, line 45")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_ClosureEvents:create6() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_ClosureEvents, }))
	return new_inst
end

function CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents(this22, __wurst_stackPos29) 
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
	wurst_stack[wurst_stack_depth] = __wurst_stackPos29
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

function EventListener_EventListener_onEvent(this26, __wurst_stackPos35) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos35
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_EventListener_init(this27, __wurst_stackPos36) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos36
	wurst_stack_depth = (wurst_stack_depth + 1)
	this27.EventListener_eventId = 0
	this27.EventListener_uid = -1
	this27.EventListener_next = nil
	this27.EventListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_construct_EventListener(this28, __wurst_stackPos37) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos37
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_EventListener_init(this28, "when calling EventListener_init in ClosureEvents, line 108")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_EventListener_onDestroy(this29, __wurst_stackPos38) 
	local listener = nil
	local listener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos38
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (this29.EventListener_uid < 0) then
		listener = EventListener_generalListenersFirsts[this29.EventListener_eventId]
		if (listener == this29) then
			EventListener_generalListenersFirsts[this29.EventListener_eventId] = this29.EventListener_next
		elseif not((this29.EventListener_prev == nil)) then
			this29.EventListener_prev.EventListener_next = this29.EventListener_next
		end
	else
		listener1 = EventListener_unitListenersFirsts[this29.EventListener_uid]
		if (listener1 == this29) then
			EventListener_unitListenersFirsts[this29.EventListener_uid] = this29.EventListener_next
		elseif not((this29.EventListener_prev == nil)) then
			this29.EventListener_prev.EventListener_next = this29.EventListener_next
		end
	end
	if not((this29.EventListener_next == nil)) then
		this29.EventListener_next.EventListener_prev = this29.EventListener_prev
	end
	this29.EventListener_next = nil
	this29.EventListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_destroyEventListener(this30, __wurst_stackPos39) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos39
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_EventListener_onDestroy(this30, "when calling EventListener_onDestroy in ClosureEvents, line 225")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener:create8() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener, }))
	return new_inst
end

function OnCastListener_OnCastListener_fire(this31, caster3, __wurst_stackPos40) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos40
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_OnCastListener_init(this32, __wurst_stackPos41) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos41
	wurst_stack_depth = (wurst_stack_depth + 1)
	this32.OnCastListener_next = nil
	this32.OnCastListener_prev = nil
	this32.OnCastListener_eventUnit = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_construct_OnCastListener(this33, __wurst_stackPos42) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos42
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnCastListener_OnCastListener_init(this33, "when calling OnCastListener_init in ClosureEvents, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_OnCastListener_onDestroy(this34, __wurst_stackPos43) 
	local index = nil
	local listener2 = nil
	local listener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos43
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((this34.OnCastListener_eventUnit == nil)) then
		index = unit_getIndex(this34.OnCastListener_eventUnit, "when calling getIndex in ClosureEvents, line 60")
		listener2 = EventListener_castMapCasters[index]
		if (listener2 == this34) then
			if not((this34.OnCastListener_next == nil)) then
				EventListener_castMapCasters[index] = this34.OnCastListener_next
			else
				EventListener_castMapCasters[index] = nil
			end
		elseif not((this34.OnCastListener_prev == nil)) then
			this34.OnCastListener_prev.OnCastListener_next = this34.OnCastListener_next
		end
	else
		listener3 = HashMap_HashMap_get(EventListener_castMap, this34.OnCastListener_abilId, "when calling get in ClosureEvents, line 70")
		if (listener3 == this34) then
			if not((this34.OnCastListener_next == nil)) then
				HashMap_HashMap_put(EventListener_castMap, this34.OnCastListener_abilId, this34.OnCastListener_next, "when calling put in ClosureEvents, line 73")
			else
				HashMap_HashMap_remove(EventListener_castMap, this34.OnCastListener_abilId, "when calling remove in ClosureEvents, line 75")
			end
		elseif not((this34.OnCastListener_prev == nil)) then
			this34.OnCastListener_prev.OnCastListener_next = this34.OnCastListener_next
		end
	end
	if not((this34.OnCastListener_next == nil)) then
		this34.OnCastListener_next.OnCastListener_prev = this34.OnCastListener_prev
	end
	this34.OnCastListener_next = nil
	this34.OnCastListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_destroyOnCastListener(this39, __wurst_stackPos48) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos48
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnCastListener_OnCastListener_onDestroy(this39, "when calling OnCastListener_onDestroy in ClosureEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback:create9() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback, }))
	return new_inst
end

function ForGroupCallback_ForGroupCallback_callback(this40, u2, __wurst_stackPos49) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos49
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback_destroyForGroupCallback(this41, __wurst_stackPos50) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos50
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallbackUntil:create10() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallbackUntil, }))
	return new_inst
end

function ForGroupCallbackUntil_ForGroupCallbackUntil_callback(this42, u3, __wurst_stackPos51) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos51
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic:create11() 
	local new_inst = ({CallbackPeriodic_t=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic, }))
	return new_inst
end

function CallbackPeriodic_CallbackPeriodic_start(this43, whichTimer, time, __wurst_stackPos52) 
	local receiver10 = nil
	local receiver11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos52
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver10 = whichTimer
	timer_setData(receiver10, __wurst_objectToIndex(this43), "when calling setData in ClosureTimers, line 158")
	receiver11 = receiver10
	timer_startPeriodic(receiver11, time, function (...) 
			xpcall(function (...) 
					bridge_CallbackPeriodic_staticCallback(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in ClosureTimers, line 159")
	this43.CallbackPeriodic_t = receiver11
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_call(this46, cb2, __wurst_stackPos55) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos55
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_init(this47, __wurst_stackPos56) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos56
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_construct_CallbackPeriodic(this48, __wurst_stackPos57) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos57
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_init(this48, "when calling CallbackPeriodic_init in ClosureTimers, line 151")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_onDestroy(this49, __wurst_stackPos58) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos58
	wurst_stack_depth = (wurst_stack_depth + 1)
	timer_release(this49.CallbackPeriodic_t, "when calling release in ClosureTimers, line 166")
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

function CallbackSingle_CallbackSingle_start(this51, whichTimer1, time2, __wurst_stackPos60) 
	local receiver12 = nil
	local receiver13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos60
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver12 = whichTimer1
	timer_setData(receiver12, __wurst_objectToIndex(this51), "when calling setData in ClosureTimers, line 134")
	receiver13 = receiver12
	timer_start(receiver13, time2, function (...) 
			xpcall(function (...) 
					bridge_code__start_CallbackSingle_ClosureTimers(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling start in ClosureTimers, line 135")
	this51.CallbackSingle_t = receiver13
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_call(this53, __wurst_stackPos62) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos62
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_construct_CallbackSingle(this20, __wurst_stackPos26) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos26
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_init(this20, "when calling CallbackSingle_init in ClosureTimers, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_destroyCallbackSingle(this55, __wurst_stackPos64) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos64
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_onDestroy(this55, "when calling CallbackSingle_onDestroy in ClosureTimers, line 147")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_init(this54, __wurst_stackPos63) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos63
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_onDestroy(this56, __wurst_stackPos65) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos65
	wurst_stack_depth = (wurst_stack_depth + 1)
	timer_release(this56.CallbackSingle_t, "when calling release in ClosureTimers, line 148")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent:create13() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent(this57, __wurst_stackPos66) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos66
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onUnreducedDamage("when calling onUnreducedDamage in DamageEvent, line 476")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent1:create14() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent1, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent1(this58, __wurst_stackPos68) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos68
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onDamage("when calling onDamage in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement:create15() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=DamageElement, }))
	return new_inst
end

function DamageElement_new_DamageElement(name, color, __wurst_stackPos70) 
	local this59 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos70
	wurst_stack_depth = (wurst_stack_depth + 1)
	this59 = DamageElement:create15()
	DamageElement_construct_DamageElement(this59, name, color, "when calling construct_DamageElement in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this59
end

function DamageElement_DamageElement_init(this61, __wurst_stackPos72) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos72
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement_construct_DamageElement(this60, name1, color1, __wurst_stackPos71) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos71
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageElement_DamageElement_init(this60, "when calling DamageElement_init in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance:create16() 
	local new_inst = ({DamageInstance_source=nil, DamageInstance_target=nil, DamageInstance_amount=0., DamageInstance_nativeAttackType=nil, DamageInstance_nativeDamageType=nil, DamageInstance_nativeWeaponType=nil, })
	setmetatable(new_inst, ({__index=DamageInstance, }))
	return new_inst
end

function DamageInstance_DamageInstance_setReducedAmount(this62, amount, __wurst_stackPos73) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos73
	wurst_stack_depth = (wurst_stack_depth + 1)
	this62.DamageInstance_amount = amount
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_init(this63, __wurst_stackPos74) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos74
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_new_DamageInstance(id1, source, target1, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType, damageElement, __wurst_stackPos75) 
	local this64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos75
	wurst_stack_depth = (wurst_stack_depth + 1)
	this64 = DamageInstance:create16()
	DamageInstance_construct_DamageInstance(this64, id1, source, target1, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType, damageElement, "when calling construct_DamageInstance in DamageEvent, line 133")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this64
end

function DamageInstance_construct_DamageInstance(this65, id2, source1, target2, unreducedAmount1, nativeAttackType1, nativeDamageType1, nativeWeaponType1, damageType1, damageElement1, __wurst_stackPos76) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos76
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_init(this65, "when calling DamageInstance_init in DamageEvent, line 133")
	this65.DamageInstance_source = source1
	this65.DamageInstance_target = target2
	this65.DamageInstance_amount = unreducedAmount1
	this65.DamageInstance_nativeAttackType = nativeAttackType1
	this65.DamageInstance_nativeDamageType = nativeDamageType1
	this65.DamageInstance_nativeWeaponType = nativeWeaponType1
	DamageInstance_count = (DamageInstance_count + 1)
	DamageInstance_stack[DamageInstance_count] = this65
	DamageInstance_current = this65
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_onDestroy(this66, __wurst_stackPos77) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos77
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_count = (DamageInstance_count - 1)
	DamageInstance_current = DamageInstance_stack[DamageInstance_count]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_destroyDamageInstance(this67, __wurst_stackPos78) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos78
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_onDestroy(this67, "when calling DamageInstance_onDestroy in DamageEvent, line 162")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener:create17() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener, }))
	return new_inst
end

function DamageListener_DamageListener_onEvent(this68, __wurst_stackPos79) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos79
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_DamageListener_init(this69, __wurst_stackPos80) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos80
	wurst_stack_depth = (wurst_stack_depth + 1)
	this69.DamageListener_next = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_construct_DamageListener(this70, __wurst_stackPos81) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos81
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageListener_DamageListener_init(this70, "when calling DamageListener_init in DamageEvent, line 431")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator:create18() 
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

function GroupIterator_destroyGroupIterator(this72, __wurst_stackPos83) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos83
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_onDestroy(this72, "when calling GroupIterator_onDestroy in Group, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_init(this74, __wurst_stackPos85) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos85
	wurst_stack_depth = (wurst_stack_depth + 1)
	this74.GroupIterator_i = 0
	this74.GroupIterator_n = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_new_GroupIterator(source2, __wurst_stackPos86) 
	local this75 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos86
	wurst_stack_depth = (wurst_stack_depth + 1)
	this75 = GroupIterator:create18()
	GroupIterator_construct_GroupIterator(this75, source2, "when calling construct_GroupIterator in Group, line 119")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this75
end

function GroupIterator_construct_GroupIterator(this76, source3, __wurst_stackPos87) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos87
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_init(this76, "when calling GroupIterator_init in Group, line 119")
	this76.GroupIterator_g = CreateGroup()
	group_add(this76.GroupIterator_g, "when calling add in Group, line 121", source3)
	this76.GroupIterator_n = group_size(this76.GroupIterator_g, "when calling size in Group, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_onDestroy(this73, __wurst_stackPos84) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos84
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_clear(this73.GroupIterator_g, "when calling clear in Group, line 136")
	group_destr(this73.GroupIterator_g, "when calling destr in Group, line 137")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap:create19() 
	local new_inst = ({HashMap_size=0, })
	setmetatable(new_inst, ({__index=HashMap, }))
	return new_inst
end

function HashMap_HashMap_has(this81, key3, __wurst_stackPos92) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos92
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Table_Table_hasInt(this81, __wurst_objectToIndex(key3), "when calling hasInt in HashMap, line 14")
end

function HashMap_HashMap_put(this37, key1, value, __wurst_stackPos46) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos46
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not(HashMap_HashMap_has(this37, key1, "when calling has in HashMap, line 18")) then
		this37.HashMap_size = (this37.HashMap_size + 1)
	end
	Table_Table_saveInt(this37, __wurst_objectToIndex(key1), __wurst_objectToIndex(value), "when calling saveInt in HashMap, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_HashMap_get(this36, key, __wurst_stackPos45) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos45
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return __wurst_objectFromIndex(Table_Table_loadInt(this36, __wurst_objectToIndex(key), "when calling loadInt in HashMap, line 24"))
end

function HashMap_HashMap_remove(this38, key2, __wurst_stackPos47) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos47
	wurst_stack_depth = (wurst_stack_depth + 1)
	if HashMap_HashMap_has(this38, key2, "when calling has in HashMap, line 28") then
		this38.HashMap_size = (this38.HashMap_size - 1)
	end
	Table_Table_removeInt(this38, __wurst_objectToIndex(key2), "when calling removeInt in HashMap, line 30")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_HashMap_init(this86, __wurst_stackPos97) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos97
	wurst_stack_depth = (wurst_stack_depth + 1)
	this86.HashMap_size = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_new_HashMap(__wurst_stackPos98) 
	local this87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos98
	wurst_stack_depth = (wurst_stack_depth + 1)
	this87 = HashMap:create19()
	HashMap_construct_HashMap(this87, "when calling construct_HashMap in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this87
end

function HashMap_construct_HashMap(this88, __wurst_stackPos99) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos99
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_construct_Table(this88, "when calling construct_Table in HashMap, line 7")
	HashMap_HashMap_init(this88, "when calling HashMap_init in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_Invigorate:create20() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_Invigorate, }))
	return new_inst
end

function CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate(this90, __wurst_stackPos101) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos101
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount > 0) then
		Invigorate_seedlingCount = (Invigorate_seedlingCount - 1)
		print1(stringConcat("Seedling stack expired. Remaining: ", int_toString(Invigorate_seedlingCount, "when calling toString in Invigorate, line 28")), "when calling print in Invigorate, line 28")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator:create21() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=LLBackIterator, }))
	return new_inst
end

function LLBackIterator_destroyLLBackIterator(this92, __wurst_stackPos104) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos104
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLBackIterator_LLBackIterator_onDestroy(this92, "when calling LLBackIterator_onDestroy in LinkedList, line 499")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator_LLBackIterator_onDestroy(this93, __wurst_stackPos105) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos105
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry:create22() 
	local new_inst = ({LLEntry_elem=nil, LLEntry_prev=nil, LLEntry_next=nil, })
	setmetatable(new_inst, ({__index=LLEntry, }))
	return new_inst
end

function LLEntry_new_LLEntry(elem, prev, next, __wurst_stackPos106) 
	local this94 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos106
	wurst_stack_depth = (wurst_stack_depth + 1)
	this94 = LLEntry:create22()
	LLEntry_construct_LLEntry(this94, elem, prev, next, "when calling construct_LLEntry in LinkedList, line 433")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this94
end

function LLEntry_destroyLLEntry(this96, __wurst_stackPos108) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos108
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_onDestroy(this96, "when calling LLEntry_onDestroy in LinkedList, line 428")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_init(this98, __wurst_stackPos110) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos110
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_construct_LLEntry(this95, elem1, prev1, next1, __wurst_stackPos107) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos107
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_init(this95, "when calling LLEntry_init in LinkedList, line 433")
	this95.LLEntry_elem = elem1
	this95.LLEntry_prev = prev1
	this95.LLEntry_next = next1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_onDestroy(this97, __wurst_stackPos109) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos109
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator:create23() 
	local new_inst = ({LLIterator_dummy=nil, LLIterator_current=nil, LLIterator_parent=nil, LLIterator_destroyOnClose=false, })
	setmetatable(new_inst, ({__index=LLIterator, }))
	return new_inst
end

function LLIterator_LLIterator_next(this99, __wurst_stackPos111) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos111
	wurst_stack_depth = (wurst_stack_depth + 1)
	this99.LLIterator_current = this99.LLIterator_current.LLEntry_next
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this99.LLIterator_current.LLEntry_elem
end

function LLIterator_LLIterator_hasNext(this100, __wurst_stackPos112) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos112
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return not((this100.LLIterator_current.LLEntry_next == this100.LLIterator_dummy))
end

function LLIterator_LLIterator_close(this101, __wurst_stackPos113) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos113
	wurst_stack_depth = (wurst_stack_depth + 1)
	if this101.LLIterator_destroyOnClose then
		LLIterator_destroyLLIterator(this101, "when calling destroyLLIterator in LinkedList, line 497")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_reset(this103, __wurst_stackPos115) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos115
	wurst_stack_depth = (wurst_stack_depth + 1)
	this103.LLIterator_dummy = LinkedList_LinkedList_getDummy(this103.LLIterator_parent, "when calling getDummy in LinkedList, line 454")
	this103.LLIterator_current = this103.LLIterator_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_new_LLIterator(parent, __wurst_stackPos117) 
	local this105 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos117
	wurst_stack_depth = (wurst_stack_depth + 1)
	this105 = LLIterator:create23()
	LLIterator_construct_LLIterator(this105, parent, "when calling construct_LLIterator in LinkedList, line 444")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this105
end

function LLIterator_destroyLLIterator(this102, __wurst_stackPos114) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos114
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_onDestroy(this102, "when calling LLIterator_onDestroy in LinkedList, line 438")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_init(this108, __wurst_stackPos120) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos120
	wurst_stack_depth = (wurst_stack_depth + 1)
	this108.LLIterator_destroyOnClose = true
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_construct_LLIterator(this106, parent1, __wurst_stackPos118) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos118
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_init(this106, "when calling LLIterator_init in LinkedList, line 444")
	this106.LLIterator_parent = parent1
	LLIterator_LLIterator_reset(this106, "when calling reset in LinkedList, line 446")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_onDestroy(this107, __wurst_stackPos119) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos119
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList:create24() 
	local new_inst = ({LinkedList_dummy=nil, LinkedList_size=0, LinkedList_staticItr=nil, LinkedList_staticBackItr=nil, })
	setmetatable(new_inst, ({__index=LinkedList, }))
	return new_inst
end

function LinkedList_LinkedList_add(this109, __wurst_stackPos121, ...) 
	local entry = nil
	local elem2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos121
	wurst_stack_depth = (wurst_stack_depth + 1)
	local __args = table.pack(...)
	for i2=1,__args.n do
	elem2 = __args[i2]
	entry = LLEntry_new_LLEntry(elem2, this109.LinkedList_dummy.LLEntry_prev, this109.LinkedList_dummy, "when calling new_LLEntry in LinkedList, line 39")
	this109.LinkedList_dummy.LLEntry_prev.LLEntry_next = entry
	this109.LinkedList_dummy.LLEntry_prev = entry
	this109.LinkedList_size = (this109.LinkedList_size + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_iterator(this110, __wurst_stackPos122) 
	local stackTrace_tempReturn = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos122
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = LLIterator_new_LLIterator(this110, "when calling new_LLIterator in LinkedList, line 179")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function LinkedList_new_LinkedList(__wurst_stackPos123) 
	local this111 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos123
	wurst_stack_depth = (wurst_stack_depth + 1)
	this111 = LinkedList:create24()
	LinkedList_construct_LinkedList2(this111, "when calling construct_LinkedList2 in LinkedList, line 31")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this111
end

function LinkedList_LinkedList_getDummy(this104, __wurst_stackPos116) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos116
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this104.LinkedList_dummy
end

function LinkedList_LinkedList_init(this113, __wurst_stackPos125) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos125
	wurst_stack_depth = (wurst_stack_depth + 1)
	this113.LinkedList_dummy = LLEntry_new_LLEntry(nil, nil, nil, "when calling new_LLEntry in LinkedList, line 18")
	this113.LinkedList_size = 0
	this113.LinkedList_staticItr = nil
	this113.LinkedList_staticBackItr = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_construct_LinkedList2(this112, __wurst_stackPos124) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos124
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_init(this112, "when calling LinkedList_init in LinkedList, line 31")
	this112.LinkedList_dummy.LLEntry_next = this112.LinkedList_dummy
	this112.LinkedList_dummy.LLEntry_prev = this112.LinkedList_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_onDestroy(this114, __wurst_stackPos126) 
	local current = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos126
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((this114.LinkedList_staticItr == nil)) then
		LLIterator_destroyLLIterator(this114.LinkedList_staticItr, "when calling destroyLLIterator in LinkedList, line 413")
	end
	if not((this114.LinkedList_staticBackItr == nil)) then
		LLBackIterator_destroyLLBackIterator(this114.LinkedList_staticBackItr, "when calling destroyLLBackIterator in LinkedList, line 415")
	end
	current = this114.LinkedList_dummy.LLEntry_next
	while true do
		if not(not((current == this114.LinkedList_dummy))) then
			break
		end
		current = current.LLEntry_next
		LLEntry_destroyLLEntry(current.LLEntry_prev, "when calling destroyLLEntry in LinkedList, line 419")
	end
	LLEntry_destroyLLEntry(this114.LinkedList_dummy, "when calling destroyLLEntry in LinkedList, line 420")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_destroyLinkedList(this115, __wurst_stackPos127) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos127
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_onDestroy(this115, "when calling LinkedList_onDestroy in LinkedList, line 411")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator:create25() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=IdGenerator, }))
	return new_inst
end

function IdGenerator_new_IdGenerator(start, __wurst_stackPos128) 
	local this116 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos128
	wurst_stack_depth = (wurst_stack_depth + 1)
	this116 = IdGenerator:create25()
	IdGenerator_construct_IdGenerator(this116, start, "when calling construct_IdGenerator in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this116
end

function IdGenerator_IdGenerator_init(this118, __wurst_stackPos130) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos130
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator_construct_IdGenerator(this117, start1, __wurst_stackPos129) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos129
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_IdGenerator_init(this117, "when calling IdGenerator_init in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_OnUnitEnterLeave:create26() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_OnUnitEnterLeave, }))
	return new_inst
end

function CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave(this119, __wurst_stackPos131) 
	local receiver14 = nil
	local count = nil
	local i3 = nil
	local temp2 = nil
	local receiver15 = nil
	local receiver16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos131
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
	temp2 = (count - 1)
	while true do
		if (i3 > temp2) then
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

function ForGroupCallback_forEachFrom_Preloader:create27() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback_forEachFrom_Preloader, }))
	return new_inst
end

function ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader(this122, u6, __wurst_stackPos136) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos136
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(u6, "when calling remove in Preloader, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_Preloader:create28() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_Preloader, }))
	return new_inst
end

function CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader(this124, __wurst_stackPos138) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos138
	wurst_stack_depth = (wurst_stack_depth + 1)
	finishPreload("when calling finishPreload in Preloader, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_Recycle:create29() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_Recycle, }))
	return new_inst
end

function EventListener_add_Recycle_onEvent_add_Recycle(this125, __wurst_stackPos140) 
	local dying = nil
	local pos4 = ({0., 0., })
	local closest = nil
	local closestDist = nil
	local iterator2 = nil
	local u7 = nil
	local dist = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos140
	wurst_stack_depth = (wurst_stack_depth + 1)
	dying = EventData_getDyingUnit("when calling getDyingUnit in Recycle, line 42")
	if unit_hasAbility(dying, Recycle_RECYCLE_ID, "when calling hasAbility in Recycle, line 43") then
		pos4 = tupleCopy(unit_getPos(dying, "when calling getPos in Recycle, line 44"))
		closest = nil
		closestDist = 99999.
		group_enumUnitsInRange(Group_ENUM_GROUP, pos4, 99999., nil, "when calling enumUnitsInRange in Recycle, line 48")
		iterator2 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Recycle, line 49")
		while true do
			if not(GroupIterator_GroupIterator_hasNext(iterator2, "when calling hasNext in Recycle, line 49")) then
				break
			end
			u7 = GroupIterator_GroupIterator_next(iterator2, "when calling next in Recycle, line 49")
			if ((not((u7 == dying)) and unit_isAlive(u7, "when calling isAlive in Recycle, line 50")) and player_isAllyOf(unit_getOwner(u7, "when calling getOwner in Recycle, line 50"), unit_getOwner(dying, "when calling getOwner in Recycle, line 50"), "when calling isAllyOf in Recycle, line 50")) then
				dist = vec2_distanceTo(pos4, unit_getPos(u7, "when calling getPos in Recycle, line 51"), "when calling distanceTo in Recycle, line 51")
				if (dist < closestDist) then
					closestDist = dist
					closest = u7
				end
			end
		end
		GroupIterator_GroupIterator_close(iterator2, "when calling close in Recycle, line 49")
		if not((closest == nil)) then
			InstantDummyCaster_castTarget(unit_getOwner(dying, "when calling getOwner in Recycle, line 57"), Invigorate_INVIGORATE_ID, 1, OrderIds_rejuvination, closest, "when calling castTarget in Recycle, line 57")
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_SeedBurst:create30() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SeedBurst, }))
	return new_inst
end

function OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst(this127, caster4, __wurst_stackPos144) 
	local targets = nil
	local iterator3 = nil
	local u8 = nil
	local delay = nil
	local iterator4 = nil
	local wrapper = nil
	local explodePos = ({0., 0., })
	local clVar1 = nil
	local iterator5 = nil
	local wrapper1 = nil
	local temp102 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos144
	wurst_stack_depth = (wurst_stack_depth + 1)
	targets = LinkedList_new_LinkedList("when calling new_LinkedList in SeedBurst, line 53")
	group_enumUnitsInRect(Group_ENUM_GROUP, bj_mapInitialPlayableArea, nil, "when calling enumUnitsInRect in SeedBurst, line 55")
	iterator3 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SeedBurst, line 56")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator3, "when calling hasNext in SeedBurst, line 56")) then
			break
		end
		u8 = GroupIterator_GroupIterator_next(iterator3, "when calling next in SeedBurst, line 56")
		if unit_hasAbility(u8, SeedBurst_INVIGORATE_BUFF_ID, "when calling hasAbility in SeedBurst, line 57") then
			LinkedList_LinkedList_add(targets, "when calling add in SeedBurst, line 58", Vec2Wrapper_new_Vec2Wrapper(unit_getPos(u8, "when calling getPos in SeedBurst, line 58"), "when calling new_Vec2Wrapper in SeedBurst, line 58"))
			unit_removeAbility(u8, SeedBurst_INVIGORATE_BUFF_ID, "when calling removeAbility in SeedBurst, line 59")
		end
	end
	GroupIterator_GroupIterator_close(iterator3, "when calling close in SeedBurst, line 56")
	delay = 0.
	iterator4 = LinkedList_LinkedList_iterator(targets, "when calling iterator in SeedBurst, line 62")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator4, "when calling hasNext in SeedBurst, line 62")) then
			break
		end
		wrapper = LLIterator_LLIterator_next(iterator4, "when calling next in SeedBurst, line 62")
		explodePos = tupleCopy(wrapper.Vec2Wrapper_pos)
		temp102 = delay
		clVar1 = CallbackSingle_doAfter_onCast_SeedBurst:create31()
		CallbackSingle_construct_CallbackSingle(clVar1, "when calling construct_CallbackSingle in SeedBurst, line 64")
		clVar1.explodePos = tupleCopy(explodePos)
		clVar1.caster = caster4
		doAfter(temp102, clVar1, "when calling doAfter in SeedBurst, line 64")
		delay = (delay + SeedBurst_BURST_DELAY)
	end
	LLIterator_LLIterator_close(iterator4, "when calling close in SeedBurst, line 62")
	iterator5 = LinkedList_LinkedList_iterator(targets, "when calling iterator in SeedBurst, line 74")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator5, "when calling hasNext in SeedBurst, line 74")) then
			break
		end
		wrapper1 = LLIterator_LLIterator_next(iterator5, "when calling next in SeedBurst, line 74")
		Vec2Wrapper_destroyVec2Wrapper(wrapper1, "when calling destroyVec2Wrapper in SeedBurst, line 75")
	end
	LLIterator_LLIterator_close(iterator5, "when calling close in SeedBurst, line 74")
	LinkedList_destroyLinkedList(targets, "when calling destroyLinkedList in SeedBurst, line 76")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_SeedBurst:create31() 
	local new_inst = ({CallbackSingle_t=nil, explodePos=({0., 0., }), caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SeedBurst, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst(this130, __wurst_stackPos148) 
	local iterator6 = nil
	local u9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos148
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect1(SeedBurst_BURST_SFX, this130.explodePos, "when calling flashEffect in SeedBurst, line 65")
	flashEffect1(SeedBurst_EXPLOSION_SFX, this130.explodePos, "when calling flashEffect in SeedBurst, line 66")
	group_enumUnitsInRange(Group_ENUM_GROUP, this130.explodePos, SeedBurst_BURST_RADIUS, nil, "when calling enumUnitsInRange in SeedBurst, line 67")
	iterator6 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SeedBurst, line 68")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator6, "when calling hasNext in SeedBurst, line 68")) then
			break
		end
		u9 = GroupIterator_GroupIterator_next(iterator6, "when calling next in SeedBurst, line 68")
		if (unit_isAlive(u9, "when calling isAlive in SeedBurst, line 69") and player_isEnemyOf(unit_getOwner(u9, "when calling getOwner in SeedBurst, line 69"), unit_getOwner(this130.caster, "when calling getOwner in SeedBurst, line 69"), "when calling isEnemyOf in SeedBurst, line 69")) then
			unit_damageTarget(this130.caster, u9, SeedBurst_BURST_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in SeedBurst, line 70")
		end
	end
	GroupIterator_GroupIterator_close(iterator6, "when calling close in SeedBurst, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper:create32() 
	local new_inst = ({Vec2Wrapper_pos=({0., 0., }), })
	setmetatable(new_inst, ({__index=Vec2Wrapper, }))
	return new_inst
end

function Vec2Wrapper_Vec2Wrapper_init(this133, __wurst_stackPos152) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos152
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_new_Vec2Wrapper(p4, __wurst_stackPos145) 
	local this134 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos145
	wurst_stack_depth = (wurst_stack_depth + 1)
	this134 = Vec2Wrapper:create32()
	Vec2Wrapper_construct_Vec2Wrapper(this134, p4, "when calling construct_Vec2Wrapper in SeedBurst, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this134
end

function Vec2Wrapper_construct_Vec2Wrapper(this135, p6, __wurst_stackPos153) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos153
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_init(this135, "when calling Vec2Wrapper_init in SeedBurst, line 21")
	this135.Vec2Wrapper_pos = tupleCopy(p6)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_Vec2Wrapper_onDestroy(this136, __wurst_stackPos154) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos154
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_destroyVec2Wrapper(this129, __wurst_stackPos147) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos147
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_onDestroy(this129, "when calling Vec2Wrapper_onDestroy in SeedBurst, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_addListener_ShieldBash:create33() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener_addListener_ShieldBash, }))
	return new_inst
end

function DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash(this137, __wurst_stackPos155) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos155
	wurst_stack_depth = (wurst_stack_depth + 1)
	onDamageTaken("when calling onDamageTaken in ShieldBash, line 86")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table:create34() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=Table, }))
	return new_inst
end

function Table_Table_hasInt(this82, parentKey, __wurst_stackPos93) 
	local stackTrace_tempReturn1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos93
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = hashtable_hasInt(Table_ht, __wurst_objectToIndex(this82), parentKey, "when calling hasInt in Table, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function Table_Table_removeInt(this85, parentKey3, __wurst_stackPos96) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos96
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_RemoveSavedInteger(Table_ht, __wurst_objectToIndex(this85), parentKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadInt(this84, parentKey2, __wurst_stackPos95) 
	local stackTrace_tempReturn2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos95
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = hashtable_loadInt(Table_ht, __wurst_objectToIndex(this84), parentKey2, "when calling loadInt in Table, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function Table_Table_saveInt(this83, parentKey1, value1, __wurst_stackPos94) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos94
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveInt(Table_ht, __wurst_objectToIndex(this83), parentKey1, value1, "when calling saveInt in Table, line 44")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_saveString(this141, parentKey8, value3, __wurst_stackPos160) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos160
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveString(Table_ht, __wurst_objectToIndex(this141), parentKey8, value3, "when calling saveString in Table, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadTrigger(this143, parentKey10, __wurst_stackPos162) 
	local stackTrace_tempReturn3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos162
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = hashtable_loadTriggerHandle(Table_ht, __wurst_objectToIndex(this143), parentKey10, "when calling loadTriggerHandle in Table, line 113")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function Table_Table_saveFogState(this145, parentKey12, value5, __wurst_stackPos164) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos164
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveFogStateHandle(Table_ht, __wurst_objectToIndex(this145), parentKey12, value5, "when calling saveFogStateHandle in Table, line 170")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_init(this147, __wurst_stackPos166) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos166
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_new_Table(__wurst_stackPos167) 
	local this148 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos167
	wurst_stack_depth = (wurst_stack_depth + 1)
	this148 = Table:create34()
	Table_construct_Table(this148, "when calling construct_Table in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this148
end

function Table_construct_Table(this89, __wurst_stackPos100) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos100
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_init(this89, "when calling Table_init in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex:create35() 
	local new_inst = ({UnitIndex__unit=nil, })
	setmetatable(new_inst, ({__index=UnitIndex, }))
	return new_inst
end

function UnitIndex_new_UnitIndex(whichUnit, __wurst_stackPos168) 
	local this149 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos168
	wurst_stack_depth = (wurst_stack_depth + 1)
	this149 = UnitIndex:create35()
	UnitIndex_construct_UnitIndex(this149, whichUnit, "when calling construct_UnitIndex in UnitIndexer, line 175")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this149
end

function UnitIndex_destroyUnitIndex(this151, __wurst_stackPos170) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos170
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_onDestroy(this151, "when calling UnitIndex_onDestroy in UnitIndexer, line 182")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_init(this153, __wurst_stackPos172) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos172
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_construct_UnitIndex(this150, whichUnit1, __wurst_stackPos169) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos169
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_init(this150, "when calling UnitIndex_init in UnitIndexer, line 175")
	this150.UnitIndex__unit = whichUnit1
	unit_setUserData(this150.UnitIndex__unit, __wurst_objectToIndex(this150), "when calling setUserData in UnitIndexer, line 177")
	pushUnit(whichUnit1, "when calling pushUnit in UnitIndexer, line 178")
	trigger_evaluate(UnitIndexer_onIndexTrigger, "when calling evaluate in UnitIndexer, line 179")
	popUnit("when calling popUnit in UnitIndexer, line 180")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_onDestroy(this152, __wurst_stackPos171) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos171
	wurst_stack_depth = (wurst_stack_depth + 1)
	pushUnit(this152.UnitIndex__unit, "when calling pushUnit in UnitIndexer, line 183")
	trigger_evaluate(UnitIndexer_onDeindexTrigger, "when calling evaluate in UnitIndexer, line 184")
	popUnit("when calling popUnit in UnitIndexer, line 185")
	unit_setUserData(this152.UnitIndex__unit, 0, "when calling setUserData in UnitIndexer, line 186")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initGlobals(__wurst_stackPos177) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos177
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

function InitGlobals(__wurst_stackPos178) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos178
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

function Unit000003_DropItems(__wurst_stackPos179) 
	local trigWidget = nil
	local trigUnit = nil
	local itemID = nil
	local canDrop = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos179
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget = nil
	trigUnit = nil
	itemID = 0
	canDrop = true
	trigWidget = bj_lastDyingWidget
	if (trigWidget == nil) then
		trigUnit = GetTriggerUnit()
	end
	if not((trigUnit == nil)) then
		canDrop = not(__wurst_safe_IsUnitHidden(trigUnit))
		if (canDrop and not((GetChangingUnit() == nil))) then
			canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop then
		RandomDistReset()
		RandomDistAddItem(1936614759, 100)
		itemID = RandomDistChoose()
		if not((trigUnit == nil)) then
			__wurst_safe_UnitDropItem(trigUnit, itemID)
		else
			__wurst_safe_WidgetDropItem(trigWidget, itemID)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000038_DropItems(__wurst_stackPos180) 
	local trigWidget1 = nil
	local trigUnit1 = nil
	local itemID1 = nil
	local canDrop1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos180
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget1 = nil
	trigUnit1 = nil
	itemID1 = 0
	canDrop1 = true
	trigWidget1 = bj_lastDyingWidget
	if (trigWidget1 == nil) then
		trigUnit1 = GetTriggerUnit()
	end
	if not((trigUnit1 == nil)) then
		canDrop1 = not(__wurst_safe_IsUnitHidden(trigUnit1))
		if (canDrop1 and not((GetChangingUnit() == nil))) then
			canDrop1 = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop1 then
		RandomDistReset()
		RandomDistAddItem(1918987571, 100)
		itemID1 = RandomDistChoose()
		if not((trigUnit1 == nil)) then
			__wurst_safe_UnitDropItem(trigUnit1, itemID1)
		else
			__wurst_safe_WidgetDropItem(trigWidget1, itemID1)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000043_DropItems(__wurst_stackPos181) 
	local trigWidget2 = nil
	local trigUnit2 = nil
	local itemID2 = nil
	local canDrop2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos181
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget2 = nil
	trigUnit2 = nil
	itemID2 = 0
	canDrop2 = true
	trigWidget2 = bj_lastDyingWidget
	if (trigWidget2 == nil) then
		trigUnit2 = GetTriggerUnit()
	end
	if not((trigUnit2 == nil)) then
		canDrop2 = not(__wurst_safe_IsUnitHidden(trigUnit2))
		if (canDrop2 and not((GetChangingUnit() == nil))) then
			canDrop2 = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop2 then
		RandomDistReset()
		RandomDistAddItem(1936548206, 100)
		itemID2 = RandomDistChoose()
		if not((trigUnit2 == nil)) then
			__wurst_safe_UnitDropItem(trigUnit2, itemID2)
		else
			__wurst_safe_WidgetDropItem(trigWidget2, itemID2)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000077_DropItems(__wurst_stackPos182) 
	local trigWidget3 = nil
	local trigUnit3 = nil
	local itemID3 = nil
	local canDrop3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos182
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget3 = nil
	trigUnit3 = nil
	itemID3 = 0
	canDrop3 = true
	trigWidget3 = bj_lastDyingWidget
	if (trigWidget3 == nil) then
		trigUnit3 = GetTriggerUnit()
	end
	if not((trigUnit3 == nil)) then
		canDrop3 = not(__wurst_safe_IsUnitHidden(trigUnit3))
		if (canDrop3 and not((GetChangingUnit() == nil))) then
			canDrop3 = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop3 then
		RandomDistReset()
		RandomDistAddItem(1936879474, 100)
		itemID3 = RandomDistChoose()
		if not((trigUnit3 == nil)) then
			__wurst_safe_UnitDropItem(trigUnit3, itemID3)
		else
			__wurst_safe_WidgetDropItem(trigWidget3, itemID3)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000080_DropItems(__wurst_stackPos183) 
	local trigWidget4 = nil
	local trigUnit4 = nil
	local itemID4 = nil
	local canDrop4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos183
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget4 = nil
	trigUnit4 = nil
	itemID4 = 0
	canDrop4 = true
	trigWidget4 = bj_lastDyingWidget
	if (trigWidget4 == nil) then
		trigUnit4 = GetTriggerUnit()
	end
	if not((trigUnit4 == nil)) then
		canDrop4 = not(__wurst_safe_IsUnitHidden(trigUnit4))
		if (canDrop4 and not((GetChangingUnit() == nil))) then
			canDrop4 = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop4 then
		RandomDistReset()
		RandomDistAddItem(1885695602, 100)
		itemID4 = RandomDistChoose()
		if not((trigUnit4 == nil)) then
			__wurst_safe_UnitDropItem(trigUnit4, itemID4)
		else
			__wurst_safe_WidgetDropItem(trigWidget4, itemID4)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000090_DropItems(__wurst_stackPos184) 
	local trigWidget5 = nil
	local trigUnit5 = nil
	local itemID5 = nil
	local canDrop5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos184
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget5 = nil
	trigUnit5 = nil
	itemID5 = 0
	canDrop5 = true
	trigWidget5 = bj_lastDyingWidget
	if (trigWidget5 == nil) then
		trigUnit5 = GetTriggerUnit()
	end
	if not((trigUnit5 == nil)) then
		canDrop5 = not(__wurst_safe_IsUnitHidden(trigUnit5))
		if (canDrop5 and not((GetChangingUnit() == nil))) then
			canDrop5 = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop5 then
		RandomDistReset()
		RandomDistAddItem(1936221537, 100)
		itemID5 = RandomDistChoose()
		if not((trigUnit5 == nil)) then
			__wurst_safe_UnitDropItem(trigUnit5, itemID5)
		else
			__wurst_safe_WidgetDropItem(trigWidget5, itemID5)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000097_DropItems(__wurst_stackPos185) 
	local trigWidget6 = nil
	local trigUnit6 = nil
	local itemID6 = nil
	local canDrop6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos185
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget6 = nil
	trigUnit6 = nil
	itemID6 = 0
	canDrop6 = true
	trigWidget6 = bj_lastDyingWidget
	if (trigWidget6 == nil) then
		trigUnit6 = GetTriggerUnit()
	end
	if not((trigUnit6 == nil)) then
		canDrop6 = not(__wurst_safe_IsUnitHidden(trigUnit6))
		if (canDrop6 and not((GetChangingUnit() == nil))) then
			canDrop6 = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop6 then
		RandomDistReset()
		RandomDistAddItem(1868984943, 100)
		itemID6 = RandomDistChoose()
		if not((trigUnit6 == nil)) then
			__wurst_safe_UnitDropItem(trigUnit6, itemID6)
		else
			__wurst_safe_WidgetDropItem(trigWidget6, itemID6)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer0(__wurst_stackPos186) 
	local p7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos186
	wurst_stack_depth = (wurst_stack_depth + 1)
	p7 = Player(0)
	gg_unit_etol_0001 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1702129516, 1472.0, -(128.0), 270.000, 1702129516)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1701670775, 992.0, 32.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1700884333, 1664.0, -(704.0), 270.000, 1700884333)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos187) 
	local p8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos187
	wurst_stack_depth = (wurst_stack_depth + 1)
	p8 = Player(0)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 838.5, -(1277.3), 16.183, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 808.8, -(1084.9), 202.847, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1702061422, 957.7, -(387.4), 69.117, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1702061422, 1066.0, -(511.7), 192.530, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 1014.9, -(1147.3), 305.814, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1164666213, 611.6, -(730.9), 152.000, 1164666213)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 1060.7, -(927.4), 55.483, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 987.2, -(885.9), 43.254, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 822.7, -(937.2), 76.335, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 668.8, -(1147.0), 40.706, 1697656882)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer1(__wurst_stackPos188) 
	local p9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos188
	wurst_stack_depth = (wurst_stack_depth + 1)
	p9 = Player(1)
	gg_unit_hwtw_0003 = __wurst_safe_BlzCreateUnitWithSkin(p9, 1752659063, -(4736.0), -(5760.0), 270.000, 1752659063)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostileBuildings(__wurst_stackPos189) 
	local p10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos189
	wurst_stack_depth = (wurst_stack_depth + 1)
	p10 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	gg_unit_cp00_0005 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 1600.0, -(2816.0), 270.000, 1668296752)
	gg_unit_cp00_0006 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 5248.0, -(960.0), 270.000, 1668296752)
	gg_unit_cp00_0007 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 4800.0, 2624.0, 270.000, 1668296752)
	gg_unit_cp00_0008 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 1216.0, -(512.0), 270.000, 1668296752)
	gg_unit_cp00_0009 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(5696.0), 3520.0, 270.000, 1668296752)
	gg_unit_cp00_0010 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(5568.0), -(960.0), 270.000, 1668296752)
	gg_unit_cp00_0011 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(2880.0), 3392.0, 270.000, 1668296752)
	gg_unit_cp00_0012 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(6400.0), 704.0, 270.000, 1668296752)
	gg_unit_cp00_0013 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(3392.0), -(3200.0), 270.000, 1668296752)
	gg_unit_cp00_0014 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(2240.0), 5312.0, 270.000, 1668296752)
	gg_unit_cp00_0015 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 2752.0, 2112.0, 270.000, 1668296752)
	gg_unit_cp00_0016 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(1344.0), -(448.0), 270.000, 1668296752)
	gg_unit_cp00_0017 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(1216.0), -(3264.0), 270.000, 1668296752)
	gg_unit_cp00_0018 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 3264.0, -(1152.0), 270.000, 1668296752)
	gg_unit_cp00_0019 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 1600.0, 4672.0, 270.000, 1668296752)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostile(__wurst_stackPos190) 
	local p11 = nil
	local u11 = nil
	local t = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos190
	wurst_stack_depth = (wurst_stack_depth + 1)
	p11 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	u11 = nil
	t = nil
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 3227.0, -(953.6), 276.937, 1852207724)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 2851.4, -(1207.6), 345.886, 1852207724)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207731, 3141.6, -(1200.9), 123.208, 1852207731)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853059186, -(1049.9), -(3101.3), 45.652, 1853059186)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853059186, -(889.8), -(3235.0), 37.961, 1853059186)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853059952, -(1108.3), -(3467.5), 68.554, 1853059952)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125236, 420.0, -(3574.2), 54.470, 1853125236)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060200, -(5759.6), -(2337.7), 41.299, 1853060200)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060204, -(5605.5), -(2353.4), 117.876, 1853060204)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060204, -(5633.8), -(2157.0), 200.770, 1853060204)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060204, -(5835.2), -(2095.7), 75.566, 1853060204)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(5460.5), -(2277.5), 187.268, 1853060211)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(5453.3), -(2092.9), 280.742, 1853060211)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(5603.0), -(1981.1), 109.405, 1853060211)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(5849.6), -(2004.7), 145.079, 1853060211)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320295, -(1483.1), -(688.7), 34.308, 1853320295)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320308, -(1592.8), -(632.4), 30.080, 1853320308)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320308, -(1454.7), -(780.7), 19.573, 1853320308)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207713, 5541.8, -(926.4), 164.430, 1852207713)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000038_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 5187.4, -(1075.3), 165.269, 1852207724)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 5125.9, -(880.8), 181.638, 1852207724)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 5135.2, -(682.5), 253.285, 1852207724)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207717, 5312.7, -(723.8), 264.573, 1852207717)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270642, 1724.6, -(3089.6), 143.210, 1852270642)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000043_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270641, 1603.3, -(3194.6), 179.640, 1852270641)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270641, 1598.3, -(2950.3), 110.286, 1852270641)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270641, 1807.2, -(2935.5), 153.903, 1852270641)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1848651824, 422.5, -(52.9), 184.565, 1848651824)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125235, 1.1, -(3547.9), 13.702, 1853125235)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125235, 375.4, -(3911.5), 79.127, 1853125235)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125235, 181.5, -(3818.1), 40.610, 1853125235)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(5539.1), 3515.8, 64.932, 1852662375)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(5358.7), 3494.4, 121.334, 1852662375)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(5669.5), 3668.6, 314.984, 1852662375)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(5609.3), 3856.7, 309.917, 1852662375)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(5230.2), 3588.8, 154.000, 1852662375)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(5294.9), 3916.0, 238.030, 1852662375)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(5473.0), 3924.5, 257.251, 1852662375)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852340580, -(2112.4), 5419.3, 251.560, 1852340580)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000080_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852666999, -(5168.7), 3663.1, 186.648, 1852666999)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852666999, -(5196.7), 3831.2, 205.128, 1852666999)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852666723, -(5093.4), 3747.2, 184.270, 1852666723)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000077_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853056872, -(2006.6), 5280.4, 179.915, 1853056872)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853056872, -(2326.7), 5511.4, 293.829, 1853056872)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853318510, 2544.2, 3906.1, 242.161, 1853318510)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207728, 2680.5, 3623.6, 164.835, 1852207728)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207728, 2365.2, 3526.7, 96.867, 1852207728)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207203, 1622.8, 4798.9, 260.600, 1852207203)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000090_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207220, 1029.9, 4738.7, 275.980, 1852207220)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207220, 1823.9, 4424.7, 151.836, 1852207220)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207219, 1508.5, 4500.8, 65.068, 1852207219)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207219, 1461.4, 4819.3, 276.963, 1852207219)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320801, 2495.3, 3495.6, 125.320, 1853320801)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000097_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4469.8, 2688.4, 284.950, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4516.4, 2635.5, 133.894, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4560.2, 2690.5, 341.619, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4594.7, 2749.5, 38.442, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4493.2, 2780.5, 280.654, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4647.0, 2407.6, 266.196, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4725.3, 2380.5, 332.973, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4702.3, 2479.4, 347.146, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4784.7, 2487.5, 297.460, 1852008242)
	u11 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1316252014, 4649.3, 2599.3, 18.400, 1316252014)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u11, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000003_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassiveBuildings(__wurst_stackPos191) 
	local p12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos191
	wurst_stack_depth = (wurst_stack_depth + 1)
	p12 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852207665, 5312.0, -(512.0), 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852207666, 5632.0, -(512.0), 270.000, 1852207666)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852207665, 3008.0, -(896.0), 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, -(5792.0), 4000.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, -(5920.0), 3808.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, -(5984.0), 4064.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852206952, -(1984.0), 5632.0, 270.000, 1852206952)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(5472.0), 3296.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(5216.0), 3296.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(5920.0), 3488.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(5664.0), 3232.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(5408.0), 3040.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, -(2272.0), 5728.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(2208.0), 5024.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(2400.0), 5024.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(2016.0), 5088.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853122608, 1280.0, 4736.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853122608, 1856.0, 4608.0, 270.000, 1853122608)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassive(__wurst_stackPos192) 
	local p13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos192
	wurst_stack_depth = (wurst_stack_depth + 1)
	p13 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1848651826, 4493.7, 2500.9, 280.654, 1848651826)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos193) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos193
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateBuildingsForPlayer0("when calling CreateBuildingsForPlayer0 in war3map, line 559")
	CreateBuildingsForPlayer1("when calling CreateBuildingsForPlayer1 in war3map, line 560")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos194) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos194
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 565")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos195) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos195
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateNeutralHostileBuildings("when calling CreateNeutralHostileBuildings in war3map, line 570")
	CreateNeutralPassiveBuildings("when calling CreateNeutralPassiveBuildings in war3map, line 571")
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 572")
	CreateNeutralHostile("when calling CreateNeutralHostile in war3map, line 573")
	CreateNeutralPassive("when calling CreateNeutralPassive in war3map, line 574")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 575")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateRegions(__wurst_stackPos196) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos196
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_rct_Region_000 = Rect(-(4960.0), -(6336.0), -(4512.0), -(5984.0))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_init_Actions(__wurst_stackPos197) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos197
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

function InitTrig_init(__wurst_stackPos198) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos198
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_init = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_init, function (...) 
			xpcall(function (...) 
					bridge_Trig_init_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomTriggers(__wurst_stackPos199) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos199
	wurst_stack_depth = (wurst_stack_depth + 1)
	InitTrig_init("when calling InitTrig_init in war3map, line 627")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function RunInitializationTriggers(__wurst_stackPos200) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos200
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
	Abilities_tranquility = ""
	Angle_DEGTORAD = 0.
	Angle_RADTODEG = 0.
	BasicWaves_selectedTarget = nil
	BasicWaves_footmen = nil
	BasicWaves_spawn1 = ({0., 0., })
	Basics_ANIMATION_PERIOD = 0.
	Basics_HEIGHT_ENABLER = 0
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
	ErrorHandling_suppressErrorMessages = false
	GameTimer_currentTime = 0.
	Group_ENUM_GROUP = nil
	HashList_ht = nil
	HashList_occurences = nil
	InstantDummyCaster_DUMMY_CASTER_UNIT_ID = 0
	InstantDummyCaster_DUMMY_ROOT_ABIL_ID = 0
	InstantDummyCaster_caster = nil
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
	OrderIds_rejuvination = 0
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
	Recycle_RECYCLE_ID = 0
	RegisterEvents_t = defaultArray(function () 
			return nil
		end)
	RegisterEvents_onCastMap = nil
	SeedBurst_SEED_BURST_ID = 0
	SeedBurst_BURST_DAMAGE = 0.
	SeedBurst_BURST_RADIUS = 0.
	SeedBurst_BURST_DELAY = 0.
	SeedBurst_BURST_SFX = ""
	SeedBurst_EXPLOSION_SFX = ""
	SeedBurst_INVIGORATE_BUFF_ID = 0
	ShieldBash_MY_ABILITY_ID = 0
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
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
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
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.__wurst_supertypes = ({[OnCastListener_onCast_Bloom] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Bloom.__typeId__ = 29
	OnCastListener_onCast_CenariusCharacter.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter.__typeId__ = 30
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter1] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter1.__typeId__ = 31
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
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
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
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
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
	CallbackSingle_nullTimer_ClosureEvents.__typeId__ = 8
	EventListener.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener.destroyEventListener = EventListener_destroyEventListener
	EventListener.__wurst_supertypes = ({[EventListener] = true, })
	EventListener.__typeId__ = 15
	OnCastListener.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.__wurst_supertypes = ({[OnCastListener] = true, })
	OnCastListener.__typeId__ = 28
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
	EventListener_add_DamageEvent.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.__wurst_supertypes = ({[EventListener_add_DamageEvent] = true, [EventListener] = true, })
	EventListener_add_DamageEvent.__typeId__ = 16
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.__wurst_supertypes = ({[EventListener_add_DamageEvent1] = true, [EventListener] = true, })
	EventListener_add_DamageEvent1.__typeId__ = 17
	DamageElement.__wurst_supertypes = ({[DamageElement] = true, })
	DamageElement.__typeId__ = 11
	DamageInstance.DamageInstance_DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.DamageInstance_destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.__wurst_supertypes = ({[DamageInstance] = true, })
	DamageInstance.__typeId__ = 12
	DamageListener.__wurst_supertypes = ({[DamageListener] = true, })
	DamageListener.__typeId__ = 13
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
	HashMap.__typeId__ = 34
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
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.__wurst_supertypes = ({[CallbackSingle_doAfter_Invigorate] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_Invigorate.__typeId__ = 5
	LLBackIterator.LLBackIterator_destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.__wurst_supertypes = ({[LLBackIterator] = true, })
	LLBackIterator.__typeId__ = 24
	LLEntry.LLEntry_destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.__wurst_supertypes = ({[LLEntry] = true, })
	LLEntry.__typeId__ = 25
	LLIterator.LLIterator_LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.LLIterator_destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.__wurst_supertypes = ({[LLIterator] = true, })
	LLIterator.__typeId__ = 26
	LinkedList.LinkedList_LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.__wurst_supertypes = ({[LinkedList] = true, })
	LinkedList.__typeId__ = 27
	IdGenerator.__wurst_supertypes = ({[IdGenerator] = true, })
	IdGenerator.__typeId__ = 23
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
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
	CallbackSingle_nullTimer_OnUnitEnterLeave.__typeId__ = 9
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
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
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
	CallbackSingle_nullTimer_Preloader.__typeId__ = 10
	EventListener_add_Recycle.EventListener_add_DamageEvent_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_Recycle_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Recycle.EventListener_add_Recycle_onEvent = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_Recycle_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Recycle.EventListener_onEvent = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Recycle.onEvent = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.__wurst_supertypes = ({[EventListener_add_Recycle] = true, [EventListener] = true, })
	EventListener_add_Recycle.__typeId__ = 18
	OnCastListener_onCast_SeedBurst.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.__wurst_supertypes = ({[OnCastListener_onCast_SeedBurst] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SeedBurst.__typeId__ = 32
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_SeedBurst] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_SeedBurst.__typeId__ = 7
	Vec2Wrapper.Vec2Wrapper_destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.__wurst_supertypes = ({[Vec2Wrapper] = true, })
	Vec2Wrapper.__typeId__ = 36
	DamageListener_addListener_ShieldBash.DamageListener_addListener_ShieldBash_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.DamageListener_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.__wurst_supertypes = ({[DamageListener_addListener_ShieldBash] = true, [DamageListener] = true, })
	DamageListener_addListener_ShieldBash.__typeId__ = 14
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
	Table.__typeId__ = 33
	UnitIndex.UnitIndex_destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.__wurst_supertypes = ({[UnitIndex] = true, })
	UnitIndex.__typeId__ = 35
	initGlobals("when calling initGlobals")
	initCompiletimeState("when calling initCompiletimeState in blizzard, line 1")
	SetCameraBounds((-(7424.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(7680.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(7424.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(7680.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("AshenvaleDay")
	SetAmbientNightSound("AshenvaleNight")
	SetMapMusic("Music", true, 0)
	CreateRegions("when calling CreateRegions in war3map, line 672")
	CreateAllUnits("when calling CreateAllUnits in war3map, line 673")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 675")
	InitCustomTriggers("when calling InitCustomTriggers in war3map, line 676")
	RunInitializationTriggers("when calling RunInitializationTriggers in war3map, line 677")
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
	  local __wurst_init_ok = xpcall(init_Bloom, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Bloom.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Invigorate, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Invigorate.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_SummonTreant, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package SummonTreant.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_SeedBurst, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package SeedBurst.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_InstantDummyCaster, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package InstantDummyCaster.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Recycle, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Recycle.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ShieldBash, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ShieldBash.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_UpgradeObjEditing, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package UpgradeObjEditing.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ThickBark, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ThickBark.", "<lua error>")
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

function init_Abilities(__wurst_stackPos202) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos202
	wurst_stack_depth = (wurst_stack_depth + 1)
	Abilities_tranquility = "Abilities\\Spells\\NightElf\\Tranquility\\Tranquility.mdx"
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityIds(__wurst_stackPos203) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos203
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityObjEditing(__wurst_stackPos235) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos235
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos207) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos207
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_DEGTORAD = 0.017453293
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this156, __wurst_stackPos262) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos262
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this156[1] * Angle_RADTODEG)
end

function angle_radians(this157, __wurst_stackPos263) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos263
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this157[1]
end

function real_fromDeg(this158, __wurst_stackPos264) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos264
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this158 * Angle_DEGTORAD), })
end

function real_asAngleRadians(this159, __wurst_stackPos265) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos265
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this159, })
end

function init_BasicWaves(__wurst_stackPos236) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos236
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

function createPlayerUnit(p14, unitID, number, unitGroup, __wurst_stackPos271) 
	local i4 = nil
	local temp3 = nil
	local u12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos271
	wurst_stack_depth = (wurst_stack_depth + 1)
	i4 = 0
	temp3 = (number - 1)
	while true do
		if (i4 > temp3) then
			break
		end
		u12 = createUnit(p14, unitID, BasicWaves_spawn1, ({0., }), "when calling createUnit in BasicWaves, line 15")
		group_add1(unitGroup, "when calling add in BasicWaves, line 16", u12)
		i4 = (i4 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnWave(__wurst_stackPos273) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos273
	wurst_stack_depth = (wurst_stack_depth + 1)
	createPlayerUnit(Player_players[1], 1751543663, 1, BasicWaves_footmen, "when calling createPlayerUnit in BasicWaves, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupWaveSpawn(__wurst_stackPos268) 
	local receiver17 = nil
	local receiver18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos268
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

function code__addAction_BasicWaves(__wurst_stackPos274) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos274
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAttackPlayer(__wurst_stackPos269) 
	local receiver19 = nil
	local receiver20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos269
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

function code__addAction_BasicWaves1(__wurst_stackPos275) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos275
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 32")
	print2(group_size(BasicWaves_footmen, "when calling size in BasicWaves, line 33"), "when calling print in BasicWaves, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupBuildingDeathTrigger(__wurst_stackPos270) 
	local receiver21 = nil
	local receiver22 = nil
	local receiver23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos270
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

function code__Condition_addCondition_addAction_BasicWaves(__wurst_stackPos280) 
	local stackTrace_tempReturn4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos280
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = (GetTriggerUnit() == udg_watchTower)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function code__addAction_BasicWaves2(__wurst_stackPos281) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos281
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 40")
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function startingCameraPosition(__wurst_stackPos267) 
	local u13 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos267
	wurst_stack_depth = (wurst_stack_depth + 1)
	u13 = ({__wurst_safe_GetUnitX(udg_heroSelector), __wurst_safe_GetUnitY(udg_heroSelector), })
	__wurst_safe_SetCameraPositionForPlayer(Player_players[0], u13[1], u13[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Basics(__wurst_stackPos215) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos215
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	Basics_HEIGHT_ENABLER = 1097691750
	Basics_DUMMY_PLAYER = Player_players[PLAYER_NEUTRAL_PASSIVE]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_BitSet(__wurst_stackPos206) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos206
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_BITSET_SIZE = 32
	initPows("when calling initPows in BitSet, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPows(__wurst_stackPos282) 
	local allPows = nil
	local i5 = nil
	local temp4 = nil
	local i6 = nil
	local temp5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos282
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_pows[0] = 1
	allPows = 1
	i5 = 1
	temp4 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i5 > temp4) then
			break
		end
		BitSet_pows[i5] = (intEnsure(BitSet_pows[(i5 - 1)]) * 2)
		allPows = int_bitOr(allPows, intEnsure(BitSet_pows[i5]), "when calling bitOr in BitSet, line 17")
		i5 = (i5 + 1)
	end
	i6 = 0
	temp5 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i6 > temp5) then
			break
		end
		int_bitXor(allPows, intEnsure(BitSet_pows[i6]), "when calling bitXor in BitSet, line 19")
		i6 = (i6 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Bloom(__wurst_stackPos249) 
	local clVar2 = nil
	local temp79 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos249
	wurst_stack_depth = (wurst_stack_depth + 1)
	Bloom_HEALING_CLOUD_ID = intEnsure(1095577650)
	Bloom_CLOUD_UNIT_ID = 1701212014
	Bloom_CLOUD_RADIUS = 256.
	Bloom_CLOUD_HEAL = 20.
	Bloom_CLOUD_DURATION = 10.
	Bloom_HEAL_INTERVAL = 1.
	temp79 = Bloom_HEALING_CLOUD_ID
	clVar2 = OnCastListener_onCast_Bloom:create2()
	OnCastListener_construct_OnCastListener(clVar2, "when calling construct_OnCastListener in Bloom, line 73")
	EventListener_onCast(temp79, clVar2, "when calling onCast in Bloom, line 73")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnCloud(owner, pos1, __wurst_stackPos18) 
	local cloud = nil
	local sfx = nil
	local healTimer = nil
	local clVar3 = nil
	local clVar4 = nil
	local temp80 = nil
	local temp81 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos18
	wurst_stack_depth = (wurst_stack_depth + 1)
	cloud = createUnit(owner, Bloom_CLOUD_UNIT_ID, pos1, ({0., }), "when calling createUnit in Bloom, line 44")
	unit_setInvulnerable(cloud, true, "when calling setInvulnerable in Bloom, line 45")
	unit_pause(cloud, "when calling pause in Bloom, line 46")
	unit_addAbility(cloud, 1097625443, "when calling addAbility in Bloom, line 48")
	unit_setPathing(cloud, false, "when calling setPathing in Bloom, line 49")
	unit_setAnimation(cloud, "stand 4", "when calling setAnimation in Bloom, line 50")
	sfx = widget_addEffect(cloud, Abilities_tranquility, "origin", "when calling addEffect in Bloom, line 53")
	effect_setScale(sfx, 1., "when calling setScale in Bloom, line 54")
	effect_setColor(sfx, 0, 255, 0, "when calling setColor in Bloom, line 55")
	temp80 = Bloom_HEAL_INTERVAL
	clVar3 = CallbackPeriodic_doPeriodically_Bloom:create()
	CallbackPeriodic_construct_CallbackPeriodic(clVar3, "when calling construct_CallbackPeriodic in Bloom, line 58")
	clVar3.pos = tupleCopy(pos1)
	clVar3.owner = owner
	healTimer = doPeriodically(temp80, clVar3, "when calling doPeriodically in Bloom, line 58")
	temp81 = Bloom_CLOUD_DURATION
	clVar4 = CallbackSingle_doAfter_Bloom:create1()
	CallbackSingle_construct_CallbackSingle(clVar4, "when calling construct_CallbackSingle in Bloom, line 66")
	clVar4.healTimer = healTimer
	clVar4.cloud = cloud
	clVar4.sfx = sfx
	doAfter(temp81, clVar4, "when calling doAfter in Bloom, line 66")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CenariusCharacter(__wurst_stackPos253) 
	local clVar5 = nil
	local clVar6 = nil
	local temp82 = nil
	local temp83 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos253
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp82 = Invigorate_INVIGORATE_ID
	clVar5 = OnCastListener_onCast_CenariusCharacter:create3()
	OnCastListener_construct_OnCastListener(clVar5, "when calling construct_OnCastListener in CenariusCharacter, line 28")
	EventListener_onCast(temp82, clVar5, "when calling onCast in CenariusCharacter, line 28")
	temp83 = SummonTreant_SUMMON_TREANT_ID
	clVar6 = OnCastListener_onCast_CenariusCharacter1:create4()
	OnCastListener_construct_OnCastListener(clVar6, "when calling construct_OnCastListener in CenariusCharacter, line 32")
	EventListener_onCast(temp83, clVar6, "when calling onCast in CenariusCharacter, line 32")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureEvents(__wurst_stackPos248) 
	local clVar7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos248
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
	clVar7 = CallbackSingle_nullTimer_ClosureEvents:create6()
	CallbackSingle_construct_CallbackSingle(clVar7, "when calling construct_CallbackSingle in ClosureEvents, line 306")
	nullTimer(clVar7, "when calling nullTimer in ClosureEvents, line 306")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function fireEvents(_u, __wurst_stackPos297) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos297
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function eventid_toIntId(this175, __wurst_stackPos298) 
	local id4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos298
	wurst_stack_depth = (wurst_stack_depth + 1)
	id4 = intEnsure(ClosureEvents_eventidToIndex[handle_getHandleId(this175, "when calling getHandleId in ClosureEvents, line 248")])
	if (id4 == 0) then
		id4 = registerEventId(this175, "when calling registerEventId in ClosureEvents, line 250")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return id4
end

function registerEventId(evnt, __wurst_stackPos300) 
	local eventId = nil
	local i7 = nil
	local temp6 = nil
	local receiver24 = nil
	local receiver25 = nil
	local receiver26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos300
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
		temp6 = (bj_MAX_PLAYERS - 1)
		while true do
			if (i7 > temp6) then
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

function unregisterEventsForUnit(u14, __wurst_stackPos304) 
	local index2 = nil
	local listener5 = nil
	local t1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos304
	wurst_stack_depth = (wurst_stack_depth + 1)
	if fireEvents(u14, "when calling fireEvents in ClosureEvents, line 279") then
		index2 = unit_getIndex(u14, "when calling getIndex in ClosureEvents, line 280")
		unregisterEvents(index2, "when calling unregisterEvents in ClosureEvents, line 281")
		if not((EventListener_castMapCasters[index2] == nil)) then
			listener5 = EventListener_castMapCasters[index2]
			EventListener_castMapCasters[index2] = nil
			while true do
				if not(not((listener5 == nil))) then
					break
				end
				t1 = listener5
				listener5 = listener5.OnCastListener_next
				OnCastListener_destroyOnCastListener(t1, "when calling destroyOnCastListener in ClosureEvents, line 288")
			end
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unregisterEvents(id5, __wurst_stackPos305) 
	local listener6 = nil
	local t2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos305
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (id5 > 0) then
		if not((EventListener_unitListenersFirsts[id5] == nil)) then
			Log_trace(stringConcat("unregister unit has listeners. startid: ", int_toString(id5, "when calling toString in ClosureEvents, line 293")), "when calling trace in ClosureEvents, line 293")
			listener6 = EventListener_unitListenersFirsts[id5]
			EventListener_unitListenersFirsts[id5] = nil
			while true do
				if not(not((listener6 == nil))) then
					break
				end
				t2 = listener6
				listener6 = listener6.EventListener_next
				EventListener_destroyEventListener(t2, "when calling destroyEventListener in ClosureEvents, line 299")
			end
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onUnitDeindex_ClosureEvents(__wurst_stackPos307) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos307
	wurst_stack_depth = (wurst_stack_depth + 1)
	unregisterEventsForUnit(getIndexingUnit("when calling getIndexingUnit in ClosureEvents, line 304"), "when calling unregisterEventsForUnit in ClosureEvents, line 304")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents(__wurst_stackPos309) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos309
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 307")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents1(__wurst_stackPos311) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos311
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 308")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_ClosureEvents(__wurst_stackPos312) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos312
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_onSpellEffect("when calling onSpellEffect in ClosureEvents, line 323")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add(eventId1, listener7, __wurst_stackPos314) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos314
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

function EventListener_addSpellInternal(u15, abilId1, listener8, __wurst_stackPos315) 
	local index3 = nil
	local entry1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos315
	wurst_stack_depth = (wurst_stack_depth + 1)
	listener8.OnCastListener_abilId = abilId1
	if not((u15 == nil)) then
		listener8.OnCastListener_eventUnit = u15
		index3 = unit_getIndex(u15, "when calling getIndex in ClosureEvents, line 170")
		if not((EventListener_castMapCasters[index3] == nil)) then
			EventListener_castMapCasters[index3].OnCastListener_prev = listener8
			listener8.OnCastListener_next = EventListener_castMapCasters[index3]
		end
		EventListener_castMapCasters[index3] = listener8
	else
		entry1 = HashMap_HashMap_get(EventListener_castMap, abilId1, "when calling get in ClosureEvents, line 176")
		if not((entry1 == nil)) then
			entry1.OnCastListener_prev = listener8
			listener8.OnCastListener_next = entry1
		end
		HashMap_HashMap_put(EventListener_castMap, abilId1, listener8, "when calling put in ClosureEvents, line 181")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return listener8
end

function EventListener_onCast(abilId, listener4, __wurst_stackPos285) 
	local stackTrace_tempReturn5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos285
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = EventListener_addSpellInternal(nil, abilId, listener4, "when calling addSpellInternal in ClosureEvents, line 155")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function EventListener_generalEventCallback(__wurst_stackPos310) 
	local trigUnit7 = nil
	local id6 = nil
	local index4 = nil
	local listener9 = nil
	local nextListener = nil
	local globalListener = nil
	local nextListener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos310
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit7 = GetTriggerUnit()
	id6 = eventid_toIntId(GetTriggerEventId(), "when calling toIntId in ClosureEvents, line 186")
	if not((trigUnit7 == nil)) then
		index4 = unit_getIndex(trigUnit7, "when calling getIndex in ClosureEvents, line 189")
		if (index4 > 0) then
			listener9 = EventListener_unitListenersFirsts[index4]
			if (not((listener9 == nil)) and fireEvents(trigUnit7, "when calling fireEvents in ClosureEvents, line 192")) then
				while true do
					if not(not((listener9 == nil))) then
						break
					end
					nextListener = listener9.EventListener_next
					if (listener9.EventListener_eventId == id6) then
						listener9:onEvent1("when calling onEvent in ClosureEvents, line 196")
					end
					listener9 = nextListener
				end
			end
		end
	end
	globalListener = EventListener_generalListenersFirsts[id6]
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

function EventListener_onSpellEffect(__wurst_stackPos313) 
	local trigUnit8 = nil
	local abilId2 = nil
	local caster5 = nil
	local index5 = nil
	local listener10 = nil
	local nextListener2 = nil
	local nextListener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos313
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit8 = GetTriggerUnit()
	abilId2 = GetSpellAbilityId()
	caster5 = GetSpellAbilityUnit()
	index5 = unit_getIndex(trigUnit8, "when calling getIndex in ClosureEvents, line 210")
	listener10 = EventListener_castMapCasters[index5]
	while true do
		if not(not((listener10 == nil))) then
			break
		end
		nextListener2 = listener10.OnCastListener_next
		if ((listener10.OnCastListener_abilId == -1) or (listener10.OnCastListener_abilId == abilId2)) then
			listener10:fire(caster5, "when calling fire in ClosureEvents, line 215")
		end
		listener10 = nextListener2
	end
	listener10 = HashMap_HashMap_get(EventListener_castMap, abilId2, "when calling get in ClosureEvents, line 218")
	while true do
		if not(not((listener10 == nil))) then
			break
		end
		nextListener3 = listener10.OnCastListener_next
		if ((listener10.OnCastListener_eventUnit == nil) or (listener10.OnCastListener_eventUnit == trigUnit8)) then
			listener10:fire(caster5, "when calling fire in ClosureEvents, line 222")
		end
		listener10 = nextListener3
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureForGroups(__wurst_stackPos231) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos231
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

function code__Filter_ClosureForGroups(__wurst_stackPos316) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos316
	wurst_stack_depth = (wurst_stack_depth + 1)
	filterCallback(GetFilterUnit(), "when calling filterCallback in ClosureForGroups, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function filterCallback(filter5, __wurst_stackPos317) 
	local idx = nil
	local mode = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos317
	wurst_stack_depth = (wurst_stack_depth + 1)
	idx = (ClosureForGroups_tempCallbacksCount - 1)
	mode = intEnsure(ClosureForGroups_callbackMode[idx])
	if (mode == ClosureForGroups_MODE_NORMAL) then
		currentCallback("when calling currentCallback in ClosureForGroups, line 30"):callback(filter5, "when calling callback in ClosureForGroups, line 30")
	elseif (mode == ClosureForGroups_MODE_COUNTED) then
		if (intEnsure(ClosureForGroups_countIters[idx]) < intEnsure(ClosureForGroups_countLimits[idx])) then
			currentCallback("when calling currentCallback in ClosureForGroups, line 33"):callback(filter5, "when calling callback in ClosureForGroups, line 33")
		end
		ClosureForGroups_countIters[idx] = (intEnsure(ClosureForGroups_countIters[idx]) + 1)
	elseif not(boolEnsure(ClosureForGroups_stopRequested[idx])) then
		if not(currentCallbackUntil("when calling currentCallbackUntil in ClosureForGroups, line 36"):ForGroupCallbackUntil_callback(filter5, "when calling callback in ClosureForGroups, line 36")) then
			ClosureForGroups_stopRequested[idx] = true
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function currentCallback(__wurst_stackPos318) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos318
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacks[(ClosureForGroups_tempCallbacksCount - 1)]
end

function currentCallbackUntil(__wurst_stackPos319) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos319
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacksUntil[(ClosureForGroups_tempCallbacksCount - 1)]
end

function group_forEachFrom(this180, cb5, __wurst_stackPos320) 
	local u16 = nil
	local from = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos320
	wurst_stack_depth = (wurst_stack_depth + 1)
	from = this180
	while true do
		if not(group_hasNext(from, "when calling hasNext in ClosureForGroups, line 80")) then
			break
		end
		u16 = group_next(from, "when calling next in ClosureForGroups, line 80")
		cb5:callback(u16, "when calling callback in ClosureForGroups, line 81")
	end
	ForGroupCallback_destroyForGroupCallback(cb5, "when calling destroyForGroupCallback in ClosureForGroups, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureTimers(__wurst_stackPos239) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos239
	wurst_stack_depth = (wurst_stack_depth + 1)
	ClosureTimers_x = 200
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_doAfter(this183, timeToWait1, cb6, __wurst_stackPos323) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos323
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_start(cb6, this183, timeToWait1, "when calling start in ClosureTimers, line 17")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb6
end

function doAfter(timeToWait, cb1, __wurst_stackPos27) 
	local stackTrace_tempReturn6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos27
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = timer_doAfter(getTimer("when calling getTimer in ClosureTimers, line 28"), timeToWait, cb1, "when calling doAfter in ClosureTimers, line 28")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function nullTimer(cb4, __wurst_stackPos296) 
	local stackTrace_tempReturn7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos296
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = doAfter(0., cb4, "when calling doAfter in ClosureTimers, line 51")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function timer_doPeriodically(this184, time5, cb7, __wurst_stackPos325) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos325
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_start(cb7, this184, time5, "when calling start in ClosureTimers, line 63")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb7
end

function doPeriodically(time4, cb3, __wurst_stackPos294) 
	local stackTrace_tempReturn8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos294
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn8 = timer_doPeriodically(getTimer("when calling getTimer in ClosureTimers, line 75"), time4, cb3, "when calling doPeriodically in ClosureTimers, line 75")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn8
end

function CallbackPeriodic_staticCallback(__wurst_stackPos326) 
	local cb8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos326
	wurst_stack_depth = (wurst_stack_depth + 1)
	cb8 = __wurst_objectFromIndex(timer_getData(GetExpiredTimer(), "when calling getData in ClosureTimers, line 162"))
	cb8:call(cb8, "when calling call in ClosureTimers, line 163")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__start_CallbackSingle_ClosureTimers(__wurst_stackPos328) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos328
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_staticCallback("when calling staticCallback in ClosureTimers, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_staticCallback(__wurst_stackPos329) 
	local t3 = nil
	local cb9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos329
	wurst_stack_depth = (wurst_stack_depth + 1)
	t3 = GetExpiredTimer()
	cb9 = __wurst_objectFromIndex(timer_getData(t3, "when calling getData in ClosureTimers, line 140"))
	cb9:call1("when calling call in ClosureTimers, line 141")
	CallbackSingle_destroyCallbackSingle(cb9, "when calling destroyCallbackSingle in ClosureTimers, line 142")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos223) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos223
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

function colorA_toColorString(this186, __wurst_stackPos330) 
	local stackTrace_tempReturn9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos330
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn9 = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this186[4], "when calling toHex in Colors, line 194")), toHex(this186[1], "when calling toHex in Colors, line 194")), toHex(this186[2], "when calling toHex in Colors, line 194")), toHex(this186[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn9
end

function toHex(number1, __wurst_stackPos332) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos332
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number1 // 16)
	secondpart = (number1 - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos331) 
	local i8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos331
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

function init_ControlPoint(__wurst_stackPos254) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos254
	wurst_stack_depth = (wurst_stack_depth + 1)
	ControlPoint_controlPoints = CreateGroup()
	ControlPoint_controlPointValue = 30
	setupAllControlPoints("when calling setupAllControlPoints in ControlPoint, line 54")
	incomeTimer("when calling incomeTimer in ControlPoint, line 55")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function incomeTimer(__wurst_stackPos335) 
	local countdown = nil
	local d = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos335
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

function income(__wurst_stackPos339) 
	local iterator7 = nil
	local u17 = nil
	local p15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos339
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterator7 = group_iterator(ControlPoint_controlPoints, "when calling iterator in ControlPoint, line 14")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator7, "when calling hasNext in ControlPoint, line 14")) then
			break
		end
		u17 = GroupIterator_GroupIterator_next(iterator7, "when calling next in ControlPoint, line 14")
		p15 = unit_getOwner(u17, "when calling getOwner in ControlPoint, line 15")
		player_addGold(p15, ControlPoint_controlPointValue, "when calling addGold in ControlPoint, line 16")
	end
	GroupIterator_GroupIterator_close(iterator7, "when calling close in ControlPoint, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupCaptureOnHalf(target5, __wurst_stackPos341) 
	local receiver27 = nil
	local receiver28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos341
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver27 = CreateTrigger()
	trigger_registerUnitEvent(receiver27, target5, EVENT_UNIT_DAMAGED, "when calling registerUnitEvent in ControlPoint, line 20")
	receiver28 = receiver27
	trigger_addAction(receiver28, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_ControlPoint(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ControlPoint, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_ControlPoint(__wurst_stackPos343) 
	local u18 = nil
	local attacker = nil
	local hp = nil
	local maxHp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos343
	wurst_stack_depth = (wurst_stack_depth + 1)
	u18 = GetTriggerUnit()
	attacker = GetEventDamageSource()
	hp = __wurst_safe_GetUnitState(u18, UNIT_STATE_LIFE)
	maxHp = __wurst_safe_GetUnitState(u18, UNIT_STATE_MAX_LIFE)
	if ((hp / maxHp) <= 0.5) then
		group_remove(ControlPoint_controlPoints, "when calling remove in ControlPoint, line 27", u18)
		__wurst_safe_SetUnitOwner(u18, unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 28"), true)
		__wurst_safe_SetUnitState(u18, UNIT_STATE_LIFE, maxHp)
		group_add1(ControlPoint_controlPoints, "when calling add in ControlPoint, line 30", u18)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAllControlPoints(__wurst_stackPos334) 
	local u19 = nil
	local iterator8 = nil
	local cp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos334
	wurst_stack_depth = (wurst_stack_depth + 1)
	u19 = CreateGroup()
	group_add1(u19, "when calling add in ControlPoint, line 34", udg_controlPoint_001, udg_controlPoint_002, udg_controlPoint_003, udg_controlPoint_004, udg_controlPoint_005, udg_controlPoint_006, udg_controlPoint_007, udg_controlPoint_008, udg_controlPoint_009, udg_controlPoint_010, udg_controlPoint_011, udg_controlPoint_012, udg_controlPoint_013, udg_controlPoint_014, udg_controlPoint_015)
	iterator8 = group_iterator(u19, "when calling iterator in ControlPoint, line 50")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator8, "when calling hasNext in ControlPoint, line 50")) then
			break
		end
		cp = GroupIterator_GroupIterator_next(iterator8, "when calling next in ControlPoint, line 50")
		setupCaptureOnHalf(cp, "when calling setupCaptureOnHalf in ControlPoint, line 51")
	end
	GroupIterator_GroupIterator_close(iterator8, "when calling close in ControlPoint, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DamageEvent(__wurst_stackPos255) 
	local clVar8 = nil
	local clVar9 = nil
	local temp86 = nil
	local temp87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos255
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
	temp86 = EVENT_PLAYER_UNIT_DAMAGING
	clVar8 = EventListener_add_DamageEvent:create13()
	EventListener_construct_EventListener(clVar8, "when calling construct_EventListener in DamageEvent, line 476")
	EventListener_add(temp86, clVar8, "when calling add in DamageEvent, line 476")
	temp87 = EVENT_PLAYER_UNIT_DAMAGED
	clVar9 = EventListener_add_DamageEvent1:create14()
	EventListener_construct_EventListener(clVar9, "when calling construct_EventListener in DamageEvent, line 477")
	EventListener_add(temp87, clVar9, "when calling add in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onUnreducedDamage(__wurst_stackPos67) 
	local amount2 = nil
	local attackType1 = nil
	local dmg = nil
	local i9 = nil
	local temp7 = nil
	local listener11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos67
	wurst_stack_depth = (wurst_stack_depth + 1)
	amount2 = GetEventDamage()
	attackType1 = BlzGetEventAttackType()
	if (DamageEvent_nextDamageType == 4) then
		if (DamageEvent_DETECT_NATIVE_ABILITIES and (attackType1 == ATTACK_TYPE_NORMAL)) then
			DamageEvent_nextDamageType = 1
		else
			DamageEvent_nextDamageType = 0
			DamageEvent_nextDamageElement = DamageEvent_DAMAGE_ELEMENT_ATTACK
		end
	end
	dmg = DamageInstance_new_DamageInstance(DamageEvent_nextDamageId, GetEventDamageSource(), GetTriggerUnit(), amount2, attackType1, BlzGetEventDamageType(), BlzGetEventWeaponType(), DamageEvent_nextDamageType, DamageEvent_nextDamageElement, "when calling new_DamageInstance in DamageEvent, line 196")
	DamageEvent_nextDamageId = 0
	DamageEvent_nextDamageType = 4
	DamageEvent_nextDamageElement = nil
	i9 = 0
	temp7 = DamageEvent_maxUnreducedPriority
	while true do
		if (i9 > temp7) then
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

function DamageEvent_onDamage(__wurst_stackPos69) 
	local dmg1 = nil
	local i10 = nil
	local temp8 = nil
	local listener12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos69
	wurst_stack_depth = (wurst_stack_depth + 1)
	dmg1 = DamageInstance_current
	if not(DamageEvent_abort) then
		DamageInstance_DamageInstance_setReducedAmount(dmg1, GetEventDamage(), "when calling setReducedAmount in DamageEvent, line 222")
		i10 = 0
		temp8 = DamageEvent_maxPriority
		while true do
			if (i10 > temp8) then
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

function DamageEvent_addListener(listener13, __wurst_stackPos345) 
	local stackTrace_tempReturn10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos345
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn10 = DamageEvent_addListener1(DamageEvent_maxPriority, listener13, "when calling addListener in DamageEvent, line 248")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn10
end

function DamageEvent_addListener1(priority, listener14, __wurst_stackPos346) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos346
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

function DamageEvent_getSource(__wurst_stackPos347) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos347
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_source
end

function DamageEvent_getTarget(__wurst_stackPos348) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos348
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_target
end

function init_Destructable(__wurst_stackPos211) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos211
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_destr(this13, __wurst_stackPos14) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos14
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyEffect(this13)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect1(path1, pos5, __wurst_stackPos149) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos149
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect2(path1, pos5, 1.0, real_fromDeg(GetRandomReal(0., 359.), "when calling fromDeg in Effect, line 14"), "when calling flashEffect in Effect, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect2(path2, pos6, scale1, yaw, __wurst_stackPos349) 
	local receiver29 = nil
	local receiver30 = nil
	local receiver31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos349
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver29 = addEffect(path2, pos6, "when calling addEffect in Effect, line 23")
	effect_setScale(receiver29, scale1, "when calling setScale in Effect, line 23")
	receiver30 = receiver29
	effect_setYaw(receiver30, yaw, "when calling setYaw in Effect, line 23")
	receiver31 = receiver30
	effect_destr(receiver31, "when calling destr in Effect, line 23")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect(path3, pos7, __wurst_stackPos350) 
	local stackTrace_tempReturn11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos350
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn11 = AddSpecialEffect(path3, pos7[1], pos7[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn11
end

function effect_setScale(this173, scale, __wurst_stackPos292) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos292
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectScale(this173, scale)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_setYaw(this194, yaw1, __wurst_stackPos351) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos351
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectYaw(this194, angle_radians(yaw1, "when calling radians in Effect, line 171"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect(path, target, attachPointName, __wurst_stackPos9) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos9
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(addEffect1(path, target, attachPointName, "when calling addEffect in Effect, line 29"), "when calling destr in Effect, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect1(path4, target6, attachPointName1, __wurst_stackPos352) 
	local stackTrace_tempReturn12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos352
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn12 = __wurst_safe_AddSpecialEffectTarget(path4, target6, attachPointName1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn12
end

function effect_setColor(this174, r, g, b, __wurst_stackPos293) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos293
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectColor(this174, r, g, b)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos217) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos217
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_MUTE_ERROR_DURATION = 60
	ErrorHandling_PRIMARY_ERROR_KEY = -1
	ErrorHandling_HT = hashtable_compiletime
	ErrorHandling_suppressErrorMessages = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function error1(msg, __wurst_stackPos31) 
	local hash = nil
	local stacktraceStr = nil
	local stacktraceIndex = nil
	local stacktraceLimit = nil
	local stacktraceStr1 = nil
	local stacktraceIndex1 = nil
	local stacktraceLimit1 = nil
	local temp88 = nil
	local temp89 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos31
	wurst_stack_depth = (wurst_stack_depth + 1)
	if MagicFunctions_compiletime then
		compileError(stringConcat("ERROR: ", msg), "when calling compileError in ErrorHandling, line 45")
	elseif true then
	else
		if not(ErrorHandling_suppressErrorMessages) then
			hash = string_getHash(msg, "when calling getHash in ErrorHandling, line 53")
			if hashtable_hasInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling hasInt in ErrorHandling, line 54") then
				if ((hashtable_loadInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling loadInt in ErrorHandling, line 56") + ErrorHandling_MUTE_ERROR_DURATION) < GameTimer_currentTime) then
					temp88 = msg
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
					Log_error(stringConcat(temp88, stacktraceStr), "when calling error in ErrorHandling, line 58")
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
				temp89 = stringConcat("Message: ", msg)
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
				Log_error(stringConcat(temp89, stacktraceStr1), "when calling error in ErrorHandling, line 70")
			end
		end
		error("__wurst_abort_thread", 0)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos230) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos230
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function eventid_isPlayerunitEvent(this177, __wurst_stackPos301) 
	local eventId2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos301
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId2 = handle_getHandleId(this177, "when calling getHandleId in EventHelper, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((((eventId2 >= 18) and (eventId2 <= 51)) or ((eventId2 >= 269) and (eventId2 <= 277))) or (eventId2 == 315)) or (eventId2 == 308))
end

function eventid_isKeyboardEvent(this178, __wurst_stackPos302) 
	local eventId3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos302
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId3 = handle_getHandleId(this178, "when calling getHandleId in EventHelper, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((eventId3 >= 261) and (eventId3 <= 268)) or (eventId3 == 17))
end

function eventid_isMouseEvent(this179, __wurst_stackPos303) 
	local eventId4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos303
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId4 = handle_getHandleId(this179, "when calling getHandleId in EventHelper, line 61")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((eventId4 >= 305) and (eventId4 <= 307))
end

function EventData_getDyingUnit(__wurst_stackPos141) 
	local stackTrace_tempReturn13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos141
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn13 = GetDyingUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn13
end

function EventData_getSpellTargetUnit(__wurst_stackPos21) 
	local stackTrace_tempReturn14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos21
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn14 = GetSpellTargetUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn14
end

function init_Force(__wurst_stackPos221) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos221
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos224) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos224
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos216) 
	local receiver32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos216
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver32 = CreateTimer()
	timer_start(receiver32, 100000., nil, "when calling start in GameTimer, line 7")
	timer_startPeriodic(CreateTimer(), Basics_ANIMATION_PERIOD, function (...) 
			xpcall(function (...) 
					bridge_code__startPeriodic_GameTimer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in GameTimer, line 15")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__startPeriodic_GameTimer(__wurst_stackPos359) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos359
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos225) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos225
	wurst_stack_depth = (wurst_stack_depth + 1)
	Group_ENUM_GROUP = CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRange(this1, pos, range, filter, __wurst_stackPos1) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos1
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsInRange(this1, pos[1], pos[2], range, filter)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRect1(this121, rec1, __wurst_stackPos134) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos134
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRect(this121, rec1, nil, "when calling enumUnitsInRect in Group, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRect(this15, rec, filter1, __wurst_stackPos16) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos16
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsInRect(this15, rec, filter1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsOfType(this199, id7, filter8, __wurst_stackPos360) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos360
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsOfType(this199, UnitId2String(id7), filter8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this77, __wurst_stackPos88, ...) 
	local i11 = nil
	local g2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos88
	wurst_stack_depth = (wurst_stack_depth + 1)
	i11 = 0
	local __args1 = table.pack(...)
	for i12=1,__args1.n do
	g2 = __args1[i12]
	i11 = (i11 + __wurst_safe_BlzGroupAddGroupFast(g2, this77))
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i11
end

function group_clear(this79, __wurst_stackPos90) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos90
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupClear(this79)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add1(this161, __wurst_stackPos272, ...) 
	local i13 = nil
	local u20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos272
	wurst_stack_depth = (wurst_stack_depth + 1)
	i13 = 0
	local __args2 = table.pack(...)
	for i14=1,__args2.n do
	u20 = __args2[i14]
	if __wurst_safe_GroupAddUnit(this161, u20) then
		i13 = (i13 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i13
end

function group_remove(this193, __wurst_stackPos344, ...) 
	local i15 = nil
	local u21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos344
	wurst_stack_depth = (wurst_stack_depth + 1)
	i15 = 0
	local __args3 = table.pack(...)
	for i16=1,__args3.n do
	u21 = __args3[i16]
	if __wurst_safe_GroupRemoveUnit(this193, u21) then
		i15 = (i15 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i15
end

function group_destr(this80, __wurst_stackPos91) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos91
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyGroup(this80)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_size(this78, __wurst_stackPos89) 
	local stackTrace_tempReturn15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos89
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn15 = __wurst_safe_BlzGroupGetSize(this78)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn15
end

function group_isEmpty(this200, __wurst_stackPos361) 
	local stackTrace_tempReturn16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos361
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn16 = not(group_hasNext(this200, "when calling hasNext in Group, line 70"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn16
end

function group_hasNext(this181, __wurst_stackPos321) 
	local stackTrace_tempReturn17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos321
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn17 = not((__wurst_safe_FirstOfGroup(this181) == nil))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn17
end

function group_get(this71, index1, __wurst_stackPos82) 
	local stackTrace_tempReturn18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos82
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn18 = __wurst_safe_BlzGroupUnitAt(this71, index1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn18
end

function group_targetOrder(this162, order, targetWidget, __wurst_stackPos276) 
	local stackTrace_tempReturn19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos276
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn19 = __wurst_safe_GroupTargetOrder(this162, order, targetWidget)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn19
end

function group_iterator(this2, __wurst_stackPos2) 
	local stackTrace_tempReturn20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos2
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn20 = GroupIterator_new_GroupIterator(this2, "when calling new_GroupIterator in Group, line 141")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn20
end

function group_next(this182, __wurst_stackPos322) 
	local iterUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos322
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterUnit = __wurst_safe_FirstOfGroup(this182)
	__wurst_safe_GroupRemoveUnit(this182, iterUnit)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return iterUnit
end

function init_HashList(__wurst_stackPos229) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos229
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashList_ht = hashtable_compiletime2
	HashList_occurences = hashtable_compiletime3
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_hasBoolean(this197, parentKey15, childKey8, __wurst_stackPos357) 
	local stackTrace_tempReturn21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos357
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn21 = __wurst_HaveSavedBoolean(this197, parentKey15, childKey8)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn21
end

function hashtable_hasInt(this138, parentKey4, childKey, __wurst_stackPos157) 
	local stackTrace_tempReturn22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos157
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn22 = __wurst_HaveSavedInteger(this138, parentKey4, childKey)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn22
end

function hashtable_loadBoolean(this198, parentKey16, childKey9, __wurst_stackPos358) 
	local stackTrace_tempReturn23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos358
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn23 = __wurst_LoadBoolean(this198, parentKey16, childKey9)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn23
end

function hashtable_loadInt(this139, parentKey6, childKey2, __wurst_stackPos158) 
	local stackTrace_tempReturn24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos158
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn24 = __wurst_LoadInteger(this139, parentKey6, childKey2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn24
end

function hashtable_loadTriggerHandle(this144, parentKey11, childKey5, __wurst_stackPos163) 
	local stackTrace_tempReturn25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos163
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn25 = __wurst_LoadTriggerHandle(this144, parentKey11, childKey5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn25
end

function hashtable_saveBoolean(this196, parentKey14, childKey7, value9, __wurst_stackPos356) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos356
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveBoolean(this196, parentKey14, childKey7, value9)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveFogStateHandle(this146, parentKey13, childKey6, value6, __wurst_stackPos165) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos165
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveFogStateHandle(this146, parentKey13, childKey6, value6)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveInt(this140, parentKey7, childKey3, value2, __wurst_stackPos159) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos159
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveInteger(this140, parentKey7, childKey3, value2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveString(this142, parentKey9, childKey4, value4, __wurst_stackPos161) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos161
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveStr(this142, parentKey9, childKey4, value4)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Icons(__wurst_stackPos237) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos237
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_InstantDummyCaster(__wurst_stackPos256) 
	local receiver33 = nil
	local receiver34 = nil
	local receiver35 = nil
	local receiver36 = nil
	local receiver37 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos256
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_DUMMY_CASTER_UNIT_ID = intEnsure(2016423986)
	InstantDummyCaster_DUMMY_ROOT_ABIL_ID = intEnsure(1095577657)
	receiver33 = createUnit(Basics_DUMMY_PLAYER, InstantDummyCaster_DUMMY_CASTER_UNIT_ID, MapBounds_boundMax, ({0., }), "when calling createUnit in InstantDummyCaster, line 97")
	unit_setPathing(receiver33, false, "when calling setPathing in InstantDummyCaster, line 98")
	receiver34 = receiver33
	unit_addAbility(receiver34, Basics_HEIGHT_ENABLER, "when calling addAbility in InstantDummyCaster, line 98")
	receiver35 = receiver34
	unit_removeAbility(receiver35, Basics_HEIGHT_ENABLER, "when calling removeAbility in InstantDummyCaster, line 98")
	receiver36 = receiver35
	unit_addAbility(receiver36, InstantDummyCaster_DUMMY_ROOT_ABIL_ID, "when calling addAbility in InstantDummyCaster, line 98")
	receiver37 = receiver36
	unit_removeAbility(receiver37, InstantDummyCaster_DUMMY_ROOT_ABIL_ID, "when calling removeAbility in InstantDummyCaster, line 98")
	InstantDummyCaster_caster = receiver37
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_prepare(owner2, id8, lvl1, pos8, __wurst_stackPos362) 
	local receiver38 = nil
	local receiver39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos362
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver38 = InstantDummyCaster_caster
	unit_addAbility(receiver38, id8, "when calling addAbility in InstantDummyCaster, line 27")
	receiver39 = receiver38
	unit_setMana(receiver39, 1000000., "when calling setMana in InstantDummyCaster, line 27")
	if vec3_inBounds(pos8, "when calling inBounds in InstantDummyCaster, line 28") then
		unit_setXYZ(InstantDummyCaster_caster, pos8, "when calling setXYZ in InstantDummyCaster, line 29")
	end
	if (lvl1 > 1) then
		unit_setAbilityLevel(InstantDummyCaster_caster, id8, lvl1, "when calling setAbilityLevel in InstantDummyCaster, line 31")
	end
	if not((owner2 == nil)) then
		unit_setOwner(InstantDummyCaster_caster, owner2, false, "when calling setOwner in InstantDummyCaster, line 33")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_finish(id9, __wurst_stackPos368) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos368
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setOwner(InstantDummyCaster_caster, Basics_DUMMY_PLAYER, false, "when calling setOwner in InstantDummyCaster, line 36")
	unit_removeAbility(InstantDummyCaster_caster, id9, "when calling removeAbility in InstantDummyCaster, line 37")
	unit_setPos(InstantDummyCaster_caster, MapBounds_boundMax, "when calling setPos in InstantDummyCaster, line 38")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_castTarget1(owner3, abilityId1, lvl3, orderId1, target7, casterPos, __wurst_stackPos370) 
	local success = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos370
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_prepare(owner3, abilityId1, lvl3, casterPos, "when calling prepare in InstantDummyCaster, line 47")
	unit_setFacing(InstantDummyCaster_caster, vec2_angleTo(unit_getPos(InstantDummyCaster_caster, "when calling getPos in InstantDummyCaster, line 48"), widget_getPos(target7, "when calling getPos in InstantDummyCaster, line 48"), "when calling angleTo in InstantDummyCaster, line 48"), "when calling setFacing in InstantDummyCaster, line 48")
	success = unit_issueTargetOrderById(InstantDummyCaster_caster, orderId1, target7, "when calling issueTargetOrderById in InstantDummyCaster, line 49")
	InstantDummyCaster_finish(abilityId1, "when calling finish in InstantDummyCaster, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return success
end

function InstantDummyCaster_castTarget(owner1, abilityId, lvl, orderId, target3, __wurst_stackPos143) 
	local stackTrace_tempReturn26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos143
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn26 = InstantDummyCaster_castTarget1(owner1, abilityId, lvl, orderId, target3, vec2_toVec3(({__wurst_safe_GetWidgetX(target3), __wurst_safe_GetWidgetY(target3), }), "when calling toVec3 in InstantDummyCaster, line 62"), "when calling castTarget in InstantDummyCaster, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn26
end

function init_Integer(__wurst_stackPos205) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos205
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function int_toString(this91, __wurst_stackPos103) 
	local stackTrace_tempReturn27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos103
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn27 = tostring(this91)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn27
end

function int_bitOr(this165, other, __wurst_stackPos283) 
	local stackTrace_tempReturn28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos283
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn28 = BlzBitOr(this165, other)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn28
end

function int_bitXor(this166, other1, __wurst_stackPos284) 
	local stackTrace_tempReturn29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos284
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn29 = BlzBitXor(this166, other1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn29
end

function init_Invigorate(__wurst_stackPos250) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos250
	wurst_stack_depth = (wurst_stack_depth + 1)
	Invigorate_seedlingCount = 0
	Invigorate_INVIGORATE_ID = intEnsure(1095577651)
	Invigorate_MAX_SEEDLING_STACKS = 5
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getSeedlingCount(__wurst_stackPos24) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos24
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Invigorate_seedlingCount
end

function addSeedlingStack(__wurst_stackPos22) 
	local clVar10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos22
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount >= Invigorate_MAX_SEEDLING_STACKS) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	Invigorate_seedlingCount = (Invigorate_seedlingCount + 1)
	print1(stringConcat("Seedling stacks: ", int_toString(Invigorate_seedlingCount, "when calling toString in Invigorate, line 22")), "when calling print in Invigorate, line 22")
	clVar10 = CallbackSingle_doAfter_Invigorate:create20()
	CallbackSingle_construct_CallbackSingle(clVar10, "when calling construct_CallbackSingle in Invigorate, line 25")
	doAfter(12., clVar10, "when calling doAfter in Invigorate, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos226) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos226
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_LinkedList(__wurst_stackPos232) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos232
	wurst_stack_depth = (wurst_stack_depth + 1)
	realToIndex(0., "when calling realToIndex in LinkedList, line 617")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos214) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos214
	wurst_stack_depth = (wurst_stack_depth + 1)
	MagicFunctions_compiletime = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function compileError(msg4, __wurst_stackPos353) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos353
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MapBounds(__wurst_stackPos241) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos241
	wurst_stack_depth = (wurst_stack_depth + 1)
	initMapBounds("when calling initMapBounds in MapBounds, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function inBoundsXY(x5, y4, __wurst_stackPos378) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos378
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((((x5 > MapBounds_boundMin[1]) and (x5 < MapBounds_boundMax[1])) and (y4 > MapBounds_boundMin[2])) and (y4 < MapBounds_boundMax[2]))
end

function vec3_inBounds(this202, __wurst_stackPos364) 
	local stackTrace_tempReturn30 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos364
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn30 = inBoundsXY(this202[1], this202[2], "when calling inBoundsXY in MapBounds, line 40")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn30
end

function initMapBounds(__wurst_stackPos377) 
	local cond_result = nil
	local receiver40 = nil
	local cond_result1 = nil
	local receiver41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos377
	wurst_stack_depth = (wurst_stack_depth + 1)
	if MagicFunctions_compiletime then
		cond_result = Rect(-1024., -1024., 1024., 1024.)
	else
		cond_result = GetPlayableMapRect()
	end
	MapBounds_playableMapRect = cond_result
	receiver40 = CreateRegion()
	region_addRect(receiver40, MapBounds_playableMapRect, "when calling addRect in MapBounds, line 49")
	if MagicFunctions_compiletime then
		cond_result1 = Rect(-1536., -1536., 1536., 1536.)
	else
		cond_result1 = GetWorldBounds()
	end
	MapBounds_boundRect = cond_result1
	receiver41 = CreateRegion()
	region_addRect(receiver41, MapBounds_boundRect, "when calling addRect in MapBounds, line 51")
	MapBounds_boundRegion = receiver41
	MapBounds_playableMin = ({rect_getMinX(MapBounds_playableMapRect, "when calling getMinX in MapBounds, line 52"), rect_getMinY(MapBounds_playableMapRect, "when calling getMinY in MapBounds, line 52"), })
	MapBounds_playableMax = ({rect_getMaxX(MapBounds_playableMapRect, "when calling getMaxX in MapBounds, line 53"), rect_getMaxY(MapBounds_playableMapRect, "when calling getMaxY in MapBounds, line 53"), })
	MapBounds_boundMin = ({rect_getMinX(MapBounds_boundRect, "when calling getMinX in MapBounds, line 54"), rect_getMinY(MapBounds_boundRect, "when calling getMinY in MapBounds, line 54"), })
	MapBounds_boundMax = ({rect_getMaxX(MapBounds_boundRect, "when calling getMaxX in MapBounds, line 55"), rect_getMaxY(MapBounds_boundRect, "when calling getMaxY in MapBounds, line 55"), })
	vec2_op_mult(vec2_op_plus(MapBounds_playableMin, MapBounds_playableMax, "when calling op_plus in MapBounds, line 56"), .5, "when calling op_mult in MapBounds, line 56")
	vec2_op_mult(vec2_op_plus(MapBounds_boundMin, MapBounds_boundMax, "when calling op_plus in MapBounds, line 57"), .5, "when calling op_mult in MapBounds, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Maths(__wurst_stackPos208) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos208
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Matrices(__wurst_stackPos218) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos218
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIdGenerator(__wurst_stackPos243) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos243
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_new_IdGenerator(2016423984, "when calling new_IdGenerator in ObjectIdGenerator, line 6")
	IdGenerator_new_IdGenerator(1213018160, "when calling new_IdGenerator in ObjectIdGenerator, line 7")
	IdGenerator_new_IdGenerator(1095577648, "when calling new_IdGenerator in ObjectIdGenerator, line 8")
	IdGenerator_new_IdGenerator(1112354864, "when calling new_IdGenerator in ObjectIdGenerator, line 9")
	IdGenerator_new_IdGenerator(1229795376, "when calling new_IdGenerator in ObjectIdGenerator, line 10")
	IdGenerator_new_IdGenerator(1380790320, "when calling new_IdGenerator in ObjectIdGenerator, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIds(__wurst_stackPos233) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos233
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_OnUnitEnterLeave(__wurst_stackPos246) 
	local i17 = nil
	local temp9 = nil
	local clVar11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos246
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_eventTrigger = CreateTrigger()
	OnUnitEnterLeave_preplacedUnits = CreateGroup()
	OnUnitEnterLeave_tempUnitsCount = 0
	OnUnitEnterLeave_ABILITY_ID = intEnsure(1095577649)
	i17 = 0
	temp9 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i17 > temp9) then
			break
		end
		player_setAbilityAvailable(Player_players[i17], OnUnitEnterLeave_ABILITY_ID, false, "when calling setAbilityAvailable in OnUnitEnterLeave, line 64")
		i17 = (i17 + 1)
	end
	clVar11 = CallbackSingle_nullTimer_OnUnitEnterLeave:create26()
	CallbackSingle_construct_CallbackSingle(clVar11, "when calling construct_CallbackSingle in OnUnitEnterLeave, line 66")
	nullTimer(clVar11, "when calling nullTimer in OnUnitEnterLeave, line 66")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushUnit1(u22, __wurst_stackPos387) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos387
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnits[OnUnitEnterLeave_tempUnitsCount] = u22
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit1(__wurst_stackPos388) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos388
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getEnterLeaveUnit(__wurst_stackPos389) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos389
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (OnUnitEnterLeave_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return OnUnitEnterLeave_tempUnits[(OnUnitEnterLeave_tempUnitsCount - 1)]
end

function onEnter(c1, __wurst_stackPos390) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos390
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(OnUnitEnterLeave_eventTrigger, __wurst_safe_Filter(c1), "when calling addCondition in OnUnitEnterLeave, line 46")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onLeave(c2, __wurst_stackPos391) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos391
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addAction(OnUnitEnterLeave_eventTrigger, c2, "when calling addAction in OnUnitEnterLeave, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function prepareUnit(u5, __wurst_stackPos135) 
	local receiver42 = nil
	local receiver43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos135
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver42 = u5
	unit_addAbility(receiver42, OnUnitEnterLeave_ABILITY_ID, "when calling addAbility in OnUnitEnterLeave, line 56")
	receiver43 = receiver42
	unit_makeAbilityPermanent(receiver43, OnUnitEnterLeave_ABILITY_ID, true, "when calling makeAbilityPermanent in OnUnitEnterLeave, line 56")
	pushUnit1(u5, "when calling pushUnit in OnUnitEnterLeave, line 57")
	trigger_evaluate(OnUnitEnterLeave_eventTrigger, "when calling evaluate in OnUnitEnterLeave, line 58")
	popUnit1("when calling popUnit in OnUnitEnterLeave, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave(__wurst_stackPos393) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos393
	wurst_stack_depth = (wurst_stack_depth + 1)
	prepareUnit(GetFilterUnit(), "when calling prepareUnit in OnUnitEnterLeave, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave(__wurst_stackPos394) 
	local leavingUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos394
	wurst_stack_depth = (wurst_stack_depth + 1)
	leavingUnit = GetTriggerUnit()
	if ((unit_getAbilityLevel(leavingUnit, OnUnitEnterLeave_ABILITY_ID, "when calling getAbilityLevel in OnUnitEnterLeave, line 73") == 0) and (GetIssuedOrderId() == OrderIds_undefend)) then
		pushUnit1(leavingUnit, "when calling pushUnit in OnUnitEnterLeave, line 74")
		trigger_execute(OnUnitEnterLeave_eventTrigger, "when calling execute in OnUnitEnterLeave, line 75")
		popUnit1("when calling popUnit in OnUnitEnterLeave, line 76")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Orders(__wurst_stackPos245) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos245
	wurst_stack_depth = (wurst_stack_depth + 1)
	OrderIds_rejuvination = 852160
	OrderIds_undefend = 852056
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos212) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos212
	wurst_stack_depth = (wurst_stack_depth + 1)
	Player_localPlayer = GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos397) 
	local i18 = nil
	local temp10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos397
	wurst_stack_depth = (wurst_stack_depth + 1)
	i18 = 0
	temp10 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i18 > temp10) then
			break
		end
		Player_players[i18] = Player(i18)
		i18 = (i18 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setGold(this223, val3, __wurst_stackPos398) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos398
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this223, PLAYER_STATE_RESOURCE_GOLD, val3, "when calling setState in Player, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setState(this224, state, val4, __wurst_stackPos399) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos399
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this224, state, val4)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addGold(this191, val1, __wurst_stackPos340) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos340
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_addState(this191, PLAYER_STATE_RESOURCE_GOLD, val1, "when calling addState in Player, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addState(this225, state1, val5, __wurst_stackPos400) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos400
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this225, state1, (player_getState(this225, state1, "when calling getState in Player, line 31") + val5))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setLumber(this227, val6, __wurst_stackPos402) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos402
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this227, PLAYER_STATE_RESOURCE_LUMBER, val6, "when calling setState in Player, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_getState(this226, state2, __wurst_stackPos401) 
	local stackTrace_tempReturn31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos401
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn31 = __wurst_safe_GetPlayerState(this226, state2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn31
end

function player_isAllyOf(this6, p, __wurst_stackPos6) 
	local stackTrace_tempReturn32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos6
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn32 = __wurst_safe_IsPlayerAlly(this6, p)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn32
end

function player_isEnemyOf(this131, p5, __wurst_stackPos150) 
	local stackTrace_tempReturn33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos150
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn33 = __wurst_safe_IsPlayerEnemy(this131, p5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn33
end

function player_setAbilityAvailable(this219, abilityId2, avail, __wurst_stackPos386) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos386
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerAbilityAvailable(this219, abilityId2, avail)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Playercolor(__wurst_stackPos222) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos222
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Preloader(__wurst_stackPos242) 
	local clVar12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos242
	wurst_stack_depth = (wurst_stack_depth + 1)
	Preloader_autoFinish = true
	Preloader_dumg = CreateGroup()
	Preloader_dum = createUnit(Basics_DUMMY_PLAYER, UnitIds_shade, MapBounds_playableMin, ({0., }), "when calling createUnit in Preloader, line 53")
	unit_setInvulnerable(Preloader_dum, true, "when calling setInvulnerable in Preloader, line 54")
	if (Preloader_dum == nil) then
		error1("DUMMY_UNITID not added correctly to the map.", "when calling error in Preloader, line 56")
	end
	if Preloader_autoFinish then
		clVar12 = CallbackSingle_nullTimer_Preloader:create28()
		CallbackSingle_construct_CallbackSingle(clVar12, "when calling construct_CallbackSingle in Preloader, line 58")
		nullTimer(clVar12, "when calling nullTimer in Preloader, line 58")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function finishPreload(__wurst_stackPos139) 
	local clVar13 = nil
	local temp91 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos139
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(Preloader_dum, "when calling remove in Preloader, line 47")
	temp91 = Preloader_dumg
	clVar13 = ForGroupCallback_forEachFrom_Preloader:create27()
	group_forEachFrom(temp91, clVar13, "when calling forEachFrom in Preloader, line 48")
	group_destr(Preloader_dumg, "when calling destr in Preloader, line 49")
	Preloader_dumg = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos213) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos213
	wurst_stack_depth = (wurst_stack_depth + 1)
	Printing_DEBUG_LEVEL = 2
	Printing_DEBUG_MSG_DURATION = 45.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Loglevel_getTag(this228, __wurst_stackPos403) 
	local temp11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos403
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp11 = this228
	if (temp11 == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffADADADtrace|r"
	elseif (temp11 == 1) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cff2685DCdebug|r"
	elseif (temp11 == 2) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFFCC00info|r"
	elseif (temp11 == 3) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffF47E3Ewarning|r"
	else
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFB2700error|r"
	end
end

function printLog(showTo, loglvl, msg6, __wurst_stackPos404) 
	local compositeMsg = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos404
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Printing_DEBUG_LEVEL <= loglvl) then
		compositeMsg = stringConcat(stringConcat(Loglevel_getTag(loglvl, "when calling getTag in Printing, line 81"), " - "), msg6)
		__wurst_safe_DisplayTimedTextToPlayer(showTo, 0., 0., Printing_DEBUG_MSG_DURATION, compositeMsg)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print1(msg1, __wurst_stackPos102) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos102
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print2(msg2, __wurst_stackPos277) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos277
	wurst_stack_depth = (wurst_stack_depth + 1)
	print1(tostring(msg2), "when calling print in Printing, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_trace(msg3, __wurst_stackPos306) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos306
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 0, msg3, "when calling printLog in Printing, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_error(msg5, __wurst_stackPos354) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos354
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 4, msg5, "when calling printLog in Printing, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos219) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos219
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos204) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos204
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function real_squared(this229, __wurst_stackPos405) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos405
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this229 * this229)
end

function real_toInt(this195, __wurst_stackPos355) 
	local stackTrace_tempReturn34 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos355
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn34 = R2I(this195)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn34
end

function rect_getMinX(this213, __wurst_stackPos380) 
	local stackTrace_tempReturn35 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos380
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn35 = __wurst_safe_GetRectMinX(this213)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn35
end

function rect_getMaxX(this215, __wurst_stackPos382) 
	local stackTrace_tempReturn36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos382
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn36 = __wurst_safe_GetRectMaxX(this215)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn36
end

function rect_getMinY(this214, __wurst_stackPos381) 
	local stackTrace_tempReturn37 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos381
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn37 = __wurst_safe_GetRectMinY(this214)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn37
end

function rect_getMaxY(this216, __wurst_stackPos383) 
	local stackTrace_tempReturn38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos383
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn38 = __wurst_safe_GetRectMaxY(this216)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn38
end

function rect_getCenter(this160, __wurst_stackPos266) 
	local stackTrace_tempReturn39 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos266
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn39 = ({rect_getCenterX(this160, "when calling getCenterX in Rect, line 16"), rect_getCenterY(this160, "when calling getCenterY in Rect, line 16"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn39
end

function rect_getCenterX(this230, __wurst_stackPos406) 
	local stackTrace_tempReturn40 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos406
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn40 = __wurst_safe_GetRectCenterX(this230)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn40
end

function rect_getCenterY(this231, __wurst_stackPos407) 
	local stackTrace_tempReturn41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos407
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn41 = __wurst_safe_GetRectCenterY(this231)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn41
end

function init_Recycle(__wurst_stackPos257) 
	local iterator9 = nil
	local u23 = nil
	local clVar14 = nil
	local temp92 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos257
	wurst_stack_depth = (wurst_stack_depth + 1)
	Recycle_RECYCLE_ID = intEnsure(1095577697)
	group_enumUnitsOfType(Group_ENUM_GROUP, 1697656882, nil, "when calling enumUnitsOfType in Recycle, line 36")
	iterator9 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Recycle, line 37")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator9, "when calling hasNext in Recycle, line 37")) then
			break
		end
		u23 = GroupIterator_GroupIterator_next(iterator9, "when calling next in Recycle, line 37")
		__wurst_safe_UnitAddAbility(u23, Recycle_RECYCLE_ID)
	end
	GroupIterator_GroupIterator_close(iterator9, "when calling close in Recycle, line 37")
	temp92 = EVENT_PLAYER_UNIT_DEATH
	clVar14 = EventListener_add_Recycle:create29()
	EventListener_construct_EventListener(clVar14, "when calling construct_EventListener in Recycle, line 41")
	EventListener_add(temp92, clVar14, "when calling add in Recycle, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function region_addRect(this212, rct, __wurst_stackPos379) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos379
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RegionAddRect(this212, rct)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_RegisterEvents(__wurst_stackPos244) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos244
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

function registerPlayerUnitEvent1(p3, c, __wurst_stackPos133) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos133
	wurst_stack_depth = (wurst_stack_depth + 1)
	registerPlayerUnitEvent(p3, nil, c, nil, "when calling registerPlayerUnitEvent in RegisterEvents, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function registerPlayerUnitEvent(p2, filter2, condition, action, __wurst_stackPos34) 
	local hid = nil
	local k = nil
	local cond_result2 = nil
	local temp93 = nil
	local temp94 = nil
	local temp95 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos34
	wurst_stack_depth = (wurst_stack_depth + 1)
	hid = handle_getHandleId(p2, "when calling getHandleId in RegisterEvents, line 17")
	if (RegisterEvents_t[hid] == nil) then
		RegisterEvents_t[hid] = CreateTrigger()
		k = (bj_MAX_PLAYER_SLOTS - 1)
		while true do
			if (k < 0) then
				break
			end
			temp93 = RegisterEvents_t[hid]
			temp94 = Player_players[k]
			temp95 = p2
			if not((filter2 == nil)) then
				cond_result2 = __wurst_safe_Filter(filter2)
			else
				cond_result2 = nil
			end
			trigger_registerPlayerUnitEvent(temp93, temp94, temp95, cond_result2, "when calling registerPlayerUnitEvent in RegisterEvents, line 21")
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

function code__registerPlayerUnitEvent_RegisterEvents(__wurst_stackPos408) 
	local stackTrace_tempReturn42 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos408
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn42 = trigger_evaluate(__wurst_objectFromIndex(intEnsure(HashMap_HashMap_get(RegisterEvents_onCastMap, GetSpellAbilityId(), "when calling get in RegisterEvents, line 58"))), "when calling evaluate in RegisterEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn42
end

function init_SeedBurst(__wurst_stackPos252) 
	local clVar15 = nil
	local temp96 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos252
	wurst_stack_depth = (wurst_stack_depth + 1)
	SeedBurst_SEED_BURST_ID = intEnsure(1095577653)
	SeedBurst_BURST_DAMAGE = 75.
	SeedBurst_BURST_RADIUS = 256.
	SeedBurst_BURST_DELAY = 0.15
	SeedBurst_BURST_SFX = "Abilities\\Spells\\Other\\Entangle\\EntangledTarget.mdl"
	SeedBurst_EXPLOSION_SFX = "Abilities\\Weapons\\GryphonRider\\GryphonRiderMissileArt.mdl"
	SeedBurst_INVIGORATE_BUFF_ID = 1114793322
	temp96 = SeedBurst_SEED_BURST_ID
	clVar15 = OnCastListener_onCast_SeedBurst:create30()
	OnCastListener_construct_OnCastListener(clVar15, "when calling construct_OnCastListener in SeedBurst, line 52")
	EventListener_onCast(temp96, clVar15, "when calling onCast in SeedBurst, line 52")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ShieldBash(__wurst_stackPos258) 
	local clVar16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos258
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1112354865)
	ShieldBash_MY_ABILITY_ID = intEnsure(1095577654)
	intEnsure(1095577655)
	intEnsure(2016423985)
	ShieldBash_ARMOR_BONUS = 4
	ShieldBash_REFLECT_CHANCE = 0.25
	ShieldBash_REFLECT_DAMAGE = 40.
	ShieldBash_REFLECT_SFX = "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl"
	stringConcat(stringConcat(stringConcat(stringConcat("Increases armor by ", int_toString(ShieldBash_ARMOR_BONUS, "when calling toString in ShieldBash, line 23")), " and has a "), int_toString(real_toInt((ShieldBash_REFLECT_CHANCE * 100.), "when calling toInt in ShieldBash, line 23"), "when calling toString in ShieldBash, line 23")), "% chance to retaliate.")
	clVar16 = DamageListener_addListener_ShieldBash:create33()
	DamageListener_construct_DamageListener(clVar16, "when calling construct_DamageListener in ShieldBash, line 85")
	DamageEvent_addListener(clVar16, "when calling addListener in ShieldBash, line 85")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onDamageTaken(__wurst_stackPos156) 
	local victim = nil
	local attacker1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos156
	wurst_stack_depth = (wurst_stack_depth + 1)
	victim = DamageEvent_getTarget("when calling getTarget in ShieldBash, line 61")
	attacker1 = DamageEvent_getSource("when calling getSource in ShieldBash, line 62")
	if not(unit_hasAbility(victim, ShieldBash_MY_ABILITY_ID, "when calling hasAbility in ShieldBash, line 64")) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	if ((attacker1 == nil) or not(unit_isAlive(attacker1, "when calling isAlive in ShieldBash, line 67"))) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	if (GetRandomReal(0., 1.) > ShieldBash_REFLECT_CHANCE) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	unit_damageTarget(victim, attacker1, ShieldBash_REFLECT_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in ShieldBash, line 73")
	flashEffect(ShieldBash_REFLECT_SFX, attacker1, "origin", "when calling flashEffect in ShieldBash, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_String(__wurst_stackPos209) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos209
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this232, __wurst_stackPos409) 
	local stackTrace_tempReturn43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos409
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn43 = StringLength(this232)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn43
end

function string_getHash(this187, __wurst_stackPos333) 
	local stackTrace_tempReturn44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos333
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn44 = StringHash(this187)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn44
end

function init_SummonTreant(__wurst_stackPos251) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos251
	wurst_stack_depth = (wurst_stack_depth + 1)
	SummonTreant_SUMMON_TREANT_ID = intEnsure(1095577652)
	SummonTreant_TREANT_UNIT_ID = 1697656882
	SummonTreant_TREANT_DURATION = 15.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Table(__wurst_stackPos220) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos220
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TargetsAllowed(__wurst_stackPos234) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos234
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ThickBark(__wurst_stackPos260) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos260
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1095577656)
	intEnsure(1380790321)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_createTimerDialog(this188, __wurst_stackPos336) 
	local stackTrace_tempReturn45 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos336
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn45 = __wurst_safe_CreateTimerDialog(this188)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn45
end

function timerdialog_setTitle(this189, title, __wurst_stackPos337) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos337
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogSetTitle(this189, title)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timerdialog_display(this190, display, __wurst_stackPos338) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos338
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogDisplay(this190, display)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TimerUtils(__wurst_stackPos238) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos238
	wurst_stack_depth = (wurst_stack_depth + 1)
	TimerUtils_freeTimersCount = 0
	TimerUtils_timerData = Table_new_Table("when calling new_Table in TimerUtils, line 13")
	TimerUtils_HELD = 679645218
	HashMap_new_HashMap("when calling new_HashMap in TimerUtils, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_setData(this44, data, __wurst_stackPos53) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos53
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveInt(TimerUtils_timerData, handle_getTCHandleId(this44, "when calling getTCHandleId in TimerUtils, line 18"), data, "when calling saveInt in TimerUtils, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_getData(this185, __wurst_stackPos327) 
	local stackTrace_tempReturn46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos327
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn46 = Table_Table_loadInt(TimerUtils_timerData, handle_getTCHandleId(this185, "when calling getTCHandleId in TimerUtils, line 22"), "when calling loadInt in TimerUtils, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn46
end

function getTimer(__wurst_stackPos324) 
	local receiver44 = nil
	local stackTrace_tempReturn47 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos324
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (TimerUtils_freeTimersCount > 0) then
		TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount - 1)
		timer_setData(TimerUtils_freeTimers[TimerUtils_freeTimersCount], 0, "when calling setData in TimerUtils, line 30")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return TimerUtils_freeTimers[TimerUtils_freeTimersCount]
	else
		receiver44 = CreateTimer()
		timer_setData(receiver44, 0, "when calling setData in TimerUtils, line 33")
		stackTrace_tempReturn47 = receiver44
		wurst_stack_depth = (wurst_stack_depth - 1)
		return stackTrace_tempReturn47
	end
end

function timer_release(this50, __wurst_stackPos59) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos59
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (this50 == nil) then
		error1("Trying to release a null timer", "when calling error in TimerUtils, line 38")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	if (timer_getData(this50, "when calling getData in TimerUtils, line 40") == TimerUtils_HELD) then
		error1("ReleaseTimer: Double free!", "when calling error in TimerUtils, line 41")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	timer_setData(this50, TimerUtils_HELD, "when calling setData in TimerUtils, line 43")
	timer_pause(this50, "when calling pause in TimerUtils, line 44")
	TimerUtils_freeTimers[TimerUtils_freeTimersCount] = this50
	TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_pause(this234, __wurst_stackPos411) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos411
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseTimer(this234)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_start(this52, time3, timerCallBack1, __wurst_stackPos61) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos61
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this52, time3, false, timerCallBack1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_startPeriodic(this45, time1, timerCallBack, __wurst_stackPos54) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos54
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this45, time1, true, timerCallBack)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_addAction(this23, actionFunc, __wurst_stackPos30) 
	local stackTrace_tempReturn48 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos30
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn48 = __wurst_safe_TriggerAddAction(this23, actionFunc)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn48
end

function trigger_addCondition(this164, condition1, __wurst_stackPos279) 
	local stackTrace_tempReturn49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos279
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn49 = __wurst_safe_TriggerAddCondition(this164, condition1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn49
end

function trigger_evaluate(this155, __wurst_stackPos175) 
	local stackTrace_tempReturn50 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos175
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn50 = __wurst_safe_TriggerEvaluate(this155)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn50
end

function trigger_execute(this222, __wurst_stackPos396) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos396
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TriggerExecute(this222)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_registerEnterRegion(this120, whichRegion, filter3, __wurst_stackPos132) 
	local stackTrace_tempReturn51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos132
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn51 = __wurst_safe_TriggerRegisterEnterRegion(this120, whichRegion, filter3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn51
end

function trigger_registerPlayerChatEvent(this25, whichPlayer1, chatMessageToDetect, exactMatchOnly, __wurst_stackPos33) 
	local stackTrace_tempReturn52 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos33
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn52 = __wurst_safe_TriggerRegisterPlayerChatEvent(this25, whichPlayer1, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn52
end

function trigger_registerPlayerEvent(this24, whichPlayer, whichPlayerEvent, __wurst_stackPos32) 
	local stackTrace_tempReturn53 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos32
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn53 = __wurst_safe_TriggerRegisterPlayerEvent(this24, whichPlayer, whichPlayerEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn53
end

function trigger_registerPlayerUnitEvent(this163, whichPlayer8, whichPlayerUnitEvent, filter4, __wurst_stackPos278) 
	local stackTrace_tempReturn54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos278
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn54 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this163, whichPlayer8, whichPlayerUnitEvent, filter4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn54
end

function trigger_registerUnitEvent(this192, whichUnit6, whichEvent1, __wurst_stackPos342) 
	local stackTrace_tempReturn55 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos342
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn55 = __wurst_safe_TriggerRegisterUnitEvent(this192, whichUnit6, whichEvent1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn55
end

function init_TypeCasting(__wurst_stackPos228) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos228
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	TypeCasting_R2I_PRECISION = 1000.
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos412) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos412
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function handle_getTCHandleId(this233, __wurst_stackPos410) 
	local stackTrace_tempReturn56 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos410
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn56 = GetHandleId(this233)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn56
end

function realToIndex(r3, __wurst_stackPos376) 
	local stackTrace_tempReturn57 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos376
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn57 = real_toInt((r3 * TypeCasting_R2I_PRECISION), "when calling toInt in TypeCasting, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn57
end

function triggerFromIndex(index7, __wurst_stackPos413) 
	return __wurst_objectFromIndex(index7)
end

function init_UnitIds(__wurst_stackPos240) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos240
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIds_shade = 1970497636
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UnitIndexer(__wurst_stackPos247) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos247
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

function pushUnit(u10, __wurst_stackPos174) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos174
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnits[UnitIndexer_tempUnitsCount] = u10
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit(__wurst_stackPos176) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos176
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function shouldIndex(_u1, __wurst_stackPos414) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos414
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function unit_getIndex(this35, __wurst_stackPos44) 
	local stackTrace_tempReturn58 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos44
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn58 = unit_getUserData(this35, "when calling getUserData in UnitIndexer, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn58
end

function unit_toUnitIndex(this236, __wurst_stackPos416) 
	local instance = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos416
	wurst_stack_depth = (wurst_stack_depth + 1)
	instance = __wurst_objectFromIndex(unit_getUserData(this236, "when calling getUserData in UnitIndexer, line 132"))
	if (instance == nil) then
		instance = UnitIndex_new_UnitIndex(this236, "when calling new_UnitIndex in UnitIndexer, line 135")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return instance
end

function getIndexingUnit(__wurst_stackPos308) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos308
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (UnitIndexer_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return UnitIndexer_tempUnits[(UnitIndexer_tempUnitsCount - 1)]
end

function onUnitDeindex(func2, __wurst_stackPos295) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos295
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(UnitIndexer_onDeindexTrigger, __wurst_safe_Condition(func2), "when calling addCondition in UnitIndexer, line 150")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_deindex(this237, __wurst_stackPos417) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos417
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (unit_getUserData(this237, "when calling getUserData in UnitIndexer, line 160") == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return false
	else
		UnitIndex_destroyUnitIndex(unit_toUnitIndex(this237, "when calling toUnitIndex in UnitIndexer, line 163"), "when calling destroyUnitIndex in UnitIndexer, line 163")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return true
	end
end

function code__onEnter_UnitIndexer(__wurst_stackPos418) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos418
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling shouldIndex in UnitIndexer, line 190") then
		unit_toUnitIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling toUnitIndex in UnitIndexer, line 190")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onLeave_UnitIndexer(__wurst_stackPos419) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos419
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling shouldIndex in UnitIndexer, line 191") then
		unit_deindex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling deindex in UnitIndexer, line 191")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createUnit(p1, unitId, pos3, facing, __wurst_stackPos25) 
	local stackTrace_tempReturn59 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos25
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn59 = __wurst_safe_CreateUnit(p1, unitId, pos3[1], pos3[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn59
end

function unit_setFlyHeight(this238, height, rate, __wurst_stackPos420) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos420
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFlyHeight(this238, height, rate)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addAbility(this169, abil1, __wurst_stackPos288) 
	local stackTrace_tempReturn60 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos288
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn60 = __wurst_safe_UnitAddAbility(this169, abil1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn60
end

function unit_setAbilityLevel(this204, abilId3, lvl2, __wurst_stackPos366) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos366
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAbilityLevel(this204, abilId3, lvl2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_makeAbilityPermanent(this220, abil2, flag1, __wurst_stackPos392) 
	local stackTrace_tempReturn61 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos392
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn61 = __wurst_safe_UnitMakeAbilityPermanent(this220, flag1, abil2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn61
end

function unit_addHP(this8, val, __wurst_stackPos8) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos8
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_addState(this8, UNIT_STATE_LIFE, val, "when calling addState in Unit, line 81")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addState(this239, state3, value14, __wurst_stackPos421) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos421
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this239, state3, (unit_getState(this239, state3, "when calling getState in Unit, line 96") + value14))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getState(this240, state4, __wurst_stackPos422) 
	local stackTrace_tempReturn62 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos422
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn62 = __wurst_safe_GetUnitState(this240, state4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn62
end

function unit_damageTarget(this132, target4, amount1, attack, ranged, attackType, damageType2, weaponType, __wurst_stackPos151) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos151
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_UnitDamageTarget(this132, target4, amount1, attack, ranged, attackType, damageType2, weaponType)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_kill(this12, __wurst_stackPos13) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos13
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_KillUnit(this12)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getAbilityLevel(this221, id11, __wurst_stackPos395) 
	local stackTrace_tempReturn63 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos395
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn63 = __wurst_safe_GetUnitAbilityLevel(this221, id11)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn63
end

function handle_getHandleId(this176, __wurst_stackPos299) 
	local stackTrace_tempReturn64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos299
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn64 = GetHandleId(this176)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn64
end

function unit_getOwner(this7, __wurst_stackPos7) 
	local stackTrace_tempReturn65 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos7
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn65 = __wurst_safe_GetOwningPlayer(this7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn65
end

function unit_getPos(this17, __wurst_stackPos19) 
	local stackTrace_tempReturn66 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos19
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn66 = ({unit_getX(this17, "when calling getX in Unit, line 249"), unit_getY(this17, "when calling getY in Unit, line 249"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn66
end

function unit_getX(this241, __wurst_stackPos423) 
	local stackTrace_tempReturn67 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos423
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn67 = __wurst_safe_GetUnitX(this241)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn67
end

function unit_getY(this242, __wurst_stackPos424) 
	local stackTrace_tempReturn68 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos424
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn68 = __wurst_safe_GetUnitY(this242)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn68
end

function unit_getUserData(this235, __wurst_stackPos415) 
	local stackTrace_tempReturn69 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos415
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn69 = __wurst_safe_GetUnitUserData(this235)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn69
end

function unit_hasAbility(this16, id, __wurst_stackPos17) 
	local stackTrace_tempReturn70 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos17
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn70 = (__wurst_safe_GetUnitAbilityLevel(this16, id) > 0)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn70
end

function unit_isAlive(this5, __wurst_stackPos5) 
	local stackTrace_tempReturn71 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos5
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn71 = UnitAlive(this5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn71
end

if UnitAlive then
else
	UnitAlive = function (id13) 
			error("The native 'UnitAlive' is not implemented.")
		end
end

function unit_issueTargetOrderById(this210, id10, target8, __wurst_stackPos374) 
	local stackTrace_tempReturn72 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos374
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn72 = __wurst_safe_IssueTargetOrderById(this210, id10, target8)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn72
end

function unit_pause(this168, __wurst_stackPos287) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos287
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this168, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_remove(this123, __wurst_stackPos137) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos137
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RemoveUnit(this123)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_removeAbility(this128, abil, __wurst_stackPos146) 
	local stackTrace_tempReturn73 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos146
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn73 = __wurst_safe_UnitRemoveAbility(this128, abil)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn73
end

function unit_setAnimation(this171, name2, __wurst_stackPos290) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos290
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAnimation(this171, name2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setFacing(this207, a, __wurst_stackPos371) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos371
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFacing(this207, angle_degrees(a, "when calling degrees in Unit, line 516"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setState(this243, state5, value15, __wurst_stackPos425) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos425
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this243, state5, value15)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setInvulnerable(this167, flag, __wurst_stackPos286) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos286
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitInvulnerable(this167, flag)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setMana(this201, val2, __wurst_stackPos363) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos363
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setState(this201, UNIT_STATE_MANA, val2, "when calling setState in Unit, line 528")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setOwner(this205, p16, changeColor1, __wurst_stackPos367) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos367
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitOwner(this205, p16, changeColor1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPathing(this170, value8, __wurst_stackPos289) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos289
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPathing(this170, value8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPos(this206, pos10, __wurst_stackPos369) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos369
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPosition(this206, pos10[1], pos10[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setUserData(this154, data1, __wurst_stackPos173) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos173
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitUserData(this154, data1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setX(this244, x8, __wurst_stackPos426) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos426
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitX(this244, x8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setY(this245, y7, __wurst_stackPos427) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos427
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitY(this245, y7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setXYZ(this203, pos9, __wurst_stackPos365) 
	local receiver45 = nil
	local receiver46 = nil
	local receiver47 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos365
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver45 = this203
	unit_setX(receiver45, pos9[1], "when calling setX in Unit, line 608")
	receiver46 = receiver45
	unit_setY(receiver46, pos9[2], "when calling setY in Unit, line 608")
	receiver47 = receiver46
	unit_setFlyHeight(receiver47, pos9[3], 0., "when calling setFlyHeight in Unit, line 609")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UpgradeObjEditing(__wurst_stackPos259) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos259
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Vectors(__wurst_stackPos210) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos210
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function vec2_op_plus(this218, v2, __wurst_stackPos385) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos385
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this218[1] + v2[1]), (this218[2] + v2[2]), })
end

function vec2_op_mult(this217, factor, __wurst_stackPos384) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos384
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this217[1] * factor), (this217[2] * factor), })
end

function vec2_toVec3(this211, __wurst_stackPos375) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos375
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this211[1], this211[2], 0., })
end

function tupleCopy1(t) 
	return ({t[1], })
end

function vec2_angleTo(this208, v1, __wurst_stackPos372) 
	local stackTrace_tempReturn74 = ({0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos372
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn74 = tupleCopy1(real_asAngleRadians(Atan2((v1[2] - this208[2]), (v1[1] - this208[1])), "when calling asAngleRadians in Vectors, line 127"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn74
end

function vec2_distanceTo(this126, v, __wurst_stackPos142) 
	local stackTrace_tempReturn75 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos142
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn75 = SquareRoot((real_squared((v[1] - this126[1]), "when calling squared in Vectors, line 157") + real_squared((v[2] - this126[2]), "when calling squared in Vectors, line 157")))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn75
end

function init_WeatherEffects(__wurst_stackPos227) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos227
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widget_getPos(this209, __wurst_stackPos373) 
	local stackTrace_tempReturn76 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos373
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn76 = ({widget_getX(this209, "when calling getX in Widget, line 12"), widget_getY(this209, "when calling getY in Widget, line 12"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn76
end

function widget_getX(this246, __wurst_stackPos428) 
	local stackTrace_tempReturn77 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos428
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn77 = __wurst_safe_GetWidgetX(this246)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn77
end

function widget_getY(this247, __wurst_stackPos429) 
	local stackTrace_tempReturn78 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos429
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn78 = __wurst_safe_GetWidgetY(this247)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn78
end

function widget_addEffect(this172, modelName, attachment, __wurst_stackPos291) 
	local stackTrace_tempReturn79 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos291
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn79 = __wurst_safe_AddSpecialEffectTarget(modelName, this172, attachment)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn79
end

function init_winLoss(__wurst_stackPos261) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos261
	wurst_stack_depth = (wurst_stack_depth + 1)
	setupDefeatCondition("when calling setupDefeatCondition in winLoss, line 26")
	setupVictoryCondition("when calling setupVictoryCondition in winLoss, line 27")
	player_setGold(Player_players[0], 1000, "when calling setGold in winLoss, line 28")
	player_setLumber(Player_players[0], 1000, "when calling setLumber in winLoss, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupVictoryCondition(__wurst_stackPos431) 
	local receiver48 = nil
	local receiver49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos431
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver48 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver48, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 12")
	receiver49 = receiver48
	trigger_addAction(receiver49, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 13")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss(__wurst_stackPos432) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos432
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_remove(BasicWaves_footmen, "when calling remove in winLoss, line 14", GetTriggerUnit())
	if group_isEmpty(BasicWaves_footmen, "when calling isEmpty in winLoss, line 15") then
		__wurst_safe_CustomVictoryBJ(Player_players[0], true, true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupDefeatCondition(__wurst_stackPos430) 
	local receiver50 = nil
	local receiver51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos430
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver50 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver50, Player_players[0], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 20")
	receiver51 = receiver50
	trigger_addAction(receiver51, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss1(__wurst_stackPos433) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos433
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (GetTriggerUnit() == udg_townHall) then
		__wurst_safe_CustomDefeatBJ(Player_players[0], "You have been defeated!")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos201) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos201
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos434) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos434
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
	__wurst_SaveStr(hashtable_compiletime1, 2, -263269125, "AM03")
	__wurst_SaveStr(hashtable_compiletime1, 2, -644213493, "AM04")
	__wurst_SaveStr(hashtable_compiletime1, 2, -2032846969, "AM05")
	__wurst_SaveStr(hashtable_compiletime1, 2, -844489484, "AM02")
	__wurst_SaveStr(hashtable_compiletime1, 2, 1282521876, "Aloc")
	__wurst_SaveStr(hashtable_compiletime1, 2, 512215473, "Agho")
	__wurst_SaveStr(hashtable_compiletime1, 2, -1945487672, "AM0a")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function bridge_Unit000038_DropItems() 
	Unit000038_DropItems("via function reference war3map, line 447")
end

function bridge_Unit000043_DropItems() 
	Unit000043_DropItems("via function reference war3map, line 456")
end

function bridge_Unit000080_DropItems() 
	Unit000080_DropItems("via function reference war3map, line 475")
end

function bridge_Unit000077_DropItems() 
	Unit000077_DropItems("via function reference war3map, line 482")
end

function bridge_Unit000090_DropItems() 
	Unit000090_DropItems("via function reference war3map, line 492")
end

function bridge_Unit000097_DropItems() 
	Unit000097_DropItems("via function reference war3map, line 501")
end

function bridge_Unit000003_DropItems() 
	Unit000003_DropItems("via function reference war3map, line 515")
end

function bridge_Trig_init_Actions() 
	Trig_init_Actions("via function reference war3map, line 622")
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

function __wurst_safe_DisplayTimedTextToPlayer(toPlayer, x6, y5, duration, message) 
	if (toPlayer == nil) then
		return nil
	end
	DisplayTimedTextToPlayer(toPlayer, x6, y5, duration, message)
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

function __wurst_safe_GetUnitX(whichUnit4) 
	if (whichUnit4 == nil) then
		return 0.0
	end
	return GetUnitX(whichUnit4)
end

function __wurst_safe_GetUnitY(whichUnit5) 
	if (whichUnit5 == nil) then
		return 0.0
	end
	return GetUnitY(whichUnit5)
end

function __wurst_safe_TriggerEvaluate(whichTrigger4) 
	if (whichTrigger4 == nil) then
		return false
	end
	return TriggerEvaluate(whichTrigger4)
end

function __wurst_safe_TriggerExecute(whichTrigger5) 
	if (whichTrigger5 == nil) then
		return nil
	end
	TriggerExecute(whichTrigger5)
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

function __wurst_safe_TriggerRegisterTimerExpireEvent(whichTrigger10, t5) 
	if (whichTrigger10 == nil) then
		return nil
	end
	if (t5 == nil) then
		return nil
	end
	return TriggerRegisterTimerExpireEvent(whichTrigger10, t5)
end

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger9, whichPlayer18, whichPlayerUnitEvent1, filter11) 
	if (whichTrigger9 == nil) then
		return nil
	end
	if (whichPlayer18 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger9, whichPlayer18, whichPlayerUnitEvent1, filter11)
end

function __wurst_safe_TriggerRegisterPlayerEvent(whichTrigger8, whichPlayer17, whichPlayerEvent1) 
	if (whichTrigger8 == nil) then
		return nil
	end
	if (whichPlayer17 == nil) then
		return nil
	end
	if (whichPlayerEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerEvent(whichTrigger8, whichPlayer17, whichPlayerEvent1)
end

function __wurst_safe_TriggerRegisterGameStateEvent(whichTrigger11, whichState, opcode, limitval) 
	if (whichTrigger11 == nil) then
		return nil
	end
	if (whichState == nil) then
		return nil
	end
	if (opcode == nil) then
		return nil
	end
	return TriggerRegisterGameStateEvent(whichTrigger11, whichState, opcode, limitval)
end

function __wurst_safe_TriggerRegisterEnterRegion(whichTrigger6, whichRegion2, filter10) 
	if (whichTrigger6 == nil) then
		return nil
	end
	if (whichRegion2 == nil) then
		return nil
	end
	return TriggerRegisterEnterRegion(whichTrigger6, whichRegion2, filter10)
end

function __wurst_safe_RegionAddRect(whichRegion1, r4) 
	if (whichRegion1 == nil) then
		return nil
	end
	if (r4 == nil) then
		return nil
	end
	RegionAddRect(whichRegion1, r4)
end

function __wurst_safe_StopSound(soundHandle1, killWhenDone, fadeOut) 
	if (soundHandle1 == nil) then
		return nil
	end
	StopSound(soundHandle1, killWhenDone, fadeOut)
end

function __wurst_safe_VolumeGroupSetVolume(vgroup, scale3) 
	if (vgroup == nil) then
		return nil
	end
	VolumeGroupSetVolume(vgroup, scale3)
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

function __wurst_safe_SetUnitAbilityLevel(whichUnit14, abilcode, level) 
	if (whichUnit14 == nil) then
		return 0
	end
	return SetUnitAbilityLevel(whichUnit14, abilcode, level)
end

function __wurst_safe_GetUnitAbilityLevel(whichUnit18, abilcode1) 
	if (whichUnit18 == nil) then
		return 0
	end
	return GetUnitAbilityLevel(whichUnit18, abilcode1)
end

function __wurst_safe_UnitRemoveAbility(whichUnit24, abilityId5) 
	if (whichUnit24 == nil) then
		return false
	end
	return UnitRemoveAbility(whichUnit24, abilityId5)
end

function __wurst_safe_GetItemTypeId(i19) 
	if (i19 == nil) then
		return 0
	end
	return GetItemTypeId(i19)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level1) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level1)
end

function __wurst_safe_GroupClear(whichGroup4) 
	if (whichGroup4 == nil) then
		return nil
	end
	GroupClear(whichGroup4)
end

function __wurst_safe_GroupAddUnit(whichGroup5, whichUnit10) 
	if (whichGroup5 == nil) then
		return false
	end
	if (whichUnit10 == nil) then
		return false
	end
	return GroupAddUnit(whichGroup5, whichUnit10)
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

function __wurst_safe_UnitSuspendDecay(whichUnit33, suspend) 
	if (whichUnit33 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit33, suspend)
end

function __wurst_safe_GetUnitState(whichUnit7, whichUnitState) 
	if (whichUnit7 == nil) then
		return 0.0
	end
	if (whichUnitState == nil) then
		return 0.0
	end
	return GetUnitState(whichUnit7, whichUnitState)
end

function __wurst_safe_SetUnitTimeScale(whichUnit34, timeScale) 
	if (whichUnit34 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit34, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit25, whichAnimation) 
	if (whichUnit25 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit25, whichAnimation)
end

function __wurst_safe_DestroyGroup(whichGroup7) 
	if (whichGroup7 == nil) then
		return nil
	end
	DestroyGroup(whichGroup7)
end

function __wurst_safe_TriggerAddAction(whichTrigger2, actionFunc1) 
	if (whichTrigger2 == nil) then
		return nil
	end
	return TriggerAddAction(whichTrigger2, actionFunc1)
end

function __wurst_safe_SetUnitState(whichUnit9, whichUnitState1, newVal) 
	if (whichUnit9 == nil) then
		return nil
	end
	if (whichUnitState1 == nil) then
		return nil
	end
	SetUnitState(whichUnit9, whichUnitState1, newVal)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit35) 
	if (whichUnit35 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit35)
end

function __wurst_safe_IsUnitHidden(whichUnit2) 
	if (whichUnit2 == nil) then
		return false
	end
	return IsUnitHidden(whichUnit2)
end

function __wurst_safe_IsUnitType(whichUnit36, whichUnitType) 
	if (whichUnit36 == nil) then
		return false
	end
	if (whichUnitType == nil) then
		return false
	end
	return IsUnitType(whichUnit36, whichUnitType)
end

function __wurst_safe_GetUnitTypeId(whichUnit37) 
	if (whichUnit37 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit37)
end

function __wurst_safe_FirstOfGroup(whichGroup9) 
	if (whichGroup9 == nil) then
		return nil
	end
	return FirstOfGroup(whichGroup9)
end

function __wurst_safe_IssueTargetOrderById(whichUnit21, order2, targetWidget3) 
	if (whichUnit21 == nil) then
		return false
	end
	if (targetWidget3 == nil) then
		return false
	end
	return IssueTargetOrderById(whichUnit21, order2, targetWidget3)
end

function __wurst_safe_SetUnitFlyHeight(whichUnit13, newHeight, rate1) 
	if (whichUnit13 == nil) then
		return nil
	end
	SetUnitFlyHeight(whichUnit13, newHeight, rate1)
end

function __wurst_safe_SetPlayerState(whichPlayer11, whichPlayerState, value13) 
	if (whichPlayer11 == nil) then
		return nil
	end
	if (whichPlayerState == nil) then
		return nil
	end
	SetPlayerState(whichPlayer11, whichPlayerState, value13)
end

function __wurst_safe_PauseUnit(whichUnit22, flag2) 
	if (whichUnit22 == nil) then
		return nil
	end
	PauseUnit(whichUnit22, flag2)
end

function __wurst_safe_GetPlayerController(whichPlayer21) 
	if (whichPlayer21 == nil) then
		return nil
	end
	return GetPlayerController(whichPlayer21)
end

function __wurst_safe_UnitAddAbility(whichUnit12, abilityId3) 
	if (whichUnit12 == nil) then
		return false
	end
	return UnitAddAbility(whichUnit12, abilityId3)
end

function __wurst_safe_UnitMakeAbilityPermanent(whichUnit15, permanent, abilityId4) 
	if (whichUnit15 == nil) then
		return false
	end
	return UnitMakeAbilityPermanent(whichUnit15, permanent, abilityId4)
end

function __wurst_safe_KillUnit(whichUnit17) 
	if (whichUnit17 == nil) then
		return nil
	end
	KillUnit(whichUnit17)
end

function __wurst_safe_GetOwningPlayer(whichUnit19) 
	if (whichUnit19 == nil) then
		return nil
	end
	return GetOwningPlayer(whichUnit19)
end

function __wurst_safe_CreateUnit(id12, unitid1, x7, y6, face1) 
	if (id12 == nil) then
		return nil
	end
	return CreateUnit(id12, unitid1, x7, y6, face1)
end

function __wurst_safe_RemoveUnit(whichUnit23) 
	if (whichUnit23 == nil) then
		return nil
	end
	RemoveUnit(whichUnit23)
end

function __wurst_safe_SetUnitFacing(whichUnit26, facingAngle) 
	if (whichUnit26 == nil) then
		return nil
	end
	SetUnitFacing(whichUnit26, facingAngle)
end

function __wurst_safe_AddItemToStock(whichUnit38, itemId, currentStock, stockMax) 
	if (whichUnit38 == nil) then
		return nil
	end
	AddItemToStock(whichUnit38, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit39, itemId1) 
	if (whichUnit39 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit39, itemId1)
end

function __wurst_safe_UnitDamageTarget(whichUnit16, target9, amount3, attack1, ranged1, attackType3, damageType4, weaponType2) 
	if (whichUnit16 == nil) then
		return false
	end
	if (target9 == nil) then
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
	return UnitDamageTarget(whichUnit16, target9, amount3, attack1, ranged1, attackType3, damageType4, weaponType2)
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

function __wurst_safe_SetUnitPosition(whichUnit29, newX, newY) 
	if (whichUnit29 == nil) then
		return nil
	end
	SetUnitPosition(whichUnit29, newX, newY)
end

function __wurst_safe_GroupEnumUnitsInRect(whichGroup1, r2, filter7) 
	if (whichGroup1 == nil) then
		return nil
	end
	if (r2 == nil) then
		return nil
	end
	GroupEnumUnitsInRect(whichGroup1, r2, filter7)
end

function __wurst_safe_GroupRemoveUnit(whichGroup6, whichUnit11) 
	if (whichGroup6 == nil) then
		return false
	end
	if (whichUnit11 == nil) then
		return false
	end
	return GroupRemoveUnit(whichGroup6, whichUnit11)
end

function __wurst_safe_ForceAddPlayer(whichForce, whichPlayer22) 
	if (whichForce == nil) then
		return nil
	end
	if (whichPlayer22 == nil) then
		return nil
	end
	ForceAddPlayer(whichForce, whichPlayer22)
end

function __wurst_safe_ForceEnumPlayers(whichForce1, filter12) 
	if (whichForce1 == nil) then
		return nil
	end
	ForceEnumPlayers(whichForce1, filter12)
end

function __wurst_safe_IsUnitAliveBJ(whichUnit40) 
	if (whichUnit40 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit40)
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

function __wurst_safe_SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value16) 
	if (sourcePlayer == nil) then
		return nil
	end
	if (otherPlayer2 == nil) then
		return nil
	end
	if (whichAllianceSetting == nil) then
		return nil
	end
	SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value16)
end

function __wurst_safe_SetUnitOwner(whichUnit8, whichPlayer10, changeColor) 
	if (whichUnit8 == nil) then
		return nil
	end
	if (whichPlayer10 == nil) then
		return nil
	end
	SetUnitOwner(whichUnit8, whichPlayer10, changeColor)
end

function __wurst_safe_DisplayTimedTextFromPlayer(toPlayer1, x9, y8, duration1, message2) 
	if (toPlayer1 == nil) then
		return nil
	end
	DisplayTimedTextFromPlayer(toPlayer1, x9, y8, duration1, message2)
end

function __wurst_safe_TriggerRegisterDialogButtonEvent(whichTrigger12, whichButton) 
	if (whichTrigger12 == nil) then
		return nil
	end
	if (whichButton == nil) then
		return nil
	end
	return TriggerRegisterDialogButtonEvent(whichTrigger12, whichButton)
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

function __wurst_safe_VolumeGroupSetVolumeForPlayerBJ(whichPlayer26, vgroup1, scale4) 
	if (whichPlayer26 == nil) then
		return nil
	end
	if (vgroup1 == nil) then
		return nil
	end
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer26, vgroup1, scale4)
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

function __wurst_safe_CreateTimerDialog(t4) 
	if (t4 == nil) then
		return nil
	end
	return CreateTimerDialog(t4)
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

function __wurst_safe_PingMinimapForPlayer(whichPlayer30, x10, y9, duration2) 
	if (whichPlayer30 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer30, x10, y9, duration2)
end

function __wurst_safe_UnitAddIndicator(whichUnit41, red, green, blue, alpha) 
	if (whichUnit41 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit41, red, green, blue, alpha)
end

function __wurst_safe_RescueUnitBJ(whichUnit42, rescuer, changeColor2) 
	if (whichUnit42 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit42, rescuer, changeColor2)
end

function __wurst_safe_SetPlayerTechMaxAllowed(whichPlayer31, techid, maximum) 
	if (whichPlayer31 == nil) then
		return nil
	end
	SetPlayerTechMaxAllowed(whichPlayer31, techid, maximum)
end

function __wurst_safe_SetPlayerAbilityAvailable(whichPlayer15, abilid, avail1) 
	if (whichPlayer15 == nil) then
		return nil
	end
	SetPlayerAbilityAvailable(whichPlayer15, abilid, avail1)
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

function __wurst_safe_GetPlayerState(whichPlayer12, whichPlayerState1) 
	if (whichPlayer12 == nil) then
		return 0
	end
	if (whichPlayerState1 == nil) then
		return 0
	end
	return GetPlayerState(whichPlayer12, whichPlayerState1)
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

function __wurst_safe_GroupEnumUnitsInRange(whichGroup, x4, y3, radius, filter6) 
	if (whichGroup == nil) then
		return nil
	end
	GroupEnumUnitsInRange(whichGroup, x4, y3, radius, filter6)
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

function __wurst_safe_GetItemType(whichItem) 
	if (whichItem == nil) then
		return nil
	end
	return GetItemType(whichItem)
end

function __wurst_safe_GetItemLevel(whichItem1) 
	if (whichItem1 == nil) then
		return 0
	end
	return GetItemLevel(whichItem1)
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

function __wurst_safe_SetItemDropID(whichItem2, unitId1) 
	if (whichItem2 == nil) then
		return nil
	end
	SetItemDropID(whichItem2, unitId1)
end

function __wurst_safe_UpdateStockAvailability(whichItem3) 
	if (whichItem3 == nil) then
		return nil
	end
	UpdateStockAvailability(whichItem3)
end

function __wurst_safe_GetWidgetX(whichWidget) 
	if (whichWidget == nil) then
		return 0.0
	end
	return GetWidgetX(whichWidget)
end

function __wurst_safe_GetWidgetY(whichWidget1) 
	if (whichWidget1 == nil) then
		return 0.0
	end
	return GetWidgetY(whichWidget1)
end

function __wurst_safe_UnitDropItem(inUnit, inItemID) 
	if (inUnit == nil) then
		return nil
	end
	return UnitDropItem(inUnit, inItemID)
end

function __wurst_safe_WidgetDropItem(inWidget, inItemID1) 
	if (inWidget == nil) then
		return nil
	end
	return WidgetDropItem(inWidget, inItemID1)
end

function __wurst_safe_DestroyTrigger(whichTrigger) 
	if (whichTrigger == nil) then
		return nil
	end
	DestroyTrigger(whichTrigger)
end

function __wurst_safe_BlzCreateUnitWithSkin(id3, unitid, x1, y1, face, skinId) 
	if (id3 == nil) then
		return nil
	end
	return BlzCreateUnitWithSkin(id3, unitid, x1, y1, face, skinId)
end

function __wurst_safe_TriggerRegisterUnitEvent(whichTrigger1, whichUnit3, whichEvent) 
	if (whichTrigger1 == nil) then
		return nil
	end
	if (whichUnit3 == nil) then
		return nil
	end
	if (whichEvent == nil) then
		return nil
	end
	return TriggerRegisterUnitEvent(whichTrigger1, whichUnit3, whichEvent)
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

function __wurst_safe_BlzSetEventAttackType(attackType2) 
	if (attackType2 == nil) then
		return false
	end
	return BlzSetEventAttackType(attackType2)
end

function __wurst_safe_BlzSetEventDamageType(damageType3) 
	if (damageType3 == nil) then
		return false
	end
	return BlzSetEventDamageType(damageType3)
end

function __wurst_safe_BlzSetEventWeaponType(weaponType1) 
	if (weaponType1 == nil) then
		return false
	end
	return BlzSetEventWeaponType(weaponType1)
end

function __wurst_safe_BlzSetSpecialEffectScale(whichEffect1, scale2) 
	if (whichEffect1 == nil) then
		return nil
	end
	BlzSetSpecialEffectScale(whichEffect1, scale2)
end

function __wurst_safe_BlzSetSpecialEffectYaw(whichEffect2, yaw2) 
	if (whichEffect2 == nil) then
		return nil
	end
	BlzSetSpecialEffectYaw(whichEffect2, yaw2)
end

function __wurst_safe_BlzSetSpecialEffectColor(whichEffect3, r1, g1, b1) 
	if (whichEffect3 == nil) then
		return nil
	end
	BlzSetSpecialEffectColor(whichEffect3, r1, g1, b1)
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

function __wurst_safe_IsPlayerAlly(whichPlayer13, otherPlayer) 
	if (whichPlayer13 == nil) then
		return false
	end
	if (otherPlayer == nil) then
		return false
	end
	return IsPlayerAlly(whichPlayer13, otherPlayer)
end

function __wurst_safe_IsPlayerEnemy(whichPlayer14, otherPlayer1) 
	if (whichPlayer14 == nil) then
		return false
	end
	if (otherPlayer1 == nil) then
		return false
	end
	return IsPlayerEnemy(whichPlayer14, otherPlayer1)
end

function __wurst_safe_TriggerAddCondition(whichTrigger3, condition2) 
	if (whichTrigger3 == nil) then
		return nil
	end
	return TriggerAddCondition(whichTrigger3, condition2)
end

function __wurst_safe_TriggerRegisterPlayerChatEvent(whichTrigger7, whichPlayer16, chatMessageToDetect1, exactMatchOnly1) 
	if (whichTrigger7 == nil) then
		return nil
	end
	if (whichPlayer16 == nil) then
		return nil
	end
	return TriggerRegisterPlayerChatEvent(whichTrigger7, whichPlayer16, chatMessageToDetect1, exactMatchOnly1)
end

function __wurst_safe_GetUnitUserData(whichUnit20) 
	if (whichUnit20 == nil) then
		return 0
	end
	return GetUnitUserData(whichUnit20)
end

function __wurst_safe_SetUnitInvulnerable(whichUnit27, flag3) 
	if (whichUnit27 == nil) then
		return nil
	end
	SetUnitInvulnerable(whichUnit27, flag3)
end

function __wurst_safe_SetUnitPathing(whichUnit28, flag4) 
	if (whichUnit28 == nil) then
		return nil
	end
	SetUnitPathing(whichUnit28, flag4)
end

function __wurst_safe_SetUnitUserData(whichUnit30, data2) 
	if (whichUnit30 == nil) then
		return nil
	end
	SetUnitUserData(whichUnit30, data2)
end

function __wurst_safe_SetUnitX(whichUnit31, newX1) 
	if (whichUnit31 == nil) then
		return nil
	end
	SetUnitX(whichUnit31, newX1)
end

function __wurst_safe_SetUnitY(whichUnit32, newY1) 
	if (whichUnit32 == nil) then
		return nil
	end
	SetUnitY(whichUnit32, newY1)
end

function __wurst_safe_CustomVictoryBJ(whichPlayer19, showDialog, showScores) 
	if (whichPlayer19 == nil) then
		return nil
	end
	CustomVictoryBJ(whichPlayer19, showDialog, showScores)
end

function __wurst_safe_CustomDefeatBJ(whichPlayer20, message1) 
	if (whichPlayer20 == nil) then
		return nil
	end
	CustomDefeatBJ(whichPlayer20, message1)
end

