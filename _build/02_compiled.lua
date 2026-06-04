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
HeroTrainer_TAVERN_ID = nil
Hibernate_HIBERNATE_ID = nil
Hibernate_HIBERNATE_BUFF_ID = nil
Hibernate_HIBERNATE_DURATION = nil
Hibernate_HEAL_INTERVAL = nil
Hibernate_ARMOR_BONUS = nil
Hibernate_HP_PCT = nil
Hibernate_HP_FLAT = nil
InstantDummyCaster_DUMMY_CASTER_UNIT_ID = nil
InstantDummyCaster_DUMMY_ROOT_ABIL_ID = nil
InstantDummyCaster_caster = nil
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
OrderIds_rejuvination = nil
OrderIds_thunderbolt = nil
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
SpiritWisps_SPIRIT_WISPS_ID = nil
SpiritWisps_WISP_BUFF_ID = nil
SpiritWisps_WISP_UNIT_ID = nil
SpiritWisps_WISP_COUNT = nil
SpiritWisps_WISP_DURATION = nil
SpiritWisps_WISP_HEAL = nil
SpiritWisps_WISP_RADIUS = nil
SpiritWisps_HEAL_INTERVAL = nil
SpiritWisps_ORBIT_RADIUS = nil
SpiritWisps_UPDATE_INTERVAL = nil
StringUtils_c2s = nil
StringUtils_MAX_INDEX = nil
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
UnitIds_wisp = nil
UnitIndexer_onIndexTrigger = nil
UnitIndexer_onDeindexTrigger = nil
UnitIndexer_tempUnits = nil
UnitIndexer_tempUnitsCount = nil
UrsocCharge_URSOC_CHARGE_ID = nil
UrsocCharge_CHARGE_STUN_ID = nil
UrsocCharge_CHARGE_DAMAGE = nil
UrsocCharge_CHARGE_SFX = nil
UrsocCharge_IMPACT_SFX = nil
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
EventListener_add_HeroTrainer = ({})
OnCastListener_onCast_Hibernate = ({})
CallbackPeriodic_doPeriodically_onCast_Hibernate = ({})
CallbackSingle_doAfter_onCast_Hibernate = ({})
CallbackSingle_doAfter_InitFocusCamera = ({})
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
OnCastListener_onCast_SpiritWisps = ({})
CallbackPeriodic_doPeriodically_onCast_SpiritWisps = ({})
CallbackPeriodic_doPeriodically_onCast_SpiritWisps1 = ({})
CallbackSingle_doAfter_onCast_SpiritWisps = ({})
Table = ({})
UnitIndex = ({})
OnCastListener_onCast_UrsocCharge = ({})

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
	EventData_getSpellTargetUnit("when calling getSpellTargetUnit in CenariusCharacter, line 30")
	addSeedlingStack("when calling addSeedlingStack in CenariusCharacter, line 31")
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
	local temp98 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos23
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (getSeedlingCount("when calling getSeedlingCount in CenariusCharacter, line 36") <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	pos2 = tupleCopy(unit_getPos(caster2, "when calling getPos in CenariusCharacter, line 39"))
	stacks = getSeedlingCount("when calling getSeedlingCount in CenariusCharacter, line 40")
	i = 1
	temp = stacks
	while true do
		if (i > temp) then
			break
		end
		treant = createUnit(unit_getOwner(caster2, "when calling getOwner in CenariusCharacter, line 43"), SummonTreant_TREANT_UNIT_ID, pos2, ({0., }), "when calling createUnit in CenariusCharacter, line 43")
		temp98 = SummonTreant_TREANT_DURATION
		clVar = CallbackSingle_doAfter_onCast_CenariusCharacter:create5()
		CallbackSingle_construct_CallbackSingle(clVar, "when calling construct_CallbackSingle in CenariusCharacter, line 44")
		clVar.treant = treant
		doAfter(temp98, clVar, "when calling doAfter in CenariusCharacter, line 44")
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
	if unit_isAlive(this21.treant, "when calling isAlive in CenariusCharacter, line 45") then
		unit_kill(this21.treant, "when calling kill in CenariusCharacter, line 46")
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

function ForForceCallback:create18() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForForceCallback, }))
	return new_inst
end

function ForForceCallback_ForForceCallback_run(this71, __wurst_stackPos82) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos82
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_destroyForForceCallback(this72, __wurst_stackPos83) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos83
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_execute_GroupUtils:create19() 
	local new_inst = ({createNow=0, })
	setmetatable(new_inst, ({__index=ForForceCallback_execute_GroupUtils, }))
	return new_inst
end

function ForForceCallback_execute_GroupUtils_run_execute_GroupUtils(this73, __wurst_stackPos84) 
	local i2 = nil
	local temp2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos84
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_numTotal = (GroupUtils_numTotal + this73.createNow)
	i2 = 1
	temp2 = this73.createNow
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

function GroupIterator_destroyGroupIterator(this75, __wurst_stackPos87) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos87
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_onDestroy(this75, "when calling GroupIterator_onDestroy in Group, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_init(this77, __wurst_stackPos89) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos89
	wurst_stack_depth = (wurst_stack_depth + 1)
	this77.GroupIterator_i = 0
	this77.GroupIterator_n = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_new_GroupIterator(source2, __wurst_stackPos90) 
	local this78 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos90
	wurst_stack_depth = (wurst_stack_depth + 1)
	this78 = GroupIterator:create20()
	GroupIterator_construct_GroupIterator(this78, source2, "when calling construct_GroupIterator in Group, line 119")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this78
end

function GroupIterator_construct_GroupIterator(this79, source3, __wurst_stackPos91) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos91
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_init(this79, "when calling GroupIterator_init in Group, line 119")
	this79.GroupIterator_g = CreateGroup()
	group_add(this79.GroupIterator_g, "when calling add in Group, line 121", source3)
	this79.GroupIterator_n = group_size(this79.GroupIterator_g, "when calling size in Group, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_onDestroy(this76, __wurst_stackPos88) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos88
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_clear(this76.GroupIterator_g, "when calling clear in Group, line 136")
	group_destr(this76.GroupIterator_g, "when calling destr in Group, line 137")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap:create21() 
	local new_inst = ({HashMap_size=0, })
	setmetatable(new_inst, ({__index=HashMap, }))
	return new_inst
end

function HashMap_HashMap_has(this84, key3, __wurst_stackPos96) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos96
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Table_Table_hasInt(this84, __wurst_objectToIndex(key3), "when calling hasInt in HashMap, line 14")
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

function HashMap_HashMap_init(this89, __wurst_stackPos101) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos101
	wurst_stack_depth = (wurst_stack_depth + 1)
	this89.HashMap_size = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_new_HashMap(__wurst_stackPos102) 
	local this90 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos102
	wurst_stack_depth = (wurst_stack_depth + 1)
	this90 = HashMap:create21()
	HashMap_construct_HashMap(this90, "when calling construct_HashMap in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this90
end

function HashMap_construct_HashMap(this91, __wurst_stackPos103) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos103
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_construct_Table(this91, "when calling construct_Table in HashMap, line 7")
	HashMap_HashMap_init(this91, "when calling HashMap_init in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_HeroTrainer:create22() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_HeroTrainer, }))
	return new_inst
end

function EventListener_add_HeroTrainer_onEvent_add_HeroTrainer(this93, __wurst_stackPos105) 
	local building = nil
	local trained = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos105
	wurst_stack_depth = (wurst_stack_depth + 1)
	building = EventData_getTrainedUnit("when calling getTrainedUnit in HeroTrainer, line 10")
	trained = EventData_getTrainedUnit("when calling getTrainedUnit in HeroTrainer, line 11")
	if (unit_getTypeId(building, "when calling getTypeId in HeroTrainer, line 13") == HeroTrainer_TAVERN_ID) then
		unit_remove(building, "when calling remove in HeroTrainer, line 14")
		print1(stringConcat("Hero chosen: ", unit_getName(trained, "when calling getName in HeroTrainer, line 15")), "when calling print in HeroTrainer, line 15")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Hibernate:create23() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Hibernate, }))
	return new_inst
end

function OnCastListener_onCast_Hibernate_fire_onCast_Hibernate(this97, caster4, __wurst_stackPos111) 
	local level = nil
	local totalHeal = nil
	local healPerTick = nil
	local sfx = nil
	local healTimer = nil
	local clVar1 = nil
	local clVar2 = nil
	local temp99 = nil
	local temp100 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos111
	wurst_stack_depth = (wurst_stack_depth + 1)
	level = (unit_getAbilityLevel(caster4, Hibernate_HIBERNATE_ID, "when calling getAbilityLevel in Hibernate, line 67") - 1)
	totalHeal = ((unit_getMaxHP(caster4, "when calling getMaxHP in Hibernate, line 69") * realEnsure(Hibernate_HP_PCT[level])) + realEnsure(Hibernate_HP_FLAT[level]))
	healPerTick = (totalHeal / (Hibernate_HIBERNATE_DURATION / Hibernate_HEAL_INTERVAL))
	unit_setArmor(caster4, (unit_getArmor(caster4, "when calling getArmor in Hibernate, line 72") + Hibernate_ARMOR_BONUS), "when calling setArmor in Hibernate, line 72")
	unit_pause(caster4, "when calling pause in Hibernate, line 73")
	unit_setPathing(caster4, false, "when calling setPathing in Hibernate, line 74")
	__wurst_safe_UnitAddAbility(caster4, Hibernate_HIBERNATE_BUFF_ID)
	sfx = addEffect("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", caster4, "origin", "when calling addEffect in Hibernate, line 78")
	temp99 = Hibernate_HEAL_INTERVAL
	clVar1 = CallbackPeriodic_doPeriodically_onCast_Hibernate:create24()
	CallbackPeriodic_construct_CallbackPeriodic(clVar1, "when calling construct_CallbackPeriodic in Hibernate, line 80")
	clVar1.caster = caster4
	clVar1.healPerTick = healPerTick
	healTimer = doPeriodically(temp99, clVar1, "when calling doPeriodically in Hibernate, line 80")
	temp100 = Hibernate_HIBERNATE_DURATION
	clVar2 = CallbackSingle_doAfter_onCast_Hibernate:create25()
	CallbackSingle_construct_CallbackSingle(clVar2, "when calling construct_CallbackSingle in Hibernate, line 85")
	clVar2.healTimer = healTimer
	clVar2.caster = caster4
	clVar2.sfx = sfx
	doAfter(temp100, clVar2, "when calling doAfter in Hibernate, line 85")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_Hibernate:create24() 
	local new_inst = ({CallbackPeriodic_t=nil, caster=nil, healPerTick=0., })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_Hibernate, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate(this104, cb4, __wurst_stackPos120) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos120
	wurst_stack_depth = (wurst_stack_depth + 1)
	if unit_isAlive(this104.caster, "when calling isAlive in Hibernate, line 81") then
		unit_addHP(this104.caster, this104.healPerTick, "when calling addHP in Hibernate, line 82")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_Hibernate:create25() 
	local new_inst = ({CallbackSingle_t=nil, healTimer=nil, caster=nil, sfx=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_Hibernate, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate(this105, __wurst_stackPos121) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos121
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this105.healTimer, "when calling destroyCallbackPeriodic in Hibernate, line 86")
	unit_unpause(this105.caster, "when calling unpause in Hibernate, line 87")
	unit_setPathing(this105.caster, true, "when calling setPathing in Hibernate, line 88")
	unit_setArmor(this105.caster, (unit_getArmor(this105.caster, "when calling getArmor in Hibernate, line 89") - Hibernate_ARMOR_BONUS), "when calling setArmor in Hibernate, line 89")
	__wurst_safe_UnitRemoveAbility(this105.caster, Hibernate_HIBERNATE_BUFF_ID)
	effect_destr(this105.sfx, "when calling destr in Hibernate, line 91")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_InitFocusCamera:create26() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_InitFocusCamera, }))
	return new_inst
end

function CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera(this107, __wurst_stackPos123) 
	local tree = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos123
	wurst_stack_depth = (wurst_stack_depth + 1)
	tree = gg_unit_etol_0001
	if (GetLocalPlayer() == Player(0)) then
		PanCameraToTimed(unit_getX(tree, "when calling getX in InitFocusCamera, line 10"), unit_getY(tree, "when calling getY in InitFocusCamera, line 10"), 0.)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_Invigorate:create27() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_Invigorate, }))
	return new_inst
end

function CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate(this110, __wurst_stackPos126) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos126
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount > 0) then
		Invigorate_seedlingCount = (Invigorate_seedlingCount - 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator:create28() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=LLBackIterator, }))
	return new_inst
end

function LLBackIterator_destroyLLBackIterator(this111, __wurst_stackPos127) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos127
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLBackIterator_LLBackIterator_onDestroy(this111, "when calling LLBackIterator_onDestroy in LinkedList, line 499")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator_LLBackIterator_onDestroy(this112, __wurst_stackPos128) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos128
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry:create29() 
	local new_inst = ({LLEntry_elem=nil, LLEntry_prev=nil, LLEntry_next=nil, })
	setmetatable(new_inst, ({__index=LLEntry, }))
	return new_inst
end

function LLEntry_new_LLEntry(elem, prev, next, __wurst_stackPos129) 
	local this113 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos129
	wurst_stack_depth = (wurst_stack_depth + 1)
	this113 = LLEntry:create29()
	LLEntry_construct_LLEntry(this113, elem, prev, next, "when calling construct_LLEntry in LinkedList, line 433")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this113
end

function LLEntry_destroyLLEntry(this115, __wurst_stackPos131) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos131
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_onDestroy(this115, "when calling LLEntry_onDestroy in LinkedList, line 428")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_init(this117, __wurst_stackPos133) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos133
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_construct_LLEntry(this114, elem1, prev1, next1, __wurst_stackPos130) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos130
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_init(this114, "when calling LLEntry_init in LinkedList, line 433")
	this114.LLEntry_elem = elem1
	this114.LLEntry_prev = prev1
	this114.LLEntry_next = next1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_onDestroy(this116, __wurst_stackPos132) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos132
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator:create30() 
	local new_inst = ({LLIterator_dummy=nil, LLIterator_current=nil, LLIterator_parent=nil, LLIterator_destroyOnClose=false, })
	setmetatable(new_inst, ({__index=LLIterator, }))
	return new_inst
end

function LLIterator_LLIterator_next(this118, __wurst_stackPos134) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos134
	wurst_stack_depth = (wurst_stack_depth + 1)
	this118.LLIterator_current = this118.LLIterator_current.LLEntry_next
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this118.LLIterator_current.LLEntry_elem
end

function LLIterator_LLIterator_hasNext(this119, __wurst_stackPos135) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos135
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return not((this119.LLIterator_current.LLEntry_next == this119.LLIterator_dummy))
end

function LLIterator_LLIterator_close(this120, __wurst_stackPos136) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos136
	wurst_stack_depth = (wurst_stack_depth + 1)
	if this120.LLIterator_destroyOnClose then
		LLIterator_destroyLLIterator(this120, "when calling destroyLLIterator in LinkedList, line 497")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_reset(this122, __wurst_stackPos138) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos138
	wurst_stack_depth = (wurst_stack_depth + 1)
	this122.LLIterator_dummy = LinkedList_LinkedList_getDummy(this122.LLIterator_parent, "when calling getDummy in LinkedList, line 454")
	this122.LLIterator_current = this122.LLIterator_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_new_LLIterator(parent, __wurst_stackPos140) 
	local this124 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos140
	wurst_stack_depth = (wurst_stack_depth + 1)
	this124 = LLIterator:create30()
	LLIterator_construct_LLIterator(this124, parent, "when calling construct_LLIterator in LinkedList, line 444")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this124
end

function LLIterator_destroyLLIterator(this121, __wurst_stackPos137) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos137
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_onDestroy(this121, "when calling LLIterator_onDestroy in LinkedList, line 438")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_init(this127, __wurst_stackPos143) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos143
	wurst_stack_depth = (wurst_stack_depth + 1)
	this127.LLIterator_destroyOnClose = true
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_construct_LLIterator(this125, parent1, __wurst_stackPos141) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos141
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_init(this125, "when calling LLIterator_init in LinkedList, line 444")
	this125.LLIterator_parent = parent1
	LLIterator_LLIterator_reset(this125, "when calling reset in LinkedList, line 446")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_onDestroy(this126, __wurst_stackPos142) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos142
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList:create31() 
	local new_inst = ({LinkedList_dummy=nil, LinkedList_size=0, LinkedList_staticItr=nil, LinkedList_staticBackItr=nil, })
	setmetatable(new_inst, ({__index=LinkedList, }))
	return new_inst
end

function LinkedList_LinkedList_add(this128, __wurst_stackPos144, ...) 
	local entry = nil
	local elem2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos144
	wurst_stack_depth = (wurst_stack_depth + 1)
	local __args = table.pack(...)
	for i3=1,__args.n do
	elem2 = __args[i3]
	entry = LLEntry_new_LLEntry(elem2, this128.LinkedList_dummy.LLEntry_prev, this128.LinkedList_dummy, "when calling new_LLEntry in LinkedList, line 39")
	this128.LinkedList_dummy.LLEntry_prev.LLEntry_next = entry
	this128.LinkedList_dummy.LLEntry_prev = entry
	this128.LinkedList_size = (this128.LinkedList_size + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_iterator(this129, __wurst_stackPos145) 
	local stackTrace_tempReturn = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos145
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = LLIterator_new_LLIterator(this129, "when calling new_LLIterator in LinkedList, line 179")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function LinkedList_new_LinkedList(__wurst_stackPos146) 
	local this130 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos146
	wurst_stack_depth = (wurst_stack_depth + 1)
	this130 = LinkedList:create31()
	LinkedList_construct_LinkedList2(this130, "when calling construct_LinkedList2 in LinkedList, line 31")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this130
end

function LinkedList_LinkedList_getDummy(this123, __wurst_stackPos139) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos139
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this123.LinkedList_dummy
end

function LinkedList_LinkedList_init(this132, __wurst_stackPos148) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos148
	wurst_stack_depth = (wurst_stack_depth + 1)
	this132.LinkedList_dummy = LLEntry_new_LLEntry(nil, nil, nil, "when calling new_LLEntry in LinkedList, line 18")
	this132.LinkedList_size = 0
	this132.LinkedList_staticItr = nil
	this132.LinkedList_staticBackItr = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_construct_LinkedList2(this131, __wurst_stackPos147) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos147
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_init(this131, "when calling LinkedList_init in LinkedList, line 31")
	this131.LinkedList_dummy.LLEntry_next = this131.LinkedList_dummy
	this131.LinkedList_dummy.LLEntry_prev = this131.LinkedList_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_onDestroy(this133, __wurst_stackPos149) 
	local current = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos149
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((this133.LinkedList_staticItr == nil)) then
		LLIterator_destroyLLIterator(this133.LinkedList_staticItr, "when calling destroyLLIterator in LinkedList, line 413")
	end
	if not((this133.LinkedList_staticBackItr == nil)) then
		LLBackIterator_destroyLLBackIterator(this133.LinkedList_staticBackItr, "when calling destroyLLBackIterator in LinkedList, line 415")
	end
	current = this133.LinkedList_dummy.LLEntry_next
	while true do
		if not(not((current == this133.LinkedList_dummy))) then
			break
		end
		current = current.LLEntry_next
		LLEntry_destroyLLEntry(current.LLEntry_prev, "when calling destroyLLEntry in LinkedList, line 419")
	end
	LLEntry_destroyLLEntry(this133.LinkedList_dummy, "when calling destroyLLEntry in LinkedList, line 420")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_destroyLinkedList(this134, __wurst_stackPos150) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos150
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_onDestroy(this134, "when calling LinkedList_onDestroy in LinkedList, line 411")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator:create32() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=IdGenerator, }))
	return new_inst
end

function IdGenerator_new_IdGenerator(start, __wurst_stackPos151) 
	local this135 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos151
	wurst_stack_depth = (wurst_stack_depth + 1)
	this135 = IdGenerator:create32()
	IdGenerator_construct_IdGenerator(this135, start, "when calling construct_IdGenerator in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this135
end

function IdGenerator_IdGenerator_init(this137, __wurst_stackPos153) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos153
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator_construct_IdGenerator(this136, start1, __wurst_stackPos152) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos152
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_IdGenerator_init(this136, "when calling IdGenerator_init in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_OnUnitEnterLeave:create33() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_OnUnitEnterLeave, }))
	return new_inst
end

function CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave(this138, __wurst_stackPos154) 
	local receiver14 = nil
	local count = nil
	local i4 = nil
	local temp3 = nil
	local receiver15 = nil
	local receiver16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos154
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
	i4 = 0
	temp3 = (count - 1)
	while true do
		if (i4 > temp3) then
			break
		end
		prepareUnit(group_get(OnUnitEnterLeave_preplacedUnits, i4, "when calling get in OnUnitEnterLeave, line 82"), "when calling prepareUnit in OnUnitEnterLeave, line 82")
		i4 = (i4 + 1)
	end
	receiver15 = OnUnitEnterLeave_preplacedUnits
	group_clear(receiver15, "when calling clear in OnUnitEnterLeave, line 83")
	receiver16 = receiver15
	group_destr(receiver16, "when calling destr in OnUnitEnterLeave, line 83")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback_forEachFrom_Preloader:create34() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback_forEachFrom_Preloader, }))
	return new_inst
end

function ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader(this141, u6, __wurst_stackPos159) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos159
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(u6, "when calling remove in Preloader, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_Preloader:create35() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_Preloader, }))
	return new_inst
end

function CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader(this142, __wurst_stackPos160) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos160
	wurst_stack_depth = (wurst_stack_depth + 1)
	finishPreload("when calling finishPreload in Preloader, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_Recycle:create36() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_Recycle, }))
	return new_inst
end

function EventListener_add_Recycle_onEvent_add_Recycle(this143, __wurst_stackPos162) 
	local dying = nil
	local pos4 = ({0., 0., })
	local closest = nil
	local closestDist = nil
	local iterator2 = nil
	local u7 = nil
	local dist = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos162
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

function OnCastListener_onCast_SeedBurst:create37() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SeedBurst, }))
	return new_inst
end

function OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst(this145, caster5, __wurst_stackPos166) 
	local targets = nil
	local iterator3 = nil
	local u8 = nil
	local delay = nil
	local iterator4 = nil
	local wrapper = nil
	local explodePos = ({0., 0., })
	local clVar3 = nil
	local iterator5 = nil
	local wrapper1 = nil
	local temp102 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos166
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
		clVar3 = CallbackSingle_doAfter_onCast_SeedBurst:create38()
		CallbackSingle_construct_CallbackSingle(clVar3, "when calling construct_CallbackSingle in SeedBurst, line 64")
		clVar3.explodePos = tupleCopy(explodePos)
		clVar3.caster = caster5
		doAfter(temp102, clVar3, "when calling doAfter in SeedBurst, line 64")
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

function CallbackSingle_doAfter_onCast_SeedBurst:create38() 
	local new_inst = ({CallbackSingle_t=nil, explodePos=({0., 0., }), caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SeedBurst, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst(this148, __wurst_stackPos170) 
	local iterator6 = nil
	local u9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos170
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect1(SeedBurst_BURST_SFX, this148.explodePos, "when calling flashEffect in SeedBurst, line 65")
	flashEffect1(SeedBurst_EXPLOSION_SFX, this148.explodePos, "when calling flashEffect in SeedBurst, line 66")
	group_enumUnitsInRange(Group_ENUM_GROUP, this148.explodePos, SeedBurst_BURST_RADIUS, nil, "when calling enumUnitsInRange in SeedBurst, line 67")
	iterator6 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SeedBurst, line 68")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator6, "when calling hasNext in SeedBurst, line 68")) then
			break
		end
		u9 = GroupIterator_GroupIterator_next(iterator6, "when calling next in SeedBurst, line 68")
		if (unit_isAlive(u9, "when calling isAlive in SeedBurst, line 69") and player_isEnemyOf(unit_getOwner(u9, "when calling getOwner in SeedBurst, line 69"), unit_getOwner(this148.caster, "when calling getOwner in SeedBurst, line 69"), "when calling isEnemyOf in SeedBurst, line 69")) then
			unit_damageTarget(this148.caster, u9, SeedBurst_BURST_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in SeedBurst, line 70")
		end
	end
	GroupIterator_GroupIterator_close(iterator6, "when calling close in SeedBurst, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper:create39() 
	local new_inst = ({Vec2Wrapper_pos=({0., 0., }), })
	setmetatable(new_inst, ({__index=Vec2Wrapper, }))
	return new_inst
end

function Vec2Wrapper_Vec2Wrapper_init(this151, __wurst_stackPos174) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos174
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_new_Vec2Wrapper(p4, __wurst_stackPos167) 
	local this152 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos167
	wurst_stack_depth = (wurst_stack_depth + 1)
	this152 = Vec2Wrapper:create39()
	Vec2Wrapper_construct_Vec2Wrapper(this152, p4, "when calling construct_Vec2Wrapper in SeedBurst, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this152
end

function Vec2Wrapper_construct_Vec2Wrapper(this153, p6, __wurst_stackPos175) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos175
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_init(this153, "when calling Vec2Wrapper_init in SeedBurst, line 21")
	this153.Vec2Wrapper_pos = tupleCopy(p6)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_Vec2Wrapper_onDestroy(this154, __wurst_stackPos176) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos176
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_destroyVec2Wrapper(this147, __wurst_stackPos169) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos169
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_onDestroy(this147, "when calling Vec2Wrapper_onDestroy in SeedBurst, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_addListener_ShieldBash:create40() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener_addListener_ShieldBash, }))
	return new_inst
end

function DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash(this155, __wurst_stackPos177) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos177
	wurst_stack_depth = (wurst_stack_depth + 1)
	onDamageTaken("when calling onDamageTaken in ShieldBash, line 86")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_SpiritWisps:create41() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SpiritWisps, }))
	return new_inst
end

function OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps(this156, caster6, __wurst_stackPos179) 
	local wisps = nil
	local i5 = nil
	local temp4 = nil
	local startAngle = nil
	local spawnPos = ({0., 0., })
	local wisp = nil
	local moveTimer = nil
	local clVar4 = nil
	local healTimer1 = nil
	local clVar5 = nil
	local clVar6 = nil
	local temp103 = nil
	local temp104 = nil
	local temp105 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos179
	wurst_stack_depth = (wurst_stack_depth + 1)
	wisps = LinkedList_new_LinkedList("when calling new_LinkedList in SpiritWisps, line 66")
	i5 = 0
	temp4 = (SpiritWisps_WISP_COUNT - 1)
	while true do
		if (i5 > temp4) then
			break
		end
		startAngle = (((2. * bj_PI) * int_toReal(i5, "when calling toReal in SpiritWisps, line 68")) / int_toReal(SpiritWisps_WISP_COUNT, "when calling toReal in SpiritWisps, line 68"))
		spawnPos = tupleCopy(vec2_polarOffset(unit_getPos(caster6, "when calling getPos in SpiritWisps, line 69"), ({startAngle, }), SpiritWisps_ORBIT_RADIUS, "when calling polarOffset in SpiritWisps, line 69"))
		wisp = createUnit(unit_getOwner(caster6, "when calling getOwner in SpiritWisps, line 70"), SpiritWisps_WISP_UNIT_ID, spawnPos, ({0., }), "when calling createUnit in SpiritWisps, line 70")
		unit_addAbility(wisp, 1097625443, "when calling addAbility in SpiritWisps, line 71")
		unit_setVertexColor(wisp, 50, 255, 50, 255, "when calling setVertexColor in SpiritWisps, line 72")
		widget_addEffect(wisp, "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes2.mdl", "origin", "when calling addEffect in SpiritWisps, line 74")
		LinkedList_LinkedList_add(wisps, "when calling add in SpiritWisps, line 75", __wurst_objectToIndex(wisp))
		i5 = (i5 + 1)
	end
	temp103 = SpiritWisps_UPDATE_INTERVAL
	clVar4 = CallbackPeriodic_doPeriodically_onCast_SpiritWisps:create42()
	CallbackPeriodic_construct_CallbackPeriodic(clVar4, "when calling construct_CallbackPeriodic in SpiritWisps, line 78")
	clVar4.wisps = wisps
	clVar4.caster = caster6
	moveTimer = doPeriodically(temp103, clVar4, "when calling doPeriodically in SpiritWisps, line 78")
	temp104 = SpiritWisps_HEAL_INTERVAL
	clVar5 = CallbackPeriodic_doPeriodically_onCast_SpiritWisps1:create43()
	CallbackPeriodic_construct_CallbackPeriodic(clVar5, "when calling construct_CallbackPeriodic in SpiritWisps, line 118")
	clVar5.caster = caster6
	healTimer1 = doPeriodically(temp104, clVar5, "when calling doPeriodically in SpiritWisps, line 118")
	temp105 = SpiritWisps_WISP_DURATION
	clVar6 = CallbackSingle_doAfter_onCast_SpiritWisps:create44()
	CallbackSingle_construct_CallbackSingle(clVar6, "when calling construct_CallbackSingle in SpiritWisps, line 126")
	clVar6.moveTimer = moveTimer
	clVar6.healTimer = healTimer1
	clVar6.wisps = wisps
	clVar6.caster = caster6
	doAfter(temp105, clVar6, "when calling doAfter in SpiritWisps, line 126")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps:create42() 
	local new_inst = ({CallbackPeriodic_t=nil, wisps=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_SpiritWisps, }))
	return new_inst
end

function tupleCopy1(t) 
	return ({t[1], })
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps(this162, cb5, __wurst_stackPos185) 
	local iterator7 = nil
	local wisp1 = nil
	local casterPos = ({0., 0., })
	local nearestInjured = nil
	local nearestDist = nil
	local iterator8 = nil
	local u10 = nil
	local dist2 = nil
	local targetPos = ({0., 0., })
	local randomAngle = ({0., })
	local randomDist = nil
	local moveDir = ({0., })
	local moveSpeed = nil
	local newPos = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos185
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterator7 = LinkedList_LinkedList_iterator(this162.wisps, "when calling iterator in SpiritWisps, line 79")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator7, "when calling hasNext in SpiritWisps, line 79")) then
			break
		end
		wisp1 = __wurst_objectFromIndex(intEnsure(LLIterator_LLIterator_next(iterator7, "when calling next in SpiritWisps, line 79")))
		casterPos = tupleCopy(unit_getPos(this162.caster, "when calling getPos in SpiritWisps, line 80"))
		nearestInjured = nil
		nearestDist = 99999.
		group_enumUnitsInRange(Group_ENUM_GROUP, casterPos, SpiritWisps_WISP_RADIUS, nil, "when calling enumUnitsInRange in SpiritWisps, line 85")
		iterator8 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SpiritWisps, line 86")
		while true do
			if not(GroupIterator_GroupIterator_hasNext(iterator8, "when calling hasNext in SpiritWisps, line 86")) then
				break
			end
			u10 = GroupIterator_GroupIterator_next(iterator8, "when calling next in SpiritWisps, line 86")
			if ((unit_isAlive(u10, "when calling isAlive in SpiritWisps, line 87") and player_isAllyOf(unit_getOwner(u10, "when calling getOwner in SpiritWisps, line 87"), unit_getOwner(this162.caster, "when calling getOwner in SpiritWisps, line 87"), "when calling isAllyOf in SpiritWisps, line 87")) and (unit_getHP(u10, "when calling getHP in SpiritWisps, line 87") < unit_getMaxHP(u10, "when calling getMaxHP in SpiritWisps, line 87"))) then
				dist2 = vec2_distanceTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 88"), unit_getPos(u10, "when calling getPos in SpiritWisps, line 88"), "when calling distanceTo in SpiritWisps, line 88")
				if (dist2 < nearestDist) then
					nearestDist = dist2
					nearestInjured = u10
				end
			end
		end
		GroupIterator_GroupIterator_close(iterator8, "when calling close in SpiritWisps, line 86")
		if not((nearestInjured == nil)) then
			targetPos = tupleCopy(vec2_polarOffset(unit_getPos(nearestInjured, "when calling getPos in SpiritWisps, line 96"), vec2_angleTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 97"), unit_getPos(nearestInjured, "when calling getPos in SpiritWisps, line 97"), "when calling angleTo in SpiritWisps, line 97"), -(50.), "when calling polarOffset in SpiritWisps, line 96"))
		else
			randomAngle = ({GetRandomReal(0., (2. * bj_PI)), })
			randomDist = GetRandomReal(50., SpiritWisps_ORBIT_RADIUS)
			targetPos = tupleCopy(vec2_polarOffset(casterPos, randomAngle, randomDist, "when calling polarOffset in SpiritWisps, line 104"))
		end
		moveDir = tupleCopy1(vec2_angleTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 107"), targetPos, "when calling angleTo in SpiritWisps, line 107"))
		moveSpeed = (200. * SpiritWisps_UPDATE_INTERVAL)
		newPos = tupleCopy(vec2_polarOffset(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 109"), moveDir, moveSpeed, "when calling polarOffset in SpiritWisps, line 109"))
		if (vec2_distanceTo(newPos, casterPos, "when calling distanceTo in SpiritWisps, line 112") > SpiritWisps_WISP_RADIUS) then
			unit_setXY(wisp1, vec2_polarOffset(casterPos, vec2_angleTo(newPos, casterPos, "when calling angleTo in SpiritWisps, line 113"), (-(SpiritWisps_WISP_RADIUS) + 20.), "when calling polarOffset in SpiritWisps, line 113"), "when calling setXY in SpiritWisps, line 113")
		else
			unit_setXY(wisp1, newPos, "when calling setXY in SpiritWisps, line 115")
		end
	end
	LLIterator_LLIterator_close(iterator7, "when calling close in SpiritWisps, line 79")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps1:create43() 
	local new_inst = ({CallbackPeriodic_t=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_SpiritWisps1, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1(this166, cb6, __wurst_stackPos189) 
	local iterator9 = nil
	local u11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos189
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRange(Group_ENUM_GROUP, unit_getPos(this166.caster, "when calling getPos in SpiritWisps, line 119"), SpiritWisps_WISP_RADIUS, nil, "when calling enumUnitsInRange in SpiritWisps, line 119")
	iterator9 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SpiritWisps, line 120")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator9, "when calling hasNext in SpiritWisps, line 120")) then
			break
		end
		u11 = GroupIterator_GroupIterator_next(iterator9, "when calling next in SpiritWisps, line 120")
		if ((unit_isAlive(u11, "when calling isAlive in SpiritWisps, line 121") and player_isAllyOf(unit_getOwner(u11, "when calling getOwner in SpiritWisps, line 121"), unit_getOwner(this166.caster, "when calling getOwner in SpiritWisps, line 121"), "when calling isAllyOf in SpiritWisps, line 121")) and (unit_getHP(u11, "when calling getHP in SpiritWisps, line 121") < unit_getMaxHP(u11, "when calling getMaxHP in SpiritWisps, line 121"))) then
			unit_addHP(u11, SpiritWisps_WISP_HEAL, "when calling addHP in SpiritWisps, line 122")
			flashEffect("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u11, "origin", "when calling flashEffect in SpiritWisps, line 123")
		end
	end
	GroupIterator_GroupIterator_close(iterator9, "when calling close in SpiritWisps, line 120")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_SpiritWisps:create44() 
	local new_inst = ({CallbackSingle_t=nil, moveTimer=nil, healTimer=nil, wisps=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SpiritWisps, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps(this167, __wurst_stackPos190) 
	local iterator10 = nil
	local wisp2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos190
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this167.moveTimer, "when calling destroyCallbackPeriodic in SpiritWisps, line 127")
	CallbackPeriodic_destroyCallbackPeriodic(this167.healTimer, "when calling destroyCallbackPeriodic in SpiritWisps, line 128")
	iterator10 = LinkedList_LinkedList_iterator(this167.wisps, "when calling iterator in SpiritWisps, line 129")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator10, "when calling hasNext in SpiritWisps, line 129")) then
			break
		end
		wisp2 = __wurst_objectFromIndex(intEnsure(LLIterator_LLIterator_next(iterator10, "when calling next in SpiritWisps, line 129")))
		unit_kill(wisp2, "when calling kill in SpiritWisps, line 130")
	end
	LLIterator_LLIterator_close(iterator10, "when calling close in SpiritWisps, line 129")
	LinkedList_destroyLinkedList(this167.wisps, "when calling destroyLinkedList in SpiritWisps, line 131")
	__wurst_safe_UnitRemoveAbility(this167.caster, SpiritWisps_WISP_BUFF_ID)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table:create45() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=Table, }))
	return new_inst
end

function Table_Table_hasInt(this85, parentKey, __wurst_stackPos97) 
	local stackTrace_tempReturn1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos97
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = hashtable_hasInt(Table_ht, __wurst_objectToIndex(this85), parentKey, "when calling hasInt in Table, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function Table_Table_hasString(this169, parentKey5, __wurst_stackPos192) 
	local stackTrace_tempReturn2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos192
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = hashtable_hasString(Table_ht, __wurst_objectToIndex(this169), parentKey5, "when calling hasString in Table, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function Table_Table_removeInt(this88, parentKey3, __wurst_stackPos100) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos100
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_RemoveSavedInteger(Table_ht, __wurst_objectToIndex(this88), parentKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadInt(this87, parentKey2, __wurst_stackPos99) 
	local stackTrace_tempReturn3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos99
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = hashtable_loadInt(Table_ht, __wurst_objectToIndex(this87), parentKey2, "when calling loadInt in Table, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function Table_Table_saveInt(this86, parentKey1, value1, __wurst_stackPos98) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos98
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveInt(Table_ht, __wurst_objectToIndex(this86), parentKey1, value1, "when calling saveInt in Table, line 44")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadString(this173, parentKey10, __wurst_stackPos196) 
	local stackTrace_tempReturn4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos196
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = hashtable_loadString(Table_ht, __wurst_objectToIndex(this173), parentKey10, "when calling loadString in Table, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function Table_Table_saveString(this175, parentKey12, value4, __wurst_stackPos198) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos198
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveString(Table_ht, __wurst_objectToIndex(this175), parentKey12, value4, "when calling saveString in Table, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadUnit(this177, parentKey14, __wurst_stackPos200) 
	local stackTrace_tempReturn5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos200
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = hashtable_loadUnitHandle(Table_ht, __wurst_objectToIndex(this177), parentKey14, "when calling loadUnitHandle in Table, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function Table_Table_loadTrigger(this179, parentKey16, __wurst_stackPos202) 
	local stackTrace_tempReturn6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos202
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = hashtable_loadTriggerHandle(Table_ht, __wurst_objectToIndex(this179), parentKey16, "when calling loadTriggerHandle in Table, line 113")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function Table_Table_saveFogState(this181, parentKey18, value6, __wurst_stackPos204) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos204
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveFogStateHandle(Table_ht, __wurst_objectToIndex(this181), parentKey18, value6, "when calling saveFogStateHandle in Table, line 170")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_init(this183, __wurst_stackPos206) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos206
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_new_Table(__wurst_stackPos207) 
	local this184 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos207
	wurst_stack_depth = (wurst_stack_depth + 1)
	this184 = Table:create45()
	Table_construct_Table(this184, "when calling construct_Table in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this184
end

function Table_construct_Table(this92, __wurst_stackPos104) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos104
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_init(this92, "when calling Table_init in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex:create46() 
	local new_inst = ({UnitIndex__unit=nil, })
	setmetatable(new_inst, ({__index=UnitIndex, }))
	return new_inst
end

function UnitIndex_new_UnitIndex(whichUnit2, __wurst_stackPos208) 
	local this185 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos208
	wurst_stack_depth = (wurst_stack_depth + 1)
	this185 = UnitIndex:create46()
	UnitIndex_construct_UnitIndex(this185, whichUnit2, "when calling construct_UnitIndex in UnitIndexer, line 175")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this185
end

function UnitIndex_destroyUnitIndex(this187, __wurst_stackPos210) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos210
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_onDestroy(this187, "when calling UnitIndex_onDestroy in UnitIndexer, line 182")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_init(this189, __wurst_stackPos212) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos212
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_construct_UnitIndex(this186, whichUnit3, __wurst_stackPos209) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos209
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_init(this186, "when calling UnitIndex_init in UnitIndexer, line 175")
	this186.UnitIndex__unit = whichUnit3
	unit_setUserData(this186.UnitIndex__unit, __wurst_objectToIndex(this186), "when calling setUserData in UnitIndexer, line 177")
	pushUnit(whichUnit3, "when calling pushUnit in UnitIndexer, line 178")
	trigger_evaluate(UnitIndexer_onIndexTrigger, "when calling evaluate in UnitIndexer, line 179")
	popUnit("when calling popUnit in UnitIndexer, line 180")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_onDestroy(this188, __wurst_stackPos211) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos211
	wurst_stack_depth = (wurst_stack_depth + 1)
	pushUnit(this188.UnitIndex__unit, "when calling pushUnit in UnitIndexer, line 183")
	trigger_evaluate(UnitIndexer_onDeindexTrigger, "when calling evaluate in UnitIndexer, line 184")
	popUnit("when calling popUnit in UnitIndexer, line 185")
	unit_setUserData(this188.UnitIndex__unit, 0, "when calling setUserData in UnitIndexer, line 186")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_UrsocCharge:create47() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_UrsocCharge, }))
	return new_inst
end

function OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge(this192, caster7, __wurst_stackPos217) 
	local target6 = nil
	local targetPos1 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos217
	wurst_stack_depth = (wurst_stack_depth + 1)
	target6 = EventData_getSpellTargetUnit("when calling getSpellTargetUnit in UrsocCharge, line 64")
	targetPos1 = tupleCopy(unit_getPos(target6, "when calling getPos in UrsocCharge, line 65"))
	unit_setXY(caster7, targetPos1, "when calling setXY in UrsocCharge, line 68")
	flashEffect1(UrsocCharge_CHARGE_SFX, targetPos1, "when calling flashEffect in UrsocCharge, line 70")
	flashEffect1(UrsocCharge_IMPACT_SFX, targetPos1, "when calling flashEffect in UrsocCharge, line 71")
	unit_damageTarget(caster7, target6, UrsocCharge_CHARGE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in UrsocCharge, line 73")
	InstantDummyCaster_castTarget(unit_getOwner(caster7, "when calling getOwner in UrsocCharge, line 84"), UrsocCharge_CHARGE_STUN_ID, 1, OrderIds_thunderbolt, target6, "when calling castTarget in UrsocCharge, line 84")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initGlobals(__wurst_stackPos218) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos218
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

function InitGlobals(__wurst_stackPos219) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos219
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

function Unit000003_DropItems(__wurst_stackPos220) 
	local trigWidget = nil
	local trigUnit = nil
	local itemID = nil
	local canDrop = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos220
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

function Unit000038_DropItems(__wurst_stackPos221) 
	local trigWidget1 = nil
	local trigUnit1 = nil
	local itemID1 = nil
	local canDrop1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos221
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

function Unit000043_DropItems(__wurst_stackPos222) 
	local trigWidget2 = nil
	local trigUnit2 = nil
	local itemID2 = nil
	local canDrop2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos222
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

function Unit000077_DropItems(__wurst_stackPos223) 
	local trigWidget3 = nil
	local trigUnit3 = nil
	local itemID3 = nil
	local canDrop3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos223
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

function Unit000080_DropItems(__wurst_stackPos224) 
	local trigWidget4 = nil
	local trigUnit4 = nil
	local itemID4 = nil
	local canDrop4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos224
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

function Unit000090_DropItems(__wurst_stackPos225) 
	local trigWidget5 = nil
	local trigUnit5 = nil
	local itemID5 = nil
	local canDrop5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos225
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

function Unit000097_DropItems(__wurst_stackPos226) 
	local trigWidget6 = nil
	local trigUnit6 = nil
	local itemID6 = nil
	local canDrop6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos226
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

function Unit000116_DropItems(__wurst_stackPos227) 
	local trigWidget7 = nil
	local trigUnit7 = nil
	local itemID7 = nil
	local canDrop7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos227
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigWidget7 = nil
	trigUnit7 = nil
	itemID7 = 0
	canDrop7 = true
	trigWidget7 = bj_lastDyingWidget
	if (trigWidget7 == nil) then
		trigUnit7 = GetTriggerUnit()
	end
	if not((trigUnit7 == nil)) then
		canDrop7 = not(__wurst_safe_IsUnitHidden(trigUnit7))
		if (canDrop7 and not((GetChangingUnit() == nil))) then
			canDrop7 = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
		end
	end
	if canDrop7 then
		RandomDistReset()
		RandomDistAddItem(1802529134, 100)
		itemID7 = RandomDistChoose()
		if not((trigUnit7 == nil)) then
			__wurst_safe_UnitDropItem(trigUnit7, itemID7)
		else
			__wurst_safe_WidgetDropItem(trigWidget7, itemID7)
		end
	end
	bj_lastDyingWidget = nil
	__wurst_safe_DestroyTrigger(GetTriggeringTrigger())
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer0(__wurst_stackPos228) 
	local p7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos228
	wurst_stack_depth = (wurst_stack_depth + 1)
	p7 = Player(0)
	gg_unit_etol_0001 = __wurst_safe_BlzCreateUnitWithSkin(p7, 1702129516, 1536.0, 18816.0, 270.000, 1702129516)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1701670775, 1056.0, 18848.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1700884333, 960.0, 18496.0, 270.000, 1700884333)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1852006768, -(4960.0), 15264.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1852006768, -(4768.0), 14624.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1852006775, -(3712.0), 15424.0, 270.000, 1852006775)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1852011628, -(5056.0), 14784.0, 270.000, 1852011628)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1852272482, -(3648.0), 12224.0, 270.000, 1852272482)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1852272482, -(2752.0), 12288.0, 270.000, 1852272482)
	__wurst_safe_BlzCreateUnitWithSkin(p7, 1852334958, -(1408.0), 24512.0, 270.000, 1852334958)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos229) 
	local p8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos229
	wurst_stack_depth = (wurst_stack_depth + 1)
	p8 = Player(0)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 784.9, 18019.4, 16.183, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 830.5, 18261.7, 202.847, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1702061422, 1253.8, 18323.4, 69.117, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1702061422, 1452.6, 18261.5, 192.530, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1160785971, 562.3, 18696.0, 73.677, 1160785971)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1164666213, 513.8, 18478.7, 152.000, 1164666213)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 608.8, 18306.6, 76.335, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656882, 571.0, 18062.6, 40.706, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1697656884, 1249.3, 18054.5, 235.137, 1697656884)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer1(__wurst_stackPos230) 
	local p9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos230
	wurst_stack_depth = (wurst_stack_depth + 1)
	p9 = Player(1)
	gg_unit_hwtw_0003 = __wurst_safe_BlzCreateUnitWithSkin(p9, 1752659063, -(3776.0), 13504.0, 270.000, 1752659063)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostileBuildings(__wurst_stackPos231) 
	local p10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos231
	wurst_stack_depth = (wurst_stack_depth + 1)
	p10 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	gg_unit_cp00_0005 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 2048.0, 16064.0, 270.000, 1668296752)
	gg_unit_cp00_0006 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 3776.0, 16576.0, 270.000, 1668296752)
	gg_unit_cp00_0007 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 5184.0, 21632.0, 270.000, 1668296752)
	gg_unit_cp00_0008 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 1536.0, 18496.0, 270.000, 1668296752)
	gg_unit_cp00_0009 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(1536.0), 24384.0, 270.000, 1668296752)
	gg_unit_cp00_0010 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(2560.0), 15808.0, 270.000, 1668296752)
	gg_unit_cp00_0011 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 3776.0, 24064.0, 270.000, 1668296752)
	gg_unit_cp00_0012 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(2368.0), 15872.0, 270.000, 1668296752)
	gg_unit_cp00_0013 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(4672.0), 15104.0, 270.000, 1668296752)
	gg_unit_cp00_0014 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 1216.0, 25408.0, 270.000, 1668296752)
	gg_unit_cp00_0015 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 3136.0, 21056.0, 270.000, 1668296752)
	gg_unit_cp00_0016 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(1984.0), 17600.0, 270.000, 1668296752)
	gg_unit_cp00_0017 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, -(768.0), 15680.0, 270.000, 1668296752)
	gg_unit_cp00_0018 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 3584.0, 17792.0, 270.000, 1668296752)
	gg_unit_cp00_0019 = __wurst_safe_BlzCreateUnitWithSkin(p10, 1668296752, 1984.0, 23616.0, 270.000, 1668296752)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostile(__wurst_stackPos232) 
	local p11 = nil
	local u13 = nil
	local t = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos232
	wurst_stack_depth = (wurst_stack_depth + 1)
	p11 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	u13 = nil
	t = nil
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 3547.0, 17990.4, 276.937, 1852207724)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 3171.4, 17736.4, 345.886, 1852207724)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207731, 3461.6, 17743.1, 123.208, 1852207731)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853059186, -(601.9), 15842.7, 45.652, 1853059186)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853059186, -(441.8), 15709.0, 37.961, 1853059186)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853056884, -(685.1), 15994.3, 331.709, 1853056884)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125236, 752.7, 15437.6, 54.470, 1853125236)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060200, -(3068.1), 15720.9, 41.299, 1853060200)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060204, -(2914.0), 15705.1, 117.876, 1853060204)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060204, -(2942.3), 15901.5, 200.770, 1853060204)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060204, -(3143.7), 15962.8, 75.566, 1853060204)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(2769.0), 15781.0, 187.268, 1853060211)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(2761.8), 15965.6, 280.742, 1853060211)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(2911.5), 16077.4, 109.405, 1853060211)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853060211, -(3158.1), 16053.8, 145.079, 1853060211)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320295, -(2215.5), 17326.7, 30.504, 1853320295)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320308, -(862.5), 18846.5, 221.719, 1853320308)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320308, -(797.1), 18750.3, 215.273, 1853320308)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207713, 3607.2, 16191.4, 84.573, 1852207713)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000038_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 3726.7, 16407.2, 82.999, 1852207724)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 3576.1, 16479.6, 42.384, 1852207724)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207724, 3943.7, 16433.0, 147.349, 1852207724)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207717, 4047.8, 16575.1, 195.989, 1852207717)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270642, 2121.8, 15996.0, 143.210, 1852270642)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000043_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270641, 1888.5, 16089.0, 179.640, 1852270641)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270641, 1925.2, 15856.2, 110.286, 1852270641)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852270641, 2188.1, 16254.1, 153.903, 1852270641)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1848651824, 422.5, -(52.9), 184.565, 1848651824)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125235, 524.2, 15166.0, 31.928, 1853125235)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125235, 626.6, 15115.1, 79.127, 1853125235)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853125235, 843.3, 15349.5, 40.610, 1853125235)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(1933.6), 23799.9, 64.932, 1852662375)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(1753.1), 23778.5, 121.334, 1852662375)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(2064.0), 23952.7, 314.984, 1852662375)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(2003.8), 24140.9, 309.917, 1852662375)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(1624.7), 23872.9, 154.000, 1852662375)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(1689.4), 24200.1, 238.030, 1852662375)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852662375, -(1867.5), 24208.6, 257.251, 1852662375)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852340580, 1444.9, 25433.8, 200.087, 1852340580)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000080_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852666999, -(1563.2), 23947.3, 186.648, 1852666999)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852666999, -(1591.2), 24115.3, 205.128, 1852666999)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852666723, -(1487.9), 24031.3, 184.270, 1852666723)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000077_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853056872, 1030.7, 25674.5, 271.491, 1853056872)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853056872, 913.6, 25301.9, 77.603, 1853056872)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853318510, 2758.1, 22874.2, 242.161, 1853318510)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207728, 2802.6, 22698.5, 164.835, 1852207728)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207728, 2707.6, 22558.6, 96.867, 1852207728)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207203, 1818.5, 23747.5, 260.600, 1852207203)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000090_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207220, 1764.0, 23330.2, 88.849, 1852207220)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207220, 1789.6, 23579.7, 261.892, 1852207220)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207219, 2058.1, 23408.4, 175.542, 1852207219)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852207219, 1557.9, 23541.6, 352.364, 1852207219)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320801, 2885.7, 22493.5, 125.320, 1853320801)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000097_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4900.5, 21637.4, 284.950, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4947.2, 21584.4, 133.894, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4991.0, 21639.5, 341.619, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 5025.5, 21698.5, 38.442, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 4923.9, 21729.4, 280.654, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 5261.6, 21483.7, 266.196, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 5339.8, 21456.6, 332.973, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 5316.8, 21555.5, 347.146, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852008242, 5399.3, 21563.6, 297.460, 1852008242)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1316252014, 5024.0, 21516.2, 18.400, 1316252014)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000003_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1851876471, 3648.4, 24134.3, 223.727, 1851876471)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1851876471, 3532.9, 24270.9, 240.700, 1851876471)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1851876471, 3777.2, 24005.4, 202.447, 1851876471)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1851876466, 3844.8, 24200.3, 232.760, 1851876466)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u13, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000116_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1851876459, 3970.0, 24084.2, 193.369, 1851876459)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1851876459, 3699.7, 24421.6, 256.144, 1851876459)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320292, -(1022.1), 18915.0, 248.167, 1853320292)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320295, -(2226.6), 17160.2, 74.291, 1853320295)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320308, -(1282.8), 18852.5, 295.913, 1853320308)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320308, -(1218.6), 18939.2, 293.176, 1853320308)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1853320295, -(2407.3), 17351.3, 2.949, 1853320295)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852404840, 4621.8, 19915.2, 265.540, 1852404840)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852404855, 4808.5, 20103.9, 264.118, 1852404855)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852404852, 4626.4, 19796.2, 271.836, 1852404852)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852404852, 4969.3, 19861.1, 266.265, 1852404852)
	u13 = __wurst_safe_BlzCreateUnitWithSkin(p11, 1852404852, 4802.8, 19770.0, 261.087, 1852404852)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassiveBuildings(__wurst_stackPos233) 
	local p12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos233
	wurst_stack_depth = (wurst_stack_depth + 1)
	p12 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852207665, 3328.0, 16576.0, 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852207666, 4224.0, 16704.0, 270.000, 1852207666)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852207665, 3328.0, 18048.0, 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, -(864.0), 24224.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, -(2208.0), 24288.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, -(2336.0), 24096.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852206952, 1472.0, 25728.0, 270.000, 1852206952)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(2400.0), 23712.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(2144.0), 23712.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(1184.0), 24352.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(2592.0), 23968.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, -(2144.0), 23392.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663601, 1184.0, 25760.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, 1248.0, 25120.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, 1056.0, 25120.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852663600, 1440.0, 25184.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853122608, 1536.0, 23680.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853122608, 2176.0, 23552.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852076661, 4096.0, 24448.0, 270.000, 1852076661)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853122609, 5024.0, 20064.0, 270.000, 1853122609)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853122608, 4544.0, 20096.0, 270.000, 1853122608)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassive(__wurst_stackPos234) 
	local p13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos234
	wurst_stack_depth = (wurst_stack_depth + 1)
	p13 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1848651826, 5154.2, 21381.0, 326.524, 1848651826)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1848651826, 4749.7, 21508.9, 280.654, 1848651826)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1848651826, 5010.6, 21875.8, 325.117, 1848651826)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos235) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos235
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateBuildingsForPlayer0("when calling CreateBuildingsForPlayer0 in war3map, line 625")
	CreateBuildingsForPlayer1("when calling CreateBuildingsForPlayer1 in war3map, line 626")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos236) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos236
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 631")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos237) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos237
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateNeutralHostileBuildings("when calling CreateNeutralHostileBuildings in war3map, line 636")
	CreateNeutralPassiveBuildings("when calling CreateNeutralPassiveBuildings in war3map, line 637")
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 638")
	CreateNeutralHostile("when calling CreateNeutralHostile in war3map, line 639")
	CreateNeutralPassive("when calling CreateNeutralPassive in war3map, line 640")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 641")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateRegions(__wurst_stackPos238) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos238
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_rct_Region_000 = Rect(-(4960.0), -(6336.0), -(4512.0), -(5984.0))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_init_Actions(__wurst_stackPos239) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos239
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

function InitTrig_init(__wurst_stackPos240) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos240
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_init = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_init, function (...) 
			xpcall(function (...) 
					bridge_Trig_init_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomTriggers(__wurst_stackPos241) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos241
	wurst_stack_depth = (wurst_stack_depth + 1)
	InitTrig_init("when calling InitTrig_init in war3map, line 693")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function RunInitializationTriggers(__wurst_stackPos242) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos242
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
	HeroTrainer_TAVERN_ID = 0
	Hibernate_HIBERNATE_ID = 0
	Hibernate_HIBERNATE_BUFF_ID = 0
	Hibernate_HIBERNATE_DURATION = 0.
	Hibernate_HEAL_INTERVAL = 0.
	Hibernate_ARMOR_BONUS = 0.
	Hibernate_HP_PCT = defaultArray(function () 
			return 0.
		end)
	Hibernate_HP_FLAT = defaultArray(function () 
			return 0.
		end)
	InstantDummyCaster_DUMMY_CASTER_UNIT_ID = 0
	InstantDummyCaster_DUMMY_ROOT_ABIL_ID = 0
	InstantDummyCaster_caster = nil
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
	OrderIds_rejuvination = 0
	OrderIds_thunderbolt = 0
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
	SpiritWisps_SPIRIT_WISPS_ID = 0
	SpiritWisps_WISP_BUFF_ID = 0
	SpiritWisps_WISP_UNIT_ID = 0
	SpiritWisps_WISP_COUNT = 0
	SpiritWisps_WISP_DURATION = 0.
	SpiritWisps_WISP_HEAL = 0.
	SpiritWisps_WISP_RADIUS = 0.
	SpiritWisps_HEAL_INTERVAL = 0.
	SpiritWisps_ORBIT_RADIUS = 0.
	SpiritWisps_UPDATE_INTERVAL = 0.
	StringUtils_c2s = defaultArray(function () 
			return ""
		end)
	StringUtils_MAX_INDEX = 0
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
	UnitIds_wisp = 0
	UnitIndexer_onIndexTrigger = nil
	UnitIndexer_onDeindexTrigger = nil
	UnitIndexer_tempUnits = defaultArray(function () 
			return nil
		end)
	UnitIndexer_tempUnitsCount = 0
	UrsocCharge_URSOC_CHARGE_ID = 0
	UrsocCharge_CHARGE_STUN_ID = 0
	UrsocCharge_CHARGE_DAMAGE = 0.
	UrsocCharge_CHARGE_SFX = ""
	UrsocCharge_IMPACT_SFX = ""
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
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
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
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Bloom.call = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Bloom.__wurst_supertypes = ({[CallbackSingle_doAfter_Bloom] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_Bloom.__typeId__ = 7
	OnCastListener_onCast_Bloom.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.__wurst_supertypes = ({[OnCastListener_onCast_Bloom] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Bloom.__typeId__ = 38
	OnCastListener_onCast_CenariusCharacter.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter.__typeId__ = 39
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter1.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter1
	OnCastListener_onCast_CenariusCharacter1.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter1] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter1.__typeId__ = 40
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_call = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_call = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_CenariusCharacter_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CenariusCharacter.call = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.call1 = CallbackSingle_doAfter_onCast_CenariusCharacter_call_doAfter_onCast_CenariusCharacter
	CallbackSingle_doAfter_onCast_CenariusCharacter.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CenariusCharacter.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_CenariusCharacter] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_CenariusCharacter.__typeId__ = 10
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_call = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
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
	CallbackSingle_nullTimer_ClosureEvents.__typeId__ = 14
	EventListener.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener.destroyEventListener = EventListener_destroyEventListener
	EventListener.__wurst_supertypes = ({[EventListener] = true, })
	EventListener.__typeId__ = 21
	OnCastListener.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.__wurst_supertypes = ({[OnCastListener] = true, })
	OnCastListener.__typeId__ = 37
	ForGroupCallback.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.__wurst_supertypes = ({[ForGroupCallback] = true, })
	ForGroupCallback.__typeId__ = 28
	ForGroupCallbackUntil.__wurst_supertypes = ({[ForGroupCallbackUntil] = true, })
	ForGroupCallbackUntil.__typeId__ = 30
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
	CallbackSingle.__typeId__ = 6
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.__wurst_supertypes = ({[EventListener_add_DamageEvent] = true, [EventListener] = true, })
	EventListener_add_DamageEvent.__typeId__ = 22
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.__wurst_supertypes = ({[EventListener_add_DamageEvent1] = true, [EventListener] = true, })
	EventListener_add_DamageEvent1.__typeId__ = 23
	DamageElement.__wurst_supertypes = ({[DamageElement] = true, })
	DamageElement.__typeId__ = 17
	DamageInstance.DamageInstance_DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.DamageInstance_destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.__wurst_supertypes = ({[DamageInstance] = true, })
	DamageInstance.__typeId__ = 18
	DamageListener.__wurst_supertypes = ({[DamageListener] = true, })
	DamageListener.__typeId__ = 19
	ForForceCallback.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.__wurst_supertypes = ({[ForForceCallback] = true, })
	ForForceCallback.__typeId__ = 26
	ForForceCallback_execute_GroupUtils.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.ForForceCallback_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.__wurst_supertypes = ({[ForForceCallback_execute_GroupUtils] = true, [ForForceCallback] = true, })
	ForForceCallback_execute_GroupUtils.__typeId__ = 27
	GroupIterator.GroupIterator_destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.__wurst_supertypes = ({[GroupIterator] = true, })
	GroupIterator.__typeId__ = 31
	HashMap.HashMap_HashMap_get = HashMap_HashMap_get
	HashMap.HashMap_HashMap_has = HashMap_HashMap_has
	HashMap.HashMap_HashMap_put = HashMap_HashMap_put
	HashMap.HashMap_HashMap_remove = HashMap_HashMap_remove
	HashMap.HashMap_get = HashMap_HashMap_get
	HashMap.HashMap_has = HashMap_HashMap_has
	HashMap.HashMap_hasInt = Table_Table_hasInt
	HashMap.HashMap_hasString = Table_Table_hasString
	HashMap.HashMap_loadInt = Table_Table_loadInt
	HashMap.HashMap_loadString = Table_Table_loadString
	HashMap.HashMap_loadTrigger = Table_Table_loadTrigger
	HashMap.HashMap_loadUnit = Table_Table_loadUnit
	HashMap.HashMap_put = HashMap_HashMap_put
	HashMap.HashMap_remove = HashMap_HashMap_remove
	HashMap.HashMap_removeInt = Table_Table_removeInt
	HashMap.HashMap_saveFogState = Table_Table_saveFogState
	HashMap.HashMap_saveInt = Table_Table_saveInt
	HashMap.HashMap_saveString = Table_Table_saveString
	HashMap.Table_Table_hasInt = Table_Table_hasInt
	HashMap.Table_Table_hasString = Table_Table_hasString
	HashMap.Table_Table_loadInt = Table_Table_loadInt
	HashMap.Table_Table_loadString = Table_Table_loadString
	HashMap.Table_Table_loadTrigger = Table_Table_loadTrigger
	HashMap.Table_Table_loadUnit = Table_Table_loadUnit
	HashMap.Table_Table_removeInt = Table_Table_removeInt
	HashMap.Table_Table_saveFogState = Table_Table_saveFogState
	HashMap.Table_Table_saveInt = Table_Table_saveInt
	HashMap.Table_Table_saveString = Table_Table_saveString
	HashMap.Table_get = HashMap_HashMap_get
	HashMap.Table_has = HashMap_HashMap_has
	HashMap.Table_hasInt = Table_Table_hasInt
	HashMap.Table_hasString = Table_Table_hasString
	HashMap.Table_loadInt = Table_Table_loadInt
	HashMap.Table_loadString = Table_Table_loadString
	HashMap.Table_loadTrigger = Table_Table_loadTrigger
	HashMap.Table_loadUnit = Table_Table_loadUnit
	HashMap.Table_put = HashMap_HashMap_put
	HashMap.Table_remove = HashMap_HashMap_remove
	HashMap.Table_removeInt = Table_Table_removeInt
	HashMap.Table_saveFogState = Table_Table_saveFogState
	HashMap.Table_saveInt = Table_Table_saveInt
	HashMap.Table_saveString = Table_Table_saveString
	HashMap.__wurst_supertypes = ({[HashMap] = true, [Table] = true, })
	HashMap.__typeId__ = 46
	EventListener_add_HeroTrainer.EventListener_add_DamageEvent_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_Recycle_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.EventListener_onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.__wurst_supertypes = ({[EventListener_add_HeroTrainer] = true, [EventListener] = true, })
	EventListener_add_HeroTrainer.__typeId__ = 24
	OnCastListener_onCast_Hibernate.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.OnCastListener_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Hibernate_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.__wurst_supertypes = ({[OnCastListener_onCast_Hibernate] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Hibernate.__typeId__ = 41
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_Hibernate] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_Hibernate.__typeId__ = 3
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_call = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_call = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Hibernate.call = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Hibernate.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_Hibernate] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_Hibernate.__typeId__ = 11
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_call = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_call = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_InitFocusCamera.call = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_InitFocusCamera.__wurst_supertypes = ({[CallbackSingle_doAfter_InitFocusCamera] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_InitFocusCamera.__typeId__ = 8
	CallbackSingle_doAfter_Invigorate.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.CallbackSingle_call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.__wurst_supertypes = ({[CallbackSingle_doAfter_Invigorate] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_Invigorate.__typeId__ = 9
	LLBackIterator.LLBackIterator_destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.__wurst_supertypes = ({[LLBackIterator] = true, })
	LLBackIterator.__typeId__ = 33
	LLEntry.LLEntry_destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.__wurst_supertypes = ({[LLEntry] = true, })
	LLEntry.__typeId__ = 34
	LLIterator.LLIterator_LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.LLIterator_destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.__wurst_supertypes = ({[LLIterator] = true, })
	LLIterator.__typeId__ = 35
	LinkedList.LinkedList_LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.__wurst_supertypes = ({[LinkedList] = true, })
	LinkedList.__typeId__ = 36
	IdGenerator.__wurst_supertypes = ({[IdGenerator] = true, })
	IdGenerator.__typeId__ = 32
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
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
	CallbackSingle_nullTimer_OnUnitEnterLeave.__typeId__ = 15
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.__wurst_supertypes = ({[ForGroupCallback_forEachFrom_Preloader] = true, [ForGroupCallback] = true, })
	ForGroupCallback_forEachFrom_Preloader.__typeId__ = 29
	CallbackSingle_nullTimer_Preloader.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_Preloader.CallbackSingle_call = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
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
	CallbackSingle_nullTimer_Preloader.__typeId__ = 16
	EventListener_add_Recycle.EventListener_add_DamageEvent_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
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
	EventListener_add_Recycle.__typeId__ = 25
	OnCastListener_onCast_SeedBurst.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.__wurst_supertypes = ({[OnCastListener_onCast_SeedBurst] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SeedBurst.__typeId__ = 42
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_SeedBurst] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_SeedBurst.__typeId__ = 12
	Vec2Wrapper.Vec2Wrapper_destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.__wurst_supertypes = ({[Vec2Wrapper] = true, })
	Vec2Wrapper.__typeId__ = 48
	DamageListener_addListener_ShieldBash.DamageListener_addListener_ShieldBash_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.DamageListener_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.__wurst_supertypes = ({[DamageListener_addListener_ShieldBash] = true, [DamageListener] = true, })
	DamageListener_addListener_ShieldBash.__typeId__ = 20
	OnCastListener_onCast_SpiritWisps.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.OnCastListener_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SpiritWisps_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.__wurst_supertypes = ({[OnCastListener_onCast_SpiritWisps] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SpiritWisps.__typeId__ = 43
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_SpiritWisps] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.__typeId__ = 4
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_SpiritWisps1] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.__typeId__ = 5
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_call = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_CenariusCharacter_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_call = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SpiritWisps.call = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SpiritWisps.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_SpiritWisps] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_SpiritWisps.__typeId__ = 13
	Table.Table_Table_hasInt = Table_Table_hasInt
	Table.Table_Table_hasString = Table_Table_hasString
	Table.Table_Table_loadInt = Table_Table_loadInt
	Table.Table_Table_loadString = Table_Table_loadString
	Table.Table_Table_loadTrigger = Table_Table_loadTrigger
	Table.Table_Table_loadUnit = Table_Table_loadUnit
	Table.Table_Table_removeInt = Table_Table_removeInt
	Table.Table_Table_saveFogState = Table_Table_saveFogState
	Table.Table_Table_saveInt = Table_Table_saveInt
	Table.Table_Table_saveString = Table_Table_saveString
	Table.Table_hasInt = Table_Table_hasInt
	Table.Table_hasString = Table_Table_hasString
	Table.Table_loadInt = Table_Table_loadInt
	Table.Table_loadString = Table_Table_loadString
	Table.Table_loadTrigger = Table_Table_loadTrigger
	Table.Table_loadUnit = Table_Table_loadUnit
	Table.Table_removeInt = Table_Table_removeInt
	Table.Table_saveFogState = Table_Table_saveFogState
	Table.Table_saveInt = Table_Table_saveInt
	Table.Table_saveString = Table_Table_saveString
	Table.__wurst_supertypes = ({[Table] = true, })
	Table.__typeId__ = 45
	UnitIndex.UnitIndex_destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.__wurst_supertypes = ({[UnitIndex] = true, })
	UnitIndex.__typeId__ = 47
	OnCastListener_onCast_UrsocCharge.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.OnCastListener_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_UrsocCharge_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.__wurst_supertypes = ({[OnCastListener_onCast_UrsocCharge] = true, [OnCastListener] = true, })
	OnCastListener_onCast_UrsocCharge.__typeId__ = 44
	initGlobals("when calling initGlobals")
	initCompiletimeState("when calling initCompiletimeState in blizzard, line 1")
	SetCameraBounds((-(26880.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(31232.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(26880.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(31232.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("AshenvaleDay")
	SetAmbientNightSound("AshenvaleNight")
	SetMapMusic("Music", true, 0)
	CreateRegions("when calling CreateRegions in war3map, line 738")
	CreateAllUnits("when calling CreateAllUnits in war3map, line 739")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 741")
	InitCustomTriggers("when calling InitCustomTriggers in war3map, line 742")
	RunInitializationTriggers("when calling RunInitializationTriggers in war3map, line 743")
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
	  local __wurst_init_ok = xpcall(init_StringUtils, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package StringUtils.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_SpiritWisps, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package SpiritWisps.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_DryadCasterMain, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package DryadCasterMain.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_HeroTrainer, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package HeroTrainer.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Hibernate, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Hibernate.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_InitFocusCamera, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package InitFocusCamera.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_UrsocCharge, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package UrsocCharge.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_UrsocMain, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package UrsocMain.", "<lua error>")
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
	DefineStartLocation(0, 1536.0, 18752.0)
	InitCustomPlayerSlots()
	__wurst_safe_SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
	InitGenericPlayerSlots()
end

function init_Abilities(__wurst_stackPos244) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos244
	wurst_stack_depth = (wurst_stack_depth + 1)
	Abilities_tranquility = "Abilities\\Spells\\NightElf\\Tranquility\\Tranquility.mdx"
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityIds(__wurst_stackPos245) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos245
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityObjEditing(__wurst_stackPos277) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos277
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos249) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos249
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_DEGTORAD = 0.017453293
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this193, __wurst_stackPos314) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos314
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this193[1] * Angle_RADTODEG)
end

function angle_radians(this194, __wurst_stackPos315) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos315
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this194[1]
end

function real_fromDeg(this195, __wurst_stackPos316) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos316
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this195 * Angle_DEGTORAD), })
end

function real_asAngleRadians(this196, __wurst_stackPos317) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos317
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this196, })
end

function init_BasicWaves(__wurst_stackPos278) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos278
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

function createPlayerUnit(p14, unitID, number, unitGroup, __wurst_stackPos323) 
	local i6 = nil
	local temp5 = nil
	local u14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos323
	wurst_stack_depth = (wurst_stack_depth + 1)
	i6 = 0
	temp5 = (number - 1)
	while true do
		if (i6 > temp5) then
			break
		end
		u14 = createUnit(p14, unitID, BasicWaves_spawn1, ({0., }), "when calling createUnit in BasicWaves, line 15")
		group_add1(unitGroup, "when calling add in BasicWaves, line 16", u14)
		i6 = (i6 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnWave(__wurst_stackPos325) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos325
	wurst_stack_depth = (wurst_stack_depth + 1)
	createPlayerUnit(Player_players[1], 1751543663, 1, BasicWaves_footmen, "when calling createPlayerUnit in BasicWaves, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupWaveSpawn(__wurst_stackPos320) 
	local receiver17 = nil
	local receiver18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos320
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

function code__addAction_BasicWaves(__wurst_stackPos326) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos326
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAttackPlayer(__wurst_stackPos321) 
	local receiver19 = nil
	local receiver20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos321
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

function code__addAction_BasicWaves1(__wurst_stackPos327) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos327
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 32")
	print2(group_size(BasicWaves_footmen, "when calling size in BasicWaves, line 33"), "when calling print in BasicWaves, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupBuildingDeathTrigger(__wurst_stackPos322) 
	local receiver21 = nil
	local receiver22 = nil
	local receiver23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos322
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

function code__Condition_addCondition_addAction_BasicWaves(__wurst_stackPos332) 
	local stackTrace_tempReturn7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos332
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = (GetTriggerUnit() == udg_watchTower)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function code__addAction_BasicWaves2(__wurst_stackPos333) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos333
	wurst_stack_depth = (wurst_stack_depth + 1)
	spawnWave("when calling spawnWave in BasicWaves, line 40")
	group_targetOrder(BasicWaves_footmen, "attack", BasicWaves_selectedTarget, "when calling targetOrder in BasicWaves, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function startingCameraPosition(__wurst_stackPos319) 
	local u15 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos319
	wurst_stack_depth = (wurst_stack_depth + 1)
	u15 = ({__wurst_safe_GetUnitX(udg_heroSelector), __wurst_safe_GetUnitY(udg_heroSelector), })
	__wurst_safe_SetCameraPositionForPlayer(Player_players[0], u15[1], u15[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Basics(__wurst_stackPos257) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos257
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	Basics_HEIGHT_ENABLER = 1097691750
	Basics_DUMMY_PLAYER = Player_players[PLAYER_NEUTRAL_PASSIVE]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_BitSet(__wurst_stackPos248) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos248
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_BITSET_SIZE = 32
	initPows("when calling initPows in BitSet, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPows(__wurst_stackPos334) 
	local allPows = nil
	local i7 = nil
	local temp6 = nil
	local i8 = nil
	local temp7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos334
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_pows[0] = 1
	allPows = 1
	i7 = 1
	temp6 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i7 > temp6) then
			break
		end
		BitSet_pows[i7] = (intEnsure(BitSet_pows[(i7 - 1)]) * 2)
		allPows = int_bitOr(allPows, intEnsure(BitSet_pows[i7]), "when calling bitOr in BitSet, line 17")
		i7 = (i7 + 1)
	end
	i8 = 0
	temp7 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i8 > temp7) then
			break
		end
		int_bitXor(allPows, intEnsure(BitSet_pows[i8]), "when calling bitXor in BitSet, line 19")
		i8 = (i8 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Bloom(__wurst_stackPos291) 
	local clVar7 = nil
	local temp73 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos291
	wurst_stack_depth = (wurst_stack_depth + 1)
	Bloom_HEALING_CLOUD_ID = intEnsure(1095577650)
	Bloom_CLOUD_UNIT_ID = 1701212014
	Bloom_CLOUD_RADIUS = 256.
	Bloom_CLOUD_HEAL = 20.
	Bloom_CLOUD_DURATION = 10.
	Bloom_HEAL_INTERVAL = 1.
	temp73 = Bloom_HEALING_CLOUD_ID
	clVar7 = OnCastListener_onCast_Bloom:create2()
	OnCastListener_construct_OnCastListener(clVar7, "when calling construct_OnCastListener in Bloom, line 73")
	EventListener_onCast(temp73, clVar7, "when calling onCast in Bloom, line 73")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnCloud(owner, pos1, __wurst_stackPos18) 
	local cloud = nil
	local sfx1 = nil
	local healTimer2 = nil
	local clVar8 = nil
	local clVar9 = nil
	local temp74 = nil
	local temp75 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos18
	wurst_stack_depth = (wurst_stack_depth + 1)
	cloud = createUnit(owner, Bloom_CLOUD_UNIT_ID, pos1, ({0., }), "when calling createUnit in Bloom, line 44")
	unit_setInvulnerable(cloud, true, "when calling setInvulnerable in Bloom, line 45")
	unit_addAbility(cloud, 1097625443, "when calling addAbility in Bloom, line 47")
	unit_setPathing(cloud, false, "when calling setPathing in Bloom, line 48")
	unit_setAnimation(cloud, "stand 4", "when calling setAnimation in Bloom, line 49")
	unit_pause(cloud, "when calling pause in Bloom, line 50")
	sfx1 = widget_addEffect(cloud, Abilities_tranquility, "origin", "when calling addEffect in Bloom, line 53")
	effect_setScale(sfx1, 1., "when calling setScale in Bloom, line 54")
	effect_setColor(sfx1, 0, 255, 0, "when calling setColor in Bloom, line 55")
	temp74 = Bloom_HEAL_INTERVAL
	clVar8 = CallbackPeriodic_doPeriodically_Bloom:create()
	CallbackPeriodic_construct_CallbackPeriodic(clVar8, "when calling construct_CallbackPeriodic in Bloom, line 58")
	clVar8.pos = tupleCopy(pos1)
	clVar8.owner = owner
	healTimer2 = doPeriodically(temp74, clVar8, "when calling doPeriodically in Bloom, line 58")
	temp75 = Bloom_CLOUD_DURATION
	clVar9 = CallbackSingle_doAfter_Bloom:create1()
	CallbackSingle_construct_CallbackSingle(clVar9, "when calling construct_CallbackSingle in Bloom, line 66")
	clVar9.healTimer = healTimer2
	clVar9.cloud = cloud
	clVar9.sfx = sfx1
	doAfter(temp75, clVar9, "when calling doAfter in Bloom, line 66")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CenariusCharacter(__wurst_stackPos295) 
	local clVar10 = nil
	local clVar11 = nil
	local temp76 = nil
	local temp77 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos295
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp76 = Invigorate_INVIGORATE_ID
	clVar10 = OnCastListener_onCast_CenariusCharacter:create3()
	OnCastListener_construct_OnCastListener(clVar10, "when calling construct_OnCastListener in CenariusCharacter, line 29")
	EventListener_onCast(temp76, clVar10, "when calling onCast in CenariusCharacter, line 29")
	temp77 = SummonTreant_SUMMON_TREANT_ID
	clVar11 = OnCastListener_onCast_CenariusCharacter1:create4()
	OnCastListener_construct_OnCastListener(clVar11, "when calling construct_OnCastListener in CenariusCharacter, line 33")
	EventListener_onCast(temp77, clVar11, "when calling onCast in CenariusCharacter, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureEvents(__wurst_stackPos290) 
	local clVar12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos290
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
	clVar12 = CallbackSingle_nullTimer_ClosureEvents:create6()
	CallbackSingle_construct_CallbackSingle(clVar12, "when calling construct_CallbackSingle in ClosureEvents, line 306")
	nullTimer(clVar12, "when calling nullTimer in ClosureEvents, line 306")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function fireEvents(_u, __wurst_stackPos344) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos344
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function eventid_toIntId(this208, __wurst_stackPos345) 
	local id5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos345
	wurst_stack_depth = (wurst_stack_depth + 1)
	id5 = intEnsure(ClosureEvents_eventidToIndex[handle_getHandleId(this208, "when calling getHandleId in ClosureEvents, line 248")])
	if (id5 == 0) then
		id5 = registerEventId(this208, "when calling registerEventId in ClosureEvents, line 250")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return id5
end

function registerEventId(evnt, __wurst_stackPos347) 
	local eventId = nil
	local i9 = nil
	local temp8 = nil
	local receiver24 = nil
	local receiver25 = nil
	local receiver26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos347
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
		i9 = 0
		temp8 = (bj_MAX_PLAYERS - 1)
		while true do
			if (i9 > temp8) then
				break
			end
			receiver24 = ClosureEvents_keyTrig
			trigger_registerPlayerEvent(receiver24, Player_players[i9], EVENT_PLAYER_MOUSE_UP, "when calling registerPlayerEvent in ClosureEvents, line 273")
			receiver25 = receiver24
			trigger_registerPlayerEvent(receiver25, Player_players[i9], EVENT_PLAYER_MOUSE_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 274")
			receiver26 = receiver25
			trigger_registerPlayerEvent(receiver26, Player_players[i9], EVENT_PLAYER_MOUSE_MOVE, "when calling registerPlayerEvent in ClosureEvents, line 275")
			i9 = (i9 + 1)
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureEvents_eventTypeCounter
end

function unregisterEventsForUnit(u16, __wurst_stackPos352) 
	local index2 = nil
	local listener5 = nil
	local t1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos352
	wurst_stack_depth = (wurst_stack_depth + 1)
	if fireEvents(u16, "when calling fireEvents in ClosureEvents, line 279") then
		index2 = unit_getIndex(u16, "when calling getIndex in ClosureEvents, line 280")
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

function unregisterEvents(id6, __wurst_stackPos353) 
	local listener6 = nil
	local t2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos353
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
				t2 = listener6
				listener6 = listener6.EventListener_next
				EventListener_destroyEventListener(t2, "when calling destroyEventListener in ClosureEvents, line 299")
			end
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onUnitDeindex_ClosureEvents(__wurst_stackPos355) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos355
	wurst_stack_depth = (wurst_stack_depth + 1)
	unregisterEventsForUnit(getIndexingUnit("when calling getIndexingUnit in ClosureEvents, line 304"), "when calling unregisterEventsForUnit in ClosureEvents, line 304")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents(__wurst_stackPos357) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos357
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 307")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents1(__wurst_stackPos359) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos359
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 308")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_ClosureEvents(__wurst_stackPos360) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos360
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_onSpellEffect("when calling onSpellEffect in ClosureEvents, line 323")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add(eventId1, listener7, __wurst_stackPos362) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos362
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

function EventListener_addSpellInternal(u17, abilId1, listener8, __wurst_stackPos363) 
	local index3 = nil
	local entry1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos363
	wurst_stack_depth = (wurst_stack_depth + 1)
	listener8.OnCastListener_abilId = abilId1
	if not((u17 == nil)) then
		listener8.OnCastListener_eventUnit = u17
		index3 = unit_getIndex(u17, "when calling getIndex in ClosureEvents, line 170")
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

function EventListener_onCast(abilId, listener4, __wurst_stackPos337) 
	local stackTrace_tempReturn8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos337
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn8 = EventListener_addSpellInternal(nil, abilId, listener4, "when calling addSpellInternal in ClosureEvents, line 155")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn8
end

function EventListener_generalEventCallback(__wurst_stackPos358) 
	local trigUnit8 = nil
	local id7 = nil
	local index4 = nil
	local listener9 = nil
	local nextListener = nil
	local globalListener = nil
	local nextListener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos358
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit8 = GetTriggerUnit()
	id7 = eventid_toIntId(GetTriggerEventId(), "when calling toIntId in ClosureEvents, line 186")
	if not((trigUnit8 == nil)) then
		index4 = unit_getIndex(trigUnit8, "when calling getIndex in ClosureEvents, line 189")
		if (index4 > 0) then
			listener9 = EventListener_unitListenersFirsts[index4]
			if (not((listener9 == nil)) and fireEvents(trigUnit8, "when calling fireEvents in ClosureEvents, line 192")) then
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

function EventListener_onSpellEffect(__wurst_stackPos361) 
	local trigUnit9 = nil
	local abilId2 = nil
	local caster8 = nil
	local index5 = nil
	local listener10 = nil
	local nextListener2 = nil
	local nextListener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos361
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit9 = GetTriggerUnit()
	abilId2 = GetSpellAbilityId()
	caster8 = GetSpellAbilityUnit()
	index5 = unit_getIndex(trigUnit9, "when calling getIndex in ClosureEvents, line 210")
	listener10 = EventListener_castMapCasters[index5]
	while true do
		if not(not((listener10 == nil))) then
			break
		end
		nextListener2 = listener10.OnCastListener_next
		if ((listener10.OnCastListener_abilId == -1) or (listener10.OnCastListener_abilId == abilId2)) then
			listener10:fire(caster8, "when calling fire in ClosureEvents, line 215")
		end
		listener10 = nextListener2
	end
	listener10 = HashMap_HashMap_get(EventListener_castMap, abilId2, "when calling get in ClosureEvents, line 218")
	while true do
		if not(not((listener10 == nil))) then
			break
		end
		nextListener3 = listener10.OnCastListener_next
		if ((listener10.OnCastListener_eventUnit == nil) or (listener10.OnCastListener_eventUnit == trigUnit9)) then
			listener10:fire(caster8, "when calling fire in ClosureEvents, line 222")
		end
		listener10 = nextListener3
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureForGroups(__wurst_stackPos273) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos273
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

function code__Filter_ClosureForGroups(__wurst_stackPos364) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos364
	wurst_stack_depth = (wurst_stack_depth + 1)
	filterCallback(GetFilterUnit(), "when calling filterCallback in ClosureForGroups, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function filterCallback(filter5, __wurst_stackPos365) 
	local idx = nil
	local mode = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos365
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

function currentCallback(__wurst_stackPos366) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos366
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacks[(ClosureForGroups_tempCallbacksCount - 1)]
end

function currentCallbackUntil(__wurst_stackPos367) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos367
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacksUntil[(ClosureForGroups_tempCallbacksCount - 1)]
end

function group_forEachFrom(this214, cb8, __wurst_stackPos368) 
	local u18 = nil
	local from = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos368
	wurst_stack_depth = (wurst_stack_depth + 1)
	from = this214
	while true do
		if not(group_hasNext(from, "when calling hasNext in ClosureForGroups, line 80")) then
			break
		end
		u18 = group_next(from, "when calling next in ClosureForGroups, line 80")
		cb8:callback(u18, "when calling callback in ClosureForGroups, line 81")
	end
	ForGroupCallback_destroyForGroupCallback(cb8, "when calling destroyForGroupCallback in ClosureForGroups, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureTimers(__wurst_stackPos281) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos281
	wurst_stack_depth = (wurst_stack_depth + 1)
	ClosureTimers_x = 200
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_doAfter(this217, timeToWait1, cb9, __wurst_stackPos371) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos371
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_start(cb9, this217, timeToWait1, "when calling start in ClosureTimers, line 17")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb9
end

function doAfter(timeToWait, cb1, __wurst_stackPos27) 
	local stackTrace_tempReturn9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos27
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn9 = timer_doAfter(getTimer("when calling getTimer in ClosureTimers, line 28"), timeToWait, cb1, "when calling doAfter in ClosureTimers, line 28")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn9
end

function nullTimer(cb7, __wurst_stackPos343) 
	local stackTrace_tempReturn10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos343
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn10 = doAfter(0., cb7, "when calling doAfter in ClosureTimers, line 51")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn10
end

function timer_doPeriodically(this218, time5, cb10, __wurst_stackPos373) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos373
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_start(cb10, this218, time5, "when calling start in ClosureTimers, line 63")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb10
end

function doPeriodically(time4, cb3, __wurst_stackPos119) 
	local stackTrace_tempReturn11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos119
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn11 = timer_doPeriodically(getTimer("when calling getTimer in ClosureTimers, line 75"), time4, cb3, "when calling doPeriodically in ClosureTimers, line 75")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn11
end

function CallbackPeriodic_staticCallback(__wurst_stackPos374) 
	local cb11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos374
	wurst_stack_depth = (wurst_stack_depth + 1)
	cb11 = __wurst_objectFromIndex(timer_getData(GetExpiredTimer(), "when calling getData in ClosureTimers, line 162"))
	cb11:call(cb11, "when calling call in ClosureTimers, line 163")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__start_CallbackSingle_ClosureTimers(__wurst_stackPos376) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos376
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_staticCallback("when calling staticCallback in ClosureTimers, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_staticCallback(__wurst_stackPos377) 
	local t3 = nil
	local cb12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos377
	wurst_stack_depth = (wurst_stack_depth + 1)
	t3 = GetExpiredTimer()
	cb12 = __wurst_objectFromIndex(timer_getData(t3, "when calling getData in ClosureTimers, line 140"))
	cb12:call1("when calling call in ClosureTimers, line 141")
	CallbackSingle_destroyCallbackSingle(cb12, "when calling destroyCallbackSingle in ClosureTimers, line 142")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos265) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos265
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

function colorA_toColorString(this220, __wurst_stackPos378) 
	local stackTrace_tempReturn12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos378
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn12 = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this220[4], "when calling toHex in Colors, line 194")), toHex(this220[1], "when calling toHex in Colors, line 194")), toHex(this220[2], "when calling toHex in Colors, line 194")), toHex(this220[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn12
end

function toHex(number1, __wurst_stackPos380) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos380
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number1 // 16)
	secondpart = (number1 - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos379) 
	local i10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos379
	wurst_stack_depth = (wurst_stack_depth + 1)
	i10 = 0
	while true do
		if (i10 > 15) then
			break
		end
		Table_Table_saveInt(Colors_decs, string_getHash(stringEnsure(Colors_hexs[i10]), "when calling getHash in Colors, line 279"), i10, "when calling saveInt in Colors, line 279")
		i10 = (i10 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ControlPoint(__wurst_stackPos296) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos296
	wurst_stack_depth = (wurst_stack_depth + 1)
	ControlPoint_controlPoints = CreateGroup()
	ControlPoint_controlPointValue = 30
	setupAllControlPoints("when calling setupAllControlPoints in ControlPoint, line 54")
	incomeTimer("when calling incomeTimer in ControlPoint, line 55")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function incomeTimer(__wurst_stackPos383) 
	local countdown = nil
	local d = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos383
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

function income(__wurst_stackPos387) 
	local iterator11 = nil
	local u19 = nil
	local p15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos387
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterator11 = group_iterator(ControlPoint_controlPoints, "when calling iterator in ControlPoint, line 14")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator11, "when calling hasNext in ControlPoint, line 14")) then
			break
		end
		u19 = GroupIterator_GroupIterator_next(iterator11, "when calling next in ControlPoint, line 14")
		p15 = unit_getOwner(u19, "when calling getOwner in ControlPoint, line 15")
		player_addGold(p15, ControlPoint_controlPointValue, "when calling addGold in ControlPoint, line 16")
	end
	GroupIterator_GroupIterator_close(iterator11, "when calling close in ControlPoint, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupCaptureOnHalf(target7, __wurst_stackPos389) 
	local receiver27 = nil
	local receiver28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos389
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver27 = CreateTrigger()
	trigger_registerUnitEvent(receiver27, target7, EVENT_UNIT_DAMAGED, "when calling registerUnitEvent in ControlPoint, line 20")
	receiver28 = receiver27
	trigger_addAction(receiver28, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_ControlPoint(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ControlPoint, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_ControlPoint(__wurst_stackPos391) 
	local u20 = nil
	local attacker = nil
	local hp = nil
	local maxHp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos391
	wurst_stack_depth = (wurst_stack_depth + 1)
	u20 = GetTriggerUnit()
	attacker = GetEventDamageSource()
	hp = __wurst_safe_GetUnitState(u20, UNIT_STATE_LIFE)
	maxHp = __wurst_safe_GetUnitState(u20, UNIT_STATE_MAX_LIFE)
	if ((hp / maxHp) <= 0.5) then
		group_remove(ControlPoint_controlPoints, "when calling remove in ControlPoint, line 27", u20)
		__wurst_safe_SetUnitOwner(u20, unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 28"), true)
		__wurst_safe_SetUnitState(u20, UNIT_STATE_LIFE, maxHp)
		group_add1(ControlPoint_controlPoints, "when calling add in ControlPoint, line 30", u20)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAllControlPoints(__wurst_stackPos382) 
	local u21 = nil
	local iterator12 = nil
	local cp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos382
	wurst_stack_depth = (wurst_stack_depth + 1)
	u21 = CreateGroup()
	group_add1(u21, "when calling add in ControlPoint, line 34", udg_controlPoint_001, udg_controlPoint_002, udg_controlPoint_003, udg_controlPoint_004, udg_controlPoint_005, udg_controlPoint_006, udg_controlPoint_007, udg_controlPoint_008, udg_controlPoint_009, udg_controlPoint_010, udg_controlPoint_011, udg_controlPoint_012, udg_controlPoint_013, udg_controlPoint_014, udg_controlPoint_015)
	iterator12 = group_iterator(u21, "when calling iterator in ControlPoint, line 50")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator12, "when calling hasNext in ControlPoint, line 50")) then
			break
		end
		cp = GroupIterator_GroupIterator_next(iterator12, "when calling next in ControlPoint, line 50")
		setupCaptureOnHalf(cp, "when calling setupCaptureOnHalf in ControlPoint, line 51")
	end
	GroupIterator_GroupIterator_close(iterator12, "when calling close in ControlPoint, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DamageEvent(__wurst_stackPos297) 
	local clVar13 = nil
	local clVar14 = nil
	local temp80 = nil
	local temp81 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos297
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
	temp80 = EVENT_PLAYER_UNIT_DAMAGING
	clVar13 = EventListener_add_DamageEvent:create13()
	EventListener_construct_EventListener(clVar13, "when calling construct_EventListener in DamageEvent, line 476")
	EventListener_add(temp80, clVar13, "when calling add in DamageEvent, line 476")
	temp81 = EVENT_PLAYER_UNIT_DAMAGED
	clVar14 = EventListener_add_DamageEvent1:create14()
	EventListener_construct_EventListener(clVar14, "when calling construct_EventListener in DamageEvent, line 477")
	EventListener_add(temp81, clVar14, "when calling add in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onUnreducedDamage(__wurst_stackPos67) 
	local amount2 = nil
	local attackType1 = nil
	local dmg = nil
	local i11 = nil
	local temp9 = nil
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
	i11 = 0
	temp9 = DamageEvent_maxUnreducedPriority
	while true do
		if (i11 > temp9) then
			break
		end
		listener11 = DamageEvent_firstUnreducedListeners[i11]
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
		i11 = (i11 + 1)
	end
	__wurst_safe_BlzSetEventAttackType(dmg.DamageInstance_nativeAttackType)
	__wurst_safe_BlzSetEventDamageType(dmg.DamageInstance_nativeDamageType)
	__wurst_safe_BlzSetEventWeaponType(dmg.DamageInstance_nativeWeaponType)
	BlzSetEventDamage(dmg.DamageInstance_amount)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onDamage(__wurst_stackPos69) 
	local dmg1 = nil
	local i12 = nil
	local temp10 = nil
	local listener12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos69
	wurst_stack_depth = (wurst_stack_depth + 1)
	dmg1 = DamageInstance_current
	if not(DamageEvent_abort) then
		DamageInstance_DamageInstance_setReducedAmount(dmg1, GetEventDamage(), "when calling setReducedAmount in DamageEvent, line 222")
		i12 = 0
		temp10 = DamageEvent_maxPriority
		while true do
			if (i12 > temp10) then
				break
			end
			listener12 = DamageEvent_firstListeners[i12]
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
			i12 = (i12 + 1)
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

function DamageEvent_addListener(listener13, __wurst_stackPos393) 
	local stackTrace_tempReturn13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos393
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn13 = DamageEvent_addListener1(DamageEvent_maxPriority, listener13, "when calling addListener in DamageEvent, line 248")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn13
end

function DamageEvent_addListener1(priority, listener14, __wurst_stackPos394) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos394
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

function DamageEvent_getSource(__wurst_stackPos395) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos395
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_source
end

function DamageEvent_getTarget(__wurst_stackPos396) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos396
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_target
end

function init_Destructable(__wurst_stackPos253) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos253
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DryadCasterMain(__wurst_stackPos302) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos302
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_destr(this13, __wurst_stackPos14) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos14
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyEffect(this13)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect1(path2, pos5, __wurst_stackPos171) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos171
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect2(path2, pos5, 1.0, real_fromDeg(GetRandomReal(0., 359.), "when calling fromDeg in Effect, line 14"), "when calling flashEffect in Effect, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect2(path3, pos7, scale1, yaw, __wurst_stackPos397) 
	local receiver29 = nil
	local receiver30 = nil
	local receiver31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos397
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver29 = addEffect1(path3, pos7, "when calling addEffect in Effect, line 23")
	effect_setScale(receiver29, scale1, "when calling setScale in Effect, line 23")
	receiver30 = receiver29
	effect_setYaw(receiver30, yaw, "when calling setYaw in Effect, line 23")
	receiver31 = receiver30
	effect_destr(receiver31, "when calling destr in Effect, line 23")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect1(path4, pos8, __wurst_stackPos398) 
	local stackTrace_tempReturn14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos398
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn14 = AddSpecialEffect(path4, pos8[1], pos8[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn14
end

function effect_setScale(this206, scale, __wurst_stackPos340) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos340
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectScale(this206, scale)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_setYaw(this228, yaw1, __wurst_stackPos399) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos399
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectYaw(this228, angle_radians(yaw1, "when calling radians in Effect, line 171"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect(path, target, attachPointName, __wurst_stackPos9) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos9
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(addEffect(path, target, attachPointName, "when calling addEffect in Effect, line 29"), "when calling destr in Effect, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect(path1, target3, attachPointName1, __wurst_stackPos118) 
	local stackTrace_tempReturn15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos118
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn15 = __wurst_safe_AddSpecialEffectTarget(path1, target3, attachPointName1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn15
end

function effect_setColor(this207, r1, g2, b1, __wurst_stackPos341) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos341
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectColor(this207, r1, g2, b1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos259) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos259
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_MUTE_ERROR_DURATION = 60
	ErrorHandling_PRIMARY_ERROR_KEY = -1
	ErrorHandling_HT = hashtable_compiletime
	ErrorHandling_lastError = ""
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
	local temp82 = nil
	local temp83 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos31
	wurst_stack_depth = (wurst_stack_depth + 1)
	if MagicFunctions_compiletime then
		compileError(stringConcat("ERROR: ", msg), "when calling compileError in ErrorHandling, line 45")
	elseif true then
		ErrorHandling_lastError = msg
	else
		if not(ErrorHandling_suppressErrorMessages) then
			hash = string_getHash(msg, "when calling getHash in ErrorHandling, line 53")
			if hashtable_hasInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling hasInt in ErrorHandling, line 54") then
				if ((hashtable_loadInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, "when calling loadInt in ErrorHandling, line 56") + ErrorHandling_MUTE_ERROR_DURATION) < GameTimer_currentTime) then
					temp82 = msg
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
					Log_error(stringConcat(temp82, stacktraceStr), "when calling error in ErrorHandling, line 58")
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
				temp83 = stringConcat("Message: ", msg)
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
				Log_error(stringConcat(temp83, stacktraceStr1), "when calling error in ErrorHandling, line 70")
			end
		end
		ErrorHandling_lastError = msg
		error("__wurst_abort_thread", 0)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos272) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos272
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function eventid_isPlayerunitEvent(this210, __wurst_stackPos348) 
	local eventId2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos348
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId2 = handle_getHandleId(this210, "when calling getHandleId in EventHelper, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((((eventId2 >= 18) and (eventId2 <= 51)) or ((eventId2 >= 269) and (eventId2 <= 277))) or (eventId2 == 315)) or (eventId2 == 308))
end

function eventid_isKeyboardEvent(this211, __wurst_stackPos349) 
	local eventId3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos349
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId3 = handle_getHandleId(this211, "when calling getHandleId in EventHelper, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((eventId3 >= 261) and (eventId3 <= 268)) or (eventId3 == 17))
end

function eventid_isMouseEvent(this212, __wurst_stackPos350) 
	local eventId4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos350
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId4 = handle_getHandleId(this212, "when calling getHandleId in EventHelper, line 61")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((eventId4 >= 305) and (eventId4 <= 307))
end

function EventData_getDyingUnit(__wurst_stackPos163) 
	local stackTrace_tempReturn16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos163
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn16 = GetDyingUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn16
end

function EventData_getTrainedUnit(__wurst_stackPos106) 
	local stackTrace_tempReturn17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos106
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn17 = GetTrainedUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn17
end

function EventData_getSpellTargetUnit(__wurst_stackPos21) 
	local stackTrace_tempReturn18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos21
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn18 = GetSpellTargetUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn18
end

function init_Execute(__wurst_stackPos298) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos298
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_executeForce = CreateForce()
	force_addPlayer(Execute_executeForce, Player_localPlayer, "when calling addPlayer in Execute, line 15")
	Execute_tempCallbacksCount = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function executeCurrentCallback(__wurst_stackPos407) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos407
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_lastError = ""
	getCurrentCallback("when calling getCurrentCallback in Execute, line 19"):run("when calling run in Execute, line 19")
	setCurrentCallbackSuccess(true, "when calling setCurrentCallbackSuccess in Execute, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getCurrentCallback(__wurst_stackPos408) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos408
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Execute_tempCallbacks[(Execute_tempCallbacksCount - 1)]
end

function setCurrentCallbackSuccess(value10, __wurst_stackPos409) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos409
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksSuccess[(Execute_tempCallbacksCount - 1)] = value10
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushCallback(c1, __wurst_stackPos410) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos410
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacks[Execute_tempCallbacksCount] = c1
	Execute_tempCallbacksSuccess[Execute_tempCallbacksCount] = false
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popCallback(__wurst_stackPos411) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos411
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount - 1)
	ForForceCallback_destroyForForceCallback(Execute_tempCallbacks[Execute_tempCallbacksCount], "when calling destroyForForceCallback in Execute, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function isLastCallbackSuccessful(__wurst_stackPos412) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos412
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return boolEnsure(Execute_tempCallbacksSuccess[Execute_tempCallbacksCount])
end

function execute(c2, __wurst_stackPos413) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos413
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not(try(c2, "when calling try in Execute, line 78")) then
		error1(stringConcat("execute: thread has crashed. caused by:\n| - ", ErrorHandling_lastError), "when calling error in Execute, line 79")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function try(c3, __wurst_stackPos414) 
	local suppressErrors = nil
	local stackTrace_tempReturn19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos414
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
	stackTrace_tempReturn19 = isLastCallbackSuccessful("when calling isLastCallbackSuccessful in Execute, line 102")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn19
end

function init_Force(__wurst_stackPos263) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos263
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_addPlayer(this233, whichPlayer11, __wurst_stackPos406) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos406
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_ForceAddPlayer(this233, whichPlayer11)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_forEach(this234, callback, __wurst_stackPos415) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos415
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_ForForce(this234, callback)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos266) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos266
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos258) 
	local receiver32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos258
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

function code__startPeriodic_GameTimer(__wurst_stackPos416) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos416
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos267) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos267
	wurst_stack_depth = (wurst_stack_depth + 1)
	Group_ENUM_GROUP = CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GroupUtils(__wurst_stackPos299) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos299
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

function createGroups(number2, __wurst_stackPos418) 
	local maxCreatePerCycle = nil
	local actualLimit = nil
	local numTarget = nil
	local overflow = nil
	local toCreate = nil
	local createNow = nil
	local clVar15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos418
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
		clVar15 = ForForceCallback_execute_GroupUtils:create19()
		clVar15.createNow = createNow
		execute(clVar15, "when calling execute in GroupUtils, line 90")
	end
	if ((GroupUtils_numTotal >= GroupUtils_GROUP_NUMBER_LIMIT) and not(GroupUtils_shownMaxError)) then
		Log_warn(stringConcat(stringConcat(stringConcat("Maximum number of GroupUtils groups (", int_toString(GroupUtils_GROUP_NUMBER_LIMIT, "when calling toString in GroupUtils, line 96")), ") created. "), "All newly created groups will be non-recyclable."), "when calling warn in GroupUtils, line 96")
		GroupUtils_shownMaxError = true
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function push(g, __wurst_stackPos85) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos85
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_stack[GroupUtils_numStack] = g
	HashMap_HashMap_put(GroupUtils_used, __wurst_objectToIndex(GroupUtils_stack[GroupUtils_numStack]), booleanToIndex(false, "when calling booleanToIndex in GroupUtils, line 118"), "when calling put in GroupUtils, line 118")
	GroupUtils_numStack = (GroupUtils_numStack + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initialize(__wurst_stackPos417) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos417
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

function group_enumUnitsInRect1(this140, rec1, __wurst_stackPos157) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos157
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRect(this140, rec1, nil, "when calling enumUnitsInRect in Group, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRect(this15, rec, filter1, __wurst_stackPos16) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos16
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsInRect(this15, rec, filter1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsOfType(this235, id8, filter8, __wurst_stackPos423) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos423
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsOfType(this235, UnitId2String(id8), filter8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this80, __wurst_stackPos92, ...) 
	local i13 = nil
	local g4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos92
	wurst_stack_depth = (wurst_stack_depth + 1)
	i13 = 0
	local __args1 = table.pack(...)
	for i14=1,__args1.n do
	g4 = __args1[i14]
	i13 = (i13 + __wurst_safe_BlzGroupAddGroupFast(g4, this80))
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i13
end

function group_clear(this82, __wurst_stackPos94) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos94
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupClear(this82)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add1(this198, __wurst_stackPos324, ...) 
	local i15 = nil
	local u23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos324
	wurst_stack_depth = (wurst_stack_depth + 1)
	i15 = 0
	local __args2 = table.pack(...)
	for i16=1,__args2.n do
	u23 = __args2[i16]
	if __wurst_safe_GroupAddUnit(this198, u23) then
		i15 = (i15 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i15
end

function group_remove(this227, __wurst_stackPos392, ...) 
	local i17 = nil
	local u24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos392
	wurst_stack_depth = (wurst_stack_depth + 1)
	i17 = 0
	local __args3 = table.pack(...)
	for i18=1,__args3.n do
	u24 = __args3[i18]
	if __wurst_safe_GroupRemoveUnit(this227, u24) then
		i17 = (i17 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i17
end

function group_destr(this83, __wurst_stackPos95) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos95
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyGroup(this83)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_size(this81, __wurst_stackPos93) 
	local stackTrace_tempReturn20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos93
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn20 = __wurst_safe_BlzGroupGetSize(this81)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn20
end

function group_isEmpty(this236, __wurst_stackPos424) 
	local stackTrace_tempReturn21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos424
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn21 = not(group_hasNext(this236, "when calling hasNext in Group, line 70"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn21
end

function group_hasNext(this215, __wurst_stackPos369) 
	local stackTrace_tempReturn22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos369
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn22 = not((__wurst_safe_FirstOfGroup(this215) == nil))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn22
end

function group_get(this74, index1, __wurst_stackPos86) 
	local stackTrace_tempReturn23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos86
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn23 = __wurst_safe_BlzGroupUnitAt(this74, index1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn23
end

function group_targetOrder(this199, order, targetWidget, __wurst_stackPos328) 
	local stackTrace_tempReturn24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos328
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn24 = __wurst_safe_GroupTargetOrder(this199, order, targetWidget)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn24
end

function group_iterator(this2, __wurst_stackPos2) 
	local stackTrace_tempReturn25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos2
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn25 = GroupIterator_new_GroupIterator(this2, "when calling new_GroupIterator in Group, line 141")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn25
end

function group_next(this216, __wurst_stackPos370) 
	local iterUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos370
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterUnit = __wurst_safe_FirstOfGroup(this216)
	__wurst_safe_GroupRemoveUnit(this216, iterUnit)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return iterUnit
end

function init_HashList(__wurst_stackPos271) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos271
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashList_ht = hashtable_compiletime2
	HashList_occurences = hashtable_compiletime3
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_hasBoolean(this231, parentKey21, childKey11, __wurst_stackPos404) 
	local stackTrace_tempReturn26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos404
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn26 = __wurst_HaveSavedBoolean(this231, parentKey21, childKey11)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn26
end

function hashtable_hasInt(this168, parentKey4, childKey, __wurst_stackPos191) 
	local stackTrace_tempReturn27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos191
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn27 = __wurst_HaveSavedInteger(this168, parentKey4, childKey)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn27
end

function hashtable_hasString(this170, parentKey6, childKey1, __wurst_stackPos193) 
	local stackTrace_tempReturn28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos193
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn28 = __wurst_HaveSavedString(this170, parentKey6, childKey1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn28
end

function hashtable_loadBoolean(this232, parentKey22, childKey12, __wurst_stackPos405) 
	local stackTrace_tempReturn29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos405
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn29 = __wurst_LoadBoolean(this232, parentKey22, childKey12)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn29
end

function hashtable_loadInt(this171, parentKey8, childKey3, __wurst_stackPos194) 
	local stackTrace_tempReturn30 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos194
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn30 = __wurst_LoadInteger(this171, parentKey8, childKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn30
end

function hashtable_loadString(this174, parentKey11, childKey5, __wurst_stackPos197) 
	local stackTrace_tempReturn31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos197
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn31 = __wurst_LoadStr(this174, parentKey11, childKey5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn31
end

function hashtable_loadTriggerHandle(this180, parentKey17, childKey8, __wurst_stackPos203) 
	local stackTrace_tempReturn32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos203
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn32 = __wurst_LoadTriggerHandle(this180, parentKey17, childKey8)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn32
end

function hashtable_loadUnitHandle(this178, parentKey15, childKey7, __wurst_stackPos201) 
	local stackTrace_tempReturn33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos201
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn33 = __wurst_LoadUnitHandle(this178, parentKey15, childKey7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn33
end

function hashtable_saveBoolean(this230, parentKey20, childKey10, value9, __wurst_stackPos403) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos403
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveBoolean(this230, parentKey20, childKey10, value9)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveFogStateHandle(this182, parentKey19, childKey9, value7, __wurst_stackPos205) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos205
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveFogStateHandle(this182, parentKey19, childKey9, value7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveInt(this172, parentKey9, childKey4, value3, __wurst_stackPos195) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos195
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveInteger(this172, parentKey9, childKey4, value3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveString(this176, parentKey13, childKey6, value5, __wurst_stackPos199) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos199
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveStr(this176, parentKey13, childKey6, value5)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_HeroTrainer(__wurst_stackPos303) 
	local clVar16 = nil
	local temp84 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos303
	wurst_stack_depth = (wurst_stack_depth + 1)
	HeroTrainer_TAVERN_ID = 1848651827
	temp84 = EVENT_PLAYER_UNIT_TRAIN_FINISH
	clVar16 = EventListener_add_HeroTrainer:create22()
	EventListener_construct_EventListener(clVar16, "when calling construct_EventListener in HeroTrainer, line 9")
	EventListener_add(temp84, clVar16, "when calling add in HeroTrainer, line 9")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Hibernate(__wurst_stackPos304) 
	local clVar17 = nil
	local temp85 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos304
	wurst_stack_depth = (wurst_stack_depth + 1)
	Hibernate_HIBERNATE_ID = intEnsure(1095577654)
	Hibernate_HIBERNATE_BUFF_ID = intEnsure(1112354865)
	Hibernate_HIBERNATE_DURATION = 4.
	Hibernate_HEAL_INTERVAL = 0.1
	Hibernate_ARMOR_BONUS = 20.
	Hibernate_HP_PCT[0] = 0.30
	Hibernate_HP_PCT[1] = 0.40
	Hibernate_HP_PCT[2] = 0.50
	Hibernate_HP_FLAT[0] = 125.
	Hibernate_HP_FLAT[1] = 175.
	Hibernate_HP_FLAT[2] = 250.
	temp85 = Hibernate_HIBERNATE_ID
	clVar17 = OnCastListener_onCast_Hibernate:create23()
	OnCastListener_construct_OnCastListener(clVar17, "when calling construct_OnCastListener in Hibernate, line 65")
	EventListener_onCast(temp85, clVar17, "when calling onCast in Hibernate, line 65")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Icons(__wurst_stackPos279) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos279
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_InitFocusCamera(__wurst_stackPos305) 
	local clVar18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos305
	wurst_stack_depth = (wurst_stack_depth + 1)
	clVar18 = CallbackSingle_doAfter_InitFocusCamera:create26()
	CallbackSingle_construct_CallbackSingle(clVar18, "when calling construct_CallbackSingle in InitFocusCamera, line 6")
	doAfter(0.0, clVar18, "when calling doAfter in InitFocusCamera, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_InstantDummyCaster(__wurst_stackPos306) 
	local receiver33 = nil
	local receiver34 = nil
	local receiver35 = nil
	local receiver36 = nil
	local receiver37 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos306
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_DUMMY_CASTER_UNIT_ID = intEnsure(2016423985)
	InstantDummyCaster_DUMMY_ROOT_ABIL_ID = intEnsure(1095577655)
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

function InstantDummyCaster_prepare(owner2, id9, lvl1, pos9, __wurst_stackPos425) 
	local receiver38 = nil
	local receiver39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos425
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver38 = InstantDummyCaster_caster
	unit_addAbility(receiver38, id9, "when calling addAbility in InstantDummyCaster, line 27")
	receiver39 = receiver38
	unit_setMana(receiver39, 1000000., "when calling setMana in InstantDummyCaster, line 27")
	if vec3_inBounds(pos9, "when calling inBounds in InstantDummyCaster, line 28") then
		unit_setXYZ(InstantDummyCaster_caster, pos9, "when calling setXYZ in InstantDummyCaster, line 29")
	end
	if (lvl1 > 1) then
		unit_setAbilityLevel(InstantDummyCaster_caster, id9, lvl1, "when calling setAbilityLevel in InstantDummyCaster, line 31")
	end
	if not((owner2 == nil)) then
		unit_setOwner(InstantDummyCaster_caster, owner2, false, "when calling setOwner in InstantDummyCaster, line 33")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_finish(id10, __wurst_stackPos431) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos431
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setOwner(InstantDummyCaster_caster, Basics_DUMMY_PLAYER, false, "when calling setOwner in InstantDummyCaster, line 36")
	unit_removeAbility(InstantDummyCaster_caster, id10, "when calling removeAbility in InstantDummyCaster, line 37")
	unit_setPos(InstantDummyCaster_caster, MapBounds_boundMax, "when calling setPos in InstantDummyCaster, line 38")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_castTarget1(owner3, abilityId3, lvl3, orderId1, target8, casterPos1, __wurst_stackPos433) 
	local success = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos433
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_prepare(owner3, abilityId3, lvl3, casterPos1, "when calling prepare in InstantDummyCaster, line 47")
	unit_setFacing(InstantDummyCaster_caster, vec2_angleTo(unit_getPos(InstantDummyCaster_caster, "when calling getPos in InstantDummyCaster, line 48"), widget_getPos(target8, "when calling getPos in InstantDummyCaster, line 48"), "when calling angleTo in InstantDummyCaster, line 48"), "when calling setFacing in InstantDummyCaster, line 48")
	success = unit_issueTargetOrderById(InstantDummyCaster_caster, orderId1, target8, "when calling issueTargetOrderById in InstantDummyCaster, line 49")
	InstantDummyCaster_finish(abilityId3, "when calling finish in InstantDummyCaster, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return success
end

function InstantDummyCaster_castTarget(owner1, abilityId2, lvl, orderId, target4, __wurst_stackPos165) 
	local stackTrace_tempReturn34 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos165
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn34 = InstantDummyCaster_castTarget1(owner1, abilityId2, lvl, orderId, target4, vec2_toVec3(({__wurst_safe_GetWidgetX(target4), __wurst_safe_GetWidgetY(target4), }), "when calling toVec3 in InstantDummyCaster, line 62"), "when calling castTarget in InstantDummyCaster, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn34
end

function init_Integer(__wurst_stackPos247) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos247
	wurst_stack_depth = (wurst_stack_depth + 1)
	Integer_INT_MAX = 2147483647
	Integer_INT_MIN = -2147483648
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function int_toReal(this157, __wurst_stackPos180) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos180
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this157 * 1.)
end

function int_toString(this213, __wurst_stackPos351) 
	local stackTrace_tempReturn35 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos351
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn35 = tostring(this213)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn35
end

function int_bitOr(this202, other, __wurst_stackPos335) 
	local stackTrace_tempReturn36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos335
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn36 = BlzBitOr(this202, other)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn36
end

function int_bitXor(this203, other1, __wurst_stackPos336) 
	local stackTrace_tempReturn37 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos336
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn37 = BlzBitXor(this203, other1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn37
end

function init_Invigorate(__wurst_stackPos292) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos292
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
	local clVar19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos22
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount >= Invigorate_MAX_SEEDLING_STACKS) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	Invigorate_seedlingCount = (Invigorate_seedlingCount + 1)
	clVar19 = CallbackSingle_doAfter_Invigorate:create27()
	CallbackSingle_construct_CallbackSingle(clVar19, "when calling construct_CallbackSingle in Invigorate, line 24")
	doAfter(12., clVar19, "when calling doAfter in Invigorate, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos268) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos268
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_LinkedList(__wurst_stackPos274) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos274
	wurst_stack_depth = (wurst_stack_depth + 1)
	realToIndex(0., "when calling realToIndex in LinkedList, line 617")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos256) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos256
	wurst_stack_depth = (wurst_stack_depth + 1)
	MagicFunctions_compiletime = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function compileError(msg4, __wurst_stackPos400) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos400
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MapBounds(__wurst_stackPos283) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos283
	wurst_stack_depth = (wurst_stack_depth + 1)
	initMapBounds("when calling initMapBounds in MapBounds, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function inBoundsXY(x5, y4, __wurst_stackPos440) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos440
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((((x5 > MapBounds_boundMin[1]) and (x5 < MapBounds_boundMax[1])) and (y4 > MapBounds_boundMin[2])) and (y4 < MapBounds_boundMax[2]))
end

function vec3_inBounds(this238, __wurst_stackPos427) 
	local stackTrace_tempReturn38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos427
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn38 = inBoundsXY(this238[1], this238[2], "when calling inBoundsXY in MapBounds, line 40")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn38
end

function initMapBounds(__wurst_stackPos439) 
	local cond_result = nil
	local receiver40 = nil
	local cond_result1 = nil
	local receiver41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos439
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

function init_Maths(__wurst_stackPos250) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos250
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function max(__wurst_stackPos419, ...) 
	local maxNumber = nil
	local cond_result2 = nil
	local number3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos419
	wurst_stack_depth = (wurst_stack_depth + 1)
	maxNumber = Integer_INT_MIN
	local __args4 = table.pack(...)
	for i19=1,__args4.n do
	number3 = __args4[i19]
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

function min(__wurst_stackPos420, ...) 
	local minNumber = nil
	local cond_result3 = nil
	local number4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos420
	wurst_stack_depth = (wurst_stack_depth + 1)
	minNumber = Integer_INT_MAX
	local __args5 = table.pack(...)
	for i20=1,__args5.n do
	number4 = __args5[i20]
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

function init_Matrices(__wurst_stackPos260) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos260
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIdGenerator(__wurst_stackPos285) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos285
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_new_IdGenerator(2016423984, "when calling new_IdGenerator in ObjectIdGenerator, line 6")
	IdGenerator_new_IdGenerator(1213018160, "when calling new_IdGenerator in ObjectIdGenerator, line 7")
	IdGenerator_new_IdGenerator(1095577648, "when calling new_IdGenerator in ObjectIdGenerator, line 8")
	IdGenerator_new_IdGenerator(1112354864, "when calling new_IdGenerator in ObjectIdGenerator, line 9")
	IdGenerator_new_IdGenerator(1229795376, "when calling new_IdGenerator in ObjectIdGenerator, line 10")
	IdGenerator_new_IdGenerator(1380790320, "when calling new_IdGenerator in ObjectIdGenerator, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIds(__wurst_stackPos275) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos275
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_OnUnitEnterLeave(__wurst_stackPos288) 
	local i21 = nil
	local temp11 = nil
	local clVar20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos288
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_eventTrigger = CreateTrigger()
	OnUnitEnterLeave_preplacedUnits = CreateGroup()
	OnUnitEnterLeave_tempUnitsCount = 0
	OnUnitEnterLeave_ABILITY_ID = intEnsure(1095577649)
	i21 = 0
	temp11 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i21 > temp11) then
			break
		end
		player_setAbilityAvailable(Player_players[i21], OnUnitEnterLeave_ABILITY_ID, false, "when calling setAbilityAvailable in OnUnitEnterLeave, line 64")
		i21 = (i21 + 1)
	end
	clVar20 = CallbackSingle_nullTimer_OnUnitEnterLeave:create33()
	CallbackSingle_construct_CallbackSingle(clVar20, "when calling construct_CallbackSingle in OnUnitEnterLeave, line 66")
	nullTimer(clVar20, "when calling nullTimer in OnUnitEnterLeave, line 66")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushUnit1(u25, __wurst_stackPos449) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos449
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnits[OnUnitEnterLeave_tempUnitsCount] = u25
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit1(__wurst_stackPos450) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos450
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getEnterLeaveUnit(__wurst_stackPos451) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos451
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (OnUnitEnterLeave_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return OnUnitEnterLeave_tempUnits[(OnUnitEnterLeave_tempUnitsCount - 1)]
end

function onEnter(c4, __wurst_stackPos452) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos452
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(OnUnitEnterLeave_eventTrigger, __wurst_safe_Filter(c4), "when calling addCondition in OnUnitEnterLeave, line 46")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onLeave(c5, __wurst_stackPos453) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos453
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addAction(OnUnitEnterLeave_eventTrigger, c5, "when calling addAction in OnUnitEnterLeave, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function prepareUnit(u5, __wurst_stackPos158) 
	local receiver42 = nil
	local receiver43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos158
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

function code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave(__wurst_stackPos455) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos455
	wurst_stack_depth = (wurst_stack_depth + 1)
	prepareUnit(GetFilterUnit(), "when calling prepareUnit in OnUnitEnterLeave, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave(__wurst_stackPos456) 
	local leavingUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos456
	wurst_stack_depth = (wurst_stack_depth + 1)
	leavingUnit = GetTriggerUnit()
	if ((unit_getAbilityLevel(leavingUnit, OnUnitEnterLeave_ABILITY_ID, "when calling getAbilityLevel in OnUnitEnterLeave, line 73") == 0) and (GetIssuedOrderId() == OrderIds_undefend)) then
		pushUnit1(leavingUnit, "when calling pushUnit in OnUnitEnterLeave, line 74")
		trigger_execute(OnUnitEnterLeave_eventTrigger, "when calling execute in OnUnitEnterLeave, line 75")
		popUnit1("when calling popUnit in OnUnitEnterLeave, line 76")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Orders(__wurst_stackPos287) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos287
	wurst_stack_depth = (wurst_stack_depth + 1)
	OrderIds_rejuvination = 852160
	OrderIds_thunderbolt = 852095
	OrderIds_undefend = 852056
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos254) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos254
	wurst_stack_depth = (wurst_stack_depth + 1)
	Player_localPlayer = GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos458) 
	local i22 = nil
	local temp12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos458
	wurst_stack_depth = (wurst_stack_depth + 1)
	i22 = 0
	temp12 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i22 > temp12) then
			break
		end
		Player_players[i22] = Player(i22)
		i22 = (i22 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setGold(this257, val3, __wurst_stackPos459) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos459
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this257, PLAYER_STATE_RESOURCE_GOLD, val3, "when calling setState in Player, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setState(this258, state, val4, __wurst_stackPos460) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos460
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this258, state, val4)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addGold(this225, val1, __wurst_stackPos388) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos388
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_addState(this225, PLAYER_STATE_RESOURCE_GOLD, val1, "when calling addState in Player, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addState(this259, state1, val5, __wurst_stackPos461) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos461
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this259, state1, (player_getState(this259, state1, "when calling getState in Player, line 31") + val5))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setLumber(this261, val6, __wurst_stackPos463) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos463
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this261, PLAYER_STATE_RESOURCE_LUMBER, val6, "when calling setState in Player, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_getState(this260, state2, __wurst_stackPos462) 
	local stackTrace_tempReturn39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos462
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn39 = __wurst_safe_GetPlayerState(this260, state2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn39
end

function player_isAllyOf(this6, p, __wurst_stackPos6) 
	local stackTrace_tempReturn40 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos6
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn40 = __wurst_safe_IsPlayerAlly(this6, p)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn40
end

function player_isEnemyOf(this149, p5, __wurst_stackPos172) 
	local stackTrace_tempReturn41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos172
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn41 = __wurst_safe_IsPlayerEnemy(this149, p5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn41
end

function player_setAbilityAvailable(this254, abilityId4, avail, __wurst_stackPos448) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos448
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerAbilityAvailable(this254, abilityId4, avail)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Playercolor(__wurst_stackPos264) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos264
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Preloader(__wurst_stackPos284) 
	local clVar21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos284
	wurst_stack_depth = (wurst_stack_depth + 1)
	Preloader_autoFinish = true
	Preloader_dumg = CreateGroup()
	Preloader_dum = createUnit(Basics_DUMMY_PLAYER, UnitIds_shade, MapBounds_playableMin, ({0., }), "when calling createUnit in Preloader, line 53")
	unit_setInvulnerable(Preloader_dum, true, "when calling setInvulnerable in Preloader, line 54")
	if (Preloader_dum == nil) then
		error1("DUMMY_UNITID not added correctly to the map.", "when calling error in Preloader, line 56")
	end
	if Preloader_autoFinish then
		clVar21 = CallbackSingle_nullTimer_Preloader:create35()
		CallbackSingle_construct_CallbackSingle(clVar21, "when calling construct_CallbackSingle in Preloader, line 58")
		nullTimer(clVar21, "when calling nullTimer in Preloader, line 58")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function finishPreload(__wurst_stackPos161) 
	local clVar22 = nil
	local temp87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos161
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(Preloader_dum, "when calling remove in Preloader, line 47")
	temp87 = Preloader_dumg
	clVar22 = ForGroupCallback_forEachFrom_Preloader:create34()
	group_forEachFrom(temp87, clVar22, "when calling forEachFrom in Preloader, line 48")
	group_destr(Preloader_dumg, "when calling destr in Preloader, line 49")
	Preloader_dumg = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos255) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos255
	wurst_stack_depth = (wurst_stack_depth + 1)
	Printing_DEBUG_LEVEL = 2
	Printing_DEBUG_MSG_DURATION = 45.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Loglevel_getTag(this262, __wurst_stackPos464) 
	local temp13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos464
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp13 = this262
	if (temp13 == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffADADADtrace|r"
	elseif (temp13 == 1) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cff2685DCdebug|r"
	elseif (temp13 == 2) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFFCC00info|r"
	elseif (temp13 == 3) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffF47E3Ewarning|r"
	else
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFB2700error|r"
	end
end

function printLog(showTo, loglvl, msg7, __wurst_stackPos465) 
	local compositeMsg = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos465
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Printing_DEBUG_LEVEL <= loglvl) then
		compositeMsg = stringConcat(stringConcat(Loglevel_getTag(loglvl, "when calling getTag in Printing, line 81"), " - "), msg7)
		__wurst_safe_DisplayTimedTextToPlayer(showTo, 0., 0., Printing_DEBUG_MSG_DURATION, compositeMsg)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print1(msg1, __wurst_stackPos109) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos109
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print2(msg2, __wurst_stackPos329) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos329
	wurst_stack_depth = (wurst_stack_depth + 1)
	print1(tostring(msg2), "when calling print in Printing, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_trace(msg3, __wurst_stackPos354) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos354
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 0, msg3, "when calling printLog in Printing, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_warn(msg6, __wurst_stackPos421) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos421
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 3, msg6, "when calling printLog in Printing, line 45")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_error(msg5, __wurst_stackPos401) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos401
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 4, msg5, "when calling printLog in Printing, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos261) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos261
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos246) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos246
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function real_squared(this263, __wurst_stackPos466) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos466
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this263 * this263)
end

function real_toInt(this229, __wurst_stackPos402) 
	local stackTrace_tempReturn42 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos402
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn42 = R2I(this229)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn42
end

function rect_getMinX(this248, __wurst_stackPos442) 
	local stackTrace_tempReturn43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos442
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn43 = __wurst_safe_GetRectMinX(this248)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn43
end

function rect_getMaxX(this250, __wurst_stackPos444) 
	local stackTrace_tempReturn44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos444
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn44 = __wurst_safe_GetRectMaxX(this250)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn44
end

function rect_getMinY(this249, __wurst_stackPos443) 
	local stackTrace_tempReturn45 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos443
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn45 = __wurst_safe_GetRectMinY(this249)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn45
end

function rect_getMaxY(this251, __wurst_stackPos445) 
	local stackTrace_tempReturn46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos445
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn46 = __wurst_safe_GetRectMaxY(this251)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn46
end

function rect_getCenter(this197, __wurst_stackPos318) 
	local stackTrace_tempReturn47 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos318
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn47 = ({rect_getCenterX(this197, "when calling getCenterX in Rect, line 16"), rect_getCenterY(this197, "when calling getCenterY in Rect, line 16"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn47
end

function rect_getCenterX(this264, __wurst_stackPos467) 
	local stackTrace_tempReturn48 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos467
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn48 = __wurst_safe_GetRectCenterX(this264)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn48
end

function rect_getCenterY(this265, __wurst_stackPos468) 
	local stackTrace_tempReturn49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos468
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn49 = __wurst_safe_GetRectCenterY(this265)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn49
end

function init_Recycle(__wurst_stackPos307) 
	local iterator13 = nil
	local u26 = nil
	local clVar23 = nil
	local temp88 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos307
	wurst_stack_depth = (wurst_stack_depth + 1)
	Recycle_RECYCLE_ID = intEnsure(1095577700)
	group_enumUnitsOfType(Group_ENUM_GROUP, 1697656882, nil, "when calling enumUnitsOfType in Recycle, line 36")
	iterator13 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Recycle, line 37")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator13, "when calling hasNext in Recycle, line 37")) then
			break
		end
		u26 = GroupIterator_GroupIterator_next(iterator13, "when calling next in Recycle, line 37")
		__wurst_safe_UnitAddAbility(u26, Recycle_RECYCLE_ID)
	end
	GroupIterator_GroupIterator_close(iterator13, "when calling close in Recycle, line 37")
	temp88 = EVENT_PLAYER_UNIT_DEATH
	clVar23 = EventListener_add_Recycle:create36()
	EventListener_construct_EventListener(clVar23, "when calling construct_EventListener in Recycle, line 41")
	EventListener_add(temp88, clVar23, "when calling add in Recycle, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function region_addRect(this247, rct, __wurst_stackPos441) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos441
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RegionAddRect(this247, rct)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_RegisterEvents(__wurst_stackPos286) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos286
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

function registerPlayerUnitEvent1(p3, c, __wurst_stackPos156) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos156
	wurst_stack_depth = (wurst_stack_depth + 1)
	registerPlayerUnitEvent(p3, nil, c, nil, "when calling registerPlayerUnitEvent in RegisterEvents, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function registerPlayerUnitEvent(p2, filter2, condition, action, __wurst_stackPos34) 
	local hid = nil
	local k = nil
	local cond_result4 = nil
	local temp89 = nil
	local temp90 = nil
	local temp91 = nil
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
			temp89 = RegisterEvents_t[hid]
			temp90 = Player_players[k]
			temp91 = p2
			if not((filter2 == nil)) then
				cond_result4 = __wurst_safe_Filter(filter2)
			else
				cond_result4 = nil
			end
			trigger_registerPlayerUnitEvent(temp89, temp90, temp91, cond_result4, "when calling registerPlayerUnitEvent in RegisterEvents, line 21")
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

function code__registerPlayerUnitEvent_RegisterEvents(__wurst_stackPos469) 
	local stackTrace_tempReturn50 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos469
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn50 = trigger_evaluate(__wurst_objectFromIndex(intEnsure(HashMap_HashMap_get(RegisterEvents_onCastMap, GetSpellAbilityId(), "when calling get in RegisterEvents, line 58"))), "when calling evaluate in RegisterEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn50
end

function init_SeedBurst(__wurst_stackPos294) 
	local clVar24 = nil
	local temp92 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos294
	wurst_stack_depth = (wurst_stack_depth + 1)
	SeedBurst_SEED_BURST_ID = intEnsure(1095577653)
	SeedBurst_BURST_DAMAGE = 75.
	SeedBurst_BURST_RADIUS = 256.
	SeedBurst_BURST_DELAY = 0.15
	SeedBurst_BURST_SFX = "Abilities\\Spells\\Other\\Entangle\\EntangledTarget.mdl"
	SeedBurst_EXPLOSION_SFX = "Abilities\\Weapons\\GryphonRider\\GryphonRiderMissileArt.mdl"
	SeedBurst_INVIGORATE_BUFF_ID = 1114793322
	temp92 = SeedBurst_SEED_BURST_ID
	clVar24 = OnCastListener_onCast_SeedBurst:create37()
	OnCastListener_construct_OnCastListener(clVar24, "when calling construct_OnCastListener in SeedBurst, line 52")
	EventListener_onCast(temp92, clVar24, "when calling onCast in SeedBurst, line 52")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ShieldBash(__wurst_stackPos308) 
	local clVar25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos308
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1112354868)
	ShieldBash_MY_ABILITY_ID = intEnsure(1095577698)
	intEnsure(1095577699)
	intEnsure(2016423986)
	ShieldBash_ARMOR_BONUS = 4
	ShieldBash_REFLECT_CHANCE = 0.25
	ShieldBash_REFLECT_DAMAGE = 40.
	ShieldBash_REFLECT_SFX = "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl"
	stringConcat(stringConcat(stringConcat(stringConcat("Increases armor by ", int_toString(ShieldBash_ARMOR_BONUS, "when calling toString in ShieldBash, line 23")), " and has a "), int_toString(real_toInt((ShieldBash_REFLECT_CHANCE * 100.), "when calling toInt in ShieldBash, line 23"), "when calling toString in ShieldBash, line 23")), "% chance to retaliate.")
	clVar25 = DamageListener_addListener_ShieldBash:create40()
	DamageListener_construct_DamageListener(clVar25, "when calling construct_DamageListener in ShieldBash, line 85")
	DamageEvent_addListener(clVar25, "when calling addListener in ShieldBash, line 85")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onDamageTaken(__wurst_stackPos178) 
	local victim = nil
	local attacker1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos178
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

function init_SpiritWisps(__wurst_stackPos301) 
	local clVar26 = nil
	local temp93 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos301
	wurst_stack_depth = (wurst_stack_depth + 1)
	SpiritWisps_SPIRIT_WISPS_ID = intEnsure(1095577697)
	SpiritWisps_WISP_BUFF_ID = intEnsure(1112354867)
	SpiritWisps_WISP_UNIT_ID = UnitIds_wisp
	SpiritWisps_WISP_COUNT = 3
	SpiritWisps_WISP_DURATION = 10.
	SpiritWisps_WISP_HEAL = 15.
	SpiritWisps_WISP_RADIUS = 400.
	SpiritWisps_HEAL_INTERVAL = 1.
	SpiritWisps_ORBIT_RADIUS = 150.
	SpiritWisps_UPDATE_INTERVAL = 0.05
	temp93 = SpiritWisps_SPIRIT_WISPS_ID
	clVar26 = OnCastListener_onCast_SpiritWisps:create41()
	OnCastListener_construct_OnCastListener(clVar26, "when calling construct_OnCastListener in SpiritWisps, line 61")
	EventListener_onCast(temp93, clVar26, "when calling onCast in SpiritWisps, line 61")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_String(__wurst_stackPos251) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos251
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_StringUtils(__wurst_stackPos300) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos300
	wurst_stack_depth = (wurst_stack_depth + 1)
	StringUtils_MAX_INDEX = (126 + 1)
	initialize1("when calling initialize in StringUtils, line 186")
	__wurst_stringToIndex("")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initialize1(__wurst_stackPos471) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos471
	wurst_stack_depth = (wurst_stack_depth + 1)
	c2sInit("when calling c2sInit in StringUtils, line 181")
	s2cInit("when calling s2cInit in StringUtils, line 182")
	widthInit("when calling widthInit in StringUtils, line 183")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function c2sInit(__wurst_stackPos472) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos472
	wurst_stack_depth = (wurst_stack_depth + 1)
	StringUtils_c2s[0] = ""
	StringUtils_c2s[1] = ""
	StringUtils_c2s[2] = ""
	StringUtils_c2s[3] = ""
	StringUtils_c2s[4] = ""
	StringUtils_c2s[5] = ""
	StringUtils_c2s[6] = ""
	StringUtils_c2s[7] = ""
	StringUtils_c2s[8] = ""
	StringUtils_c2s[9] = "\t"
	StringUtils_c2s[10] = "\n"
	StringUtils_c2s[11] = ""
	StringUtils_c2s[12] = ""
	StringUtils_c2s[13] = "\r"
	StringUtils_c2s[14] = ""
	StringUtils_c2s[15] = ""
	StringUtils_c2s[16] = ""
	StringUtils_c2s[17] = ""
	StringUtils_c2s[18] = ""
	StringUtils_c2s[19] = ""
	StringUtils_c2s[20] = ""
	StringUtils_c2s[21] = ""
	StringUtils_c2s[22] = ""
	StringUtils_c2s[23] = ""
	StringUtils_c2s[24] = ""
	StringUtils_c2s[25] = ""
	StringUtils_c2s[26] = ""
	StringUtils_c2s[27] = ""
	StringUtils_c2s[28] = ""
	StringUtils_c2s[29] = ""
	StringUtils_c2s[30] = ""
	StringUtils_c2s[31] = ""
	StringUtils_c2s[32] = " "
	StringUtils_c2s[33] = "!"
	StringUtils_c2s[34] = "\""
	StringUtils_c2s[35] = "#"
	StringUtils_c2s[36] = "$"
	StringUtils_c2s[37] = "%"
	StringUtils_c2s[38] = "&"
	StringUtils_c2s[39] = "'"
	StringUtils_c2s[40] = "("
	StringUtils_c2s[41] = ")"
	StringUtils_c2s[42] = "*"
	StringUtils_c2s[43] = "+"
	StringUtils_c2s[44] = ","
	StringUtils_c2s[45] = "-"
	StringUtils_c2s[46] = "."
	StringUtils_c2s[47] = "/"
	StringUtils_c2s[48] = "0"
	StringUtils_c2s[49] = "1"
	StringUtils_c2s[50] = "2"
	StringUtils_c2s[51] = "3"
	StringUtils_c2s[52] = "4"
	StringUtils_c2s[53] = "5"
	StringUtils_c2s[54] = "6"
	StringUtils_c2s[55] = "7"
	StringUtils_c2s[56] = "8"
	StringUtils_c2s[57] = "9"
	StringUtils_c2s[58] = ":"
	StringUtils_c2s[59] = ";"
	StringUtils_c2s[60] = "<"
	StringUtils_c2s[61] = "="
	StringUtils_c2s[62] = ">"
	StringUtils_c2s[63] = "?"
	StringUtils_c2s[64] = "@"
	StringUtils_c2s[65] = "A"
	StringUtils_c2s[66] = "B"
	StringUtils_c2s[67] = "C"
	StringUtils_c2s[68] = "D"
	StringUtils_c2s[69] = "E"
	StringUtils_c2s[70] = "F"
	StringUtils_c2s[71] = "G"
	StringUtils_c2s[72] = "H"
	StringUtils_c2s[73] = "I"
	StringUtils_c2s[74] = "J"
	StringUtils_c2s[75] = "K"
	StringUtils_c2s[76] = "L"
	StringUtils_c2s[77] = "M"
	StringUtils_c2s[78] = "N"
	StringUtils_c2s[79] = "O"
	StringUtils_c2s[80] = "P"
	StringUtils_c2s[81] = "Q"
	StringUtils_c2s[82] = "R"
	StringUtils_c2s[83] = "S"
	StringUtils_c2s[84] = "T"
	StringUtils_c2s[85] = "U"
	StringUtils_c2s[86] = "V"
	StringUtils_c2s[87] = "W"
	StringUtils_c2s[88] = "X"
	StringUtils_c2s[89] = "Y"
	StringUtils_c2s[90] = "Z"
	StringUtils_c2s[91] = "["
	StringUtils_c2s[92] = "\\"
	StringUtils_c2s[93] = "]"
	StringUtils_c2s[94] = "^"
	StringUtils_c2s[95] = "_"
	StringUtils_c2s[96] = "`"
	StringUtils_c2s[97] = "a"
	StringUtils_c2s[98] = "b"
	StringUtils_c2s[99] = "c"
	StringUtils_c2s[100] = "d"
	StringUtils_c2s[101] = "e"
	StringUtils_c2s[102] = "f"
	StringUtils_c2s[103] = "g"
	StringUtils_c2s[104] = "h"
	StringUtils_c2s[105] = "i"
	StringUtils_c2s[106] = "j"
	StringUtils_c2s[107] = "k"
	StringUtils_c2s[108] = "l"
	StringUtils_c2s[109] = "m"
	StringUtils_c2s[110] = "n"
	StringUtils_c2s[111] = "o"
	StringUtils_c2s[112] = "p"
	StringUtils_c2s[113] = "q"
	StringUtils_c2s[114] = "r"
	StringUtils_c2s[115] = "s"
	StringUtils_c2s[116] = "t"
	StringUtils_c2s[117] = "u"
	StringUtils_c2s[118] = "v"
	StringUtils_c2s[119] = "w"
	StringUtils_c2s[120] = "x"
	StringUtils_c2s[121] = "y"
	StringUtils_c2s[122] = "z"
	StringUtils_c2s[123] = "{"
	StringUtils_c2s[124] = "|"
	StringUtils_c2s[125] = "}"
	StringUtils_c2s[126] = "~"
	StringUtils_c2s[127] = ""
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function s2cInit(__wurst_stackPos473) 
	local i23 = nil
	local temp14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos473
	wurst_stack_depth = (wurst_stack_depth + 1)
	i23 = 0
	temp14 = StringUtils_MAX_INDEX
	while true do
		if (i23 > temp14) then
			break
		end
		if (string_toUpperCase(stringEnsure(StringUtils_c2s[i23]), "when calling toUpperCase in StringUtils, line 321") == stringEnsure(StringUtils_c2s[i23])) then
		end
		i23 = (i23 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widthInit(__wurst_stackPos474) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos474
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this266, __wurst_stackPos470) 
	local stackTrace_tempReturn51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos470
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn51 = StringLength(this266)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn51
end

function string_toUpperCase(this267, __wurst_stackPos475) 
	local stackTrace_tempReturn52 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos475
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn52 = StringCase(this267, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn52
end

function string_getHash(this221, __wurst_stackPos381) 
	local stackTrace_tempReturn53 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos381
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn53 = StringHash(this221)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn53
end

function init_SummonTreant(__wurst_stackPos293) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos293
	wurst_stack_depth = (wurst_stack_depth + 1)
	SummonTreant_SUMMON_TREANT_ID = intEnsure(1095577652)
	SummonTreant_TREANT_UNIT_ID = 1697656882
	SummonTreant_TREANT_DURATION = 15.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Table(__wurst_stackPos262) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos262
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TargetsAllowed(__wurst_stackPos276) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos276
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ThickBark(__wurst_stackPos310) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos310
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1095577701)
	intEnsure(1380790321)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_createTimerDialog(this222, __wurst_stackPos384) 
	local stackTrace_tempReturn54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos384
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn54 = __wurst_safe_CreateTimerDialog(this222)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn54
end

function timerdialog_setTitle(this223, title, __wurst_stackPos385) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos385
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogSetTitle(this223, title)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timerdialog_display(this224, display, __wurst_stackPos386) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos386
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerDialogDisplay(this224, display)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TimerUtils(__wurst_stackPos280) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos280
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

function timer_getData(this219, __wurst_stackPos375) 
	local stackTrace_tempReturn55 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos375
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn55 = Table_Table_loadInt(TimerUtils_timerData, handle_getTCHandleId(this219, "when calling getTCHandleId in TimerUtils, line 22"), "when calling loadInt in TimerUtils, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn55
end

function getTimer(__wurst_stackPos372) 
	local receiver44 = nil
	local stackTrace_tempReturn56 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos372
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (TimerUtils_freeTimersCount > 0) then
		TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount - 1)
		timer_setData(TimerUtils_freeTimers[TimerUtils_freeTimersCount], 0, "when calling setData in TimerUtils, line 30")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return TimerUtils_freeTimers[TimerUtils_freeTimersCount]
	else
		receiver44 = CreateTimer()
		timer_setData(receiver44, 0, "when calling setData in TimerUtils, line 33")
		stackTrace_tempReturn56 = receiver44
		wurst_stack_depth = (wurst_stack_depth - 1)
		return stackTrace_tempReturn56
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

function timer_pause(this269, __wurst_stackPos477) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos477
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseTimer(this269)
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
	local stackTrace_tempReturn57 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos30
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn57 = __wurst_safe_TriggerAddAction(this23, actionFunc)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn57
end

function trigger_addCondition(this201, condition1, __wurst_stackPos331) 
	local stackTrace_tempReturn58 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos331
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn58 = __wurst_safe_TriggerAddCondition(this201, condition1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn58
end

function trigger_evaluate(this191, __wurst_stackPos215) 
	local stackTrace_tempReturn59 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos215
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn59 = __wurst_safe_TriggerEvaluate(this191)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn59
end

function trigger_execute(this256, __wurst_stackPos457) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos457
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TriggerExecute(this256)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_registerEnterRegion(this139, whichRegion, filter3, __wurst_stackPos155) 
	local stackTrace_tempReturn60 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos155
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn60 = __wurst_safe_TriggerRegisterEnterRegion(this139, whichRegion, filter3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn60
end

function trigger_registerPlayerChatEvent(this25, whichPlayer1, chatMessageToDetect, exactMatchOnly, __wurst_stackPos33) 
	local stackTrace_tempReturn61 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos33
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn61 = __wurst_safe_TriggerRegisterPlayerChatEvent(this25, whichPlayer1, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn61
end

function trigger_registerPlayerEvent(this24, whichPlayer, whichPlayerEvent, __wurst_stackPos32) 
	local stackTrace_tempReturn62 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos32
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn62 = __wurst_safe_TriggerRegisterPlayerEvent(this24, whichPlayer, whichPlayerEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn62
end

function trigger_registerPlayerUnitEvent(this200, whichPlayer8, whichPlayerUnitEvent, filter4, __wurst_stackPos330) 
	local stackTrace_tempReturn63 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos330
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn63 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this200, whichPlayer8, whichPlayerUnitEvent, filter4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn63
end

function trigger_registerUnitEvent(this226, whichUnit8, whichEvent1, __wurst_stackPos390) 
	local stackTrace_tempReturn64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos390
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn64 = __wurst_safe_TriggerRegisterUnitEvent(this226, whichUnit8, whichEvent1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn64
end

function init_TypeCasting(__wurst_stackPos270) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos270
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	TypeCasting_R2I_PRECISION = 1000.
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos478) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos478
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function handle_getTCHandleId(this268, __wurst_stackPos476) 
	local stackTrace_tempReturn65 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos476
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn65 = GetHandleId(this268)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn65
end

function realToIndex(r4, __wurst_stackPos438) 
	local stackTrace_tempReturn66 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos438
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn66 = real_toInt((r4 * TypeCasting_R2I_PRECISION), "when calling toInt in TypeCasting, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn66
end

function stringToIndex(s, __wurst_stackPos479) 
	return __wurst_stringToIndex(s)
end

function unitFromIndex(index7, __wurst_stackPos480) 
	return __wurst_objectFromIndex(index7)
end

function unitToIndex(object, __wurst_stackPos481) 
	return __wurst_objectToIndex(object)
end

function groupToIndex(object1, __wurst_stackPos482) 
	return __wurst_objectToIndex(object1)
end

function triggerFromIndex(index8, __wurst_stackPos483) 
	return __wurst_objectFromIndex(index8)
end

function booleanToIndex(u22, __wurst_stackPos422) 
	local cond_result5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos422
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	if u22 then
		cond_result5 = 1
	else
		cond_result5 = 0
	end
	return cond_result5
end

function init_UnitIds(__wurst_stackPos282) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos282
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIds_shade = 1970497636
	UnitIds_wisp = 1702327152
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UnitIndexer(__wurst_stackPos289) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos289
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

function pushUnit(u12, __wurst_stackPos214) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos214
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnits[UnitIndexer_tempUnitsCount] = u12
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit(__wurst_stackPos216) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos216
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function shouldIndex(_u1, __wurst_stackPos484) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos484
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function unit_getIndex(this35, __wurst_stackPos44) 
	local stackTrace_tempReturn67 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos44
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn67 = unit_getUserData(this35, "when calling getUserData in UnitIndexer, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn67
end

function unit_toUnitIndex(this271, __wurst_stackPos486) 
	local instance = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos486
	wurst_stack_depth = (wurst_stack_depth + 1)
	instance = __wurst_objectFromIndex(unit_getUserData(this271, "when calling getUserData in UnitIndexer, line 132"))
	if (instance == nil) then
		instance = UnitIndex_new_UnitIndex(this271, "when calling new_UnitIndex in UnitIndexer, line 135")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return instance
end

function getIndexingUnit(__wurst_stackPos356) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos356
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (UnitIndexer_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return UnitIndexer_tempUnits[(UnitIndexer_tempUnitsCount - 1)]
end

function onUnitDeindex(func2, __wurst_stackPos342) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos342
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(UnitIndexer_onDeindexTrigger, __wurst_safe_Condition(func2), "when calling addCondition in UnitIndexer, line 150")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_deindex(this272, __wurst_stackPos487) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos487
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (unit_getUserData(this272, "when calling getUserData in UnitIndexer, line 160") == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return false
	else
		UnitIndex_destroyUnitIndex(unit_toUnitIndex(this272, "when calling toUnitIndex in UnitIndexer, line 163"), "when calling destroyUnitIndex in UnitIndexer, line 163")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return true
	end
end

function code__onEnter_UnitIndexer(__wurst_stackPos488) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos488
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling shouldIndex in UnitIndexer, line 190") then
		unit_toUnitIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling toUnitIndex in UnitIndexer, line 190")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onLeave_UnitIndexer(__wurst_stackPos489) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos489
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling shouldIndex in UnitIndexer, line 191") then
		unit_deindex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling deindex in UnitIndexer, line 191")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getTypeId(this94, __wurst_stackPos107) 
	local stackTrace_tempReturn68 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos107
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn68 = __wurst_safe_GetUnitTypeId(this94)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn68
end

function createUnit(p1, unitId, pos3, facing, __wurst_stackPos25) 
	local stackTrace_tempReturn69 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos25
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn69 = __wurst_safe_CreateUnit(p1, unitId, pos3[1], pos3[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn69
end

function unit_setFlyHeight(this273, height, rate, __wurst_stackPos490) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos490
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFlyHeight(this273, height, rate)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addAbility(this159, abil1, __wurst_stackPos182) 
	local stackTrace_tempReturn70 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos182
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn70 = __wurst_safe_UnitAddAbility(this159, abil1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn70
end

function unit_setAbilityLevel(this240, abilId3, lvl2, __wurst_stackPos429) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos429
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAbilityLevel(this240, abilId3, lvl2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_makeAbilityPermanent(this255, abil2, flag1, __wurst_stackPos454) 
	local stackTrace_tempReturn71 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos454
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn71 = __wurst_safe_UnitMakeAbilityPermanent(this255, flag1, abil2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn71
end

function unit_addHP(this8, val, __wurst_stackPos8) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos8
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_addState(this8, UNIT_STATE_LIFE, val, "when calling addState in Unit, line 81")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addState(this274, state3, value15, __wurst_stackPos491) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos491
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this274, state3, (unit_getState(this274, state3, "when calling getState in Unit, line 96") + value15))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getState(this275, state4, __wurst_stackPos492) 
	local stackTrace_tempReturn72 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos492
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn72 = __wurst_safe_GetUnitState(this275, state4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn72
end

function unit_damageTarget(this150, target5, amount1, attack, ranged, attackType, damageType2, weaponType, __wurst_stackPos173) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos173
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_UnitDamageTarget(this150, target5, amount1, attack, ranged, attackType, damageType2, weaponType)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_kill(this12, __wurst_stackPos13) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos13
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_KillUnit(this12)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getAbilityLevel(this98, id3, __wurst_stackPos112) 
	local stackTrace_tempReturn73 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos112
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn73 = __wurst_safe_GetUnitAbilityLevel(this98, id3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn73
end

function unit_getHP(this163, __wurst_stackPos186) 
	local stackTrace_tempReturn74 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos186
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn74 = unit_getState(this163, UNIT_STATE_LIFE, "when calling getState in Unit, line 211")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn74
end

function unit_getMaxHP(this99, __wurst_stackPos113) 
	local stackTrace_tempReturn75 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos113
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn75 = unit_getState(this99, UNIT_STATE_MAX_LIFE, "when calling getState in Unit, line 223")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn75
end

function handle_getHandleId(this209, __wurst_stackPos346) 
	local stackTrace_tempReturn76 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos346
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn76 = GetHandleId(this209)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn76
end

function unit_getName(this96, __wurst_stackPos110) 
	local stackTrace_tempReturn77 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos110
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn77 = __wurst_safe_GetUnitName(this96)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn77
end

function unit_getOwner(this7, __wurst_stackPos7) 
	local stackTrace_tempReturn78 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos7
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn78 = __wurst_safe_GetOwningPlayer(this7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn78
end

function unit_getPos(this17, __wurst_stackPos19) 
	local stackTrace_tempReturn79 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos19
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn79 = ({unit_getX(this17, "when calling getX in Unit, line 249"), unit_getY(this17, "when calling getY in Unit, line 249"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn79
end

function unit_getX(this108, __wurst_stackPos124) 
	local stackTrace_tempReturn80 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos124
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn80 = __wurst_safe_GetUnitX(this108)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn80
end

function unit_getY(this109, __wurst_stackPos125) 
	local stackTrace_tempReturn81 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos125
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn81 = __wurst_safe_GetUnitY(this109)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn81
end

function unit_getUserData(this270, __wurst_stackPos485) 
	local stackTrace_tempReturn82 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos485
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn82 = __wurst_safe_GetUnitUserData(this270)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn82
end

function unit_hasAbility(this16, id, __wurst_stackPos17) 
	local stackTrace_tempReturn83 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos17
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn83 = (__wurst_safe_GetUnitAbilityLevel(this16, id) > 0)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn83
end

function unit_isAlive(this5, __wurst_stackPos5) 
	local stackTrace_tempReturn84 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos5
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn84 = UnitAlive(this5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn84
end

if UnitAlive then
else
	UnitAlive = function (id13) 
			error("The native 'UnitAlive' is not implemented.")
		end
end

function unit_issueTargetOrderById(this245, id11, target9, __wurst_stackPos436) 
	local stackTrace_tempReturn85 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos436
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn85 = __wurst_safe_IssueTargetOrderById(this245, id11, target9)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn85
end

function unit_pause(this102, __wurst_stackPos116) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos116
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this102, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_unpause(this106, __wurst_stackPos122) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos122
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this106, false)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_remove(this95, __wurst_stackPos108) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos108
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RemoveUnit(this95)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_removeAbility(this146, abil, __wurst_stackPos168) 
	local stackTrace_tempReturn86 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos168
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn86 = __wurst_safe_UnitRemoveAbility(this146, abil)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn86
end

function unit_setAnimation(this205, name2, __wurst_stackPos339) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos339
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAnimation(this205, name2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setFacing(this243, a1, __wurst_stackPos434) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos434
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFacing(this243, angle_degrees(a1, "when calling degrees in Unit, line 516"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setState(this276, state5, value16, __wurst_stackPos493) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos493
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this276, state5, value16)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setInvulnerable(this204, flag, __wurst_stackPos338) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos338
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitInvulnerable(this204, flag)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setMana(this237, val2, __wurst_stackPos426) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos426
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setState(this237, UNIT_STATE_MANA, val2, "when calling setState in Unit, line 528")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setOwner(this241, p16, changeColor1, __wurst_stackPos430) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos430
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitOwner(this241, p16, changeColor1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPathing(this103, value2, __wurst_stackPos117) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos117
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPathing(this103, value2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPos(this242, pos11, __wurst_stackPos432) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos432
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPosition(this242, pos11[1], pos11[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setUserData(this190, data1, __wurst_stackPos213) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos213
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitUserData(this190, data1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setVertexColor(this160, r, g1, b, a, __wurst_stackPos183) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos183
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitVertexColor(this160, r, g1, b, a)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setX(this277, x8, __wurst_stackPos494) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos494
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitX(this277, x8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setXY(this165, pos6, __wurst_stackPos188) 
	local receiver45 = nil
	local receiver46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos188
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver45 = this165
	unit_setX(receiver45, pos6[1], "when calling setX in Unit, line 598")
	receiver46 = receiver45
	unit_setY(receiver46, pos6[2], "when calling setY in Unit, line 598")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setY(this278, y7, __wurst_stackPos495) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos495
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitY(this278, y7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setXYZ(this239, pos10, __wurst_stackPos428) 
	local receiver47 = nil
	local receiver48 = nil
	local receiver49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos428
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver47 = this239
	unit_setX(receiver47, pos10[1], "when calling setX in Unit, line 608")
	receiver48 = receiver47
	unit_setY(receiver48, pos10[2], "when calling setY in Unit, line 608")
	receiver49 = receiver48
	unit_setFlyHeight(receiver49, pos10[3], 0., "when calling setFlyHeight in Unit, line 609")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getArmor(this101, __wurst_stackPos115) 
	local stackTrace_tempReturn87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos115
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn87 = __wurst_safe_BlzGetUnitArmor(this101)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn87
end

function unit_setArmor(this100, armorAmount, __wurst_stackPos114) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos114
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetUnitArmor(this100, armorAmount)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UpgradeObjEditing(__wurst_stackPos309) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos309
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UrsocCharge(__wurst_stackPos311) 
	local clVar27 = nil
	local temp94 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos311
	wurst_stack_depth = (wurst_stack_depth + 1)
	UrsocCharge_URSOC_CHARGE_ID = intEnsure(1095577656)
	UrsocCharge_CHARGE_STUN_ID = intEnsure(1095577657)
	intEnsure(1112354866)
	UrsocCharge_CHARGE_DAMAGE = 100.
	UrsocCharge_CHARGE_SFX = "Abilities\\Spells\\Human\\Charge\\ChargeTarget.mdl"
	UrsocCharge_IMPACT_SFX = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"
	temp94 = UrsocCharge_URSOC_CHARGE_ID
	clVar27 = OnCastListener_onCast_UrsocCharge:create47()
	OnCastListener_construct_OnCastListener(clVar27, "when calling construct_OnCastListener in UrsocCharge, line 63")
	EventListener_onCast(temp94, clVar27, "when calling onCast in UrsocCharge, line 63")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UrsocMain(__wurst_stackPos312) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos312
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Vectors(__wurst_stackPos252) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos252
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function vec2_op_plus(this253, v2, __wurst_stackPos447) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos447
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this253[1] + v2[1]), (this253[2] + v2[2]), })
end

function vec2_op_mult(this252, factor, __wurst_stackPos446) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos446
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this252[1] * factor), (this252[2] * factor), })
end

function vec2_toVec3(this246, __wurst_stackPos437) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos437
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this246[1], this246[2], 0., })
end

function vec2_angleTo(this164, v1, __wurst_stackPos187) 
	local stackTrace_tempReturn88 = ({0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos187
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn88 = tupleCopy1(real_asAngleRadians(Atan2((v1[2] - this164[2]), (v1[1] - this164[1])), "when calling asAngleRadians in Vectors, line 127"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn88
end

function vec2_polarOffset(this158, ang, dist1, __wurst_stackPos181) 
	local stackTrace_tempReturn89 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos181
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn89 = tupleCopy(vec2_op_plus(this158, angle_toVec(ang, dist1, "when calling toVec in Vectors, line 131"), "when calling op_plus in Vectors, line 131"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn89
end

function angle_toVec(this279, len, __wurst_stackPos496) 
	local stackTrace_tempReturn90 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos496
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn90 = ({(Cos(this279[1]) * len), (Sin(this279[1]) * len), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn90
end

function vec2_distanceTo(this144, v, __wurst_stackPos164) 
	local stackTrace_tempReturn91 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos164
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn91 = SquareRoot((real_squared((v[1] - this144[1]), "when calling squared in Vectors, line 157") + real_squared((v[2] - this144[2]), "when calling squared in Vectors, line 157")))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn91
end

function init_WeatherEffects(__wurst_stackPos269) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos269
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widget_getPos(this244, __wurst_stackPos435) 
	local stackTrace_tempReturn92 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos435
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn92 = ({widget_getX(this244, "when calling getX in Widget, line 12"), widget_getY(this244, "when calling getY in Widget, line 12"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn92
end

function widget_getX(this280, __wurst_stackPos497) 
	local stackTrace_tempReturn93 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos497
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn93 = __wurst_safe_GetWidgetX(this280)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn93
end

function widget_getY(this281, __wurst_stackPos498) 
	local stackTrace_tempReturn94 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos498
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn94 = __wurst_safe_GetWidgetY(this281)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn94
end

function widget_addEffect(this161, modelName, attachment, __wurst_stackPos184) 
	local stackTrace_tempReturn95 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos184
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn95 = __wurst_safe_AddSpecialEffectTarget(modelName, this161, attachment)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn95
end

function init_winLoss(__wurst_stackPos313) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos313
	wurst_stack_depth = (wurst_stack_depth + 1)
	setupDefeatCondition("when calling setupDefeatCondition in winLoss, line 26")
	setupVictoryCondition("when calling setupVictoryCondition in winLoss, line 27")
	player_setGold(Player_players[0], 1000, "when calling setGold in winLoss, line 28")
	player_setLumber(Player_players[0], 1000, "when calling setLumber in winLoss, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupVictoryCondition(__wurst_stackPos500) 
	local receiver50 = nil
	local receiver51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos500
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver50 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver50, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 12")
	receiver51 = receiver50
	trigger_addAction(receiver51, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 13")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss(__wurst_stackPos501) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos501
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_remove(BasicWaves_footmen, "when calling remove in winLoss, line 14", GetTriggerUnit())
	if group_isEmpty(BasicWaves_footmen, "when calling isEmpty in winLoss, line 15") then
		__wurst_safe_CustomVictoryBJ(Player_players[0], true, true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupDefeatCondition(__wurst_stackPos499) 
	local receiver52 = nil
	local receiver53 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos499
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver52 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver52, Player_players[0], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 20")
	receiver53 = receiver52
	trigger_addAction(receiver53, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss1(__wurst_stackPos502) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos502
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (GetTriggerUnit() == udg_townHall) then
		__wurst_safe_CustomDefeatBJ(Player_players[0], "You have been defeated!")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos243) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos243
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos503) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos503
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
	__wurst_SaveStr(hashtable_compiletime1, 2, -263269125, "AM03")
	__wurst_SaveStr(hashtable_compiletime1, 2, -540326714, "AInv")
	__wurst_SaveStr(hashtable_compiletime1, 2, 1032637, "Ault")
	__wurst_SaveStr(hashtable_compiletime1, 2, -644213493, "AM04")
	__wurst_SaveStr(hashtable_compiletime1, 2, -2032846969, "AM05")
	__wurst_SaveStr(hashtable_compiletime1, 2, -844489484, "AM02")
	__wurst_SaveStr(hashtable_compiletime1, 2, 1282521876, "Aloc")
	__wurst_SaveStr(hashtable_compiletime1, 2, 512215473, "Agho")
	__wurst_SaveStr(hashtable_compiletime1, 2, -809044371, "A001")
	__wurst_SaveStr(hashtable_compiletime1, 2, 264091612, "AM08")
	__wurst_SaveStr(hashtable_compiletime1, 2, 16258522, "A002")
	__wurst_SaveStr(hashtable_compiletime1, 2, -1194720164, "AM06")
	__wurst_SaveStr(hashtable_compiletime1, 2, -1432153523, "AHav")
	__wurst_SaveStr(hashtable_compiletime1, 2, -1945487672, "AM0a")
	__wurst_SaveStr(hashtable_compiletime1, 2, 79905753, "ACm2")
	__wurst_SaveStr(hashtable_compiletime1, 2, -849326328, "Aien")
	__wurst_SaveStr(hashtable_compiletime1, 2, -690706802, "Aadm")
	__wurst_SaveStr(hashtable_compiletime1, 2, 860156185, "Aspo")
	__wurst_SaveStr(hashtable_compiletime1, 2, 960411499, "AM0d")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function bridge_Unit000038_DropItems() 
	Unit000038_DropItems("via function reference war3map, line 488")
end

function bridge_Unit000043_DropItems() 
	Unit000043_DropItems("via function reference war3map, line 497")
end

function bridge_Unit000080_DropItems() 
	Unit000080_DropItems("via function reference war3map, line 516")
end

function bridge_Unit000077_DropItems() 
	Unit000077_DropItems("via function reference war3map, line 523")
end

function bridge_Unit000090_DropItems() 
	Unit000090_DropItems("via function reference war3map, line 533")
end

function bridge_Unit000097_DropItems() 
	Unit000097_DropItems("via function reference war3map, line 542")
end

function bridge_Unit000003_DropItems() 
	Unit000003_DropItems("via function reference war3map, line 556")
end

function bridge_Unit000116_DropItems() 
	Unit000116_DropItems("via function reference war3map, line 564")
end

function bridge_Trig_init_Actions() 
	Trig_init_Actions("via function reference war3map, line 688")
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

function __wurst_safe_GetUnitX(whichUnit6) 
	if (whichUnit6 == nil) then
		return 0.0
	end
	return GetUnitX(whichUnit6)
end

function __wurst_safe_GetUnitY(whichUnit7) 
	if (whichUnit7 == nil) then
		return 0.0
	end
	return GetUnitY(whichUnit7)
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

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger9, whichPlayer20, whichPlayerUnitEvent1, filter11) 
	if (whichTrigger9 == nil) then
		return nil
	end
	if (whichPlayer20 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger9, whichPlayer20, whichPlayerUnitEvent1, filter11)
end

function __wurst_safe_TriggerRegisterPlayerEvent(whichTrigger8, whichPlayer19, whichPlayerEvent1) 
	if (whichTrigger8 == nil) then
		return nil
	end
	if (whichPlayer19 == nil) then
		return nil
	end
	if (whichPlayerEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerEvent(whichTrigger8, whichPlayer19, whichPlayerEvent1)
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

function __wurst_safe_SetUnitAbilityLevel(whichUnit16, abilcode, level1) 
	if (whichUnit16 == nil) then
		return 0
	end
	return SetUnitAbilityLevel(whichUnit16, abilcode, level1)
end

function __wurst_safe_GetUnitAbilityLevel(whichUnit20, abilcode1) 
	if (whichUnit20 == nil) then
		return 0
	end
	return GetUnitAbilityLevel(whichUnit20, abilcode1)
end

function __wurst_safe_UnitRemoveAbility(whichUnit1, abilityId1) 
	if (whichUnit1 == nil) then
		return false
	end
	return UnitRemoveAbility(whichUnit1, abilityId1)
end

function __wurst_safe_GetItemTypeId(i24) 
	if (i24 == nil) then
		return 0
	end
	return GetItemTypeId(i24)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level2) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level2)
end

function __wurst_safe_GroupClear(whichGroup4) 
	if (whichGroup4 == nil) then
		return nil
	end
	GroupClear(whichGroup4)
end

function __wurst_safe_GroupAddUnit(whichGroup5, whichUnit12) 
	if (whichGroup5 == nil) then
		return false
	end
	if (whichUnit12 == nil) then
		return false
	end
	return GroupAddUnit(whichGroup5, whichUnit12)
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

function __wurst_safe_UnitSuspendDecay(whichUnit38, suspend) 
	if (whichUnit38 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit38, suspend)
end

function __wurst_safe_GetUnitState(whichUnit9, whichUnitState) 
	if (whichUnit9 == nil) then
		return 0.0
	end
	if (whichUnitState == nil) then
		return 0.0
	end
	return GetUnitState(whichUnit9, whichUnitState)
end

function __wurst_safe_SetUnitTimeScale(whichUnit39, timeScale) 
	if (whichUnit39 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit39, timeScale)
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

function __wurst_safe_TriggerAddAction(whichTrigger2, actionFunc1) 
	if (whichTrigger2 == nil) then
		return nil
	end
	return TriggerAddAction(whichTrigger2, actionFunc1)
end

function __wurst_safe_SetUnitState(whichUnit11, whichUnitState1, newVal) 
	if (whichUnit11 == nil) then
		return nil
	end
	if (whichUnitState1 == nil) then
		return nil
	end
	SetUnitState(whichUnit11, whichUnitState1, newVal)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit40) 
	if (whichUnit40 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit40)
end

function __wurst_safe_IsUnitHidden(whichUnit4) 
	if (whichUnit4 == nil) then
		return false
	end
	return IsUnitHidden(whichUnit4)
end

function __wurst_safe_IsUnitType(whichUnit41, whichUnitType) 
	if (whichUnit41 == nil) then
		return false
	end
	if (whichUnitType == nil) then
		return false
	end
	return IsUnitType(whichUnit41, whichUnitType)
end

function __wurst_safe_GetUnitTypeId(whichUnit14) 
	if (whichUnit14 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit14)
end

function __wurst_safe_FirstOfGroup(whichGroup9) 
	if (whichGroup9 == nil) then
		return nil
	end
	return FirstOfGroup(whichGroup9)
end

function __wurst_safe_IssueTargetOrderById(whichUnit24, order2, targetWidget3) 
	if (whichUnit24 == nil) then
		return false
	end
	if (targetWidget3 == nil) then
		return false
	end
	return IssueTargetOrderById(whichUnit24, order2, targetWidget3)
end

function __wurst_safe_SetUnitFlyHeight(whichUnit15, newHeight, rate1) 
	if (whichUnit15 == nil) then
		return nil
	end
	SetUnitFlyHeight(whichUnit15, newHeight, rate1)
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

function __wurst_safe_PauseUnit(whichUnit25, flag2) 
	if (whichUnit25 == nil) then
		return nil
	end
	PauseUnit(whichUnit25, flag2)
end

function __wurst_safe_GetPlayerController(whichPlayer23) 
	if (whichPlayer23 == nil) then
		return nil
	end
	return GetPlayerController(whichPlayer23)
end

function __wurst_safe_UnitAddAbility(whichUnit, abilityId) 
	if (whichUnit == nil) then
		return false
	end
	return UnitAddAbility(whichUnit, abilityId)
end

function __wurst_safe_UnitMakeAbilityPermanent(whichUnit17, permanent, abilityId5) 
	if (whichUnit17 == nil) then
		return false
	end
	return UnitMakeAbilityPermanent(whichUnit17, permanent, abilityId5)
end

function __wurst_safe_KillUnit(whichUnit19) 
	if (whichUnit19 == nil) then
		return nil
	end
	KillUnit(whichUnit19)
end

function __wurst_safe_GetOwningPlayer(whichUnit22) 
	if (whichUnit22 == nil) then
		return nil
	end
	return GetOwningPlayer(whichUnit22)
end

function __wurst_safe_CreateUnit(id12, unitid1, x7, y6, face1) 
	if (id12 == nil) then
		return nil
	end
	return CreateUnit(id12, unitid1, x7, y6, face1)
end

function __wurst_safe_RemoveUnit(whichUnit26) 
	if (whichUnit26 == nil) then
		return nil
	end
	RemoveUnit(whichUnit26)
end

function __wurst_safe_SetUnitFacing(whichUnit28, facingAngle) 
	if (whichUnit28 == nil) then
		return nil
	end
	SetUnitFacing(whichUnit28, facingAngle)
end

function __wurst_safe_AddItemToStock(whichUnit42, itemId, currentStock, stockMax) 
	if (whichUnit42 == nil) then
		return nil
	end
	AddItemToStock(whichUnit42, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit43, itemId1) 
	if (whichUnit43 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit43, itemId1)
end

function __wurst_safe_UnitDamageTarget(whichUnit18, target10, amount3, attack1, ranged1, attackType3, damageType4, weaponType2) 
	if (whichUnit18 == nil) then
		return false
	end
	if (target10 == nil) then
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
	return UnitDamageTarget(whichUnit18, target10, amount3, attack1, ranged1, attackType3, damageType4, weaponType2)
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

function __wurst_safe_SetUnitPosition(whichUnit31, newX, newY) 
	if (whichUnit31 == nil) then
		return nil
	end
	SetUnitPosition(whichUnit31, newX, newY)
end

function __wurst_safe_GroupEnumUnitsInRect(whichGroup1, r3, filter7) 
	if (whichGroup1 == nil) then
		return nil
	end
	if (r3 == nil) then
		return nil
	end
	GroupEnumUnitsInRect(whichGroup1, r3, filter7)
end

function __wurst_safe_GroupRemoveUnit(whichGroup6, whichUnit13) 
	if (whichGroup6 == nil) then
		return false
	end
	if (whichUnit13 == nil) then
		return false
	end
	return GroupRemoveUnit(whichGroup6, whichUnit13)
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

function __wurst_safe_IsUnitAliveBJ(whichUnit44) 
	if (whichUnit44 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit44)
end

function __wurst_safe_SetUnitVertexColor(whichUnit33, red, green, blue, alpha) 
	if (whichUnit33 == nil) then
		return nil
	end
	SetUnitVertexColor(whichUnit33, red, green, blue, alpha)
end

function __wurst_safe_DialogDisplay(whichPlayer24, whichDialog2, flag5) 
	if (whichPlayer24 == nil) then
		return nil
	end
	if (whichDialog2 == nil) then
		return nil
	end
	DialogDisplay(whichPlayer24, whichDialog2, flag5)
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

function __wurst_safe_SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value17) 
	if (sourcePlayer == nil) then
		return nil
	end
	if (otherPlayer2 == nil) then
		return nil
	end
	if (whichAllianceSetting == nil) then
		return nil
	end
	SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value17)
end

function __wurst_safe_SetUnitOwner(whichUnit10, whichPlayer10, changeColor) 
	if (whichUnit10 == nil) then
		return nil
	end
	if (whichPlayer10 == nil) then
		return nil
	end
	SetUnitOwner(whichUnit10, whichPlayer10, changeColor)
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

function __wurst_safe_StartSoundForPlayerBJ(whichPlayer25, soundHandle2) 
	if (whichPlayer25 == nil) then
		return nil
	end
	if (soundHandle2 == nil) then
		return nil
	end
	StartSoundForPlayerBJ(whichPlayer25, soundHandle2)
end

function __wurst_safe_AllowVictoryDefeat(gameResult) 
	if (gameResult == nil) then
		return false
	end
	return AllowVictoryDefeat(gameResult)
end

function __wurst_safe_RemovePlayer(whichPlayer26, gameResult1) 
	if (whichPlayer26 == nil) then
		return nil
	end
	if (gameResult1 == nil) then
		return nil
	end
	RemovePlayer(whichPlayer26, gameResult1)
end

function __wurst_safe_SetGameDifficulty(whichdifficulty) 
	if (whichdifficulty == nil) then
		return nil
	end
	SetGameDifficulty(whichdifficulty)
end

function __wurst_safe_VolumeGroupSetVolumeForPlayerBJ(whichPlayer27, vgroup1, scale4) 
	if (whichPlayer27 == nil) then
		return nil
	end
	if (vgroup1 == nil) then
		return nil
	end
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer27, vgroup1, scale4)
end

function __wurst_safe_CustomVictoryDialogBJ(whichPlayer28) 
	if (whichPlayer28 == nil) then
		return nil
	end
	CustomVictoryDialogBJ(whichPlayer28)
end

function __wurst_safe_CustomVictorySkipBJ(whichPlayer29) 
	if (whichPlayer29 == nil) then
		return nil
	end
	CustomVictorySkipBJ(whichPlayer29)
end

function __wurst_safe_CustomDefeatDialogBJ(whichPlayer30, message3) 
	if (whichPlayer30 == nil) then
		return nil
	end
	CustomDefeatDialogBJ(whichPlayer30, message3)
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

function __wurst_safe_PingMinimapForPlayer(whichPlayer31, x10, y9, duration2) 
	if (whichPlayer31 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer31, x10, y9, duration2)
end

function __wurst_safe_UnitAddIndicator(whichUnit45, red1, green1, blue1, alpha1) 
	if (whichUnit45 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit45, red1, green1, blue1, alpha1)
end

function __wurst_safe_RescueUnitBJ(whichUnit46, rescuer, changeColor2) 
	if (whichUnit46 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit46, rescuer, changeColor2)
end

function __wurst_safe_SetPlayerTechMaxAllowed(whichPlayer32, techid, maximum) 
	if (whichPlayer32 == nil) then
		return nil
	end
	SetPlayerTechMaxAllowed(whichPlayer32, techid, maximum)
end

function __wurst_safe_SetPlayerAbilityAvailable(whichPlayer17, abilid, avail1) 
	if (whichPlayer17 == nil) then
		return nil
	end
	SetPlayerAbilityAvailable(whichPlayer17, abilid, avail1)
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

function __wurst_LoadStr(h, p, c) 
	local t = h.__wurst_ht_str
	if t == nil or t[p] == nil then return nil end
	return t[p][c]
end

function __wurst_LoadUnitHandle(h, p, c) 
	local t = h.__wurst_ht_handle
	if t == nil or t[p] == nil then return nil end
	return t[p][c]
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

function __wurst_HaveSavedString(h, p, c) 
	local t = h.__wurst_ht_str
	return t ~= nil and t[p] ~= nil and t[p][c] ~= nil
end

function __wurst_safe_GetPlayerSlotState(whichPlayer33) 
	if (whichPlayer33 == nil) then
		return nil
	end
	return GetPlayerSlotState(whichPlayer33)
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

function __wurst_safe_GetPlayerId(whichPlayer34) 
	if (whichPlayer34 == nil) then
		return 0
	end
	return GetPlayerId(whichPlayer34)
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

function __wurst_safe_SetCameraPositionForPlayer(whichPlayer9, x3, y2) 
	if (whichPlayer9 == nil) then
		return nil
	end
	SetCameraPositionForPlayer(whichPlayer9, x3, y2)
end

function __wurst_safe_SetPlayerTeam(whichPlayer35, whichTeam) 
	if (whichPlayer35 == nil) then
		return nil
	end
	SetPlayerTeam(whichPlayer35, whichTeam)
end

function __wurst_safe_Filter(func) 
	return Filter(func)
end

function __wurst_safe_GetPlayerTechResearched(whichPlayer36, techid1, specificonly) 
	if (whichPlayer36 == nil) then
		return false
	end
	return GetPlayerTechResearched(whichPlayer36, techid1, specificonly)
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

function __wurst_safe_BlzCreateUnitWithSkin(id4, unitid, x2, y1, face, skinId) 
	if (id4 == nil) then
		return nil
	end
	return BlzCreateUnitWithSkin(id4, unitid, x2, y1, face, skinId)
end

function __wurst_safe_TriggerRegisterUnitEvent(whichTrigger1, whichUnit5, whichEvent) 
	if (whichTrigger1 == nil) then
		return nil
	end
	if (whichUnit5 == nil) then
		return nil
	end
	if (whichEvent == nil) then
		return nil
	end
	return TriggerRegisterUnitEvent(whichTrigger1, whichUnit5, whichEvent)
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

function __wurst_safe_SetPlayerRaceSelectable(whichPlayer5, value8) 
	if (whichPlayer5 == nil) then
		return nil
	end
	SetPlayerRaceSelectable(whichPlayer5, value8)
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

function __wurst_safe_BlzSetSpecialEffectColor(whichEffect3, r2, g3, b2) 
	if (whichEffect3 == nil) then
		return nil
	end
	BlzSetSpecialEffectColor(whichEffect3, r2, g3, b2)
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

function __wurst_safe_IsPlayerEnemy(whichPlayer16, otherPlayer1) 
	if (whichPlayer16 == nil) then
		return false
	end
	if (otherPlayer1 == nil) then
		return false
	end
	return IsPlayerEnemy(whichPlayer16, otherPlayer1)
end

function __wurst_safe_TriggerAddCondition(whichTrigger3, condition2) 
	if (whichTrigger3 == nil) then
		return nil
	end
	return TriggerAddCondition(whichTrigger3, condition2)
end

function __wurst_safe_TriggerRegisterPlayerChatEvent(whichTrigger7, whichPlayer18, chatMessageToDetect1, exactMatchOnly1) 
	if (whichTrigger7 == nil) then
		return nil
	end
	if (whichPlayer18 == nil) then
		return nil
	end
	return TriggerRegisterPlayerChatEvent(whichTrigger7, whichPlayer18, chatMessageToDetect1, exactMatchOnly1)
end

function __wurst_safe_GetUnitName(whichUnit21) 
	if (whichUnit21 == nil) then
		return ""
	end
	return GetUnitName(whichUnit21)
end

function __wurst_safe_GetUnitUserData(whichUnit23) 
	if (whichUnit23 == nil) then
		return 0
	end
	return GetUnitUserData(whichUnit23)
end

function __wurst_safe_SetUnitInvulnerable(whichUnit29, flag3) 
	if (whichUnit29 == nil) then
		return nil
	end
	SetUnitInvulnerable(whichUnit29, flag3)
end

function __wurst_safe_SetUnitPathing(whichUnit30, flag4) 
	if (whichUnit30 == nil) then
		return nil
	end
	SetUnitPathing(whichUnit30, flag4)
end

function __wurst_safe_SetUnitUserData(whichUnit32, data2) 
	if (whichUnit32 == nil) then
		return nil
	end
	SetUnitUserData(whichUnit32, data2)
end

function __wurst_safe_SetUnitX(whichUnit34, newX1) 
	if (whichUnit34 == nil) then
		return nil
	end
	SetUnitX(whichUnit34, newX1)
end

function __wurst_safe_SetUnitY(whichUnit35, newY1) 
	if (whichUnit35 == nil) then
		return nil
	end
	SetUnitY(whichUnit35, newY1)
end

function __wurst_safe_BlzGetUnitArmor(whichUnit36) 
	if (whichUnit36 == nil) then
		return 0.0
	end
	return BlzGetUnitArmor(whichUnit36)
end

function __wurst_safe_BlzSetUnitArmor(whichUnit37, armorAmount1) 
	if (whichUnit37 == nil) then
		return nil
	end
	BlzSetUnitArmor(whichUnit37, armorAmount1)
end

function __wurst_safe_CustomVictoryBJ(whichPlayer21, showDialog, showScores) 
	if (whichPlayer21 == nil) then
		return nil
	end
	CustomVictoryBJ(whichPlayer21, showDialog, showScores)
end

function __wurst_safe_CustomDefeatBJ(whichPlayer22, message1) 
	if (whichPlayer22 == nil) then
		return nil
	end
	CustomDefeatBJ(whichPlayer22, message1)
end

