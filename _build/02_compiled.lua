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
udg_mountHyjal = nil
udg_mountHyjalGrove = nil
udg_mountHyjalTown = nil
udg_mountHyjalCrypt = nil
udg_winterspringCenter = nil
udg_winterspringNorth = nil
udg_winterspringSouth = nil
udg_winterspringDen = nil
udg_winterspringRoost = nil
udg_moongladeWest = nil
udg_moongladeEast = nil
udg_felwoodNorth = nil
udg_felwoodCenter = nil
udg_felwoodSouth = nil
udg_ashenvaleChimaerasFall = nil
udg_ashenvaleAstranaar = nil
udg_ashenvaleForestEast = nil
udg_ashenvaleCrossing = nil
udg_ashenvaleChimaerasRest = nil
udg_ashenvaleBeachNorth = nil
udg_ashenvaleForestWest = nil
udg_ashenvaleForestCenter = nil
udg_ashenvaleGraniteDen = nil
udg_ashenvaleWarsongSouth = nil
udg_ashenvaleWarsongNorth = nil
udg_ashenvaleVentureCo = nil
udg_ashenvaleRoost = nil
udg_ashenvaleBeachSouth = nil
udg_ashenvaleForestNorth = nil
udg_winterspringFactory = nil
udg_ashenvaleForestSouth = nil
udg_ashenvaleWarsongCenter = nil
gg_trg_Other = nil
gg_trg_ControlPointInitialVariables = nil
gg_unit_h00O_0019 = nil
gg_unit_h007_0018 = nil
gg_unit_h002_0005 = nil
gg_unit_h006_0015 = nil
gg_unit_h008_0011 = nil
gg_unit_h003_0016 = nil
gg_unit_h00B_0012 = nil
gg_unit_h004_0006 = nil
gg_unit_h00E_0013 = nil
gg_unit_h009_0014 = nil
gg_unit_h005_0017 = nil
gg_unit_h00T_0007 = nil
gg_unit_h00A_0009 = nil
gg_unit_h001_0008 = nil
gg_unit_h000_0407 = nil
gg_unit_etol_0001 = nil
gg_unit_cp00_0425 = nil
gg_unit_h00L_0184 = nil
gg_unit_h00G_0185 = nil
gg_unit_h00P_0178 = nil
gg_unit_h00H_0183 = nil
gg_unit_h00N_0200 = nil
gg_unit_h00M_0136 = nil
gg_unit_h00F_0163 = nil
gg_unit_h00Q_0197 = nil
gg_unit_h00I_0135 = nil
gg_unit_h00D_0010 = nil
gg_unit_h00J_0177 = nil
gg_unit_h00C_0174 = nil
gg_unit_h00U_0175 = nil
gg_unit_h00R_0196 = nil
gg_unit_h00S_0179 = nil
gg_unit_h00K_0176 = nil
Abilities_tranquility = nil
Angle_DEGTORAD = nil
Angle_RADTODEG = nil
Basics_ANIMATION_PERIOD = nil
Basics_HEIGHT_ENABLER = nil
Basics_DUMMY_PLAYER = nil
BitSet_BITSET_SIZE = nil
BitSet_pows = nil
Bloom_HEALING_CLOUD_ID = nil
Bloom_CLOUD_UNIT_ID = nil
Bloom_HEAL_INTERVAL = nil
Bloom_CLOUD_RADIUS = nil
Bloom_CLOUD_HEAL = nil
Bloom_CLOUD_DURATION = nil
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
ControlPoint_cpOwners = nil
ControlPoint_cpValues = nil
ControlPoint_playerIncome = nil
ControlPoint_playerCpCount = nil
CorruptedBlood_CORRUPTED_BLOOD_ID = nil
CorruptedBlood_SLIME_UNIT_ID = nil
CorruptedBlood_SLIME_LIFETIME = nil
CorruptedBlood_SLIME_SPEED = nil
CorruptedBlood_SLIME_PROXIMITY = nil
CorruptedBlood_GROW_DURATION = nil
CorruptedBlood_EXPLODE_RADIUS = nil
CorruptedBlood_EXPLODE_DAMAGE = nil
CorruptedBlood_UPDATE_INTERVAL = nil
CorruptedBlood_GROW_SFX = nil
CorruptedBlood_EXPLODE_SFX = nil
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
Isolation_ISOLATION_BUFF_ID = nil
Isolation_ISOLATION_DAMAGE = nil
Isolation_ISOLATION_PERIOD = nil
MagicFunctions_compiletime = nil
MapBounds_playableMapRect = nil
MapBounds_boundRect = nil
MapBounds_boundRegion = nil
MapBounds_playableMin = nil
MapBounds_playableMax = nil
MapBounds_boundMin = nil
MapBounds_boundMax = nil
Nightmare_NIGHTMARE_ID = nil
Nightmare_NIGHTMARE_BUFF_ID = nil
Nightmare_NIGHTMARE_RADIUS = nil
Nightmare_NIGHTMARE_DURATION = nil
Nightmare_CORRUPT_SFX = nil
Nightmare_NIGHTMARE_SFX = nil
Nightmare_sleepingUnits = nil
OnUnitEnterLeave_eventTrigger = nil
OnUnitEnterLeave_preplacedUnits = nil
OnUnitEnterLeave_tempUnits = nil
OnUnitEnterLeave_tempUnitsCount = nil
OnUnitEnterLeave_ABILITY_ID = nil
OrderIds_rejuvination = nil
OrderIds_sleep = nil
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
Scoreboard_playerColors = nil
Scoreboard_incomeBoard = nil
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
SummonTreant_BONUS_TREANTS = nil
Table_ht = nil
ThrowExplosives_THROW_EXPLOSIVES_ID = nil
ThrowExplosives_BARREL_UNIT_ID = nil
ThrowExplosives_FUSE_DURATION = nil
ThrowExplosives_EXPLODE_RADIUS = nil
ThrowExplosives_EXPLODE_DAMAGE = nil
ThrowExplosives_FUSE_SFX = nil
ThrowExplosives_EXPLODE_SFX = nil
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
XaviusMain_XAVIUS_ID = nil
winLoss_footmen = nil
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
CallbackSingle_nullTimer_ClosureEvents = ({})
EventListener = ({})
OnCastListener = ({})
ForGroupCallback = ({})
ForGroupCallbackUntil = ({})
CallbackPeriodic = ({})
CallbackSingle = ({})
CallbackSingle_doAfter_ControlPoint = ({})
CallbackSingle_doAfter_CorruptedBlood = ({})
OnCastListener_onCast_CorruptedBlood = ({})
CallbackPeriodic_doPeriodically_onCast_CorruptedBlood = ({})
CallbackSingle_doAfter_onCast_CorruptedBlood = ({})
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
CallbackPeriodic_doPeriodically_Isolation = ({})
CallbackSingle_doAfter_doPeriodically_Isolation = ({})
LLBackIterator = ({})
LLEntry = ({})
LLIterator = ({})
LinkedList = ({})
OnCastListener_onCast_Nightmare = ({})
CallbackSingle_doAfter_onCast_Nightmare = ({})
EventListener_add_Nightmare = ({})
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
OnCastListener_onCast_SummonTreant = ({})
CallbackSingle_doAfter_onCast_SummonTreant = ({})
Table = ({})
OnCastListener_onCast_ThrowExplosives = ({})
CallbackPeriodic_doPeriodically_onCast_ThrowExplosives = ({})
CallbackSingle_doAfter_onCast_ThrowExplosives = ({})
UnitIndex = ({})
UnitDefinition = ({})
UnitOrBuildingOrHeroDefinition = ({})
UnitOrHeroDefinition = ({})
W3UDefinition = ({})
OnCastListener_onCast_UrsocCharge = ({})

function CallbackPeriodic_doPeriodically_Bloom:create() 
	local new_inst = ({CallbackPeriodic_t=nil, pos=({0., 0., }), radius=0., owner=nil, heal=0., })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_Bloom, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom(this, cb, __wurst_stackPos) 
	local iterator = nil
	local u = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRange(Group_ENUM_GROUP, this.pos, this.radius, nil, "when calling enumUnitsInRange in Bloom, line 82")
	iterator = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 83")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator, "when calling hasNext in Bloom, line 83")) then
			break
		end
		u = GroupIterator_GroupIterator_next(iterator, "when calling next in Bloom, line 83")
		if (unit_isAlive(u, "when calling isAlive in Bloom, line 84") and player_isAllyOf(unit_getOwner(u, "when calling getOwner in Bloom, line 84"), this.owner, "when calling isAllyOf in Bloom, line 84")) then
			unit_addHP(u, this.heal, "when calling addHP in Bloom, line 85")
			flashEffect("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u, "origin", "when calling flashEffect in Bloom, line 86")
		end
	end
	GroupIterator_GroupIterator_close(iterator, "when calling close in Bloom, line 83")
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
	CallbackPeriodic_destroyCallbackPeriodic(this10.healTimer, "when calling destroyCallbackPeriodic in Bloom, line 89")
	unit_kill(this10.cloud, "when calling kill in Bloom, line 90")
	effect_destr(this10.sfx, "when calling destr in Bloom, line 91")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Bloom:create2() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Bloom, }))
	return new_inst
end

function OnCastListener_onCast_Bloom_fire_onCast_Bloom(this14, caster, __wurst_stackPos15) 
	local level = nil
	local heal = nil
	local radius = nil
	local duration = nil
	local iterator1 = nil
	local u1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos15
	wurst_stack_depth = (wurst_stack_depth + 1)
	level = (unit_getAbilityLevel(caster, Bloom_HEALING_CLOUD_ID, "when calling getAbilityLevel in Bloom, line 95") - 1)
	heal = realEnsure(Bloom_CLOUD_HEAL[level])
	radius = realEnsure(Bloom_CLOUD_RADIUS[level])
	duration = realEnsure(Bloom_CLOUD_DURATION[level])
	group_enumUnitsInRect(Group_ENUM_GROUP, bj_mapInitialPlayableArea, nil, "when calling enumUnitsInRect in Bloom, line 100")
	iterator1 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 101")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator1, "when calling hasNext in Bloom, line 101")) then
			break
		end
		u1 = GroupIterator_GroupIterator_next(iterator1, "when calling next in Bloom, line 101")
		if unit_hasAbility(u1, 1114793322, "when calling hasAbility in Bloom, line 102") then
			spawnCloud(unit_getOwner(caster, "when calling getOwner in Bloom, line 103"), unit_getPos(u1, "when calling getPos in Bloom, line 103"), heal, radius, duration, "when calling spawnCloud in Bloom, line 103")
		end
	end
	GroupIterator_GroupIterator_close(iterator1, "when calling close in Bloom, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_CenariusCharacter:create3() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_CenariusCharacter, }))
	return new_inst
end

function OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter(this19, caster1, __wurst_stackPos21) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos21
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventData_getSpellTargetUnit("when calling getSpellTargetUnit in CenariusCharacter, line 28")
	addSeedlingStack("when calling addSeedlingStack in CenariusCharacter, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_ClosureEvents:create4() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_ClosureEvents, }))
	return new_inst
end

function CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents(this20, __wurst_stackPos24) 
	local i = nil
	local temp = nil
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
	wurst_stack[wurst_stack_depth] = __wurst_stackPos24
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
	i = 0
	temp = (bj_MAX_PLAYERS - 1)
	while true do
		if (i > temp) then
			break
		end
		trigger_registerPlayerEvent(ClosureEvents_leaveTrig, Player_players[i], EVENT_PLAYER_LEAVE, "when calling registerPlayerEvent in ClosureEvents, line 311")
		receiver = ClosureEvents_keyTrig
		trigger_registerPlayerEvent(receiver, Player_players[i], EVENT_PLAYER_ARROW_DOWN_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 312")
		receiver1 = receiver
		trigger_registerPlayerEvent(receiver1, Player_players[i], EVENT_PLAYER_ARROW_DOWN_UP, "when calling registerPlayerEvent in ClosureEvents, line 313")
		receiver2 = receiver1
		trigger_registerPlayerEvent(receiver2, Player_players[i], EVENT_PLAYER_ARROW_UP_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 314")
		receiver3 = receiver2
		trigger_registerPlayerEvent(receiver3, Player_players[i], EVENT_PLAYER_ARROW_UP_UP, "when calling registerPlayerEvent in ClosureEvents, line 315")
		receiver4 = receiver3
		trigger_registerPlayerEvent(receiver4, Player_players[i], EVENT_PLAYER_ARROW_LEFT_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 316")
		receiver5 = receiver4
		trigger_registerPlayerEvent(receiver5, Player_players[i], EVENT_PLAYER_ARROW_LEFT_UP, "when calling registerPlayerEvent in ClosureEvents, line 317")
		receiver6 = receiver5
		trigger_registerPlayerEvent(receiver6, Player_players[i], EVENT_PLAYER_ARROW_RIGHT_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 318")
		receiver7 = receiver6
		trigger_registerPlayerEvent(receiver7, Player_players[i], EVENT_PLAYER_ARROW_RIGHT_UP, "when calling registerPlayerEvent in ClosureEvents, line 319")
		receiver8 = receiver7
		trigger_registerPlayerEvent(receiver8, Player_players[i], EVENT_PLAYER_END_CINEMATIC, "when calling registerPlayerEvent in ClosureEvents, line 320")
		receiver9 = receiver8
		trigger_registerPlayerChatEvent(receiver9, Player_players[i], "", false, "when calling registerPlayerChatEvent in ClosureEvents, line 321")
		i = (i + 1)
	end
	registerPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, nil, function (...) 
			xpcall(function (...) 
					bridge_code__registerPlayerUnitEvent_nullTimer_ClosureEvents(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, nil, "when calling registerPlayerUnitEvent in ClosureEvents, line 323")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener:create5() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener, }))
	return new_inst
end

function EventListener_EventListener_onEvent(this24, __wurst_stackPos30) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos30
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_EventListener_init(this25, __wurst_stackPos31) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos31
	wurst_stack_depth = (wurst_stack_depth + 1)
	this25.EventListener_eventId = 0
	this25.EventListener_uid = -1
	this25.EventListener_next = nil
	this25.EventListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_construct_EventListener(this26, __wurst_stackPos32) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos32
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_EventListener_init(this26, "when calling EventListener_init in ClosureEvents, line 108")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_EventListener_onDestroy(this27, __wurst_stackPos33) 
	local listener = nil
	local listener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos33
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (this27.EventListener_uid < 0) then
		listener = EventListener_generalListenersFirsts[this27.EventListener_eventId]
		if (listener == this27) then
			EventListener_generalListenersFirsts[this27.EventListener_eventId] = this27.EventListener_next
		elseif not((this27.EventListener_prev == nil)) then
			this27.EventListener_prev.EventListener_next = this27.EventListener_next
		end
	else
		listener1 = EventListener_unitListenersFirsts[this27.EventListener_uid]
		if (listener1 == this27) then
			EventListener_unitListenersFirsts[this27.EventListener_uid] = this27.EventListener_next
		elseif not((this27.EventListener_prev == nil)) then
			this27.EventListener_prev.EventListener_next = this27.EventListener_next
		end
	end
	if not((this27.EventListener_next == nil)) then
		this27.EventListener_next.EventListener_prev = this27.EventListener_prev
	end
	this27.EventListener_next = nil
	this27.EventListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_destroyEventListener(this28, __wurst_stackPos34) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos34
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_EventListener_onDestroy(this28, "when calling EventListener_onDestroy in ClosureEvents, line 225")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener:create6() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener, }))
	return new_inst
end

function OnCastListener_OnCastListener_fire(this29, caster2, __wurst_stackPos35) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos35
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_OnCastListener_init(this30, __wurst_stackPos36) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos36
	wurst_stack_depth = (wurst_stack_depth + 1)
	this30.OnCastListener_next = nil
	this30.OnCastListener_prev = nil
	this30.OnCastListener_eventUnit = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_construct_OnCastListener(this31, __wurst_stackPos37) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos37
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnCastListener_OnCastListener_init(this31, "when calling OnCastListener_init in ClosureEvents, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_OnCastListener_onDestroy(this32, __wurst_stackPos38) 
	local index = nil
	local listener2 = nil
	local listener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos38
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((this32.OnCastListener_eventUnit == nil)) then
		index = unit_getIndex(this32.OnCastListener_eventUnit, "when calling getIndex in ClosureEvents, line 60")
		listener2 = EventListener_castMapCasters[index]
		if (listener2 == this32) then
			if not((this32.OnCastListener_next == nil)) then
				EventListener_castMapCasters[index] = this32.OnCastListener_next
			else
				EventListener_castMapCasters[index] = nil
			end
		elseif not((this32.OnCastListener_prev == nil)) then
			this32.OnCastListener_prev.OnCastListener_next = this32.OnCastListener_next
		end
	else
		listener3 = HashMap_HashMap_get(EventListener_castMap, this32.OnCastListener_abilId, "when calling get in ClosureEvents, line 70")
		if (listener3 == this32) then
			if not((this32.OnCastListener_next == nil)) then
				HashMap_HashMap_put(EventListener_castMap, this32.OnCastListener_abilId, this32.OnCastListener_next, "when calling put in ClosureEvents, line 73")
			else
				HashMap_HashMap_remove(EventListener_castMap, this32.OnCastListener_abilId, "when calling remove in ClosureEvents, line 75")
			end
		elseif not((this32.OnCastListener_prev == nil)) then
			this32.OnCastListener_prev.OnCastListener_next = this32.OnCastListener_next
		end
	end
	if not((this32.OnCastListener_next == nil)) then
		this32.OnCastListener_next.OnCastListener_prev = this32.OnCastListener_prev
	end
	this32.OnCastListener_next = nil
	this32.OnCastListener_prev = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_destroyOnCastListener(this37, __wurst_stackPos43) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos43
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnCastListener_OnCastListener_onDestroy(this37, "when calling OnCastListener_onDestroy in ClosureEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback:create7() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback, }))
	return new_inst
end

function ForGroupCallback_ForGroupCallback_callback(this38, u2, __wurst_stackPos44) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos44
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback_destroyForGroupCallback(this39, __wurst_stackPos45) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos45
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallbackUntil:create8() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallbackUntil, }))
	return new_inst
end

function ForGroupCallbackUntil_ForGroupCallbackUntil_callback(this40, u3, __wurst_stackPos46) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos46
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic:create9() 
	local new_inst = ({CallbackPeriodic_t=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic, }))
	return new_inst
end

function CallbackPeriodic_CallbackPeriodic_start(this41, whichTimer, time, __wurst_stackPos47) 
	local receiver10 = nil
	local receiver11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos47
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver10 = whichTimer
	timer_setData(receiver10, __wurst_objectToIndex(this41), "when calling setData in ClosureTimers, line 158")
	receiver11 = receiver10
	timer_startPeriodic(receiver11, time, function (...) 
			xpcall(function (...) 
					bridge_CallbackPeriodic_staticCallback(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in ClosureTimers, line 159")
	this41.CallbackPeriodic_t = receiver11
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_call(this44, cb1, __wurst_stackPos50) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos50
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_init(this45, __wurst_stackPos51) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos51
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_construct_CallbackPeriodic(this46, __wurst_stackPos52) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos52
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_init(this46, "when calling CallbackPeriodic_init in ClosureTimers, line 151")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_onDestroy(this47, __wurst_stackPos53) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos53
	wurst_stack_depth = (wurst_stack_depth + 1)
	timer_release(this47.CallbackPeriodic_t, "when calling release in ClosureTimers, line 166")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_destroyCallbackPeriodic(this11, __wurst_stackPos12) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos12
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_onDestroy(this11, "when calling CallbackPeriodic_onDestroy in ClosureTimers, line 165")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle:create10() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle, }))
	return new_inst
end

function CallbackSingle_CallbackSingle_start(this49, whichTimer1, time2, __wurst_stackPos55) 
	local receiver12 = nil
	local receiver13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos55
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver12 = whichTimer1
	timer_setData(receiver12, __wurst_objectToIndex(this49), "when calling setData in ClosureTimers, line 134")
	receiver13 = receiver12
	timer_start(receiver13, time2, function (...) 
			xpcall(function (...) 
					bridge_code__start_CallbackSingle_ClosureTimers(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling start in ClosureTimers, line 135")
	this49.CallbackSingle_t = receiver13
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_call(this51, __wurst_stackPos57) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos57
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_construct_CallbackSingle(this52, __wurst_stackPos58) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos58
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_init(this52, "when calling CallbackSingle_init in ClosureTimers, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_destroyCallbackSingle(this54, __wurst_stackPos60) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos60
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_onDestroy(this54, "when calling CallbackSingle_onDestroy in ClosureTimers, line 147")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_init(this53, __wurst_stackPos59) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos59
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_onDestroy(this55, __wurst_stackPos61) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos61
	wurst_stack_depth = (wurst_stack_depth + 1)
	timer_release(this55.CallbackSingle_t, "when calling release in ClosureTimers, line 148")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_ControlPoint:create11() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_ControlPoint, }))
	return new_inst
end

function CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint(this56, __wurst_stackPos62) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos62
	wurst_stack_depth = (wurst_stack_depth + 1)
	incomeTimer("when calling incomeTimer in ControlPoint, line 93")
	setupMultiboard("when calling setupMultiboard in ControlPoint, line 94")
	updateMultiboard("when calling updateMultiboard in ControlPoint, line 95")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_CorruptedBlood:create12() 
	local new_inst = ({CallbackSingle_t=nil, sfx=nil, pos=({0., 0., }), caster=nil, slime=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_CorruptedBlood, }))
	return new_inst
end

function CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood(this57, __wurst_stackPos66) 
	local iterator2 = nil
	local u4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos66
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(this57.sfx, "when calling destr in CorruptedBlood, line 52")
	flashEffect1(CorruptedBlood_EXPLODE_SFX, this57.pos, "when calling flashEffect in CorruptedBlood, line 53")
	group_enumUnitsInRange(Group_ENUM_GROUP, this57.pos, CorruptedBlood_EXPLODE_RADIUS, nil, "when calling enumUnitsInRange in CorruptedBlood, line 54")
	iterator2 = group_iterator(Group_ENUM_GROUP, "when calling iterator in CorruptedBlood, line 55")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator2, "when calling hasNext in CorruptedBlood, line 55")) then
			break
		end
		u4 = GroupIterator_GroupIterator_next(iterator2, "when calling next in CorruptedBlood, line 55")
		if (unit_isAlive(u4, "when calling isAlive in CorruptedBlood, line 56") and player_isEnemyOf(unit_getOwner(u4, "when calling getOwner in CorruptedBlood, line 56"), unit_getOwner(this57.caster, "when calling getOwner in CorruptedBlood, line 56"), "when calling isEnemyOf in CorruptedBlood, line 56")) then
			unit_damageTarget(this57.caster, u4, CorruptedBlood_EXPLODE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in CorruptedBlood, line 57")
		end
	end
	GroupIterator_GroupIterator_close(iterator2, "when calling close in CorruptedBlood, line 55")
	unit_kill(this57.slime, "when calling kill in CorruptedBlood, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_CorruptedBlood:create13() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_CorruptedBlood, }))
	return new_inst
end

function OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood(this60, caster3, __wurst_stackPos70) 
	local target2 = nil
	local targetSfx = nil
	local slime = nil
	local sfx = nil
	local proximityTime = nil
	local exploded = nil
	local clVar = nil
	local clVar1 = nil
	local temp76 = nil
	local temp77 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos70
	wurst_stack_depth = (wurst_stack_depth + 1)
	target2 = EventData_getSpellTargetUnit("when calling getSpellTargetUnit in CorruptedBlood, line 63")
	targetSfx = widget_addEffect(target2, "Abilities\\Spells\\Other\\Doom\\DoomTarget.mdl", "overhead", "when calling addEffect in CorruptedBlood, line 64")
	effect_setScale(targetSfx, 0.8, "when calling setScale in CorruptedBlood, line 65")
	effect_setColor(targetSfx, 0, 255, 0, "when calling setColor in CorruptedBlood, line 66")
	slime = createUnit(unit_getOwner(caster3, "when calling getOwner in CorruptedBlood, line 68"), CorruptedBlood_SLIME_UNIT_ID, unit_getPos(caster3, "when calling getPos in CorruptedBlood, line 68"), ({0., }), "when calling createUnit in CorruptedBlood, line 68")
	if (target2 == nil) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	print1(stringConcat("Corrupted Blood cast on: ", unit_getName(target2, "when calling getName in CorruptedBlood, line 74")), "when calling print in CorruptedBlood, line 74")
	unit_addAbility(slime, 1097625443, "when calling addAbility in CorruptedBlood, line 77")
	unit_setInvulnerable(slime, true, "when calling setInvulnerable in CorruptedBlood, line 78")
	unit_setScale(slime, 0.5, "when calling setScale in CorruptedBlood, line 79")
	unit_setVertexColor(slime, 150, 80, 200, 255, "when calling setVertexColor in CorruptedBlood, line 80")
	sfx = addEffect(CorruptedBlood_GROW_SFX, unit_getPos(slime, "when calling getPos in CorruptedBlood, line 83"), "when calling addEffect in CorruptedBlood, line 83")
	effect_setScale(sfx, 1., "when calling setScale in CorruptedBlood, line 84")
	proximityTime = 0.
	exploded = false
	temp76 = CorruptedBlood_UPDATE_INTERVAL
	clVar = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood:create14()
	CallbackPeriodic_construct_CallbackPeriodic(clVar, "when calling construct_CallbackPeriodic in CorruptedBlood, line 89")
	clVar.exploded = exploded
	clVar.slime = slime
	clVar.target = target2
	clVar.targetSfx = targetSfx
	clVar.sfx = sfx
	clVar.proximityTime = proximityTime
	clVar.caster = caster3
	doPeriodically(temp76, clVar, "when calling doPeriodically in CorruptedBlood, line 89")
	temp77 = CorruptedBlood_SLIME_LIFETIME
	clVar1 = CallbackSingle_doAfter_onCast_CorruptedBlood:create15()
	CallbackSingle_construct_CallbackSingle(clVar1, "when calling construct_CallbackSingle in CorruptedBlood, line 120")
	clVar1.exploded = exploded
	clVar1.slime = slime
	clVar1.sfx = sfx
	clVar1.targetSfx = targetSfx
	doAfter(temp77, clVar1, "when calling doAfter in CorruptedBlood, line 120")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_CorruptedBlood:create14() 
	local new_inst = ({CallbackPeriodic_t=nil, exploded=false, slime=nil, target=nil, targetSfx=nil, sfx=nil, proximityTime=0., caster=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_CorruptedBlood, }))
	return new_inst
end

function tupleCopy(t) 
	return ({t[1], t[2], })
end

function tupleCopy1(t) 
	return ({t[1], })
end

function CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood(this69, cb4, __wurst_stackPos84) 
	local slimePos = ({0., 0., })
	local targetPos = ({0., 0., })
	local dist = nil
	local moveDir = ({0., })
	local growProgress = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos84
	wurst_stack_depth = (wurst_stack_depth + 1)
	if ((this69.exploded or not(unit_isAlive(this69.slime, "when calling isAlive in CorruptedBlood, line 90"))) or not(unit_isAlive(this69.target, "when calling isAlive in CorruptedBlood, line 90"))) then
		effect_destr(this69.targetSfx, "when calling destr in CorruptedBlood, line 91")
		CallbackPeriodic_destroyCallbackPeriodic(cb4, "when calling destroyCallbackPeriodic in CorruptedBlood, line 92")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	slimePos = tupleCopy(unit_getPos(this69.slime, "when calling getPos in CorruptedBlood, line 96"))
	targetPos = tupleCopy(unit_getPos(this69.target, "when calling getPos in CorruptedBlood, line 97"))
	dist = vec2_distanceTo(slimePos, targetPos, "when calling distanceTo in CorruptedBlood, line 98")
	moveDir = tupleCopy1(vec2_angleTo(slimePos, targetPos, "when calling angleTo in CorruptedBlood, line 99"))
	unit_setXY(this69.slime, vec2_polarOffset(slimePos, moveDir, (CorruptedBlood_SLIME_SPEED * CorruptedBlood_UPDATE_INTERVAL), "when calling polarOffset in CorruptedBlood, line 100"), "when calling setXY in CorruptedBlood, line 100")
	effect_setPos(this69.sfx, unit_getPos(this69.slime, "when calling getPos in CorruptedBlood, line 101"), "when calling setPos in CorruptedBlood, line 101")
	if (dist <= CorruptedBlood_SLIME_PROXIMITY) then
		this69.proximityTime = (this69.proximityTime + CorruptedBlood_UPDATE_INTERVAL)
		growProgress = (this69.proximityTime / CorruptedBlood_GROW_DURATION)
		unit_setScale(this69.slime, (0.5 + (growProgress * 2.0)), "when calling setScale in CorruptedBlood, line 106")
		effect_setScale(this69.sfx, (0.5 + (growProgress * 2.0)), "when calling setScale in CorruptedBlood, line 107")
		if (this69.proximityTime >= CorruptedBlood_GROW_DURATION) then
			this69.exploded = true
			effect_destr(this69.sfx, "when calling destr in CorruptedBlood, line 111")
			effect_destr(this69.targetSfx, "when calling destr in CorruptedBlood, line 112")
			explodeSlime(this69.slime, this69.caster, "when calling explodeSlime in CorruptedBlood, line 113")
			CallbackPeriodic_destroyCallbackPeriodic(cb4, "when calling destroyCallbackPeriodic in CorruptedBlood, line 114")
		end
	else
		this69.proximityTime = 0.
		unit_setScale(this69.slime, 0.5, "when calling setScale in CorruptedBlood, line 117")
		effect_setScale(this69.sfx, 0.5, "when calling setScale in CorruptedBlood, line 118")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_CorruptedBlood:create15() 
	local new_inst = ({CallbackSingle_t=nil, exploded=false, slime=nil, sfx=nil, targetSfx=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_CorruptedBlood, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood(this75, __wurst_stackPos91) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos91
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (not(this75.exploded) and unit_isAlive(this75.slime, "when calling isAlive in CorruptedBlood, line 121")) then
		effect_destr(this75.sfx, "when calling destr in CorruptedBlood, line 122")
		effect_destr(this75.targetSfx, "when calling destr in CorruptedBlood, line 123")
		flashEffect1(CorruptedBlood_EXPLODE_SFX, unit_getPos(this75.slime, "when calling getPos in CorruptedBlood, line 124"), "when calling flashEffect in CorruptedBlood, line 124")
		unit_kill(this75.slime, "when calling kill in CorruptedBlood, line 125")
		this75.exploded = true
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent:create16() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent(this76, __wurst_stackPos92) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos92
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onUnreducedDamage("when calling onUnreducedDamage in DamageEvent, line 476")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent1:create17() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent1, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent1(this77, __wurst_stackPos94) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos94
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onDamage("when calling onDamage in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement:create18() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=DamageElement, }))
	return new_inst
end

function DamageElement_new_DamageElement(name, color, __wurst_stackPos96) 
	local this78 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos96
	wurst_stack_depth = (wurst_stack_depth + 1)
	this78 = DamageElement:create18()
	DamageElement_construct_DamageElement(this78, name, color, "when calling construct_DamageElement in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this78
end

function DamageElement_DamageElement_init(this80, __wurst_stackPos98) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos98
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement_construct_DamageElement(this79, name1, color1, __wurst_stackPos97) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos97
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageElement_DamageElement_init(this79, "when calling DamageElement_init in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance:create19() 
	local new_inst = ({DamageInstance_source=nil, DamageInstance_target=nil, DamageInstance_amount=0., DamageInstance_nativeAttackType=nil, DamageInstance_nativeDamageType=nil, DamageInstance_nativeWeaponType=nil, })
	setmetatable(new_inst, ({__index=DamageInstance, }))
	return new_inst
end

function DamageInstance_DamageInstance_setReducedAmount(this81, amount1, __wurst_stackPos99) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos99
	wurst_stack_depth = (wurst_stack_depth + 1)
	this81.DamageInstance_amount = amount1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_init(this82, __wurst_stackPos100) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos100
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_new_DamageInstance(id2, source, target3, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType1, damageElement, __wurst_stackPos101) 
	local this83 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos101
	wurst_stack_depth = (wurst_stack_depth + 1)
	this83 = DamageInstance:create19()
	DamageInstance_construct_DamageInstance(this83, id2, source, target3, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType1, damageElement, "when calling construct_DamageInstance in DamageEvent, line 133")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this83
end

function DamageInstance_construct_DamageInstance(this84, id3, source1, target4, unreducedAmount1, nativeAttackType1, nativeDamageType1, nativeWeaponType1, damageType2, damageElement1, __wurst_stackPos102) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos102
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_init(this84, "when calling DamageInstance_init in DamageEvent, line 133")
	this84.DamageInstance_source = source1
	this84.DamageInstance_target = target4
	this84.DamageInstance_amount = unreducedAmount1
	this84.DamageInstance_nativeAttackType = nativeAttackType1
	this84.DamageInstance_nativeDamageType = nativeDamageType1
	this84.DamageInstance_nativeWeaponType = nativeWeaponType1
	DamageInstance_count = (DamageInstance_count + 1)
	DamageInstance_stack[DamageInstance_count] = this84
	DamageInstance_current = this84
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_onDestroy(this85, __wurst_stackPos103) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos103
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_count = (DamageInstance_count - 1)
	DamageInstance_current = DamageInstance_stack[DamageInstance_count]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_destroyDamageInstance(this86, __wurst_stackPos104) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos104
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_onDestroy(this86, "when calling DamageInstance_onDestroy in DamageEvent, line 162")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener:create20() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener, }))
	return new_inst
end

function DamageListener_DamageListener_onEvent(this87, __wurst_stackPos105) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos105
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_DamageListener_init(this88, __wurst_stackPos106) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos106
	wurst_stack_depth = (wurst_stack_depth + 1)
	this88.DamageListener_next = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_construct_DamageListener(this89, __wurst_stackPos107) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos107
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageListener_DamageListener_init(this89, "when calling DamageListener_init in DamageEvent, line 431")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback:create21() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForForceCallback, }))
	return new_inst
end

function ForForceCallback_ForForceCallback_run(this90, __wurst_stackPos108) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos108
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_destroyForForceCallback(this91, __wurst_stackPos109) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos109
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_execute_GroupUtils:create22() 
	local new_inst = ({createNow=0, })
	setmetatable(new_inst, ({__index=ForForceCallback_execute_GroupUtils, }))
	return new_inst
end

function ForForceCallback_execute_GroupUtils_run_execute_GroupUtils(this92, __wurst_stackPos110) 
	local i1 = nil
	local temp1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos110
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_numTotal = (GroupUtils_numTotal + this92.createNow)
	i1 = 1
	temp1 = this92.createNow
	while true do
		if (i1 > temp1) then
			break
		end
		push(CreateGroup(), "when calling push in GroupUtils, line 93")
		i1 = (i1 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator:create23() 
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
	local u5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos4
	wurst_stack_depth = (wurst_stack_depth + 1)
	u5 = group_get(this4.GroupIterator_g, this4.GroupIterator_i, "when calling get in Group, line 128")
	this4.GroupIterator_i = (this4.GroupIterator_i + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return u5
end

function GroupIterator_GroupIterator_close(this9, __wurst_stackPos10) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos10
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_destroyGroupIterator(this9, "when calling destroyGroupIterator in Group, line 133")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_destroyGroupIterator(this94, __wurst_stackPos113) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos113
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_onDestroy(this94, "when calling GroupIterator_onDestroy in Group, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_init(this96, __wurst_stackPos115) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos115
	wurst_stack_depth = (wurst_stack_depth + 1)
	this96.GroupIterator_i = 0
	this96.GroupIterator_n = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_new_GroupIterator(source2, __wurst_stackPos116) 
	local this97 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos116
	wurst_stack_depth = (wurst_stack_depth + 1)
	this97 = GroupIterator:create23()
	GroupIterator_construct_GroupIterator(this97, source2, "when calling construct_GroupIterator in Group, line 119")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this97
end

function GroupIterator_construct_GroupIterator(this98, source3, __wurst_stackPos117) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos117
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_init(this98, "when calling GroupIterator_init in Group, line 119")
	this98.GroupIterator_g = CreateGroup()
	group_add(this98.GroupIterator_g, "when calling add in Group, line 121", source3)
	this98.GroupIterator_n = group_size(this98.GroupIterator_g, "when calling size in Group, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_onDestroy(this95, __wurst_stackPos114) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos114
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_clear(this95.GroupIterator_g, "when calling clear in Group, line 136")
	group_destr(this95.GroupIterator_g, "when calling destr in Group, line 137")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap:create24() 
	local new_inst = ({HashMap_size=0, })
	setmetatable(new_inst, ({__index=HashMap, }))
	return new_inst
end

function HashMap_HashMap_has(this103, key3, __wurst_stackPos122) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos122
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Table_Table_hasInt(this103, __wurst_objectToIndex(key3), "when calling hasInt in HashMap, line 14")
end

function HashMap_HashMap_put(this35, key1, value, __wurst_stackPos41) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos41
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not(HashMap_HashMap_has(this35, key1, "when calling has in HashMap, line 18")) then
		this35.HashMap_size = (this35.HashMap_size + 1)
	end
	Table_Table_saveInt(this35, __wurst_objectToIndex(key1), __wurst_objectToIndex(value), "when calling saveInt in HashMap, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_HashMap_get(this34, key, __wurst_stackPos40) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos40
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return __wurst_objectFromIndex(Table_Table_loadInt(this34, __wurst_objectToIndex(key), "when calling loadInt in HashMap, line 24"))
end

function HashMap_HashMap_remove(this36, key2, __wurst_stackPos42) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos42
	wurst_stack_depth = (wurst_stack_depth + 1)
	if HashMap_HashMap_has(this36, key2, "when calling has in HashMap, line 28") then
		this36.HashMap_size = (this36.HashMap_size - 1)
	end
	Table_Table_removeInt(this36, __wurst_objectToIndex(key2), "when calling removeInt in HashMap, line 30")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_HashMap_init(this108, __wurst_stackPos127) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos127
	wurst_stack_depth = (wurst_stack_depth + 1)
	this108.HashMap_size = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_new_HashMap(__wurst_stackPos128) 
	local this109 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos128
	wurst_stack_depth = (wurst_stack_depth + 1)
	this109 = HashMap:create24()
	HashMap_construct_HashMap(this109, "when calling construct_HashMap in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this109
end

function HashMap_construct_HashMap(this110, __wurst_stackPos129) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos129
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_construct_Table(this110, "when calling construct_Table in HashMap, line 7")
	HashMap_HashMap_init(this110, "when calling HashMap_init in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_HeroTrainer:create25() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_HeroTrainer, }))
	return new_inst
end

function EventListener_add_HeroTrainer_onEvent_add_HeroTrainer(this112, __wurst_stackPos131) 
	local building = nil
	local trained = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos131
	wurst_stack_depth = (wurst_stack_depth + 1)
	building = EventData_getTrainedUnit("when calling getTrainedUnit in HeroTrainer, line 10")
	trained = EventData_getTrainedUnit("when calling getTrainedUnit in HeroTrainer, line 11")
	if (unit_getTypeId(building, "when calling getTypeId in HeroTrainer, line 13") == HeroTrainer_TAVERN_ID) then
		unit_remove(building, "when calling remove in HeroTrainer, line 14")
		print1(stringConcat("Hero chosen: ", unit_getName(trained, "when calling getName in HeroTrainer, line 15")), "when calling print in HeroTrainer, line 15")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Hibernate:create26() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Hibernate, }))
	return new_inst
end

function OnCastListener_onCast_Hibernate_fire_onCast_Hibernate(this115, caster5, __wurst_stackPos135) 
	local level1 = nil
	local totalHeal = nil
	local healPerTick = nil
	local sfx1 = nil
	local healTimer = nil
	local clVar2 = nil
	local clVar3 = nil
	local temp78 = nil
	local temp79 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos135
	wurst_stack_depth = (wurst_stack_depth + 1)
	level1 = (unit_getAbilityLevel(caster5, Hibernate_HIBERNATE_ID, "when calling getAbilityLevel in Hibernate, line 67") - 1)
	totalHeal = ((unit_getMaxHP(caster5, "when calling getMaxHP in Hibernate, line 69") * realEnsure(Hibernate_HP_PCT[level1])) + realEnsure(Hibernate_HP_FLAT[level1]))
	healPerTick = (totalHeal / (Hibernate_HIBERNATE_DURATION / Hibernate_HEAL_INTERVAL))
	unit_setArmor(caster5, (unit_getArmor(caster5, "when calling getArmor in Hibernate, line 72") + Hibernate_ARMOR_BONUS), "when calling setArmor in Hibernate, line 72")
	unit_pause(caster5, "when calling pause in Hibernate, line 73")
	unit_setPathing(caster5, false, "when calling setPathing in Hibernate, line 74")
	__wurst_safe_UnitAddAbility(caster5, Hibernate_HIBERNATE_BUFF_ID)
	sfx1 = addEffect1("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", caster5, "origin", "when calling addEffect in Hibernate, line 78")
	temp78 = Hibernate_HEAL_INTERVAL
	clVar2 = CallbackPeriodic_doPeriodically_onCast_Hibernate:create27()
	CallbackPeriodic_construct_CallbackPeriodic(clVar2, "when calling construct_CallbackPeriodic in Hibernate, line 80")
	clVar2.caster = caster5
	clVar2.healPerTick = healPerTick
	healTimer = doPeriodically(temp78, clVar2, "when calling doPeriodically in Hibernate, line 80")
	temp79 = Hibernate_HIBERNATE_DURATION
	clVar3 = CallbackSingle_doAfter_onCast_Hibernate:create28()
	CallbackSingle_construct_CallbackSingle(clVar3, "when calling construct_CallbackSingle in Hibernate, line 85")
	clVar3.healTimer = healTimer
	clVar3.caster = caster5
	clVar3.sfx = sfx1
	doAfter(temp79, clVar3, "when calling doAfter in Hibernate, line 85")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_Hibernate:create27() 
	local new_inst = ({CallbackPeriodic_t=nil, caster=nil, healPerTick=0., })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_Hibernate, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate(this121, cb5, __wurst_stackPos142) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos142
	wurst_stack_depth = (wurst_stack_depth + 1)
	if unit_isAlive(this121.caster, "when calling isAlive in Hibernate, line 81") then
		unit_addHP(this121.caster, this121.healPerTick, "when calling addHP in Hibernate, line 82")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_Hibernate:create28() 
	local new_inst = ({CallbackSingle_t=nil, healTimer=nil, caster=nil, sfx=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_Hibernate, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate(this122, __wurst_stackPos143) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos143
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this122.healTimer, "when calling destroyCallbackPeriodic in Hibernate, line 86")
	unit_unpause(this122.caster, "when calling unpause in Hibernate, line 87")
	unit_setPathing(this122.caster, true, "when calling setPathing in Hibernate, line 88")
	unit_setArmor(this122.caster, (unit_getArmor(this122.caster, "when calling getArmor in Hibernate, line 89") - Hibernate_ARMOR_BONUS), "when calling setArmor in Hibernate, line 89")
	__wurst_safe_UnitRemoveAbility(this122.caster, Hibernate_HIBERNATE_BUFF_ID)
	effect_destr(this122.sfx, "when calling destr in Hibernate, line 91")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_InitFocusCamera:create29() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_InitFocusCamera, }))
	return new_inst
end

function CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera(this124, __wurst_stackPos145) 
	local tree = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos145
	wurst_stack_depth = (wurst_stack_depth + 1)
	tree = gg_unit_etol_0001
	if (GetLocalPlayer() == Player(0)) then
		PanCameraToTimed(unit_getX(tree, "when calling getX in InitFocusCamera, line 10"), unit_getY(tree, "when calling getY in InitFocusCamera, line 10"), 0.)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_Invigorate:create30() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_Invigorate, }))
	return new_inst
end

function CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate(this127, __wurst_stackPos148) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos148
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount > 0) then
		Invigorate_seedlingCount = (Invigorate_seedlingCount - 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_Isolation:create31() 
	local new_inst = ({CallbackPeriodic_t=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_Isolation, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation(this128, cb6, __wurst_stackPos149) 
	local g3 = nil
	local u6 = nil
	local from = nil
	local clVar4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos149
	wurst_stack_depth = (wurst_stack_depth + 1)
	g3 = CreateGroup()
	group_enumUnitsInRect1(g3, bj_mapInitialPlayableArea, "when calling enumUnitsInRect in Isolation, line 80")
	from = g3
	while true do
		if not(group_hasNext(from, "when calling hasNext in Isolation, line 82")) then
			break
		end
		u6 = group_next(from, "when calling next in Isolation, line 82")
		if (unit_hasAbility(u6, Isolation_ISOLATION_BUFF_ID, "when calling hasAbility in Isolation, line 83") and not(unit_hasAbility(u6, Nightmare_NIGHTMARE_BUFF_ID, "when calling hasAbility in Isolation, line 83"))) then
			group_enumUnitsInRange(Group_ENUM_GROUP, unit_getPos(u6, "when calling getPos in Isolation, line 84"), 300., nil, "when calling enumUnitsInRange in Isolation, line 84")
			if not((group_size(Group_ENUM_GROUP, "when calling size in Isolation, line 85") > 1)) then
				print1(stringConcat("print size is: ", int_toString(group_size(Group_ENUM_GROUP, "when calling size in Isolation, line 86"), "when calling toString in Isolation, line 86")), "when calling print in Isolation, line 86")
				unit_damageTarget(u6, u6, Isolation_ISOLATION_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in Isolation, line 87")
			end
		end
	end
	clVar4 = CallbackSingle_doAfter_doPeriodically_Isolation:create32()
	CallbackSingle_construct_CallbackSingle(clVar4, "when calling construct_CallbackSingle in Isolation, line 91")
	clVar4.g = g3
	doAfter(5., clVar4, "when calling doAfter in Isolation, line 91")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_doPeriodically_Isolation:create32() 
	local new_inst = ({CallbackSingle_t=nil, g=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_doPeriodically_Isolation, }))
	return new_inst
end

function CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation(this133, __wurst_stackPos154) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos154
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_destr(this133.g, "when calling destr in Isolation, line 92")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator:create33() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=LLBackIterator, }))
	return new_inst
end

function LLBackIterator_destroyLLBackIterator(this134, __wurst_stackPos155) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos155
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLBackIterator_LLBackIterator_onDestroy(this134, "when calling LLBackIterator_onDestroy in LinkedList, line 499")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator_LLBackIterator_onDestroy(this135, __wurst_stackPos156) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos156
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry:create34() 
	local new_inst = ({LLEntry_elem=nil, LLEntry_prev=nil, LLEntry_next=nil, })
	setmetatable(new_inst, ({__index=LLEntry, }))
	return new_inst
end

function LLEntry_new_LLEntry(elem, prev, next, __wurst_stackPos157) 
	local this136 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos157
	wurst_stack_depth = (wurst_stack_depth + 1)
	this136 = LLEntry:create34()
	LLEntry_construct_LLEntry(this136, elem, prev, next, "when calling construct_LLEntry in LinkedList, line 433")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this136
end

function LLEntry_destroyLLEntry(this138, __wurst_stackPos159) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos159
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_onDestroy(this138, "when calling LLEntry_onDestroy in LinkedList, line 428")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_init(this140, __wurst_stackPos161) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos161
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_construct_LLEntry(this137, elem1, prev1, next1, __wurst_stackPos158) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos158
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_init(this137, "when calling LLEntry_init in LinkedList, line 433")
	this137.LLEntry_elem = elem1
	this137.LLEntry_prev = prev1
	this137.LLEntry_next = next1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_onDestroy(this139, __wurst_stackPos160) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos160
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator:create35() 
	local new_inst = ({LLIterator_dummy=nil, LLIterator_current=nil, LLIterator_parent=nil, LLIterator_destroyOnClose=false, })
	setmetatable(new_inst, ({__index=LLIterator, }))
	return new_inst
end

function LLIterator_LLIterator_next(this141, __wurst_stackPos162) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos162
	wurst_stack_depth = (wurst_stack_depth + 1)
	this141.LLIterator_current = this141.LLIterator_current.LLEntry_next
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this141.LLIterator_current.LLEntry_elem
end

function LLIterator_LLIterator_hasNext(this142, __wurst_stackPos163) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos163
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return not((this142.LLIterator_current.LLEntry_next == this142.LLIterator_dummy))
end

function LLIterator_LLIterator_close(this143, __wurst_stackPos164) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos164
	wurst_stack_depth = (wurst_stack_depth + 1)
	if this143.LLIterator_destroyOnClose then
		LLIterator_destroyLLIterator(this143, "when calling destroyLLIterator in LinkedList, line 497")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_reset(this145, __wurst_stackPos166) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos166
	wurst_stack_depth = (wurst_stack_depth + 1)
	this145.LLIterator_dummy = LinkedList_LinkedList_getDummy(this145.LLIterator_parent, "when calling getDummy in LinkedList, line 454")
	this145.LLIterator_current = this145.LLIterator_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_new_LLIterator(parent, __wurst_stackPos168) 
	local this147 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos168
	wurst_stack_depth = (wurst_stack_depth + 1)
	this147 = LLIterator:create35()
	LLIterator_construct_LLIterator(this147, parent, "when calling construct_LLIterator in LinkedList, line 444")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this147
end

function LLIterator_destroyLLIterator(this144, __wurst_stackPos165) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos165
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_onDestroy(this144, "when calling LLIterator_onDestroy in LinkedList, line 438")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_init(this150, __wurst_stackPos171) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos171
	wurst_stack_depth = (wurst_stack_depth + 1)
	this150.LLIterator_destroyOnClose = true
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_construct_LLIterator(this148, parent1, __wurst_stackPos169) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos169
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_init(this148, "when calling LLIterator_init in LinkedList, line 444")
	this148.LLIterator_parent = parent1
	LLIterator_LLIterator_reset(this148, "when calling reset in LinkedList, line 446")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_onDestroy(this149, __wurst_stackPos170) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos170
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList:create36() 
	local new_inst = ({LinkedList_dummy=nil, LinkedList_size=0, LinkedList_staticItr=nil, LinkedList_staticBackItr=nil, })
	setmetatable(new_inst, ({__index=LinkedList, }))
	return new_inst
end

function LinkedList_LinkedList_add(this151, __wurst_stackPos172, ...) 
	local entry = nil
	local elem2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos172
	wurst_stack_depth = (wurst_stack_depth + 1)
	local __args = table.pack(...)
	for i2=1,__args.n do
	elem2 = __args[i2]
	entry = LLEntry_new_LLEntry(elem2, this151.LinkedList_dummy.LLEntry_prev, this151.LinkedList_dummy, "when calling new_LLEntry in LinkedList, line 39")
	this151.LinkedList_dummy.LLEntry_prev.LLEntry_next = entry
	this151.LinkedList_dummy.LLEntry_prev = entry
	this151.LinkedList_size = (this151.LinkedList_size + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_iterator(this152, __wurst_stackPos173) 
	local stackTrace_tempReturn = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos173
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = LLIterator_new_LLIterator(this152, "when calling new_LLIterator in LinkedList, line 179")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function LinkedList_LinkedList_has(this153, elem3, __wurst_stackPos174) 
	local entry1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos174
	wurst_stack_depth = (wurst_stack_depth + 1)
	entry1 = this153.LinkedList_dummy.LLEntry_next
	while true do
		if not(not((entry1 == this153.LinkedList_dummy))) then
			break
		end
		if (entry1.LLEntry_elem == elem3) then
			wurst_stack_depth = (wurst_stack_depth - 1)
			return true
		end
		entry1 = entry1.LLEntry_next
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return false
end

function LinkedList_new_LinkedList(__wurst_stackPos175) 
	local this154 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos175
	wurst_stack_depth = (wurst_stack_depth + 1)
	this154 = LinkedList:create36()
	LinkedList_construct_LinkedList2(this154, "when calling construct_LinkedList2 in LinkedList, line 31")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this154
end

function LinkedList_LinkedList_getDummy(this146, __wurst_stackPos167) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos167
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this146.LinkedList_dummy
end

function LinkedList_LinkedList_init(this156, __wurst_stackPos177) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos177
	wurst_stack_depth = (wurst_stack_depth + 1)
	this156.LinkedList_dummy = LLEntry_new_LLEntry(nil, nil, nil, "when calling new_LLEntry in LinkedList, line 18")
	this156.LinkedList_size = 0
	this156.LinkedList_staticItr = nil
	this156.LinkedList_staticBackItr = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_construct_LinkedList2(this155, __wurst_stackPos176) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos176
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_init(this155, "when calling LinkedList_init in LinkedList, line 31")
	this155.LinkedList_dummy.LLEntry_next = this155.LinkedList_dummy
	this155.LinkedList_dummy.LLEntry_prev = this155.LinkedList_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_onDestroy(this157, __wurst_stackPos178) 
	local current = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos178
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((this157.LinkedList_staticItr == nil)) then
		LLIterator_destroyLLIterator(this157.LinkedList_staticItr, "when calling destroyLLIterator in LinkedList, line 413")
	end
	if not((this157.LinkedList_staticBackItr == nil)) then
		LLBackIterator_destroyLLBackIterator(this157.LinkedList_staticBackItr, "when calling destroyLLBackIterator in LinkedList, line 415")
	end
	current = this157.LinkedList_dummy.LLEntry_next
	while true do
		if not(not((current == this157.LinkedList_dummy))) then
			break
		end
		current = current.LLEntry_next
		LLEntry_destroyLLEntry(current.LLEntry_prev, "when calling destroyLLEntry in LinkedList, line 419")
	end
	LLEntry_destroyLLEntry(this157.LinkedList_dummy, "when calling destroyLLEntry in LinkedList, line 420")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_destroyLinkedList(this158, __wurst_stackPos179) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos179
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_onDestroy(this158, "when calling LinkedList_onDestroy in LinkedList, line 411")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Nightmare:create37() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Nightmare, }))
	return new_inst
end

function OnCastListener_onCast_Nightmare_fire_onCast_Nightmare(this159, caster6, __wurst_stackPos180) 
	local targetPos1 = ({0., 0., })
	local iterator3 = nil
	local u7 = nil
	local target6 = nil
	local clVar5 = nil
	local temp81 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos180
	wurst_stack_depth = (wurst_stack_depth + 1)
	targetPos1 = tupleCopy(EventData_getSpellTargetPos("when calling getSpellTargetPos in Nightmare, line 60"))
	flashEffect1(Nightmare_NIGHTMARE_SFX, targetPos1, "when calling flashEffect in Nightmare, line 61")
	group_enumUnitsInRange(Group_ENUM_GROUP, targetPos1, Nightmare_NIGHTMARE_RADIUS, nil, "when calling enumUnitsInRange in Nightmare, line 63")
	iterator3 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Nightmare, line 64")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator3, "when calling hasNext in Nightmare, line 64")) then
			break
		end
		u7 = GroupIterator_GroupIterator_next(iterator3, "when calling next in Nightmare, line 64")
		if (((unit_isAlive(u7, "when calling isAlive in Nightmare, line 65") and player_isEnemyOf(unit_getOwner(u7, "when calling getOwner in Nightmare, line 65"), unit_getOwner(caster6, "when calling getOwner in Nightmare, line 65"), "when calling isEnemyOf in Nightmare, line 65")) and not(unit_isType(u7, UNIT_TYPE_HERO, "when calling isType in Nightmare, line 65"))) and not(unit_isType(u7, UNIT_TYPE_MAGIC_IMMUNE, "when calling isType in Nightmare, line 66"))) then
			target6 = u7
			unit_getOwner(u7, "when calling getOwner in Nightmare, line 68")
			print1(stringConcat("Has buff: ", boolean_toString(unit_hasAbility(target6, 1098216300, "when calling hasAbility in Nightmare, line 72"), "when calling toString in Nightmare, line 72")), "when calling print in Nightmare, line 72")
			InstantDummyCaster_castTarget(Player_players[PLAYER_NEUTRAL_AGGRESSIVE], 1096119148, 1, OrderIds_sleep, u7, "when calling castTarget in Nightmare, line 73")
			flashEffect(Nightmare_NIGHTMARE_SFX, target6, "origin", "when calling flashEffect in Nightmare, line 74")
			HashMap_HashMap_put(Nightmare_sleepingUnits, __wurst_objectToIndex(target6), booleanToIndex(true, "when calling booleanToIndex in Nightmare, line 75"), "when calling put in Nightmare, line 75")
			flashEffect(Nightmare_NIGHTMARE_SFX, target6, "origin", "when calling flashEffect in Nightmare, line 76")
			print1(stringConcat(unit_getName(target6, "when calling getName in Nightmare, line 77"), " falls into the Nightmare!"), "when calling print in Nightmare, line 77")
			temp81 = Nightmare_NIGHTMARE_DURATION
			clVar5 = CallbackSingle_doAfter_onCast_Nightmare:create38()
			CallbackSingle_construct_CallbackSingle(clVar5, "when calling construct_CallbackSingle in Nightmare, line 79")
			clVar5.target = target6
			clVar5.caster = caster6
			doAfter(temp81, clVar5, "when calling doAfter in Nightmare, line 79")
		end
	end
	GroupIterator_GroupIterator_close(iterator3, "when calling close in Nightmare, line 64")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_Nightmare:create38() 
	local new_inst = ({CallbackSingle_t=nil, target=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_Nightmare, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare(this162, __wurst_stackPos186) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos186
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (HashMap_HashMap_has(Nightmare_sleepingUnits, __wurst_objectToIndex(this162.target), "when calling has in Nightmare, line 80") and booleanFromIndex(intEnsure(HashMap_HashMap_get(Nightmare_sleepingUnits, __wurst_objectToIndex(this162.target), "when calling get in Nightmare, line 80")), "when calling booleanFromIndex in Nightmare, line 80")) then
		unit_setOwner(this162.target, unit_getOwner(this162.caster, "when calling getOwner in Nightmare, line 83"), true, "when calling setOwner in Nightmare, line 83")
		__wurst_safe_UnitRemoveAbility(this162.target, 1112896364)
		__wurst_safe_UnitRemoveAbility(this162.target, 1112896368)
		__wurst_safe_UnitRemoveAbility(this162.target, 1114993524)
		HashMap_HashMap_remove(Nightmare_sleepingUnits, __wurst_objectToIndex(this162.target), "when calling remove in Nightmare, line 88")
		flashEffect(Nightmare_CORRUPT_SFX, this162.target, "origin", "when calling flashEffect in Nightmare, line 89")
	else
		HashMap_HashMap_remove(Nightmare_sleepingUnits, __wurst_objectToIndex(this162.target), "when calling remove in Nightmare, line 92")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_Nightmare:create39() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_Nightmare, }))
	return new_inst
end

function EventListener_add_Nightmare_onEvent_add_Nightmare(this164, __wurst_stackPos189) 
	local damaged = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos189
	wurst_stack_depth = (wurst_stack_depth + 1)
	damaged = EventData_getTriggerUnit("when calling getTriggerUnit in Nightmare, line 96")
	if (HashMap_HashMap_has(Nightmare_sleepingUnits, __wurst_objectToIndex(damaged), "when calling has in Nightmare, line 97") and booleanFromIndex(intEnsure(HashMap_HashMap_get(Nightmare_sleepingUnits, __wurst_objectToIndex(damaged), "when calling get in Nightmare, line 97")), "when calling booleanFromIndex in Nightmare, line 97")) then
		unit_unpause(damaged, "when calling unpause in Nightmare, line 99")
		HashMap_HashMap_put(Nightmare_sleepingUnits, __wurst_objectToIndex(damaged), booleanToIndex(false, "when calling booleanToIndex in Nightmare, line 100"), "when calling put in Nightmare, line 100")
		flashEffect("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", damaged, "origin", "when calling flashEffect in Nightmare, line 101")
		print1(stringConcat(unit_getName(damaged, "when calling getName in Nightmare, line 102"), " has been woken from the Nightmare!"), "when calling print in Nightmare, line 102")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator:create40() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=IdGenerator, }))
	return new_inst
end

function IdGenerator_new_IdGenerator(start, __wurst_stackPos191) 
	local this165 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos191
	wurst_stack_depth = (wurst_stack_depth + 1)
	this165 = IdGenerator:create40()
	IdGenerator_construct_IdGenerator(this165, start, "when calling construct_IdGenerator in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this165
end

function IdGenerator_IdGenerator_init(this167, __wurst_stackPos193) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos193
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator_construct_IdGenerator(this166, start1, __wurst_stackPos192) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos192
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_IdGenerator_init(this166, "when calling IdGenerator_init in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_OnUnitEnterLeave:create41() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_OnUnitEnterLeave, }))
	return new_inst
end

function CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave(this168, __wurst_stackPos194) 
	local receiver14 = nil
	local count = nil
	local i3 = nil
	local temp2 = nil
	local receiver15 = nil
	local receiver16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos194
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

function ForGroupCallback_forEachFrom_Preloader:create42() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback_forEachFrom_Preloader, }))
	return new_inst
end

function ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader(this170, u10, __wurst_stackPos198) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos198
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(u10, "when calling remove in Preloader, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_Preloader:create43() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_Preloader, }))
	return new_inst
end

function CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader(this171, __wurst_stackPos199) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos199
	wurst_stack_depth = (wurst_stack_depth + 1)
	finishPreload("when calling finishPreload in Preloader, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_Recycle:create44() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_Recycle, }))
	return new_inst
end

function EventListener_add_Recycle_onEvent_add_Recycle(this172, __wurst_stackPos201) 
	local dying = nil
	local pos7 = ({0., 0., })
	local closest = nil
	local closestDist = nil
	local iterator4 = nil
	local u11 = nil
	local dist2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos201
	wurst_stack_depth = (wurst_stack_depth + 1)
	dying = EventData_getDyingUnit("when calling getDyingUnit in Recycle, line 42")
	if unit_hasAbility(dying, Recycle_RECYCLE_ID, "when calling hasAbility in Recycle, line 43") then
		pos7 = tupleCopy(unit_getPos(dying, "when calling getPos in Recycle, line 44"))
		closest = nil
		closestDist = 99999.
		group_enumUnitsInRange(Group_ENUM_GROUP, pos7, 99999., nil, "when calling enumUnitsInRange in Recycle, line 48")
		iterator4 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Recycle, line 49")
		while true do
			if not(GroupIterator_GroupIterator_hasNext(iterator4, "when calling hasNext in Recycle, line 49")) then
				break
			end
			u11 = GroupIterator_GroupIterator_next(iterator4, "when calling next in Recycle, line 49")
			if ((not((u11 == dying)) and unit_isAlive(u11, "when calling isAlive in Recycle, line 50")) and player_isAllyOf(unit_getOwner(u11, "when calling getOwner in Recycle, line 50"), unit_getOwner(dying, "when calling getOwner in Recycle, line 50"), "when calling isAllyOf in Recycle, line 50")) then
				dist2 = vec2_distanceTo(pos7, unit_getPos(u11, "when calling getPos in Recycle, line 51"), "when calling distanceTo in Recycle, line 51")
				if (dist2 < closestDist) then
					closestDist = dist2
					closest = u11
				end
			end
		end
		GroupIterator_GroupIterator_close(iterator4, "when calling close in Recycle, line 49")
		if not((closest == nil)) then
			InstantDummyCaster_castTarget(unit_getOwner(dying, "when calling getOwner in Recycle, line 57"), Invigorate_INVIGORATE_ID, 1, OrderIds_rejuvination, closest, "when calling castTarget in Recycle, line 57")
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_SeedBurst:create45() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SeedBurst, }))
	return new_inst
end

function OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst(this173, caster7, __wurst_stackPos203) 
	local level2 = nil
	local targets = nil
	local iterator5 = nil
	local u12 = nil
	local delay = nil
	local iterator6 = nil
	local wrapper = nil
	local explodePos = ({0., 0., })
	local damage = nil
	local radius2 = nil
	local clVar6 = nil
	local iterator7 = nil
	local wrapper1 = nil
	local temp82 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos203
	wurst_stack_depth = (wurst_stack_depth + 1)
	level2 = (unit_getAbilityLevel(caster7, SeedBurst_SEED_BURST_ID, "when calling getAbilityLevel in SeedBurst, line 82") - 1)
	targets = LinkedList_new_LinkedList("when calling new_LinkedList in SeedBurst, line 84")
	group_enumUnitsInRect(Group_ENUM_GROUP, bj_mapInitialPlayableArea, nil, "when calling enumUnitsInRect in SeedBurst, line 85")
	iterator5 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SeedBurst, line 86")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator5, "when calling hasNext in SeedBurst, line 86")) then
			break
		end
		u12 = GroupIterator_GroupIterator_next(iterator5, "when calling next in SeedBurst, line 86")
		if unit_hasAbility(u12, SeedBurst_INVIGORATE_BUFF_ID, "when calling hasAbility in SeedBurst, line 87") then
			LinkedList_LinkedList_add(targets, "when calling add in SeedBurst, line 88", Vec2Wrapper_new_Vec2Wrapper(unit_getPos(u12, "when calling getPos in SeedBurst, line 88"), "when calling new_Vec2Wrapper in SeedBurst, line 88"))
			unit_removeAbility(u12, SeedBurst_INVIGORATE_BUFF_ID, "when calling removeAbility in SeedBurst, line 89")
		end
	end
	GroupIterator_GroupIterator_close(iterator5, "when calling close in SeedBurst, line 86")
	delay = 0.
	iterator6 = LinkedList_LinkedList_iterator(targets, "when calling iterator in SeedBurst, line 92")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator6, "when calling hasNext in SeedBurst, line 92")) then
			break
		end
		wrapper = LLIterator_LLIterator_next(iterator6, "when calling next in SeedBurst, line 92")
		explodePos = tupleCopy(wrapper.Vec2Wrapper_pos)
		damage = realEnsure(SeedBurst_BURST_DAMAGE[level2])
		radius2 = realEnsure(SeedBurst_BURST_RADIUS[level2])
		temp82 = delay
		clVar6 = CallbackSingle_doAfter_onCast_SeedBurst:create46()
		CallbackSingle_construct_CallbackSingle(clVar6, "when calling construct_CallbackSingle in SeedBurst, line 96")
		clVar6.explodePos = tupleCopy(explodePos)
		clVar6.radius = radius2
		clVar6.caster = caster7
		clVar6.damage = damage
		doAfter(temp82, clVar6, "when calling doAfter in SeedBurst, line 96")
		delay = (delay + SeedBurst_BURST_DELAY)
	end
	LLIterator_LLIterator_close(iterator6, "when calling close in SeedBurst, line 92")
	iterator7 = LinkedList_LinkedList_iterator(targets, "when calling iterator in SeedBurst, line 105")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator7, "when calling hasNext in SeedBurst, line 105")) then
			break
		end
		wrapper1 = LLIterator_LLIterator_next(iterator7, "when calling next in SeedBurst, line 105")
		Vec2Wrapper_destroyVec2Wrapper(wrapper1, "when calling destroyVec2Wrapper in SeedBurst, line 106")
	end
	LLIterator_LLIterator_close(iterator7, "when calling close in SeedBurst, line 105")
	LinkedList_destroyLinkedList(targets, "when calling destroyLinkedList in SeedBurst, line 107")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_SeedBurst:create46() 
	local new_inst = ({CallbackSingle_t=nil, explodePos=({0., 0., }), radius=0., caster=nil, damage=0., })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SeedBurst, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst(this176, __wurst_stackPos207) 
	local iterator8 = nil
	local u13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos207
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect1(SeedBurst_BURST_SFX, this176.explodePos, "when calling flashEffect in SeedBurst, line 97")
	flashEffect1(SeedBurst_EXPLOSION_SFX, this176.explodePos, "when calling flashEffect in SeedBurst, line 98")
	group_enumUnitsInRange(Group_ENUM_GROUP, this176.explodePos, this176.radius, nil, "when calling enumUnitsInRange in SeedBurst, line 99")
	iterator8 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SeedBurst, line 100")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator8, "when calling hasNext in SeedBurst, line 100")) then
			break
		end
		u13 = GroupIterator_GroupIterator_next(iterator8, "when calling next in SeedBurst, line 100")
		if (unit_isAlive(u13, "when calling isAlive in SeedBurst, line 101") and player_isEnemyOf(unit_getOwner(u13, "when calling getOwner in SeedBurst, line 101"), unit_getOwner(this176.caster, "when calling getOwner in SeedBurst, line 101"), "when calling isEnemyOf in SeedBurst, line 101")) then
			unit_damageTarget(this176.caster, u13, this176.damage, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in SeedBurst, line 102")
		end
	end
	GroupIterator_GroupIterator_close(iterator8, "when calling close in SeedBurst, line 100")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper:create47() 
	local new_inst = ({Vec2Wrapper_pos=({0., 0., }), })
	setmetatable(new_inst, ({__index=Vec2Wrapper, }))
	return new_inst
end

function Vec2Wrapper_Vec2Wrapper_init(this177, __wurst_stackPos208) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos208
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_new_Vec2Wrapper(p6, __wurst_stackPos204) 
	local this178 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos204
	wurst_stack_depth = (wurst_stack_depth + 1)
	this178 = Vec2Wrapper:create47()
	Vec2Wrapper_construct_Vec2Wrapper(this178, p6, "when calling construct_Vec2Wrapper in SeedBurst, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this178
end

function Vec2Wrapper_construct_Vec2Wrapper(this179, p7, __wurst_stackPos209) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos209
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_init(this179, "when calling Vec2Wrapper_init in SeedBurst, line 24")
	this179.Vec2Wrapper_pos = tupleCopy(p7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_Vec2Wrapper_onDestroy(this180, __wurst_stackPos210) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos210
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_destroyVec2Wrapper(this175, __wurst_stackPos206) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos206
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_onDestroy(this175, "when calling Vec2Wrapper_onDestroy in SeedBurst, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_addListener_ShieldBash:create48() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener_addListener_ShieldBash, }))
	return new_inst
end

function DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash(this181, __wurst_stackPos211) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos211
	wurst_stack_depth = (wurst_stack_depth + 1)
	onDamageTaken("when calling onDamageTaken in ShieldBash, line 86")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_SpiritWisps:create49() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SpiritWisps, }))
	return new_inst
end

function OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps(this182, caster8, __wurst_stackPos213) 
	local wisps = nil
	local i4 = nil
	local temp3 = nil
	local startAngle = nil
	local spawnPos = ({0., 0., })
	local wisp = nil
	local moveTimer = nil
	local clVar7 = nil
	local healTimer1 = nil
	local clVar8 = nil
	local clVar9 = nil
	local temp83 = nil
	local temp84 = nil
	local temp85 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos213
	wurst_stack_depth = (wurst_stack_depth + 1)
	wisps = LinkedList_new_LinkedList("when calling new_LinkedList in SpiritWisps, line 60")
	i4 = 0
	temp3 = (SpiritWisps_WISP_COUNT - 1)
	while true do
		if (i4 > temp3) then
			break
		end
		startAngle = (((2. * bj_PI) * int_toReal(i4, "when calling toReal in SpiritWisps, line 63")) / int_toReal(SpiritWisps_WISP_COUNT, "when calling toReal in SpiritWisps, line 63"))
		spawnPos = tupleCopy(vec2_polarOffset(unit_getPos(caster8, "when calling getPos in SpiritWisps, line 64"), ({startAngle, }), SpiritWisps_ORBIT_RADIUS, "when calling polarOffset in SpiritWisps, line 64"))
		wisp = createUnit(unit_getOwner(caster8, "when calling getOwner in SpiritWisps, line 65"), SpiritWisps_WISP_UNIT_ID, spawnPos, ({0., }), "when calling createUnit in SpiritWisps, line 65")
		unit_addAbility(wisp, 1097625443, "when calling addAbility in SpiritWisps, line 66")
		unit_setVertexColor(wisp, 50, 255, 50, 255, "when calling setVertexColor in SpiritWisps, line 67")
		widget_addEffect(wisp, "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes2.mdl", "origin", "when calling addEffect in SpiritWisps, line 69")
		LinkedList_LinkedList_add(wisps, "when calling add in SpiritWisps, line 70", __wurst_objectToIndex(wisp))
		i4 = (i4 + 1)
	end
	temp83 = SpiritWisps_UPDATE_INTERVAL
	clVar7 = CallbackPeriodic_doPeriodically_onCast_SpiritWisps:create50()
	CallbackPeriodic_construct_CallbackPeriodic(clVar7, "when calling construct_CallbackPeriodic in SpiritWisps, line 72")
	clVar7.wisps = wisps
	clVar7.caster = caster8
	moveTimer = doPeriodically(temp83, clVar7, "when calling doPeriodically in SpiritWisps, line 72")
	temp84 = SpiritWisps_HEAL_INTERVAL
	clVar8 = CallbackPeriodic_doPeriodically_onCast_SpiritWisps1:create51()
	CallbackPeriodic_construct_CallbackPeriodic(clVar8, "when calling construct_CallbackPeriodic in SpiritWisps, line 114")
	clVar8.caster = caster8
	healTimer1 = doPeriodically(temp84, clVar8, "when calling doPeriodically in SpiritWisps, line 114")
	temp85 = SpiritWisps_WISP_DURATION
	clVar9 = CallbackSingle_doAfter_onCast_SpiritWisps:create52()
	CallbackSingle_construct_CallbackSingle(clVar9, "when calling construct_CallbackSingle in SpiritWisps, line 122")
	clVar9.moveTimer = moveTimer
	clVar9.healTimer = healTimer1
	clVar9.wisps = wisps
	clVar9.caster = caster8
	doAfter(temp85, clVar9, "when calling doAfter in SpiritWisps, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps:create50() 
	local new_inst = ({CallbackPeriodic_t=nil, wisps=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_SpiritWisps, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps(this184, cb7, __wurst_stackPos215) 
	local wispTargets = nil
	local iterator9 = nil
	local wisp1 = nil
	local casterPos = ({0., 0., })
	local nearestInjured = nil
	local nearestDist = nil
	local iterator10 = nil
	local u14 = nil
	local dist3 = nil
	local targetPos2 = ({0., 0., })
	local randomAngle = ({0., })
	local randomDist = nil
	local moveDir1 = ({0., })
	local moveSpeed = nil
	local newPos = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos215
	wurst_stack_depth = (wurst_stack_depth + 1)
	wispTargets = LinkedList_new_LinkedList("when calling new_LinkedList in SpiritWisps, line 73")
	iterator9 = LinkedList_LinkedList_iterator(this184.wisps, "when calling iterator in SpiritWisps, line 74")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator9, "when calling hasNext in SpiritWisps, line 74")) then
			break
		end
		wisp1 = __wurst_objectFromIndex(intEnsure(LLIterator_LLIterator_next(iterator9, "when calling next in SpiritWisps, line 74")))
		casterPos = tupleCopy(unit_getPos(this184.caster, "when calling getPos in SpiritWisps, line 75"))
		nearestInjured = nil
		nearestDist = 99999.
		group_enumUnitsInRange(Group_ENUM_GROUP, casterPos, SpiritWisps_WISP_RADIUS, nil, "when calling enumUnitsInRange in SpiritWisps, line 79")
		iterator10 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SpiritWisps, line 81")
		while true do
			if not(GroupIterator_GroupIterator_hasNext(iterator10, "when calling hasNext in SpiritWisps, line 81")) then
				break
			end
			u14 = GroupIterator_GroupIterator_next(iterator10, "when calling next in SpiritWisps, line 81")
			if ((unit_isAlive(u14, "when calling isAlive in SpiritWisps, line 82") and player_isAllyOf(unit_getOwner(u14, "when calling getOwner in SpiritWisps, line 82"), unit_getOwner(this184.caster, "when calling getOwner in SpiritWisps, line 82"), "when calling isAllyOf in SpiritWisps, line 82")) and (unit_getHP(u14, "when calling getHP in SpiritWisps, line 82") < unit_getMaxHP(u14, "when calling getMaxHP in SpiritWisps, line 82"))) then
				dist3 = vec2_distanceTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 83"), unit_getPos(u14, "when calling getPos in SpiritWisps, line 83"), "when calling distanceTo in SpiritWisps, line 83")
				if ((dist3 < nearestDist) and not(LinkedList_LinkedList_has(wispTargets, __wurst_objectToIndex(u14), "when calling has in SpiritWisps, line 84"))) then
					nearestDist = dist3
					nearestInjured = u14
					LinkedList_LinkedList_add(wispTargets, "when calling add in SpiritWisps, line 87", __wurst_objectToIndex(u14))
				end
			end
		end
		GroupIterator_GroupIterator_close(iterator10, "when calling close in SpiritWisps, line 81")
		if not((nearestInjured == nil)) then
			targetPos2 = tupleCopy(vec2_polarOffset(unit_getPos(nearestInjured, "when calling getPos in SpiritWisps, line 92"), vec2_angleTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 93"), unit_getPos(nearestInjured, "when calling getPos in SpiritWisps, line 93"), "when calling angleTo in SpiritWisps, line 93"), -(50.), "when calling polarOffset in SpiritWisps, line 92"))
		else
			randomAngle = ({GetRandomReal(0., (2. * bj_PI)), })
			randomDist = GetRandomReal(50., SpiritWisps_ORBIT_RADIUS)
			targetPos2 = tupleCopy(vec2_polarOffset(casterPos, randomAngle, randomDist, "when calling polarOffset in SpiritWisps, line 100"))
		end
		moveDir1 = tupleCopy1(vec2_angleTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 103"), targetPos2, "when calling angleTo in SpiritWisps, line 103"))
		moveSpeed = (200. * SpiritWisps_UPDATE_INTERVAL)
		newPos = tupleCopy(vec2_polarOffset(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 105"), moveDir1, moveSpeed, "when calling polarOffset in SpiritWisps, line 105"))
		if (vec2_distanceTo(newPos, casterPos, "when calling distanceTo in SpiritWisps, line 108") > SpiritWisps_WISP_RADIUS) then
			unit_setXY(wisp1, vec2_polarOffset(casterPos, vec2_angleTo(newPos, casterPos, "when calling angleTo in SpiritWisps, line 109"), (-(SpiritWisps_WISP_RADIUS) + 20.), "when calling polarOffset in SpiritWisps, line 109"), "when calling setXY in SpiritWisps, line 109")
		else
			unit_setXY(wisp1, newPos, "when calling setXY in SpiritWisps, line 111")
		end
	end
	LLIterator_LLIterator_close(iterator9, "when calling close in SpiritWisps, line 74")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps1:create51() 
	local new_inst = ({CallbackPeriodic_t=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_SpiritWisps1, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1(this186, cb8, __wurst_stackPos217) 
	local iterator11 = nil
	local u15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos217
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRange(Group_ENUM_GROUP, unit_getPos(this186.caster, "when calling getPos in SpiritWisps, line 115"), SpiritWisps_WISP_RADIUS, nil, "when calling enumUnitsInRange in SpiritWisps, line 115")
	iterator11 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SpiritWisps, line 116")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator11, "when calling hasNext in SpiritWisps, line 116")) then
			break
		end
		u15 = GroupIterator_GroupIterator_next(iterator11, "when calling next in SpiritWisps, line 116")
		if ((unit_isAlive(u15, "when calling isAlive in SpiritWisps, line 117") and player_isAllyOf(unit_getOwner(u15, "when calling getOwner in SpiritWisps, line 117"), unit_getOwner(this186.caster, "when calling getOwner in SpiritWisps, line 117"), "when calling isAllyOf in SpiritWisps, line 117")) and (unit_getHP(u15, "when calling getHP in SpiritWisps, line 117") < unit_getMaxHP(u15, "when calling getMaxHP in SpiritWisps, line 117"))) then
			unit_addHP(u15, SpiritWisps_WISP_HEAL, "when calling addHP in SpiritWisps, line 118")
			flashEffect("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u15, "origin", "when calling flashEffect in SpiritWisps, line 119")
		end
	end
	GroupIterator_GroupIterator_close(iterator11, "when calling close in SpiritWisps, line 116")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_SpiritWisps:create52() 
	local new_inst = ({CallbackSingle_t=nil, moveTimer=nil, healTimer=nil, wisps=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SpiritWisps, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps(this187, __wurst_stackPos218) 
	local iterator12 = nil
	local wisp2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos218
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this187.moveTimer, "when calling destroyCallbackPeriodic in SpiritWisps, line 123")
	CallbackPeriodic_destroyCallbackPeriodic(this187.healTimer, "when calling destroyCallbackPeriodic in SpiritWisps, line 124")
	iterator12 = LinkedList_LinkedList_iterator(this187.wisps, "when calling iterator in SpiritWisps, line 125")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator12, "when calling hasNext in SpiritWisps, line 125")) then
			break
		end
		wisp2 = __wurst_objectFromIndex(intEnsure(LLIterator_LLIterator_next(iterator12, "when calling next in SpiritWisps, line 125")))
		unit_kill(wisp2, "when calling kill in SpiritWisps, line 126")
	end
	LLIterator_LLIterator_close(iterator12, "when calling close in SpiritWisps, line 125")
	LinkedList_destroyLinkedList(this187.wisps, "when calling destroyLinkedList in SpiritWisps, line 127")
	__wurst_safe_UnitRemoveAbility(this187.caster, SpiritWisps_WISP_BUFF_ID)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_SummonTreant:create53() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SummonTreant, }))
	return new_inst
end

function OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant(this188, caster9, __wurst_stackPos219) 
	local level3 = nil
	local duration2 = nil
	local totalTreants = nil
	local pos8 = ({0., 0., })
	local i5 = nil
	local temp4 = nil
	local treant = nil
	local clVar10 = nil
	local temp86 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos219
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (getSeedlingCount("when calling getSeedlingCount in SummonTreant, line 70") <= 0) then
		print1("No seedling stacks available!", "when calling print in SummonTreant, line 71")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	level3 = (unit_getAbilityLevel(caster9, SummonTreant_SUMMON_TREANT_ID, "when calling getAbilityLevel in SummonTreant, line 74") - 1)
	duration2 = realEnsure(SummonTreant_TREANT_DURATION[level3])
	totalTreants = (getSeedlingCount("when calling getSeedlingCount in SummonTreant, line 76") + intEnsure(SummonTreant_BONUS_TREANTS[level3]))
	pos8 = tupleCopy(unit_getPos(caster9, "when calling getPos in SummonTreant, line 77"))
	Invigorate_seedlingCount = 0
	print1(stringConcat(stringConcat(stringConcat(stringConcat("Spawning ", int_toString(totalTreants, "when calling toString in SummonTreant, line 80")), " treants for "), int_toString(real_toInt(duration2, "when calling toInt in SummonTreant, line 80"), "when calling toString in SummonTreant, line 80")), "s."), "when calling print in SummonTreant, line 80")
	i5 = 1
	temp4 = totalTreants
	while true do
		if (i5 > temp4) then
			break
		end
		treant = createUnit(unit_getOwner(caster9, "when calling getOwner in SummonTreant, line 83"), SummonTreant_TREANT_UNIT_ID, pos8, ({0., }), "when calling createUnit in SummonTreant, line 83")
		temp86 = duration2
		clVar10 = CallbackSingle_doAfter_onCast_SummonTreant:create54()
		CallbackSingle_construct_CallbackSingle(clVar10, "when calling construct_CallbackSingle in SummonTreant, line 84")
		clVar10.treant = treant
		doAfter(temp86, clVar10, "when calling doAfter in SummonTreant, line 84")
		i5 = (i5 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_SummonTreant:create54() 
	local new_inst = ({CallbackSingle_t=nil, treant=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SummonTreant, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant(this190, __wurst_stackPos222) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos222
	wurst_stack_depth = (wurst_stack_depth + 1)
	if unit_isAlive(this190.treant, "when calling isAlive in SummonTreant, line 85") then
		unit_kill(this190.treant, "when calling kill in SummonTreant, line 86")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table:create55() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=Table, }))
	return new_inst
end

function Table_Table_hasInt(this104, parentKey, __wurst_stackPos123) 
	local stackTrace_tempReturn1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos123
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = hashtable_hasInt(Table_ht, __wurst_objectToIndex(this104), parentKey, "when calling hasInt in Table, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function Table_Table_hasString(this192, parentKey5, __wurst_stackPos224) 
	local stackTrace_tempReturn2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos224
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = hashtable_hasString(Table_ht, __wurst_objectToIndex(this192), parentKey5, "when calling hasString in Table, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function Table_Table_removeInt(this107, parentKey3, __wurst_stackPos126) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos126
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_RemoveSavedInteger(Table_ht, __wurst_objectToIndex(this107), parentKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadInt(this106, parentKey2, __wurst_stackPos125) 
	local stackTrace_tempReturn3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos125
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = hashtable_loadInt(Table_ht, __wurst_objectToIndex(this106), parentKey2, "when calling loadInt in Table, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function Table_Table_saveInt(this105, parentKey1, value1, __wurst_stackPos124) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos124
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveInt(Table_ht, __wurst_objectToIndex(this105), parentKey1, value1, "when calling saveInt in Table, line 44")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadString(this196, parentKey10, __wurst_stackPos228) 
	local stackTrace_tempReturn4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos228
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = hashtable_loadString(Table_ht, __wurst_objectToIndex(this196), parentKey10, "when calling loadString in Table, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function Table_Table_saveString(this198, parentKey12, value4, __wurst_stackPos230) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos230
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveString(Table_ht, __wurst_objectToIndex(this198), parentKey12, value4, "when calling saveString in Table, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadUnit(this200, parentKey14, __wurst_stackPos232) 
	local stackTrace_tempReturn5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos232
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = hashtable_loadUnitHandle(Table_ht, __wurst_objectToIndex(this200), parentKey14, "when calling loadUnitHandle in Table, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function Table_Table_loadTrigger(this202, parentKey16, __wurst_stackPos234) 
	local stackTrace_tempReturn6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos234
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = hashtable_loadTriggerHandle(Table_ht, __wurst_objectToIndex(this202), parentKey16, "when calling loadTriggerHandle in Table, line 113")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function Table_Table_saveFogState(this204, parentKey18, value6, __wurst_stackPos236) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos236
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveFogStateHandle(Table_ht, __wurst_objectToIndex(this204), parentKey18, value6, "when calling saveFogStateHandle in Table, line 170")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_init(this206, __wurst_stackPos238) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos238
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_new_Table(__wurst_stackPos239) 
	local this207 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos239
	wurst_stack_depth = (wurst_stack_depth + 1)
	this207 = Table:create55()
	Table_construct_Table(this207, "when calling construct_Table in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this207
end

function Table_construct_Table(this111, __wurst_stackPos130) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos130
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_init(this111, "when calling Table_init in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_ThrowExplosives:create56() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_ThrowExplosives, }))
	return new_inst
end

function OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives(this208, caster10, __wurst_stackPos240) 
	local targetPos3 = ({0., 0., })
	local barrel = nil
	local fuseSfx = nil
	local barrelScale = nil
	local pulseTimer = nil
	local clVar11 = nil
	local clVar12 = nil
	local temp87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos240
	wurst_stack_depth = (wurst_stack_depth + 1)
	targetPos3 = tupleCopy(EventData_getSpellTargetPos("when calling getSpellTargetPos in ThrowExplosives, line 61"))
	print1("cast spell", "when calling print in ThrowExplosives, line 62")
	barrel = createUnit(unit_getOwner(caster10, "when calling getOwner in ThrowExplosives, line 65"), ThrowExplosives_BARREL_UNIT_ID, targetPos3, ({0., }), "when calling createUnit in ThrowExplosives, line 65")
	unit_addAbility(barrel, 1097625443, "when calling addAbility in ThrowExplosives, line 66")
	unit_setInvulnerable(barrel, true, "when calling setInvulnerable in ThrowExplosives, line 67")
	unit_pause(barrel, "when calling pause in ThrowExplosives, line 68")
	fuseSfx = widget_addEffect(barrel, ThrowExplosives_FUSE_SFX, "origin", "when calling addEffect in ThrowExplosives, line 71")
	effect_setScale(fuseSfx, 1., "when calling setScale in ThrowExplosives, line 72")
	barrelScale = 1.
	unit_setScale(barrel, barrelScale, "when calling setScale in ThrowExplosives, line 75")
	clVar11 = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives:create57()
	CallbackPeriodic_construct_CallbackPeriodic(clVar11, "when calling construct_CallbackPeriodic in ThrowExplosives, line 77")
	clVar11.barrelScale = barrelScale
	clVar11.barrel = barrel
	pulseTimer = doPeriodically(0.5, clVar11, "when calling doPeriodically in ThrowExplosives, line 77")
	temp87 = ThrowExplosives_FUSE_DURATION
	clVar12 = CallbackSingle_doAfter_onCast_ThrowExplosives:create58()
	CallbackSingle_construct_CallbackSingle(clVar12, "when calling construct_CallbackSingle in ThrowExplosives, line 81")
	clVar12.pulseTimer = pulseTimer
	clVar12.fuseSfx = fuseSfx
	clVar12.targetPos = tupleCopy(targetPos3)
	clVar12.caster = caster10
	clVar12.barrel = barrel
	doAfter(temp87, clVar12, "when calling doAfter in ThrowExplosives, line 81")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_ThrowExplosives:create57() 
	local new_inst = ({CallbackPeriodic_t=nil, barrelScale=0., barrel=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_ThrowExplosives, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives(this209, cb9, __wurst_stackPos241) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos241
	wurst_stack_depth = (wurst_stack_depth + 1)
	this209.barrelScale = (this209.barrelScale + 0.05)
	unit_setScale(this209.barrel, this209.barrelScale, "when calling setScale in ThrowExplosives, line 79")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_ThrowExplosives:create58() 
	local new_inst = ({CallbackSingle_t=nil, pulseTimer=nil, fuseSfx=nil, targetPos=({0., 0., }), caster=nil, barrel=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_ThrowExplosives, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives(this210, __wurst_stackPos242) 
	local iterator13 = nil
	local u16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos242
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this210.pulseTimer, "when calling destroyCallbackPeriodic in ThrowExplosives, line 82")
	effect_destr(this210.fuseSfx, "when calling destr in ThrowExplosives, line 83")
	flashEffect1(ThrowExplosives_EXPLODE_SFX, this210.targetPos, "when calling flashEffect in ThrowExplosives, line 84")
	flashEffect1("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", this210.targetPos, "when calling flashEffect in ThrowExplosives, line 85")
	group_enumUnitsInRange(Group_ENUM_GROUP, this210.targetPos, ThrowExplosives_EXPLODE_RADIUS, nil, "when calling enumUnitsInRange in ThrowExplosives, line 87")
	iterator13 = group_iterator(Group_ENUM_GROUP, "when calling iterator in ThrowExplosives, line 88")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator13, "when calling hasNext in ThrowExplosives, line 88")) then
			break
		end
		u16 = GroupIterator_GroupIterator_next(iterator13, "when calling next in ThrowExplosives, line 88")
		if (unit_isAlive(u16, "when calling isAlive in ThrowExplosives, line 89") and player_isEnemyOf(unit_getOwner(u16, "when calling getOwner in ThrowExplosives, line 89"), unit_getOwner(this210.caster, "when calling getOwner in ThrowExplosives, line 89"), "when calling isEnemyOf in ThrowExplosives, line 89")) then
			unit_damageTarget(this210.caster, u16, ThrowExplosives_EXPLODE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in ThrowExplosives, line 90")
		end
	end
	GroupIterator_GroupIterator_close(iterator13, "when calling close in ThrowExplosives, line 88")
	unit_kill(this210.barrel, "when calling kill in ThrowExplosives, line 92")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex:create59() 
	local new_inst = ({UnitIndex__unit=nil, })
	setmetatable(new_inst, ({__index=UnitIndex, }))
	return new_inst
end

function UnitIndex_new_UnitIndex(whichUnit2, __wurst_stackPos243) 
	local this211 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos243
	wurst_stack_depth = (wurst_stack_depth + 1)
	this211 = UnitIndex:create59()
	UnitIndex_construct_UnitIndex(this211, whichUnit2, "when calling construct_UnitIndex in UnitIndexer, line 175")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this211
end

function UnitIndex_destroyUnitIndex(this213, __wurst_stackPos245) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos245
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_onDestroy(this213, "when calling UnitIndex_onDestroy in UnitIndexer, line 182")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_init(this215, __wurst_stackPos247) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos247
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_construct_UnitIndex(this212, whichUnit3, __wurst_stackPos244) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos244
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_init(this212, "when calling UnitIndex_init in UnitIndexer, line 175")
	this212.UnitIndex__unit = whichUnit3
	unit_setUserData(this212.UnitIndex__unit, __wurst_objectToIndex(this212), "when calling setUserData in UnitIndexer, line 177")
	pushUnit(whichUnit3, "when calling pushUnit in UnitIndexer, line 178")
	trigger_evaluate(UnitIndexer_onIndexTrigger, "when calling evaluate in UnitIndexer, line 179")
	popUnit("when calling popUnit in UnitIndexer, line 180")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_onDestroy(this214, __wurst_stackPos246) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos246
	wurst_stack_depth = (wurst_stack_depth + 1)
	pushUnit(this214.UnitIndex__unit, "when calling pushUnit in UnitIndexer, line 183")
	trigger_evaluate(UnitIndexer_onDeindexTrigger, "when calling evaluate in UnitIndexer, line 184")
	popUnit("when calling popUnit in UnitIndexer, line 185")
	unit_setUserData(this214.UnitIndex__unit, 0, "when calling setUserData in UnitIndexer, line 186")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitDefinition:create60() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=UnitDefinition, }))
	return new_inst
end

function UnitDefinition_UnitDefinition_init(this218, __wurst_stackPos252) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos252
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitDefinition_new_UnitDefinition(newId, origId, __wurst_stackPos253) 
	local this219 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos253
	wurst_stack_depth = (wurst_stack_depth + 1)
	this219 = UnitDefinition:create60()
	UnitDefinition_construct_UnitDefinition(this219, newId, origId, "when calling construct_UnitDefinition in UnitObjEditing, line 707")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this219
end

function UnitDefinition_construct_UnitDefinition(this220, newId1, origId1, __wurst_stackPos254) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos254
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitOrHeroDefinition_construct_UnitOrHeroDefinition(this220, newId1, origId1, "when calling construct_UnitOrHeroDefinition in UnitObjEditing, line 707")
	UnitDefinition_UnitDefinition_init(this220, "when calling UnitDefinition_init in UnitObjEditing, line 707")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrBuildingOrHeroDefinition:create61() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=UnitOrBuildingOrHeroDefinition, }))
	return new_inst
end

function UnitOrBuildingOrHeroDefinition_UnitOrBuildingOrHeroDefinition_init(this222, __wurst_stackPos256) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos256
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrBuildingOrHeroDefinition_construct_UnitOrBuildingOrHeroDefinition(this223, newUnitId, origUnitId, __wurst_stackPos257) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos257
	wurst_stack_depth = (wurst_stack_depth + 1)
	W3UDefinition_construct_W3UDefinition(this223, newUnitId, origUnitId, "when calling construct_W3UDefinition in UnitObjEditing, line 56")
	UnitOrBuildingOrHeroDefinition_UnitOrBuildingOrHeroDefinition_init(this223, "when calling UnitOrBuildingOrHeroDefinition_init in UnitObjEditing, line 56")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrHeroDefinition:create62() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=UnitOrHeroDefinition, }))
	return new_inst
end

function UnitOrHeroDefinition_UnitOrHeroDefinition_init(this225, __wurst_stackPos259) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos259
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrHeroDefinition_construct_UnitOrHeroDefinition(this221, newId2, origId2, __wurst_stackPos255) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos255
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitOrBuildingOrHeroDefinition_construct_UnitOrBuildingOrHeroDefinition(this221, newId2, origId2, "when calling construct_UnitOrBuildingOrHeroDefinition in UnitObjEditing, line 604")
	UnitOrHeroDefinition_UnitOrHeroDefinition_init(this221, "when calling UnitOrHeroDefinition_init in UnitObjEditing, line 604")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function W3UDefinition:create63() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=W3UDefinition, }))
	return new_inst
end

function W3UDefinition_W3UDefinition_init(this226, __wurst_stackPos260) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos260
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function W3UDefinition_construct_W3UDefinition(this224, newId3, baseId, __wurst_stackPos258) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos258
	wurst_stack_depth = (wurst_stack_depth + 1)
	W3UDefinition_W3UDefinition_init(this224, "when calling W3UDefinition_init in UnitObjEditing, line 21")
	createObjectDefinition("w3u", newId3, baseId, "when calling createObjectDefinition in UnitObjEditing, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_UrsocCharge:create64() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_UrsocCharge, }))
	return new_inst
end

function OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge(this227, caster11, __wurst_stackPos262) 
	local target8 = nil
	local targetPos4 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos262
	wurst_stack_depth = (wurst_stack_depth + 1)
	target8 = EventData_getSpellTargetUnit("when calling getSpellTargetUnit in UrsocCharge, line 94")
	targetPos4 = tupleCopy(unit_getPos(target8, "when calling getPos in UrsocCharge, line 95"))
	unit_setXY(caster11, targetPos4, "when calling setXY in UrsocCharge, line 98")
	flashEffect1(UrsocCharge_CHARGE_SFX, targetPos4, "when calling flashEffect in UrsocCharge, line 100")
	flashEffect1(UrsocCharge_IMPACT_SFX, targetPos4, "when calling flashEffect in UrsocCharge, line 101")
	unit_damageTarget(caster11, target8, UrsocCharge_CHARGE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in UrsocCharge, line 103")
	InstantDummyCaster_castTarget(unit_getOwner(caster11, "when calling getOwner in UrsocCharge, line 114"), UrsocCharge_CHARGE_STUN_ID, 1, OrderIds_thunderbolt, target8, "when calling castTarget in UrsocCharge, line 114")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initGlobals(__wurst_stackPos263) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos263
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_townHall = nil
	udg_mountHyjal = nil
	udg_mountHyjalGrove = nil
	udg_mountHyjalTown = nil
	udg_mountHyjalCrypt = nil
	udg_winterspringCenter = nil
	udg_winterspringNorth = nil
	udg_winterspringSouth = nil
	udg_winterspringDen = nil
	udg_winterspringRoost = nil
	udg_moongladeWest = nil
	udg_moongladeEast = nil
	udg_felwoodNorth = nil
	udg_felwoodCenter = nil
	udg_felwoodSouth = nil
	udg_ashenvaleChimaerasFall = nil
	udg_ashenvaleAstranaar = nil
	udg_ashenvaleForestEast = nil
	udg_ashenvaleCrossing = nil
	udg_ashenvaleChimaerasRest = nil
	udg_ashenvaleBeachNorth = nil
	udg_ashenvaleForestWest = nil
	udg_ashenvaleForestCenter = nil
	udg_ashenvaleGraniteDen = nil
	udg_ashenvaleWarsongSouth = nil
	udg_ashenvaleWarsongNorth = nil
	udg_ashenvaleVentureCo = nil
	udg_ashenvaleRoost = nil
	udg_ashenvaleBeachSouth = nil
	udg_ashenvaleForestNorth = nil
	udg_winterspringFactory = nil
	udg_ashenvaleForestSouth = nil
	udg_ashenvaleWarsongCenter = nil
	gg_trg_Other = nil
	gg_trg_ControlPointInitialVariables = nil
	gg_unit_h00O_0019 = nil
	gg_unit_h007_0018 = nil
	gg_unit_h002_0005 = nil
	gg_unit_h006_0015 = nil
	gg_unit_h008_0011 = nil
	gg_unit_h003_0016 = nil
	gg_unit_h00B_0012 = nil
	gg_unit_h004_0006 = nil
	gg_unit_h00E_0013 = nil
	gg_unit_h009_0014 = nil
	gg_unit_h005_0017 = nil
	gg_unit_h00T_0007 = nil
	gg_unit_h00A_0009 = nil
	gg_unit_h001_0008 = nil
	gg_unit_h000_0407 = nil
	gg_unit_etol_0001 = nil
	gg_unit_cp00_0425 = nil
	gg_unit_h00L_0184 = nil
	gg_unit_h00G_0185 = nil
	gg_unit_h00P_0178 = nil
	gg_unit_h00H_0183 = nil
	gg_unit_h00N_0200 = nil
	gg_unit_h00M_0136 = nil
	gg_unit_h00F_0163 = nil
	gg_unit_h00Q_0197 = nil
	gg_unit_h00I_0135 = nil
	gg_unit_h00D_0010 = nil
	gg_unit_h00J_0177 = nil
	gg_unit_h00C_0174 = nil
	gg_unit_h00U_0175 = nil
	gg_unit_h00R_0196 = nil
	gg_unit_h00S_0179 = nil
	gg_unit_h00K_0176 = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitGlobals(__wurst_stackPos264) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos264
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_townHall = nil
	CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000003_DropItems(__wurst_stackPos265) 
	local trigWidget = nil
	local trigUnit = nil
	local itemID = nil
	local canDrop = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos265
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

function Unit000038_DropItems(__wurst_stackPos266) 
	local trigWidget1 = nil
	local trigUnit1 = nil
	local itemID1 = nil
	local canDrop1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos266
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

function Unit000043_DropItems(__wurst_stackPos267) 
	local trigWidget2 = nil
	local trigUnit2 = nil
	local itemID2 = nil
	local canDrop2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos267
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

function Unit000077_DropItems(__wurst_stackPos268) 
	local trigWidget3 = nil
	local trigUnit3 = nil
	local itemID3 = nil
	local canDrop3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos268
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

function Unit000080_DropItems(__wurst_stackPos269) 
	local trigWidget4 = nil
	local trigUnit4 = nil
	local itemID4 = nil
	local canDrop4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos269
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

function Unit000090_DropItems(__wurst_stackPos270) 
	local trigWidget5 = nil
	local trigUnit5 = nil
	local itemID5 = nil
	local canDrop5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos270
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

function Unit000097_DropItems(__wurst_stackPos271) 
	local trigWidget6 = nil
	local trigUnit6 = nil
	local itemID6 = nil
	local canDrop6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos271
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

function Unit000116_DropItems(__wurst_stackPos272) 
	local trigWidget7 = nil
	local trigUnit7 = nil
	local itemID7 = nil
	local canDrop7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos272
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

function CreateBuildingsForPlayer0(__wurst_stackPos273) 
	local p8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos273
	wurst_stack_depth = (wurst_stack_depth + 1)
	p8 = Player(0)
	gg_unit_etol_0001 = __wurst_safe_BlzCreateUnitWithSkin(p8, 1702129516, 1536.0, 18816.0, 270.000, 1702129516)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1701670775, 1056.0, 18848.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700884333, 960.0, 18496.0, 270.000, 1700884333)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852334958, -(1408.0), 24512.0, 270.000, 1852334958)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700885605, -(2144.0), 11232.0, 270.000, 1700885605)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700884343, -(2496.0), 10560.0, 270.000, 1700884343)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700884325, -(4096.0), 12288.0, 270.000, 1700884325)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos274) 
	local p9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos274
	wurst_stack_depth = (wurst_stack_depth + 1)
	p9 = Player(0)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 784.9, 18019.4, 16.183, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 830.5, 18261.7, 202.847, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1702061422, 1253.8, 18323.4, 69.117, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1702061422, 1452.6, 18261.5, 192.530, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1160785971, 562.3, 18696.0, 73.677, 1160785971)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1164666213, 996.9, 17784.5, 152.000, 1164666213)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 608.8, 18306.6, 76.335, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 571.0, 18062.6, 40.706, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656884, 1249.3, 18054.5, 235.137, 1697656884)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer1(__wurst_stackPos275) 
	local p10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos275
	wurst_stack_depth = (wurst_stack_depth + 1)
	p10 = Player(1)
	__wurst_safe_BlzCreateUnitWithSkin(p10, 1752659063, 5248.0, 6080.0, 270.000, 1752659063)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer5(__wurst_stackPos276) 
	local p11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos276
	wurst_stack_depth = (wurst_stack_depth + 1)
	p11 = Player(5)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1868718450, 1920.0, 11008.0, 270.000, 1868718450)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1870099575, 704.0, 9280.0, 270.000, 1870099575)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1869050469, 2112.0, 10432.0, 270.000, 1869050469)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1869902434, 2528.0, 9952.0, 270.000, 1869902434)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1868719457, 2752.0, 11648.0, 270.000, 1868719457)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1868984178, 992.0, 10080.0, 270.000, 1868984178)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1868984178, 2528.0, 9184.0, 270.000, 1868984178)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1868655732, 1696.0, 9888.0, 270.000, 1868655732)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1870099575, 1344.0, 8640.0, 270.000, 1870099575)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1865429042, 1920.0, 13504.0, 270.000, 1865429042)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1865429041, 2816.0, 12928.0, 270.000, 1865429041)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1852860262, 1504.0, 10464.0, 270.000, 1852860262)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1865429040, 1408.0, 12928.0, 270.000, 1865429040)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1865429040, 2368.0, 12800.0, 270.000, 1865429040)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1870099575, 320.0, 11392.0, 270.000, 1870099575)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1870099575, 1600.0, 11968.0, 270.000, 1870099575)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1870099575, 2112.0, 11712.0, 270.000, 1870099575)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1870099575, 3136.0, 11648.0, 270.000, 1870099575)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1868784247, 2784.0, 12000.0, 270.000, 1868784247)
	__wurst_safe_BlzCreateUnitWithSkin(p11, 1852076651, 2752.0, 10496.0, 270.000, 1852076651)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer5(__wurst_stackPos277) 
	local p12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos277
	wurst_stack_depth = (wurst_stack_depth + 1)
	p12 = Player(5)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(6978.2), 8024.8, 295.347, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(6990.9), 7837.8, 357.942, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(8053.7), 7983.8, 246.909, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(8056.4), 7802.6, 195.494, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(8050.1), 7622.7, 120.138, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(6981.3), 7699.2, 55.314, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(8043.2), 8096.9, 252.900, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, -(7574.4), 8243.7, 211.446, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, -(7414.0), 8117.0, 226.992, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, -(7370.0), 7734.9, 148.287, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, -(7933.6), 7529.4, 129.703, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, -(7455.0), 7536.4, 148.814, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852009314, -(7416.6), 7891.4, 189.599, 1852009314)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(7854.9), 7918.6, 205.984, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(7843.4), 8090.1, 226.256, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(7651.4), 8073.4, 211.014, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(7663.4), 7900.1, 194.212, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(7647.1), 7721.4, 173.328, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(7863.3), 7684.2, 161.111, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1868852084, -(7932.4), 7796.5, 184.764, 1868852084)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869834349, -(2689.3), 8137.8, 304.177, 1869834349)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869834349, -(2781.4), 8005.1, 160.889, 1869834349)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869834349, -(2867.4), 7893.6, 183.510, 1869834349)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869311844, -(3081.3), 8154.1, 159.842, 1869311844)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869050485, -(3374.3), 8113.4, 76.017, 1869050485)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869050485, -(3251.2), 8212.4, 96.825, 1869050485)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869050485, -(3103.9), 8324.5, 183.159, 1869050485)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869050485, -(3455.8), 8189.3, 283.950, 1869050485)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869050485, -(3312.6), 8292.6, 345.772, 1869050485)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1869050485, -(3211.5), 8386.7, 84.246, 1869050485)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(3021.0), 7940.7, 302.485, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(2916.7), 8044.7, 147.397, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1853305463, -(2835.5), 8150.0, 92.793, 1853305463)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852009314, 1190.4, 9542.6, 233.547, 1852009314)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852009314, 2083.2, 8892.6, 213.364, 1852009314)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 1238.0, 9333.8, 40.390, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 1539.6, 9150.8, 111.921, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 749.7, 9517.8, 298.618, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 1923.4, 9224.1, 234.664, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 2021.8, 9117.4, 274.689, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 2120.7, 9048.6, 197.375, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 1367.6, 9276.5, 324.359, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 881.6, 9539.9, 193.201, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 1056.4, 9734.2, 163.723, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008567, 2124.6, 9239.4, 111.690, 1852008567)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1406.8, 9629.0, 222.625, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1109.6, 9223.7, 228.885, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1300.8, 9116.2, 238.839, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1445.7, 9019.7, 234.214, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1675.6, 9404.8, 225.647, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1841.7, 9380.7, 239.185, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1212.1, 9794.3, 236.439, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1529.0, 8841.5, 196.280, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 897.9, 9775.0, 303.241, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 695.3, 9717.1, 100.858, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1898.1, 9027.2, 223.805, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1006.9, 9600.6, 288.604, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 861.7, 9053.0, 145.562, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1163.7, 9000.7, 92.991, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 46.1, 8141.7, 257.044, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, -(27.6), 8053.2, 276.271, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1009.5, 9076.0, 15.425, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1295.0, 8904.4, 289.366, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 986.0, 9416.3, 304.886, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1880.4, 8785.9, 190.191, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1807.2, 8865.5, 211.455, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1713.4, 9027.8, 247.650, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1693.4, 8847.5, 228.371, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 807.7, 9405.5, 327.096, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 911.3, 9301.3, 333.946, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 972.3, 8928.5, 136.938, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1080.4, 8856.3, 117.414, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1188.9, 8789.9, 225.007, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 123.5, 7944.9, 111.998, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 180.0, 8056.2, 260.164, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008551, 1758.9, 9149.5, 248.183, 1852008551)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852269164, 2179.0, 12909.6, 212.471, 1852269164)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852269164, 1616.3, 12967.4, 164.954, 1852269164)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852269164, 1863.4, 12883.6, 325.304, 1852269164)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852139386, 2253.1, 13126.7, 339.136, 1852139386)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852139386, 2078.7, 13165.9, 114.712, 1852139386)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852139386, 1742.0, 13166.3, 300.123, 1852139386)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852139386, 1578.9, 13238.5, 86.179, 1852139386)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1851946861, 2537.5, 10957.5, 276.381, 1851946861)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1315070563, -(8197.8), 7856.1, 279.270, 1315070563)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1332766568, 1450.9, 9420.6, 273.909, 1332766568)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 863.3, 11339.1, 239.185, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 640.8, 11575.5, 239.185, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 617.0, 11820.6, 239.185, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 764.4, 11772.9, 239.185, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1096.2, 12071.2, 233.685, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1294.8, 11918.9, 159.824, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 995.3, 11351.8, 200.309, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 840.4, 11483.9, 9.844, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1147.2, 11906.1, 133.353, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1273.4, 12065.6, 206.786, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 529.2, 11697.5, 349.200, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1852008562, 1032.3, 11510.9, 166.195, 1852008562)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1851941995, 2326.1, 10879.9, 94.364, 1851941995)
	__wurst_safe_BlzCreateUnitWithSkin(p12, 1851941995, 2790.7, 10919.0, 319.437, 1851941995)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer18(__wurst_stackPos278) 
	local p13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos278
	wurst_stack_depth = (wurst_stack_depth + 1)
	p13 = Player(18)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1700885605, -(8352.0), 7456.0, 270.000, 1700885605)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1697656885, -(7232.0), 8512.0, 270.000, 1697656885)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1701670775, -(8160.0), 8544.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1701670775, -(8160.0), 8288.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1702130288, -(7200.0), 8096.0, 270.000, 1702130288)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1702130288, -(7136.0), 7584.0, 270.000, 1702130288)
	__wurst_safe_BlzCreateUnitWithSkin(p13, 1701080947, -(6848.0), 9536.0, 270.000, 1701080947)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostileBuildings(__wurst_stackPos279) 
	local p14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos279
	wurst_stack_depth = (wurst_stack_depth + 1)
	p14 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	gg_unit_h002_0005 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988530, 2043.1, 16049.5, 270.000, 1747988530)
	gg_unit_h004_0006 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988532, 3790.1, 16592.5, 270.000, 1747988532)
	gg_unit_h00T_0007 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988564, 5201.0, 21647.2, 270.000, 1747988564)
	gg_unit_h001_0008 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988529, -(2054.5), 17548.8, 270.000, 1747988529)
	gg_unit_h00A_0009 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988545, -(1627.2), 24241.2, 270.000, 1747988545)
	gg_unit_h00D_0010 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988548, -(3666.6), 14393.4, 270.000, 1747988548)
	gg_unit_h008_0011 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988536, 3767.3, 24074.8, 270.000, 1747988536)
	gg_unit_h00B_0012 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988546, -(2764.2), 21793.9, 270.000, 1747988546)
	gg_unit_h00E_0013 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988549, -(5198.1), 17582.0, 270.000, 1747988549)
	gg_unit_h009_0014 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988537, 1238.7, 25400.3, 270.000, 1747988537)
	gg_unit_h006_0015 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988534, 3134.0, 21074.3, 270.000, 1747988534)
	gg_unit_h003_0016 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988531, -(785.8), 15707.1, 270.000, 1747988531)
	gg_unit_h005_0017 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988533, 4807.8, 19519.2, 270.000, 1747988533)
	gg_unit_h007_0018 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988535, 1957.2, 23602.8, 270.000, 1747988535)
	gg_unit_h00O_0019 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988559, -(2242.8), 10951.6, 270.000, 1747988559)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852207665, 3328.0, 16576.0, 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852207666, 4224.0, 16704.0, 270.000, 1852207666)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852207665, 3328.0, 18048.0, 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663601, -(864.0), 24224.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663601, -(2208.0), 24288.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663601, -(2336.0), 24096.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663600, -(2400.0), 23712.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663600, -(2144.0), 23712.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663600, -(1184.0), 24352.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663600, -(2592.0), 23968.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852663600, -(2144.0), 23392.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1853122608, 1536.0, 23680.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1853122608, 2176.0, 23552.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852076661, 4096.0, 24448.0, 270.000, 1852076661)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852006768, -(5536.0), 18080.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1853122609, 5024.0, 20064.0, 270.000, 1853122609)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1853122608, 4544.0, 20096.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852006768, -(4896.0), 18208.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852006775, -(3200.0), 14528.0, 270.000, 1852006775)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852011628, -(4096.0), 14208.0, 270.000, 1852011628)
	gg_unit_h00I_0135 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988553, -(2423.8), 7874.8, 270.000, 1747988553)
	gg_unit_h00M_0136 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988557, -(5708.5), 11743.7, 270.000, 1747988557)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852009847, -(4128.0), 13792.0, 270.000, 1852009847)
	gg_unit_h00F_0163 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988550, -(10812.8), 10843.1, 270.000, 1747988550)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852009847, -(4448.0), 14304.0, 270.000, 1852009847)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852006768, -(4384.0), 14560.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852006768, -(3488.0), 14880.0, 270.000, 1852006768)
	gg_unit_h00C_0174 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988547, -(7778.2), 7822.0, 270.000, 1747988547)
	gg_unit_h00U_0175 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988565, 1720.8, 10287.2, 270.000, 1747988565)
	gg_unit_h00K_0176 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988555, -(5186.3), 9785.8, 270.000, 1747988555)
	gg_unit_h00J_0177 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988554, -(9994.0), 9485.2, 270.000, 1747988554)
	gg_unit_h00P_0178 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988560, -(1461.7), 13433.8, 270.000, 1747988560)
	gg_unit_h00S_0179 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988563, 1183.1, 7094.8, 270.000, 1747988563)
	gg_unit_h00H_0183 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988552, -(6601.3), 9382.6, 270.000, 1747988552)
	gg_unit_h00L_0184 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988556, -(8085.1), 10076.2, 270.000, 1747988556)
	gg_unit_h00G_0185 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988551, -(11701.8), 9545.5, 270.000, 1747988551)
	gg_unit_h00R_0196 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988562, 1069.2, 11646.9, 270.000, 1747988562)
	gg_unit_h00Q_0197 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988561, 1917.4, 13090.1, 270.000, 1747988561)
	gg_unit_h00N_0200 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988558, 54.1, 10226.1, 270.000, 1747988558)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852009847, -(7392.0), 10656.0, 270.000, 1852009847)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852006768, -(6816.0), 10080.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852011628, -(5120.0), 11520.0, 270.000, 1852011628)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852006768, -(5408.0), 11232.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852207666, -(512.0), 8896.0, 270.000, 1852207666)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1852207665, -(896.0), 9024.0, 270.000, 1852207665)
	gg_unit_h000_0407 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1747988528, 1546.5, 18490.7, 270.000, 1747988528)
	gg_unit_cp00_0425 = __wurst_safe_BlzCreateUnitWithSkin(p14, 1668296752, -(6226.7), 6887.4, 270.000, 1668296752)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostile(__wurst_stackPos280) 
	local p15 = nil
	local u18 = nil
	local t = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos280
	wurst_stack_depth = (wurst_stack_depth + 1)
	p15 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	u18 = nil
	t = nil
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207724, 3547.0, 17990.4, 276.937, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207724, 3171.4, 17736.4, 345.886, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207731, 3461.6, 17743.1, 123.208, 1852207731)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059186, -(698.1), 15809.5, 45.652, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059186, -(630.9), 15745.7, 37.961, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853056884, -(724.8), 15948.8, 20.181, 1853056884)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125236, 752.7, 15437.6, 54.470, 1853125236)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060200, -(3951.2), 14793.2, 105.934, 1853060200)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(5326.9), 17685.1, 70.295, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(3837.3), 19729.3, 166.584, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(3987.5), 19573.8, 137.695, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(4996.6), 17507.0, 99.296, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(4123.8), 19532.3, 104.475, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(3882.2), 19867.3, 191.766, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(4010.1), 19729.0, 148.868, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320295, -(2215.5), 17326.7, 30.504, 1853320295)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320308, -(862.5), 18846.5, 221.719, 1853320308)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320308, -(797.1), 18750.3, 215.273, 1853320308)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207713, 3607.2, 16191.4, 84.573, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000038_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207724, 3726.7, 16407.2, 82.999, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207724, 3576.1, 16479.6, 42.384, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207724, 3943.7, 16433.0, 147.349, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207717, 4047.8, 16575.1, 195.989, 1852207717)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270642, 2121.8, 15996.0, 143.210, 1852270642)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000043_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270641, 1888.5, 16089.0, 179.640, 1852270641)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270641, 1925.2, 15856.2, 110.290, 1852270641)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270641, 2188.1, 16254.1, 153.900, 1852270641)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1848651824, 422.5, -(52.9), 184.565, 1848651824)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1848651826, 5154.2, 21381.0, 326.520, 1848651826)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125235, 524.2, 15166.0, 31.928, 1853125235)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125235, 626.6, 15115.1, 79.127, 1853125235)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125235, 843.3, 15349.5, 40.610, 1853125235)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852662375, -(1933.6), 23799.9, 64.932, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852662375, -(1753.1), 23778.5, 121.334, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852662375, -(2064.0), 23952.7, 314.984, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852662375, -(2003.8), 24140.9, 309.917, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852662375, -(1624.7), 23872.9, 154.000, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852662375, -(1689.4), 24200.1, 238.030, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852662375, -(1867.5), 24208.6, 257.251, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852340580, 1431.5, 25397.3, 200.087, 1852340580)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000080_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666999, -(1563.2), 23947.3, 186.648, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666999, -(1591.2), 24115.3, 205.128, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666723, -(1487.9), 24031.3, 184.270, 1852666723)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000077_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853056872, 1154.8, 25799.5, 271.491, 1853056872)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853056872, 1203.8, 25050.1, 77.603, 1853056872)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852340580, 964.5, 25675.1, 271.744, 1852340580)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852340580, 928.3, 25210.0, 98.638, 1852340580)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852599148, -(10529.4), 8084.6, 92.035, 1852599148)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852601198, -(10293.0), 8172.0, 153.416, 1852601198)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853318510, 2758.1, 22874.2, 242.161, 1853318510)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207728, 2802.6, 22698.5, 164.835, 1852207728)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207728, 2707.6, 22558.6, 96.867, 1852207728)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207203, 1818.5, 23747.5, 260.600, 1852207203)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000090_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207220, 1764.0, 23330.2, 88.849, 1852207220)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207220, 1789.6, 23579.7, 261.892, 1852207220)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207219, 2058.1, 23408.4, 175.542, 1852207219)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207219, 1557.9, 23541.6, 352.364, 1852207219)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320801, 2885.7, 22493.5, 125.320, 1853320801)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000097_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 4900.5, 21637.4, 284.950, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 4947.2, 21584.4, 133.894, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 4991.0, 21639.5, 341.619, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 5025.5, 21698.5, 38.442, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 4923.9, 21729.4, 280.654, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 5261.6, 21483.7, 266.196, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 5339.8, 21456.6, 332.973, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 5316.8, 21555.5, 347.146, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852008242, 5399.3, 21563.6, 297.460, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1316252014, 5024.0, 21516.2, 18.400, 1316252014)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000003_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1848651826, 4749.7, 21508.9, 280.650, 1848651826)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1848651826, 5010.6, 21875.8, 325.120, 1848651826)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1851876471, 3648.4, 24134.3, 223.727, 1851876471)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1851876471, 3532.9, 24270.9, 240.700, 1851876471)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1851876471, 3777.2, 24005.4, 202.447, 1851876471)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1851876466, 3844.8, 24200.3, 232.760, 1851876466)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u18, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000116_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1851876459, 3970.0, 24084.2, 193.369, 1851876459)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1851876459, 3699.7, 24421.6, 256.144, 1851876459)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320292, -(1022.1), 18915.0, 248.167, 1853320292)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320295, -(2226.6), 17160.2, 74.291, 1853320295)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320308, -(1282.8), 18852.5, 295.913, 1853320308)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320308, -(1218.6), 18939.2, 293.176, 1853320308)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320295, -(2407.3), 17351.3, 2.949, 1853320295)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852404840, 4621.8, 19915.2, 265.540, 1852404840)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852404855, 4808.5, 20103.9, 264.118, 1852404855)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852404852, 4626.4, 19796.2, 271.836, 1852404852)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852404852, 4969.3, 19861.1, 266.265, 1852404852)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852404852, 4802.8, 19770.0, 261.087, 1852404852)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853058158, -(3035.1), 22030.3, 246.640, 1853058158)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853058150, -(3232.3), 22093.6, 160.043, 1853058150)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853058150, -(3055.9), 22218.3, 354.759, 1853058150)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853058150, -(2822.1), 22161.4, 337.313, 1853058150)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853058150, -(3225.3), 21926.2, 253.418, 1853058150)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853058150, -(2797.6), 22031.2, 180.379, 1853058150)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(3833.0), 14638.6, 101.876, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(5057.3), 17701.7, 94.733, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(5190.9), 17783.4, 93.685, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(5263.7), 17415.5, 96.945, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(4059.3), 14649.0, 94.506, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(3732.5), 14798.5, 87.511, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(5471.7), 17520.1, 44.658, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(5025.3), 18031.8, 256.692, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(4179.1), 14785.4, 140.684, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(5278.8), 18075.3, 147.386, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(3931.4), 14948.8, 35.519, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(3948.7), 14524.9, 116.712, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(3655.9), 14687.9, 103.805, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(5142.2), 18080.9, 310.082, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055348, -(5390.0), 17962.6, 72.787, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270642, -(4274.7), 20728.0, 286.753, 1852270642)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270642, -(4493.1), 20655.4, 306.762, 1852270642)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270642, -(4548.8), 20504.4, 343.566, 1852270642)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853056884, -(593.5), 15615.8, 38.455, 1853056884)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059186, -(533.1), 15792.1, 37.961, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059186, -(597.4), 15858.4, 45.652, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059186, -(548.4), 16013.9, 45.652, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059186, -(419.1), 15726.6, 37.961, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1311780918, 820.3, 16223.1, 88.520, 1311780918)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125220, -(5169.7), 15689.2, 61.793, 1853125220)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125236, -(4928.7), 15707.0, 108.749, 1853125236)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125236, -(5350.9), 15866.7, 34.049, 1853125236)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666723, -(11935.3), 9716.7, 318.489, 1852666723)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666486, -(11876.1), 9943.2, 296.661, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666486, -(12037.8), 9887.2, 311.319, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666486, -(12167.1), 9714.1, 337.297, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666486, -(12173.2), 9587.3, 352.502, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666486, -(12028.2), 9489.9, 7.068, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666734, -(11786.5), 9791.0, 283.788, 1852666734)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666734, -(11900.1), 9573.4, 345.672, 1852666734)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666999, -(11790.3), 9654.0, 298.452, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666999, -(11629.4), 9726.6, 245.035, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666999, -(11850.8), 9469.5, 24.356, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666999, -(11869.8), 9318.0, 54.830, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666999, -(11439.8), 9736.5, 216.482, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853125220, -(11560.4), 8954.5, 53.920, 1853125220)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852467042, -(10298.9), 9814.3, 303.919, 1852467042)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852467042, -(10036.4), 9933.3, 278.130, 1852467042)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852466993, -(10248.2), 9691.0, 330.954, 1852466993)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852466993, -(10073.8), 9781.7, 312.043, 1852466993)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852466993, -(9851.3), 9770.5, 260.418, 1852466993)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852600950, -(10710.9), 10687.9, 151.012, 1852600950)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852076662, -(11024.4), 10814.4, 359.121, 1852076662)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852076662, -(10577.6), 10877.6, 127.665, 1852076662)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059702, -(10783.0), 11005.9, 141.882, 1853059702)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059702, -(10508.2), 11027.5, 311.032, 1853059702)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853059702, -(11019.9), 10983.4, 145.540, 1853059702)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852601198, -(10718.0), 8115.6, 74.173, 1852601198)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852597363, -(10376.6), 7799.8, 114.988, 1852597363)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852597363, -(10556.9), 7817.7, 86.108, 1852597363)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852597363, -(10224.8), 7943.2, 151.870, 1852597363)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666477, -(9739.1), 11871.6, 261.759, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666477, -(9916.1), 11840.3, 286.329, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666477, -(10072.3), 11810.3, 306.749, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666477, -(9949.4), 11713.4, 299.124, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852666477, -(9799.5), 11758.7, 269.768, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320292, -(8814.1), 8901.5, 169.496, 1853320292)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320292, -(8756.6), 9067.6, 179.402, 1853320292)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853320295, -(8854.2), 8765.3, 154.633, 1853320295)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207713, -(936.5), 8794.8, 324.424, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060215, -(3325.0), 9599.6, 273.158, 1853060215)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853122668, -(3560.4), 9462.5, 297.033, 1853122668)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853122668, -(3161.4), 9386.0, 206.902, 1853122668)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060200, -(5503.0), 11603.3, 230.714, 1853060200)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060200, -(5835.3), 11435.1, 241.856, 1853060200)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(5858.1), 11655.2, 253.218, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(5701.3), 11561.8, 239.774, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(5563.7), 11406.0, 246.106, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(5852.3), 11814.4, 251.068, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(5605.8), 11863.2, 243.740, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(5394.9), 11748.6, 214.145, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(7247.7), 10088.4, 30.273, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(7050.3), 10135.0, 47.477, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060204, -(7356.8), 10241.5, 8.636, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(7330.0), 10433.0, 6.534, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(7146.8), 10332.4, 20.556, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853060211, -(6908.7), 10257.1, 38.241, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852272246, -(5144.6), 7654.7, 321.361, 1852272246)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852272247, -(5345.7), 7666.5, 334.423, 1852272247)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852272247, -(5284.6), 7828.5, 316.372, 1852272247)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852272247, -(5094.7), 7868.0, 296.714, 1852272247)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852272226, -(5227.7), 7554.3, 342.382, 1852272226)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852272226, -(5002.6), 7741.3, 292.185, 1852272226)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852798827, 1251.6, 7315.2, 225.237, 1852798827)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852798827, 1550.6, 7094.4, 223.608, 1852798827)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852798821, 1060.6, 7195.9, 218.629, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852798821, 1331.1, 7145.9, 219.766, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852798821, 1349.1, 6950.2, 224.981, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207713, -(711.7), 8844.7, 236.093, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207713, -(911.2), 8629.7, 18.359, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207713, -(389.4), 8507.4, 173.740, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207719, -(685.0), 8649.7, 308.571, 1852207719)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207719, -(845.5), 8463.8, 311.505, 1852207719)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207717, -(494.5), 8681.6, 261.084, 1852207717)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207713, -(2356.0), 6975.8, 39.641, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207713, -(2153.3), 6854.3, 48.919, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852207717, -(2322.8), 6807.4, 48.432, 1852207717)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055597, -(7673.4), 9546.4, 145.353, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055597, -(7908.0), 9633.1, 118.470, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055597, -(2041.0), 8826.2, 141.795, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055597, -(2302.7), 8802.4, 104.083, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055597, -(1992.1), 9044.7, 184.191, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1853055597, -(7957.1), 9401.0, 119.808, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852798821, -(1663.6), 6484.8, 22.995, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852798821, -(1563.7), 6665.6, 331.113, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270450, 231.7, 10116.9, 147.531, 1852270450)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270450, 270.3, 10530.2, 226.933, 1852270450)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852270450, -(78.7), 9939.9, 96.375, 1852270450)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852273524, -(20.1), 10405.6, 167.877, 1852273524)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852273524, -(211.7), 10157.7, 148.748, 1852273524)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852273252, -(1531.4), 13530.0, 295.646, 1852273252)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852269675, -(1748.2), 13290.4, 320.206, 1852269675)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852269675, -(1450.9), 13299.6, 309.601, 1852269675)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852269675, -(1216.0), 13390.2, 272.132, 1852269675)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852273271, -(1249.6), 13220.2, 277.941, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852273271, -(1683.8), 13109.1, 114.170, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852273271, -(1344.8), 13631.1, 280.580, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	u18 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1852273271, -(1767.8), 13579.1, 307.387, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u18, 200.0)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassiveBuildings(__wurst_stackPos281) 
	local p16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos281
	wurst_stack_depth = (wurst_stack_depth + 1)
	p16 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p16, 1852206952, 1408.0, 25664.0, 270.000, 1852206952)
	__wurst_safe_BlzCreateUnitWithSkin(p16, 1851942508, 1536.0, 7360.0, 270.000, 1851942508)
	__wurst_safe_BlzCreateUnitWithSkin(p16, 1852268900, 2560.0, 13312.0, 270.000, 1852268900)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos282) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos282
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateBuildingsForPlayer0("when calling CreateBuildingsForPlayer0 in war3map, line 1155")
	CreateBuildingsForPlayer1("when calling CreateBuildingsForPlayer1 in war3map, line 1156")
	CreateBuildingsForPlayer5("when calling CreateBuildingsForPlayer5 in war3map, line 1157")
	CreateBuildingsForPlayer18("when calling CreateBuildingsForPlayer18 in war3map, line 1158")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos283) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos283
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 1163")
	CreateUnitsForPlayer5("when calling CreateUnitsForPlayer5 in war3map, line 1164")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos284) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos284
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateNeutralHostileBuildings("when calling CreateNeutralHostileBuildings in war3map, line 1169")
	CreateNeutralPassiveBuildings("when calling CreateNeutralPassiveBuildings in war3map, line 1170")
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 1171")
	CreateNeutralHostile("when calling CreateNeutralHostile in war3map, line 1172")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 1173")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateRegions(__wurst_stackPos285) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos285
	wurst_stack_depth = (wurst_stack_depth + 1)
	Rect(-(4960.0), -(6336.0), -(4512.0), -(5984.0))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_Other_Actions(__wurst_stackPos286) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos286
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_townHall = gg_unit_etol_0001
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitTrig_Other(__wurst_stackPos287) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos287
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_Other = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_Other, function (...) 
			xpcall(function (...) 
					bridge_Trig_Other_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_ControlPointInitialVariables_Actions(__wurst_stackPos288) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos288
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_mountHyjal = gg_unit_h000_0407
	udg_mountHyjalGrove = gg_unit_h001_0008
	udg_mountHyjalCrypt = gg_unit_h002_0005
	udg_mountHyjalTown = gg_unit_h003_0016
	udg_winterspringSouth = gg_unit_h004_0006
	udg_winterspringCenter = gg_unit_h005_0017
	udg_winterspringNorth = gg_unit_h006_0015
	udg_winterspringFactory = gg_unit_h00T_0007
	udg_winterspringDen = gg_unit_h007_0018
	udg_winterspringRoost = gg_unit_h008_0011
	udg_moongladeEast = gg_unit_h009_0014
	udg_moongladeWest = gg_unit_h00A_0009
	udg_felwoodNorth = gg_unit_h00B_0012
	udg_felwoodCenter = gg_unit_h00E_0013
	udg_felwoodSouth = gg_unit_h00D_0010
	udg_ashenvaleAstranaar = gg_unit_h00C_0174
	udg_ashenvaleBeachNorth = gg_unit_h00F_0163
	udg_ashenvaleBeachSouth = gg_unit_h00G_0185
	udg_ashenvaleChimaerasFall = gg_unit_h00O_0019
	udg_ashenvaleChimaerasRest = gg_unit_h00H_0183
	udg_ashenvaleCrossing = gg_unit_h00I_0135
	udg_ashenvaleForestCenter = gg_unit_h00L_0184
	udg_ashenvaleForestEast = gg_unit_h00K_0176
	udg_ashenvaleForestNorth = gg_unit_h00M_0136
	udg_ashenvaleForestSouth = gg_unit_cp00_0425
	udg_ashenvaleForestWest = gg_unit_h00J_0177
	udg_ashenvaleGraniteDen = gg_unit_h00N_0200
	udg_ashenvaleRoost = gg_unit_h00P_0178
	udg_ashenvaleVentureCo = gg_unit_h00Q_0197
	udg_ashenvaleWarsongSouth = gg_unit_h00S_0179
	udg_ashenvaleWarsongCenter = gg_unit_h00U_0175
	udg_ashenvaleWarsongNorth = gg_unit_h00R_0196
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitTrig_ControlPointInitialVariables(__wurst_stackPos289) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos289
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_ControlPointInitialVariables = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_ControlPointInitialVariables, function (...) 
			xpcall(function (...) 
					bridge_Trig_ControlPointInitialVariables_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomTriggers(__wurst_stackPos290) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos290
	wurst_stack_depth = (wurst_stack_depth + 1)
	InitTrig_Other("when calling InitTrig_Other in war3map, line 1254")
	InitTrig_ControlPointInitialVariables("when calling InitTrig_ControlPointInitialVariables in war3map, line 1255")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function RunInitializationTriggers(__wurst_stackPos291) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos291
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_ConditionalTriggerExecute(gg_trg_Other)
	__wurst_safe_ConditionalTriggerExecute(gg_trg_ControlPointInitialVariables)
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
	udg_mountHyjal = nil
	udg_mountHyjalGrove = nil
	udg_mountHyjalTown = nil
	udg_mountHyjalCrypt = nil
	udg_winterspringCenter = nil
	udg_winterspringNorth = nil
	udg_winterspringSouth = nil
	udg_winterspringDen = nil
	udg_winterspringRoost = nil
	udg_moongladeWest = nil
	udg_moongladeEast = nil
	udg_felwoodNorth = nil
	udg_felwoodCenter = nil
	udg_felwoodSouth = nil
	udg_ashenvaleChimaerasFall = nil
	udg_ashenvaleAstranaar = nil
	udg_ashenvaleForestEast = nil
	udg_ashenvaleCrossing = nil
	udg_ashenvaleChimaerasRest = nil
	udg_ashenvaleBeachNorth = nil
	udg_ashenvaleForestWest = nil
	udg_ashenvaleForestCenter = nil
	udg_ashenvaleGraniteDen = nil
	udg_ashenvaleWarsongSouth = nil
	udg_ashenvaleWarsongNorth = nil
	udg_ashenvaleVentureCo = nil
	udg_ashenvaleRoost = nil
	udg_ashenvaleBeachSouth = nil
	udg_ashenvaleForestNorth = nil
	udg_winterspringFactory = nil
	udg_ashenvaleForestSouth = nil
	udg_ashenvaleWarsongCenter = nil
	gg_trg_Other = nil
	gg_trg_ControlPointInitialVariables = nil
	gg_unit_h00O_0019 = nil
	gg_unit_h007_0018 = nil
	gg_unit_h002_0005 = nil
	gg_unit_h006_0015 = nil
	gg_unit_h008_0011 = nil
	gg_unit_h003_0016 = nil
	gg_unit_h00B_0012 = nil
	gg_unit_h004_0006 = nil
	gg_unit_h00E_0013 = nil
	gg_unit_h009_0014 = nil
	gg_unit_h005_0017 = nil
	gg_unit_h00T_0007 = nil
	gg_unit_h00A_0009 = nil
	gg_unit_h001_0008 = nil
	gg_unit_h000_0407 = nil
	gg_unit_etol_0001 = nil
	gg_unit_cp00_0425 = nil
	gg_unit_h00L_0184 = nil
	gg_unit_h00G_0185 = nil
	gg_unit_h00P_0178 = nil
	gg_unit_h00H_0183 = nil
	gg_unit_h00N_0200 = nil
	gg_unit_h00M_0136 = nil
	gg_unit_h00F_0163 = nil
	gg_unit_h00Q_0197 = nil
	gg_unit_h00I_0135 = nil
	gg_unit_h00D_0010 = nil
	gg_unit_h00J_0177 = nil
	gg_unit_h00C_0174 = nil
	gg_unit_h00U_0175 = nil
	gg_unit_h00R_0196 = nil
	gg_unit_h00S_0179 = nil
	gg_unit_h00K_0176 = nil
	Abilities_tranquility = ""
	Angle_DEGTORAD = 0.
	Angle_RADTODEG = 0.
	Basics_ANIMATION_PERIOD = 0.
	Basics_HEIGHT_ENABLER = 0
	Basics_DUMMY_PLAYER = nil
	BitSet_BITSET_SIZE = 0
	BitSet_pows = defaultArray(function () 
			return 0
		end)
	Bloom_HEALING_CLOUD_ID = 0
	Bloom_CLOUD_UNIT_ID = 0
	Bloom_HEAL_INTERVAL = 0.
	Bloom_CLOUD_RADIUS = defaultArray(function () 
			return 0.
		end)
	Bloom_CLOUD_HEAL = defaultArray(function () 
			return 0.
		end)
	Bloom_CLOUD_DURATION = defaultArray(function () 
			return 0.
		end)
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
	ControlPoint_cpOwners = nil
	ControlPoint_cpValues = nil
	ControlPoint_playerIncome = defaultArray(function () 
			return 0
		end)
	ControlPoint_playerCpCount = defaultArray(function () 
			return 0
		end)
	CorruptedBlood_CORRUPTED_BLOOD_ID = 0
	CorruptedBlood_SLIME_UNIT_ID = 0
	CorruptedBlood_SLIME_LIFETIME = 0.
	CorruptedBlood_SLIME_SPEED = 0.
	CorruptedBlood_SLIME_PROXIMITY = 0.
	CorruptedBlood_GROW_DURATION = 0.
	CorruptedBlood_EXPLODE_RADIUS = 0.
	CorruptedBlood_EXPLODE_DAMAGE = 0.
	CorruptedBlood_UPDATE_INTERVAL = 0.
	CorruptedBlood_GROW_SFX = ""
	CorruptedBlood_EXPLODE_SFX = ""
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
	Isolation_ISOLATION_BUFF_ID = 0
	Isolation_ISOLATION_DAMAGE = 0.
	Isolation_ISOLATION_PERIOD = 0.
	MagicFunctions_compiletime = false
	MapBounds_playableMapRect = nil
	MapBounds_boundRect = nil
	MapBounds_boundRegion = nil
	MapBounds_playableMin = ({0., 0., })
	MapBounds_playableMax = ({0., 0., })
	MapBounds_boundMin = ({0., 0., })
	MapBounds_boundMax = ({0., 0., })
	Nightmare_NIGHTMARE_ID = 0
	Nightmare_NIGHTMARE_BUFF_ID = 0
	Nightmare_NIGHTMARE_RADIUS = 0.
	Nightmare_NIGHTMARE_DURATION = 0.
	Nightmare_CORRUPT_SFX = ""
	Nightmare_NIGHTMARE_SFX = ""
	Nightmare_sleepingUnits = nil
	OnUnitEnterLeave_eventTrigger = nil
	OnUnitEnterLeave_preplacedUnits = nil
	OnUnitEnterLeave_tempUnits = defaultArray(function () 
			return nil
		end)
	OnUnitEnterLeave_tempUnitsCount = 0
	OnUnitEnterLeave_ABILITY_ID = 0
	OrderIds_rejuvination = 0
	OrderIds_sleep = 0
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
	Scoreboard_playerColors = defaultArray(function () 
			return ({0, 0, 0, 0, })
		end)
	Scoreboard_incomeBoard = nil
	SeedBurst_SEED_BURST_ID = 0
	SeedBurst_BURST_DAMAGE = defaultArray(function () 
			return 0.
		end)
	SeedBurst_BURST_RADIUS = defaultArray(function () 
			return 0.
		end)
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
	SummonTreant_TREANT_DURATION = defaultArray(function () 
			return 0.
		end)
	SummonTreant_BONUS_TREANTS = defaultArray(function () 
			return 0
		end)
	Table_ht = nil
	ThrowExplosives_THROW_EXPLOSIVES_ID = 0
	ThrowExplosives_BARREL_UNIT_ID = 0
	ThrowExplosives_FUSE_DURATION = 0.
	ThrowExplosives_EXPLODE_RADIUS = 0.
	ThrowExplosives_EXPLODE_DAMAGE = 0.
	ThrowExplosives_FUSE_SFX = ""
	ThrowExplosives_EXPLODE_SFX = ""
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
	XaviusMain_XAVIUS_ID = 0
	winLoss_footmen = nil
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
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
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
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Bloom.call = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Bloom.__wurst_supertypes = ({[CallbackSingle_doAfter_Bloom] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_Bloom.__typeId__ = 10
	OnCastListener_onCast_Bloom.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.__wurst_supertypes = ({[OnCastListener_onCast_Bloom] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Bloom.__typeId__ = 48
	OnCastListener_onCast_CenariusCharacter.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter.__typeId__ = 49
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_call = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
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
	CallbackSingle_nullTimer_ClosureEvents.__typeId__ = 23
	EventListener.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener.destroyEventListener = EventListener_destroyEventListener
	EventListener.__wurst_supertypes = ({[EventListener] = true, })
	EventListener.__typeId__ = 30
	OnCastListener.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.__wurst_supertypes = ({[OnCastListener] = true, })
	OnCastListener.__typeId__ = 47
	ForGroupCallback.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.__wurst_supertypes = ({[ForGroupCallback] = true, })
	ForGroupCallback.__typeId__ = 38
	ForGroupCallbackUntil.__wurst_supertypes = ({[ForGroupCallbackUntil] = true, })
	ForGroupCallbackUntil.__typeId__ = 40
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
	CallbackSingle.__typeId__ = 9
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_call = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_ControlPoint_call = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_ControlPoint_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_ControlPoint_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_ControlPoint.call = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_ControlPoint.__wurst_supertypes = ({[CallbackSingle_doAfter_ControlPoint] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_ControlPoint.__typeId__ = 11
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_call = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_CorruptedBlood_call = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_CorruptedBlood_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_CorruptedBlood_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_CorruptedBlood.call = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_CorruptedBlood.__wurst_supertypes = ({[CallbackSingle_doAfter_CorruptedBlood] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_CorruptedBlood.__typeId__ = 12
	OnCastListener_onCast_CorruptedBlood.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CorruptedBlood.OnCastListener_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_CorruptedBlood_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CorruptedBlood.fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.__wurst_supertypes = ({[OnCastListener_onCast_CorruptedBlood] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CorruptedBlood.__typeId__ = 50
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_CorruptedBlood] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.__typeId__ = 4
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_call = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_call = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CorruptedBlood.call = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CorruptedBlood.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_CorruptedBlood] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_CorruptedBlood.__typeId__ = 16
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_Nightmare_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.__wurst_supertypes = ({[EventListener_add_DamageEvent] = true, [EventListener] = true, })
	EventListener_add_DamageEvent.__typeId__ = 31
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_Nightmare_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.__wurst_supertypes = ({[EventListener_add_DamageEvent1] = true, [EventListener] = true, })
	EventListener_add_DamageEvent1.__typeId__ = 32
	DamageElement.__wurst_supertypes = ({[DamageElement] = true, })
	DamageElement.__typeId__ = 26
	DamageInstance.DamageInstance_DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.DamageInstance_destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.__wurst_supertypes = ({[DamageInstance] = true, })
	DamageInstance.__typeId__ = 27
	DamageListener.__wurst_supertypes = ({[DamageListener] = true, })
	DamageListener.__typeId__ = 28
	ForForceCallback.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.__wurst_supertypes = ({[ForForceCallback] = true, })
	ForForceCallback.__typeId__ = 36
	ForForceCallback_execute_GroupUtils.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.ForForceCallback_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.__wurst_supertypes = ({[ForForceCallback_execute_GroupUtils] = true, [ForForceCallback] = true, })
	ForForceCallback_execute_GroupUtils.__typeId__ = 37
	GroupIterator.GroupIterator_destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.__wurst_supertypes = ({[GroupIterator] = true, })
	GroupIterator.__typeId__ = 41
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
	HashMap.__typeId__ = 59
	EventListener_add_HeroTrainer.EventListener_add_DamageEvent_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_Nightmare_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_Recycle_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.EventListener_onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.__wurst_supertypes = ({[EventListener_add_HeroTrainer] = true, [EventListener] = true, })
	EventListener_add_HeroTrainer.__typeId__ = 33
	OnCastListener_onCast_Hibernate.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.OnCastListener_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Hibernate_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.__wurst_supertypes = ({[OnCastListener_onCast_Hibernate] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Hibernate.__typeId__ = 51
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_Hibernate] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_Hibernate.__typeId__ = 5
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_call = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_call = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Hibernate.call = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Hibernate.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_Hibernate] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_Hibernate.__typeId__ = 17
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_call = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_call = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_InitFocusCamera_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_InitFocusCamera.call = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_InitFocusCamera.__wurst_supertypes = ({[CallbackSingle_doAfter_InitFocusCamera] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_InitFocusCamera.__typeId__ = 13
	CallbackSingle_doAfter_Invigorate.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.CallbackSingle_call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_Invigorate_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_Invigorate.call = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_Invigorate.__wurst_supertypes = ({[CallbackSingle_doAfter_Invigorate] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_Invigorate.__typeId__ = 14
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Isolation_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Isolation_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Isolation.call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Isolation.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_Isolation] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_Isolation.__typeId__ = 3
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_call = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_doPeriodically_Isolation_call = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_doPeriodically_Isolation_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_doPeriodically_Isolation_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_doPeriodically_Isolation.call = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_doPeriodically_Isolation.__wurst_supertypes = ({[CallbackSingle_doAfter_doPeriodically_Isolation] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_doPeriodically_Isolation.__typeId__ = 15
	LLBackIterator.LLBackIterator_destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.__wurst_supertypes = ({[LLBackIterator] = true, })
	LLBackIterator.__typeId__ = 43
	LLEntry.LLEntry_destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.__wurst_supertypes = ({[LLEntry] = true, })
	LLEntry.__typeId__ = 44
	LLIterator.LLIterator_LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.LLIterator_destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.__wurst_supertypes = ({[LLIterator] = true, })
	LLIterator.__typeId__ = 45
	LinkedList.LinkedList_LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.LinkedList_LinkedList_has = LinkedList_LinkedList_has
	LinkedList.LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.LinkedList_has = LinkedList_LinkedList_has
	LinkedList.destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.__wurst_supertypes = ({[LinkedList] = true, })
	LinkedList.__typeId__ = 46
	OnCastListener_onCast_Nightmare.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Nightmare.OnCastListener_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Nightmare_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Nightmare.fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.__wurst_supertypes = ({[OnCastListener_onCast_Nightmare] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Nightmare.__typeId__ = 52
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_call = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_call = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Nightmare.call = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Nightmare.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_Nightmare] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_Nightmare.__typeId__ = 18
	EventListener_add_Nightmare.EventListener_add_DamageEvent_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_Nightmare_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Nightmare.EventListener_add_Nightmare_onEvent = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_Nightmare_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_Recycle_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Nightmare.EventListener_onEvent = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Nightmare.onEvent = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.__wurst_supertypes = ({[EventListener_add_Nightmare] = true, [EventListener] = true, })
	EventListener_add_Nightmare.__typeId__ = 34
	IdGenerator.__wurst_supertypes = ({[IdGenerator] = true, })
	IdGenerator.__typeId__ = 42
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
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
	CallbackSingle_nullTimer_OnUnitEnterLeave.__typeId__ = 24
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.__wurst_supertypes = ({[ForGroupCallback_forEachFrom_Preloader] = true, [ForGroupCallback] = true, })
	ForGroupCallback_forEachFrom_Preloader.__typeId__ = 39
	CallbackSingle_nullTimer_Preloader.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_nullTimer_Preloader.CallbackSingle_call = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
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
	CallbackSingle_nullTimer_Preloader.__typeId__ = 25
	EventListener_add_Recycle.EventListener_add_DamageEvent_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_Nightmare_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
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
	EventListener_add_Recycle.__typeId__ = 35
	OnCastListener_onCast_SeedBurst.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.__wurst_supertypes = ({[OnCastListener_onCast_SeedBurst] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SeedBurst.__typeId__ = 53
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_SeedBurst] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_SeedBurst.__typeId__ = 19
	Vec2Wrapper.Vec2Wrapper_destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.__wurst_supertypes = ({[Vec2Wrapper] = true, })
	Vec2Wrapper.__typeId__ = 61
	DamageListener_addListener_ShieldBash.DamageListener_addListener_ShieldBash_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.DamageListener_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.__wurst_supertypes = ({[DamageListener_addListener_ShieldBash] = true, [DamageListener] = true, })
	DamageListener_addListener_ShieldBash.__typeId__ = 29
	OnCastListener_onCast_SpiritWisps.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.OnCastListener_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SpiritWisps_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.__wurst_supertypes = ({[OnCastListener_onCast_SpiritWisps] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SpiritWisps.__typeId__ = 54
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_SpiritWisps] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.__typeId__ = 6
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_SpiritWisps1] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.__typeId__ = 7
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_call = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_call = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SpiritWisps.call = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SpiritWisps.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_SpiritWisps] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_SpiritWisps.__typeId__ = 20
	OnCastListener_onCast_SummonTreant.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SummonTreant.OnCastListener_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SummonTreant_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SummonTreant.fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.__wurst_supertypes = ({[OnCastListener_onCast_SummonTreant] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SummonTreant.__typeId__ = 55
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_call = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SummonTreant_call = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SummonTreant_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SummonTreant_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SummonTreant.call = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SummonTreant.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_SummonTreant] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_SummonTreant.__typeId__ = 21
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
	Table.__typeId__ = 58
	OnCastListener_onCast_ThrowExplosives.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_ThrowExplosives.OnCastListener_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_ThrowExplosives_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_ThrowExplosives.fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.__wurst_supertypes = ({[OnCastListener_onCast_ThrowExplosives] = true, [OnCastListener] = true, })
	OnCastListener_onCast_ThrowExplosives.__typeId__ = 56
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_ThrowExplosives] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.__typeId__ = 8
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_call = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_ThrowExplosives_call = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_ThrowExplosives_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_ThrowExplosives_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_ThrowExplosives.call = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_ThrowExplosives.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_ThrowExplosives] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_ThrowExplosives.__typeId__ = 22
	UnitIndex.UnitIndex_destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.__wurst_supertypes = ({[UnitIndex] = true, })
	UnitIndex.__typeId__ = 60
	UnitDefinition.__wurst_supertypes = ({[UnitDefinition] = true, [UnitOrHeroDefinition] = true, [UnitOrBuildingOrHeroDefinition] = true, [W3UDefinition] = true, })
	UnitDefinition.__typeId__ = 65
	UnitOrBuildingOrHeroDefinition.__wurst_supertypes = ({[UnitOrBuildingOrHeroDefinition] = true, [W3UDefinition] = true, })
	UnitOrBuildingOrHeroDefinition.__typeId__ = 63
	UnitOrHeroDefinition.__wurst_supertypes = ({[UnitOrHeroDefinition] = true, [UnitOrBuildingOrHeroDefinition] = true, [W3UDefinition] = true, })
	UnitOrHeroDefinition.__typeId__ = 64
	W3UDefinition.__wurst_supertypes = ({[W3UDefinition] = true, })
	W3UDefinition.__typeId__ = 62
	OnCastListener_onCast_UrsocCharge.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.OnCastListener_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_UrsocCharge_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.__wurst_supertypes = ({[OnCastListener_onCast_UrsocCharge] = true, [OnCastListener] = true, })
	OnCastListener_onCast_UrsocCharge.__typeId__ = 57
	initGlobals("when calling initGlobals")
	initCompiletimeState("when calling initCompiletimeState in blizzard, line 1")
	SetCameraBounds((-(26880.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(31232.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(26880.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(31232.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("AshenvaleDay")
	SetAmbientNightSound("AshenvaleNight")
	SetMapMusic("Music", true, 0)
	CreateRegions("when calling CreateRegions in war3map, line 1301")
	CreateAllUnits("when calling CreateAllUnits in war3map, line 1302")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 1304")
	InitCustomTriggers("when calling InitCustomTriggers in war3map, line 1305")
	RunInitializationTriggers("when calling RunInitializationTriggers in war3map, line 1306")
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
	  local __wurst_init_ok = xpcall(init_Bloom, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Bloom.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_BuffIds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package BuffIds.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_Scoreboard, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Scoreboard.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_ControlPoint, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ControlPoint.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_CorruptedBlood, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package CorruptedBlood.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_CustomIcons, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package CustomIcons.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_DamageEvent, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package DamageEvent.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_StringUtils, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package StringUtils.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Nightmare, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Nightmare.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Isolation, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Isolation.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_ThrowExplosives, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ThrowExplosives.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_XaviusMain, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package XaviusMain.", "<lua error>")
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

function init_Abilities(__wurst_stackPos293) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos293
	wurst_stack_depth = (wurst_stack_depth + 1)
	Abilities_tranquility = "Abilities\\Spells\\NightElf\\Tranquility\\Tranquility.mdx"
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityIds(__wurst_stackPos294) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos294
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityObjEditing(__wurst_stackPos326) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos326
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos298) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos298
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_DEGTORAD = 0.017453293
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this228, __wurst_stackPos370) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos370
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this228[1] * Angle_RADTODEG)
end

function angle_radians(this229, __wurst_stackPos371) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos371
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this229[1]
end

function real_fromDeg(this230, __wurst_stackPos372) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos372
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this230 * Angle_DEGTORAD), })
end

function real_asAngleRadians(this231, __wurst_stackPos373) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos373
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this231, })
end

function init_Basics(__wurst_stackPos306) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos306
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	Basics_HEIGHT_ENABLER = 1097691750
	Basics_DUMMY_PLAYER = Player_players[PLAYER_NEUTRAL_PASSIVE]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_BitSet(__wurst_stackPos297) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos297
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_BITSET_SIZE = 32
	initPows("when calling initPows in BitSet, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPows(__wurst_stackPos374) 
	local allPows = nil
	local i6 = nil
	local temp5 = nil
	local i7 = nil
	local temp6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos374
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_pows[0] = 1
	allPows = 1
	i6 = 1
	temp5 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i6 > temp5) then
			break
		end
		BitSet_pows[i6] = (intEnsure(BitSet_pows[(i6 - 1)]) * 2)
		allPows = int_bitOr(allPows, intEnsure(BitSet_pows[i6]), "when calling bitOr in BitSet, line 17")
		i6 = (i6 + 1)
	end
	i7 = 0
	temp6 = (BitSet_BITSET_SIZE - 1)
	while true do
		if (i7 > temp6) then
			break
		end
		int_bitXor(allPows, intEnsure(BitSet_pows[i7]), "when calling bitXor in BitSet, line 19")
		i7 = (i7 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Bloom(__wurst_stackPos341) 
	local clVar13 = nil
	local temp46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos341
	wurst_stack_depth = (wurst_stack_depth + 1)
	Bloom_HEALING_CLOUD_ID = intEnsure(1095577654)
	Bloom_CLOUD_UNIT_ID = 1701212014
	Bloom_HEAL_INTERVAL = 1.
	Bloom_CLOUD_RADIUS[0] = 256.
	Bloom_CLOUD_RADIUS[1] = 320.
	Bloom_CLOUD_RADIUS[2] = 384.
	Bloom_CLOUD_HEAL[0] = 20.
	Bloom_CLOUD_HEAL[1] = 35.
	Bloom_CLOUD_HEAL[2] = 50.
	Bloom_CLOUD_DURATION[0] = 10.
	Bloom_CLOUD_DURATION[1] = 13.
	Bloom_CLOUD_DURATION[2] = 16.
	temp46 = Bloom_HEALING_CLOUD_ID
	clVar13 = OnCastListener_onCast_Bloom:create2()
	OnCastListener_construct_OnCastListener(clVar13, "when calling construct_OnCastListener in Bloom, line 94")
	EventListener_onCast(temp46, clVar13, "when calling onCast in Bloom, line 94")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnCloud(owner, pos1, heal1, radius1, duration1, __wurst_stackPos19) 
	local cloud = nil
	local sfx2 = nil
	local healTimer2 = nil
	local clVar14 = nil
	local clVar15 = nil
	local temp47 = nil
	local temp48 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos19
	wurst_stack_depth = (wurst_stack_depth + 1)
	cloud = createUnit(owner, Bloom_CLOUD_UNIT_ID, pos1, ({0., }), "when calling createUnit in Bloom, line 70")
	unit_setInvulnerable(cloud, true, "when calling setInvulnerable in Bloom, line 71")
	unit_addAbility(cloud, 1097625443, "when calling addAbility in Bloom, line 72")
	unit_setPathing(cloud, false, "when calling setPathing in Bloom, line 73")
	unit_setAnimation(cloud, "stand 4", "when calling setAnimation in Bloom, line 74")
	unit_pause(cloud, "when calling pause in Bloom, line 75")
	sfx2 = widget_addEffect(cloud, Abilities_tranquility, "origin", "when calling addEffect in Bloom, line 77")
	effect_setScale(sfx2, 1., "when calling setScale in Bloom, line 78")
	effect_setColor(sfx2, 0, 255, 0, "when calling setColor in Bloom, line 79")
	temp47 = Bloom_HEAL_INTERVAL
	clVar14 = CallbackPeriodic_doPeriodically_Bloom:create()
	CallbackPeriodic_construct_CallbackPeriodic(clVar14, "when calling construct_CallbackPeriodic in Bloom, line 81")
	clVar14.pos = tupleCopy(pos1)
	clVar14.radius = radius1
	clVar14.owner = owner
	clVar14.heal = heal1
	healTimer2 = doPeriodically(temp47, clVar14, "when calling doPeriodically in Bloom, line 81")
	temp48 = duration1
	clVar15 = CallbackSingle_doAfter_Bloom:create1()
	CallbackSingle_construct_CallbackSingle(clVar15, "when calling construct_CallbackSingle in Bloom, line 88")
	clVar15.healTimer = healTimer2
	clVar15.cloud = cloud
	clVar15.sfx = sfx2
	doAfter(temp48, clVar15, "when calling doAfter in Bloom, line 88")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function boolean_toString(this161, __wurst_stackPos183) 
	local cond_result = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos183
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	if this161 then
		cond_result = "true"
	else
		cond_result = "false"
	end
	return cond_result
end

function init_BuffIds(__wurst_stackPos342) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos342
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CenariusCharacter(__wurst_stackPos346) 
	local clVar16 = nil
	local temp49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos346
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp49 = Invigorate_INVIGORATE_ID
	clVar16 = OnCastListener_onCast_CenariusCharacter:create3()
	OnCastListener_construct_OnCastListener(clVar16, "when calling construct_OnCastListener in CenariusCharacter, line 27")
	EventListener_onCast(temp49, clVar16, "when calling onCast in CenariusCharacter, line 27")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureEvents(__wurst_stackPos338) 
	local clVar17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos338
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
	clVar17 = CallbackSingle_nullTimer_ClosureEvents:create4()
	CallbackSingle_construct_CallbackSingle(clVar17, "when calling construct_CallbackSingle in ClosureEvents, line 306")
	nullTimer(clVar17, "when calling nullTimer in ClosureEvents, line 306")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function fireEvents(_u, __wurst_stackPos381) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos381
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function eventid_toIntId(this235, __wurst_stackPos382) 
	local id5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos382
	wurst_stack_depth = (wurst_stack_depth + 1)
	id5 = intEnsure(ClosureEvents_eventidToIndex[handle_getHandleId(this235, "when calling getHandleId in ClosureEvents, line 248")])
	if (id5 == 0) then
		id5 = registerEventId(this235, "when calling registerEventId in ClosureEvents, line 250")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return id5
end

function registerEventId(evnt, __wurst_stackPos384) 
	local eventId = nil
	local i8 = nil
	local temp7 = nil
	local receiver17 = nil
	local receiver18 = nil
	local receiver19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos384
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
		i8 = 0
		temp7 = (bj_MAX_PLAYERS - 1)
		while true do
			if (i8 > temp7) then
				break
			end
			receiver17 = ClosureEvents_keyTrig
			trigger_registerPlayerEvent(receiver17, Player_players[i8], EVENT_PLAYER_MOUSE_UP, "when calling registerPlayerEvent in ClosureEvents, line 273")
			receiver18 = receiver17
			trigger_registerPlayerEvent(receiver18, Player_players[i8], EVENT_PLAYER_MOUSE_DOWN, "when calling registerPlayerEvent in ClosureEvents, line 274")
			receiver19 = receiver18
			trigger_registerPlayerEvent(receiver19, Player_players[i8], EVENT_PLAYER_MOUSE_MOVE, "when calling registerPlayerEvent in ClosureEvents, line 275")
			i8 = (i8 + 1)
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureEvents_eventTypeCounter
end

function unregisterEventsForUnit(u19, __wurst_stackPos388) 
	local index3 = nil
	local listener5 = nil
	local t1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos388
	wurst_stack_depth = (wurst_stack_depth + 1)
	if fireEvents(u19, "when calling fireEvents in ClosureEvents, line 279") then
		index3 = unit_getIndex(u19, "when calling getIndex in ClosureEvents, line 280")
		unregisterEvents(index3, "when calling unregisterEvents in ClosureEvents, line 281")
		if not((EventListener_castMapCasters[index3] == nil)) then
			listener5 = EventListener_castMapCasters[index3]
			EventListener_castMapCasters[index3] = nil
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

function unregisterEvents(id6, __wurst_stackPos389) 
	local listener6 = nil
	local t2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos389
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

function code__onUnitDeindex_ClosureEvents(__wurst_stackPos391) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos391
	wurst_stack_depth = (wurst_stack_depth + 1)
	unregisterEventsForUnit(getIndexingUnit("when calling getIndexingUnit in ClosureEvents, line 304"), "when calling unregisterEventsForUnit in ClosureEvents, line 304")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents(__wurst_stackPos393) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos393
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 307")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents1(__wurst_stackPos395) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos395
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 308")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_ClosureEvents(__wurst_stackPos396) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos396
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_onSpellEffect("when calling onSpellEffect in ClosureEvents, line 323")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add(eventId1, listener7, __wurst_stackPos398) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos398
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

function EventListener_addSpellInternal(u20, abilId1, listener8, __wurst_stackPos399) 
	local index4 = nil
	local entry2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos399
	wurst_stack_depth = (wurst_stack_depth + 1)
	listener8.OnCastListener_abilId = abilId1
	if not((u20 == nil)) then
		listener8.OnCastListener_eventUnit = u20
		index4 = unit_getIndex(u20, "when calling getIndex in ClosureEvents, line 170")
		if not((EventListener_castMapCasters[index4] == nil)) then
			EventListener_castMapCasters[index4].OnCastListener_prev = listener8
			listener8.OnCastListener_next = EventListener_castMapCasters[index4]
		end
		EventListener_castMapCasters[index4] = listener8
	else
		entry2 = HashMap_HashMap_get(EventListener_castMap, abilId1, "when calling get in ClosureEvents, line 176")
		if not((entry2 == nil)) then
			entry2.OnCastListener_prev = listener8
			listener8.OnCastListener_next = entry2
		end
		HashMap_HashMap_put(EventListener_castMap, abilId1, listener8, "when calling put in ClosureEvents, line 181")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return listener8
end

function EventListener_onCast(abilId, listener4, __wurst_stackPos377) 
	local stackTrace_tempReturn7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos377
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = EventListener_addSpellInternal(nil, abilId, listener4, "when calling addSpellInternal in ClosureEvents, line 155")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function EventListener_generalEventCallback(__wurst_stackPos394) 
	local trigUnit8 = nil
	local id7 = nil
	local index5 = nil
	local listener9 = nil
	local nextListener = nil
	local globalListener = nil
	local nextListener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos394
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit8 = GetTriggerUnit()
	id7 = eventid_toIntId(GetTriggerEventId(), "when calling toIntId in ClosureEvents, line 186")
	if not((trigUnit8 == nil)) then
		index5 = unit_getIndex(trigUnit8, "when calling getIndex in ClosureEvents, line 189")
		if (index5 > 0) then
			listener9 = EventListener_unitListenersFirsts[index5]
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

function EventListener_onSpellEffect(__wurst_stackPos397) 
	local trigUnit9 = nil
	local abilId2 = nil
	local caster12 = nil
	local index6 = nil
	local listener10 = nil
	local nextListener2 = nil
	local nextListener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos397
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit9 = GetTriggerUnit()
	abilId2 = GetSpellAbilityId()
	caster12 = GetSpellAbilityUnit()
	index6 = unit_getIndex(trigUnit9, "when calling getIndex in ClosureEvents, line 210")
	listener10 = EventListener_castMapCasters[index6]
	while true do
		if not(not((listener10 == nil))) then
			break
		end
		nextListener2 = listener10.OnCastListener_next
		if ((listener10.OnCastListener_abilId == -1) or (listener10.OnCastListener_abilId == abilId2)) then
			listener10:fire(caster12, "when calling fire in ClosureEvents, line 215")
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
			listener10:fire(caster12, "when calling fire in ClosureEvents, line 222")
		end
		listener10 = nextListener3
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureForGroups(__wurst_stackPos322) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos322
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

function code__Filter_ClosureForGroups(__wurst_stackPos400) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos400
	wurst_stack_depth = (wurst_stack_depth + 1)
	filterCallback(GetFilterUnit(), "when calling filterCallback in ClosureForGroups, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function filterCallback(filter4, __wurst_stackPos401) 
	local idx = nil
	local mode = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos401
	wurst_stack_depth = (wurst_stack_depth + 1)
	idx = (ClosureForGroups_tempCallbacksCount - 1)
	mode = intEnsure(ClosureForGroups_callbackMode[idx])
	if (mode == ClosureForGroups_MODE_NORMAL) then
		currentCallback("when calling currentCallback in ClosureForGroups, line 30"):callback(filter4, "when calling callback in ClosureForGroups, line 30")
	elseif (mode == ClosureForGroups_MODE_COUNTED) then
		if (intEnsure(ClosureForGroups_countIters[idx]) < intEnsure(ClosureForGroups_countLimits[idx])) then
			currentCallback("when calling currentCallback in ClosureForGroups, line 33"):callback(filter4, "when calling callback in ClosureForGroups, line 33")
		end
		ClosureForGroups_countIters[idx] = (intEnsure(ClosureForGroups_countIters[idx]) + 1)
	elseif not(boolEnsure(ClosureForGroups_stopRequested[idx])) then
		if not(currentCallbackUntil("when calling currentCallbackUntil in ClosureForGroups, line 36"):ForGroupCallbackUntil_callback(filter4, "when calling callback in ClosureForGroups, line 36")) then
			ClosureForGroups_stopRequested[idx] = true
		end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function currentCallback(__wurst_stackPos402) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos402
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacks[(ClosureForGroups_tempCallbacksCount - 1)]
end

function currentCallbackUntil(__wurst_stackPos403) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos403
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacksUntil[(ClosureForGroups_tempCallbacksCount - 1)]
end

function group_forEachFrom(this240, cb11, __wurst_stackPos404) 
	local u21 = nil
	local from1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos404
	wurst_stack_depth = (wurst_stack_depth + 1)
	from1 = this240
	while true do
		if not(group_hasNext(from1, "when calling hasNext in ClosureForGroups, line 80")) then
			break
		end
		u21 = group_next(from1, "when calling next in ClosureForGroups, line 80")
		cb11:callback(u21, "when calling callback in ClosureForGroups, line 81")
	end
	ForGroupCallback_destroyForGroupCallback(cb11, "when calling destroyForGroupCallback in ClosureForGroups, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureTimers(__wurst_stackPos329) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos329
	wurst_stack_depth = (wurst_stack_depth + 1)
	ClosureTimers_x = 200
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_doAfter(this241, timeToWait1, cb12, __wurst_stackPos405) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos405
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_start(cb12, this241, timeToWait1, "when calling start in ClosureTimers, line 17")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb12
end

function doAfter(timeToWait, cb3, __wurst_stackPos83) 
	local stackTrace_tempReturn8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos83
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn8 = timer_doAfter(getTimer("when calling getTimer in ClosureTimers, line 28"), timeToWait, cb3, "when calling doAfter in ClosureTimers, line 28")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn8
end

function nullTimer(cb10, __wurst_stackPos380) 
	local stackTrace_tempReturn9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos380
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn9 = doAfter(0., cb10, "when calling doAfter in ClosureTimers, line 51")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn9
end

function timer_doPeriodically(this242, time5, cb13, __wurst_stackPos407) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos407
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_start(cb13, this242, time5, "when calling start in ClosureTimers, line 63")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb13
end

function doPeriodically(time4, cb2, __wurst_stackPos82) 
	local stackTrace_tempReturn10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos82
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn10 = timer_doPeriodically(getTimer("when calling getTimer in ClosureTimers, line 75"), time4, cb2, "when calling doPeriodically in ClosureTimers, line 75")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn10
end

function CallbackPeriodic_staticCallback(__wurst_stackPos408) 
	local cb14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos408
	wurst_stack_depth = (wurst_stack_depth + 1)
	cb14 = __wurst_objectFromIndex(timer_getData(GetExpiredTimer(), "when calling getData in ClosureTimers, line 162"))
	cb14:call(cb14, "when calling call in ClosureTimers, line 163")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__start_CallbackSingle_ClosureTimers(__wurst_stackPos410) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos410
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_staticCallback("when calling staticCallback in ClosureTimers, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_staticCallback(__wurst_stackPos411) 
	local t3 = nil
	local cb15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos411
	wurst_stack_depth = (wurst_stack_depth + 1)
	t3 = GetExpiredTimer()
	cb15 = __wurst_objectFromIndex(timer_getData(t3, "when calling getData in ClosureTimers, line 140"))
	cb15:call1("when calling call in ClosureTimers, line 141")
	CallbackSingle_destroyCallbackSingle(cb15, "when calling destroyCallbackSingle in ClosureTimers, line 142")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos314) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos314
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

function colorA_toColorString(this244, __wurst_stackPos412) 
	local stackTrace_tempReturn11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos412
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn11 = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this244[4], "when calling toHex in Colors, line 194")), toHex(this244[1], "when calling toHex in Colors, line 194")), toHex(this244[2], "when calling toHex in Colors, line 194")), toHex(this244[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn11
end

function toHex(number, __wurst_stackPos414) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos414
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number // 16)
	secondpart = (number - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos413) 
	local i9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos413
	wurst_stack_depth = (wurst_stack_depth + 1)
	i9 = 0
	while true do
		if (i9 > 15) then
			break
		end
		Table_Table_saveInt(Colors_decs, string_getHash(stringEnsure(Colors_hexs[i9]), "when calling getHash in Colors, line 279"), i9, "when calling saveInt in Colors, line 279")
		i9 = (i9 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ControlPoint(__wurst_stackPos348) 
	local clVar18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos348
	wurst_stack_depth = (wurst_stack_depth + 1)
	ControlPoint_controlPoints = CreateGroup()
	ControlPoint_cpOwners = HashMap_new_HashMap("when calling new_HashMap in ControlPoint, line 9")
	ControlPoint_cpValues = HashMap_new_HashMap("when calling new_HashMap in ControlPoint, line 10")
	setupAllControlPoints("when calling setupAllControlPoints in ControlPoint, line 91")
	clVar18 = CallbackSingle_doAfter_ControlPoint:create11()
	CallbackSingle_construct_CallbackSingle(clVar18, "when calling construct_CallbackSingle in ControlPoint, line 92")
	doAfter(0., clVar18, "when calling doAfter in ControlPoint, line 92")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function income(__wurst_stackPos417) 
	local iterator14 = nil
	local cp = nil
	local owner2 = nil
	local value9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos417
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterator14 = group_iterator(ControlPoint_controlPoints, "when calling iterator in ControlPoint, line 19")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator14, "when calling hasNext in ControlPoint, line 19")) then
			break
		end
		cp = GroupIterator_GroupIterator_next(iterator14, "when calling next in ControlPoint, line 19")
		owner2 = playerFromIndex(intEnsure(HashMap_HashMap_get(ControlPoint_cpOwners, __wurst_objectToIndex(cp), "when calling get in ControlPoint, line 20")), "when calling playerFromIndex in ControlPoint, line 20")
		value9 = intEnsure(HashMap_HashMap_get(ControlPoint_cpValues, __wurst_objectToIndex(cp), "when calling get in ControlPoint, line 21"))
		player_addGold(owner2, value9, "when calling addGold in ControlPoint, line 22")
		updateMultiboard("when calling updateMultiboard in ControlPoint, line 23")
	end
	GroupIterator_GroupIterator_close(iterator14, "when calling close in ControlPoint, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function incomeTimer(__wurst_stackPos63) 
	local countdown = nil
	local d = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos63
	wurst_stack_depth = (wurst_stack_depth + 1)
	countdown = CreateTimer()
	d = timer_createTimerDialog(countdown, "when calling createTimerDialog in ControlPoint, line 28")
	__wurst_safe_TimerDialogSetTitle(d, "Income")
	__wurst_safe_TimerDialogDisplay(d, true)
	__wurst_safe_TimerStart(countdown, 10., true, function (...) 
			xpcall(function (...) 
					bridge_income(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupCaptureOnHalf(target9, __wurst_stackPos421) 
	local receiver20 = nil
	local receiver21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos421
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver20 = CreateTrigger()
	trigger_registerUnitEvent(receiver20, target9, EVENT_UNIT_DAMAGED, "when calling registerUnitEvent in ControlPoint, line 36")
	receiver21 = receiver20
	trigger_addAction(receiver21, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_ControlPoint(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ControlPoint, line 37")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_ControlPoint(__wurst_stackPos423) 
	local u22 = nil
	local attacker = nil
	local hp = nil
	local maxHp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos423
	wurst_stack_depth = (wurst_stack_depth + 1)
	u22 = GetTriggerUnit()
	attacker = GetEventDamageSource()
	hp = __wurst_safe_GetUnitState(u22, UNIT_STATE_LIFE)
	maxHp = __wurst_safe_GetUnitState(u22, UNIT_STATE_MAX_LIFE)
	if ((hp / maxHp) <= 0.5) then
		HashMap_HashMap_put(ControlPoint_cpOwners, __wurst_objectToIndex(u22), playerToIndex(unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 43"), "when calling playerToIndex in ControlPoint, line 43"), "when calling put in ControlPoint, line 43")
		__wurst_safe_SetUnitOwner(u22, unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 44"), true)
		__wurst_safe_SetUnitState(u22, UNIT_STATE_LIFE, maxHp)
		updateMultiboard("when calling updateMultiboard in ControlPoint, line 46")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addControlPoint(cp1, value10, __wurst_stackPos425) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos425
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_HashMap_put(ControlPoint_cpValues, __wurst_objectToIndex(cp1), value10, "when calling put in ControlPoint, line 50")
	HashMap_HashMap_put(ControlPoint_cpOwners, __wurst_objectToIndex(cp1), playerToIndex(unit_getOwner(cp1, "when calling getOwner in ControlPoint, line 51"), "when calling playerToIndex in ControlPoint, line 51"), "when calling put in ControlPoint, line 51")
	group_add1(ControlPoint_controlPoints, "when calling add in ControlPoint, line 52", cp1)
	setupCaptureOnHalf(cp1, "when calling setupCaptureOnHalf in ControlPoint, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAllControlPoints(__wurst_stackPos416) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos416
	wurst_stack_depth = (wurst_stack_depth + 1)
	addControlPoint(udg_mountHyjal, 30, "when calling addControlPoint in ControlPoint, line 57")
	addControlPoint(udg_mountHyjalGrove, 10, "when calling addControlPoint in ControlPoint, line 58")
	addControlPoint(udg_mountHyjalTown, 10, "when calling addControlPoint in ControlPoint, line 59")
	addControlPoint(udg_mountHyjalCrypt, 10, "when calling addControlPoint in ControlPoint, line 60")
	addControlPoint(udg_winterspringCenter, 10, "when calling addControlPoint in ControlPoint, line 61")
	addControlPoint(udg_winterspringNorth, 10, "when calling addControlPoint in ControlPoint, line 62")
	addControlPoint(udg_winterspringSouth, 10, "when calling addControlPoint in ControlPoint, line 63")
	addControlPoint(udg_winterspringDen, 10, "when calling addControlPoint in ControlPoint, line 64")
	addControlPoint(udg_winterspringRoost, 10, "when calling addControlPoint in ControlPoint, line 65")
	addControlPoint(udg_moongladeWest, 10, "when calling addControlPoint in ControlPoint, line 66")
	addControlPoint(udg_moongladeEast, 10, "when calling addControlPoint in ControlPoint, line 67")
	addControlPoint(udg_felwoodNorth, 10, "when calling addControlPoint in ControlPoint, line 68")
	addControlPoint(udg_felwoodCenter, 10, "when calling addControlPoint in ControlPoint, line 69")
	addControlPoint(udg_felwoodSouth, 10, "when calling addControlPoint in ControlPoint, line 70")
	addControlPoint(udg_ashenvaleChimaerasFall, 10, "when calling addControlPoint in ControlPoint, line 71")
	addControlPoint(udg_ashenvaleAstranaar, 10, "when calling addControlPoint in ControlPoint, line 72")
	addControlPoint(udg_ashenvaleForestEast, 10, "when calling addControlPoint in ControlPoint, line 73")
	addControlPoint(udg_ashenvaleCrossing, 10, "when calling addControlPoint in ControlPoint, line 74")
	addControlPoint(udg_ashenvaleChimaerasRest, 10, "when calling addControlPoint in ControlPoint, line 75")
	addControlPoint(udg_ashenvaleBeachNorth, 10, "when calling addControlPoint in ControlPoint, line 76")
	addControlPoint(udg_ashenvaleForestWest, 10, "when calling addControlPoint in ControlPoint, line 77")
	addControlPoint(udg_ashenvaleForestCenter, 10, "when calling addControlPoint in ControlPoint, line 78")
	addControlPoint(udg_ashenvaleGraniteDen, 10, "when calling addControlPoint in ControlPoint, line 79")
	addControlPoint(udg_ashenvaleWarsongSouth, 10, "when calling addControlPoint in ControlPoint, line 80")
	addControlPoint(udg_ashenvaleWarsongNorth, 10, "when calling addControlPoint in ControlPoint, line 81")
	addControlPoint(udg_ashenvaleVentureCo, 10, "when calling addControlPoint in ControlPoint, line 82")
	addControlPoint(udg_ashenvaleRoost, 10, "when calling addControlPoint in ControlPoint, line 83")
	addControlPoint(udg_ashenvaleBeachSouth, 10, "when calling addControlPoint in ControlPoint, line 84")
	addControlPoint(udg_ashenvaleForestNorth, 10, "when calling addControlPoint in ControlPoint, line 85")
	addControlPoint(udg_winterspringFactory, 10, "when calling addControlPoint in ControlPoint, line 86")
	addControlPoint(udg_ashenvaleForestSouth, 10, "when calling addControlPoint in ControlPoint, line 87")
	addControlPoint(udg_ashenvaleWarsongCenter, 10, "when calling addControlPoint in ControlPoint, line 88")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CorruptedBlood(__wurst_stackPos349) 
	local clVar19 = nil
	local temp52 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos349
	wurst_stack_depth = (wurst_stack_depth + 1)
	CorruptedBlood_CORRUPTED_BLOOD_ID = intEnsure(1095577650)
	CorruptedBlood_SLIME_UNIT_ID = 1852077933
	CorruptedBlood_SLIME_LIFETIME = 10.
	CorruptedBlood_SLIME_SPEED = 100.
	CorruptedBlood_SLIME_PROXIMITY = 150.
	CorruptedBlood_GROW_DURATION = 3.
	CorruptedBlood_EXPLODE_RADIUS = 400.
	CorruptedBlood_EXPLODE_DAMAGE = 500.
	CorruptedBlood_UPDATE_INTERVAL = 0.1
	CorruptedBlood_GROW_SFX = "Abilities\\Spells\\Undead\\PlagueCloud\\PlagueCloudCaster.mdl"
	CorruptedBlood_EXPLODE_SFX = "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl"
	temp52 = CorruptedBlood_CORRUPTED_BLOOD_ID
	clVar19 = OnCastListener_onCast_CorruptedBlood:create13()
	OnCastListener_construct_OnCastListener(clVar19, "when calling construct_OnCastListener in CorruptedBlood, line 62")
	EventListener_onCast(temp52, clVar19, "when calling onCast in CorruptedBlood, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function explodeSlime(slime1, caster4, __wurst_stackPos90) 
	local pos9 = ({0., 0., })
	local sfx3 = nil
	local clVar20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos90
	wurst_stack_depth = (wurst_stack_depth + 1)
	pos9 = tupleCopy(unit_getPos(slime1, "when calling getPos in CorruptedBlood, line 47"))
	sfx3 = addEffect(CorruptedBlood_GROW_SFX, pos9, "when calling addEffect in CorruptedBlood, line 48")
	effect_setScale(sfx3, 3.0, "when calling setScale in CorruptedBlood, line 49")
	clVar20 = CallbackSingle_doAfter_CorruptedBlood:create12()
	CallbackSingle_construct_CallbackSingle(clVar20, "when calling construct_CallbackSingle in CorruptedBlood, line 51")
	clVar20.sfx = sfx3
	clVar20.pos = tupleCopy(pos9)
	clVar20.caster = caster4
	clVar20.slime = slime1
	doAfter(0.5, clVar20, "when calling doAfter in CorruptedBlood, line 51")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CustomIcons(__wurst_stackPos350) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos350
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DamageEvent(__wurst_stackPos351) 
	local clVar21 = nil
	local clVar22 = nil
	local temp53 = nil
	local temp54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos351
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
	temp53 = EVENT_PLAYER_UNIT_DAMAGING
	clVar21 = EventListener_add_DamageEvent:create16()
	EventListener_construct_EventListener(clVar21, "when calling construct_EventListener in DamageEvent, line 476")
	EventListener_add(temp53, clVar21, "when calling add in DamageEvent, line 476")
	temp54 = EVENT_PLAYER_UNIT_DAMAGED
	clVar22 = EventListener_add_DamageEvent1:create17()
	EventListener_construct_EventListener(clVar22, "when calling construct_EventListener in DamageEvent, line 477")
	EventListener_add(temp54, clVar22, "when calling add in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onUnreducedDamage(__wurst_stackPos93) 
	local amount2 = nil
	local attackType1 = nil
	local dmg = nil
	local i10 = nil
	local temp8 = nil
	local listener11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos93
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
	i10 = 0
	temp8 = DamageEvent_maxUnreducedPriority
	while true do
		if (i10 > temp8) then
			break
		end
		listener11 = DamageEvent_firstUnreducedListeners[i10]
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
		i10 = (i10 + 1)
	end
	__wurst_safe_BlzSetEventAttackType(dmg.DamageInstance_nativeAttackType)
	__wurst_safe_BlzSetEventDamageType(dmg.DamageInstance_nativeDamageType)
	__wurst_safe_BlzSetEventWeaponType(dmg.DamageInstance_nativeWeaponType)
	BlzSetEventDamage(dmg.DamageInstance_amount)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onDamage(__wurst_stackPos95) 
	local dmg1 = nil
	local i11 = nil
	local temp9 = nil
	local listener12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos95
	wurst_stack_depth = (wurst_stack_depth + 1)
	dmg1 = DamageInstance_current
	if not(DamageEvent_abort) then
		DamageInstance_DamageInstance_setReducedAmount(dmg1, GetEventDamage(), "when calling setReducedAmount in DamageEvent, line 222")
		i11 = 0
		temp9 = DamageEvent_maxPriority
		while true do
			if (i11 > temp9) then
				break
			end
			listener12 = DamageEvent_firstListeners[i11]
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
			i11 = (i11 + 1)
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

function DamageEvent_addListener(listener13, __wurst_stackPos427) 
	local stackTrace_tempReturn12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos427
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn12 = DamageEvent_addListener1(DamageEvent_maxPriority, listener13, "when calling addListener in DamageEvent, line 248")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn12
end

function DamageEvent_addListener1(priority, listener14, __wurst_stackPos428) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos428
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

function DamageEvent_getSource(__wurst_stackPos429) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos429
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_source
end

function DamageEvent_getTarget(__wurst_stackPos430) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos430
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_target
end

function init_Destructable(__wurst_stackPos302) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos302
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DryadCasterMain(__wurst_stackPos353) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos353
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_destr(this13, __wurst_stackPos14) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos14
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyEffect(this13)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect1(path1, pos2, __wurst_stackPos67) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos67
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect2(path1, pos2, 1.0, real_fromDeg(GetRandomReal(0., 359.), "when calling fromDeg in Effect, line 14"), "when calling flashEffect in Effect, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect2(path4, pos10, scale2, yaw, __wurst_stackPos431) 
	local receiver22 = nil
	local receiver23 = nil
	local receiver24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos431
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver22 = addEffect(path4, pos10, "when calling addEffect in Effect, line 23")
	effect_setScale(receiver22, scale2, "when calling setScale in Effect, line 23")
	receiver23 = receiver22
	effect_setYaw(receiver23, yaw, "when calling setYaw in Effect, line 23")
	receiver24 = receiver23
	effect_destr(receiver24, "when calling destr in Effect, line 23")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect(path2, pos4, __wurst_stackPos81) 
	local stackTrace_tempReturn13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos81
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn13 = AddSpecialEffect(path2, pos4[1], pos4[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn13
end

function effect_setScale(this62, scale, __wurst_stackPos72) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos72
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectScale(this62, scale)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_setYaw(this250, yaw1, __wurst_stackPos432) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos432
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectYaw(this250, angle_radians(yaw1, "when calling radians in Effect, line 171"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect(path, target, attachPointName, __wurst_stackPos9) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos9
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(addEffect1(path, target, attachPointName, "when calling addEffect in Effect, line 29"), "when calling destr in Effect, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect1(path3, target5, attachPointName1, __wurst_stackPos141) 
	local stackTrace_tempReturn14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos141
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn14 = __wurst_safe_AddSpecialEffectTarget(path3, target5, attachPointName1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn14
end

function effect_setColor(this63, r, g, b, __wurst_stackPos73) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos73
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectColor(this63, r, g, b)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_setPos(this74, pos6, __wurst_stackPos89) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos89
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectPosition(this74, pos6[1], pos6[2], __wurst_safe_BlzGetLocalSpecialEffectZ(this74))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos308) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos308
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_MUTE_ERROR_DURATION = 60
	ErrorHandling_PRIMARY_ERROR_KEY = -1
	ErrorHandling_HT = hashtable_compiletime2
	ErrorHandling_lastError = ""
	ErrorHandling_suppressErrorMessages = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function error1(msg, __wurst_stackPos26) 
	local hash = nil
	local stacktraceStr = nil
	local stacktraceIndex = nil
	local stacktraceLimit = nil
	local stacktraceStr1 = nil
	local stacktraceIndex1 = nil
	local stacktraceLimit1 = nil
	local temp55 = nil
	local temp56 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos26
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
					temp55 = msg
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
					Log_error(stringConcat(temp55, stacktraceStr), "when calling error in ErrorHandling, line 58")
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
				temp56 = stringConcat("Message: ", msg)
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
				Log_error(stringConcat(temp56, stacktraceStr1), "when calling error in ErrorHandling, line 70")
			end
		end
		ErrorHandling_lastError = msg
		error("__wurst_abort_thread", 0)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos321) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos321
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function eventid_isPlayerunitEvent(this237, __wurst_stackPos385) 
	local eventId2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos385
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId2 = handle_getHandleId(this237, "when calling getHandleId in EventHelper, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((((eventId2 >= 18) and (eventId2 <= 51)) or ((eventId2 >= 269) and (eventId2 <= 277))) or (eventId2 == 315)) or (eventId2 == 308))
end

function eventid_isKeyboardEvent(this238, __wurst_stackPos386) 
	local eventId3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos386
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId3 = handle_getHandleId(this238, "when calling getHandleId in EventHelper, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((eventId3 >= 261) and (eventId3 <= 268)) or (eventId3 == 17))
end

function eventid_isMouseEvent(this239, __wurst_stackPos387) 
	local eventId4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos387
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId4 = handle_getHandleId(this239, "when calling getHandleId in EventHelper, line 61")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((eventId4 >= 305) and (eventId4 <= 307))
end

function EventData_getTriggerUnit(__wurst_stackPos190) 
	local stackTrace_tempReturn15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos190
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn15 = GetTriggerUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn15
end

function EventData_getDyingUnit(__wurst_stackPos202) 
	local stackTrace_tempReturn16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos202
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn16 = GetDyingUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn16
end

function EventData_getTrainedUnit(__wurst_stackPos132) 
	local stackTrace_tempReturn17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos132
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn17 = GetTrainedUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn17
end

function EventData_getSpellTargetUnit(__wurst_stackPos22) 
	local stackTrace_tempReturn18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos22
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn18 = GetSpellTargetUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn18
end

function EventData_getAbilityTargetPos(__wurst_stackPos438) 
	local stackTrace_tempReturn19 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos438
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn19 = ({GetSpellTargetX(), GetSpellTargetY(), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn19
end

function EventData_getSpellTargetPos(__wurst_stackPos181) 
	local stackTrace_tempReturn20 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos181
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn20 = tupleCopy(EventData_getAbilityTargetPos("when calling getAbilityTargetPos in EventHelper, line 384"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn20
end

function init_Execute(__wurst_stackPos339) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos339
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_executeForce = CreateForce()
	force_addPlayer(Execute_executeForce, Player_localPlayer, "when calling addPlayer in Execute, line 15")
	Execute_tempCallbacksCount = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function executeCurrentCallback(__wurst_stackPos440) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos440
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_lastError = ""
	getCurrentCallback("when calling getCurrentCallback in Execute, line 19"):run("when calling run in Execute, line 19")
	setCurrentCallbackSuccess(true, "when calling setCurrentCallbackSuccess in Execute, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getCurrentCallback(__wurst_stackPos441) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos441
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Execute_tempCallbacks[(Execute_tempCallbacksCount - 1)]
end

function setCurrentCallbackSuccess(value12, __wurst_stackPos442) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos442
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksSuccess[(Execute_tempCallbacksCount - 1)] = value12
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushCallback(c1, __wurst_stackPos443) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos443
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacks[Execute_tempCallbacksCount] = c1
	Execute_tempCallbacksSuccess[Execute_tempCallbacksCount] = false
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popCallback(__wurst_stackPos444) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos444
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount - 1)
	ForForceCallback_destroyForForceCallback(Execute_tempCallbacks[Execute_tempCallbacksCount], "when calling destroyForForceCallback in Execute, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function isLastCallbackSuccessful(__wurst_stackPos445) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos445
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return boolEnsure(Execute_tempCallbacksSuccess[Execute_tempCallbacksCount])
end

function execute(c2, __wurst_stackPos446) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos446
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not(try(c2, "when calling try in Execute, line 78")) then
		error1(stringConcat("execute: thread has crashed. caused by:\n| - ", ErrorHandling_lastError), "when calling error in Execute, line 79")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function try(c3, __wurst_stackPos447) 
	local suppressErrors = nil
	local stackTrace_tempReturn21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos447
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
	stackTrace_tempReturn21 = isLastCallbackSuccessful("when calling isLastCallbackSuccessful in Execute, line 102")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn21
end

function init_Force(__wurst_stackPos312) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos312
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_addPlayer(this254, whichPlayer9, __wurst_stackPos439) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos439
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_ForceAddPlayer(this254, whichPlayer9)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_forEach(this255, callback, __wurst_stackPos448) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos448
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_ForForce(this255, callback)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos315) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos315
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos307) 
	local receiver25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos307
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver25 = CreateTimer()
	timer_start(receiver25, 100000., nil, "when calling start in GameTimer, line 7")
	timer_startPeriodic(CreateTimer(), Basics_ANIMATION_PERIOD, function (...) 
			xpcall(function (...) 
					bridge_code__startPeriodic_GameTimer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in GameTimer, line 15")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__startPeriodic_GameTimer(__wurst_stackPos449) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos449
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos316) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos316
	wurst_stack_depth = (wurst_stack_depth + 1)
	Group_ENUM_GROUP = CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GroupUtils(__wurst_stackPos340) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos340
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

function createGroups(number1, __wurst_stackPos451) 
	local maxCreatePerCycle = nil
	local actualLimit = nil
	local numTarget = nil
	local overflow = nil
	local toCreate = nil
	local createNow = nil
	local clVar23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos451
	wurst_stack_depth = (wurst_stack_depth + 1)
	maxCreatePerCycle = 256
	actualLimit = max("when calling max in GroupUtils, line 81", (JASS_MAX_ARRAY_SIZE - 1), GroupUtils_GROUP_NUMBER_LIMIT)
	numTarget = (GroupUtils_numTotal + number1)
	overflow = max("when calling max in GroupUtils, line 83", 0, (numTarget - actualLimit))
	toCreate = max("when calling max in GroupUtils, line 84", 0, (numTarget - overflow))
	while true do
		if not((toCreate > 0)) then
			break
		end
		createNow = min("when calling min in GroupUtils, line 87", toCreate, maxCreatePerCycle)
		toCreate = (toCreate - createNow)
		clVar23 = ForForceCallback_execute_GroupUtils:create22()
		clVar23.createNow = createNow
		execute(clVar23, "when calling execute in GroupUtils, line 90")
	end
	if ((GroupUtils_numTotal >= GroupUtils_GROUP_NUMBER_LIMIT) and not(GroupUtils_shownMaxError)) then
		Log_warn(stringConcat(stringConcat(stringConcat("Maximum number of GroupUtils groups (", int_toString(GroupUtils_GROUP_NUMBER_LIMIT, "when calling toString in GroupUtils, line 96")), ") created. "), "All newly created groups will be non-recyclable."), "when calling warn in GroupUtils, line 96")
		GroupUtils_shownMaxError = true
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function push(g2, __wurst_stackPos111) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos111
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_stack[GroupUtils_numStack] = g2
	HashMap_HashMap_put(GroupUtils_used, __wurst_objectToIndex(GroupUtils_stack[GroupUtils_numStack]), booleanToIndex(false, "when calling booleanToIndex in GroupUtils, line 118"), "when calling put in GroupUtils, line 118")
	GroupUtils_numStack = (GroupUtils_numStack + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initialize(__wurst_stackPos450) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos450
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

function group_enumUnitsInRect1(this129, rec1, __wurst_stackPos150) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos150
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRect(this129, rec1, nil, "when calling enumUnitsInRect in Group, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRect(this16, rec, filter1, __wurst_stackPos17) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos17
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsInRect(this16, rec, filter1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsOfType(this256, id8, filter7, __wurst_stackPos455) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos455
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsOfType(this256, UnitId2String(id8), filter7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this99, __wurst_stackPos118, ...) 
	local i12 = nil
	local g5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos118
	wurst_stack_depth = (wurst_stack_depth + 1)
	i12 = 0
	local __args1 = table.pack(...)
	for i13=1,__args1.n do
	g5 = __args1[i13]
	i12 = (i12 + __wurst_safe_BlzGroupAddGroupFast(g5, this99))
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i12
end

function group_clear(this101, __wurst_stackPos120) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos120
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupClear(this101)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add1(this249, __wurst_stackPos426, ...) 
	local i14 = nil
	local u23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos426
	wurst_stack_depth = (wurst_stack_depth + 1)
	i14 = 0
	local __args2 = table.pack(...)
	for i15=1,__args2.n do
	u23 = __args2[i15]
	if __wurst_safe_GroupAddUnit(this249, u23) then
		i14 = (i14 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i14
end

function group_remove(this257, __wurst_stackPos456, ...) 
	local i16 = nil
	local u24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos456
	wurst_stack_depth = (wurst_stack_depth + 1)
	i16 = 0
	local __args3 = table.pack(...)
	for i17=1,__args3.n do
	u24 = __args3[i17]
	if __wurst_safe_GroupRemoveUnit(this257, u24) then
		i16 = (i16 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i16
end

function group_destr(this102, __wurst_stackPos121) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos121
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyGroup(this102)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_size(this100, __wurst_stackPos119) 
	local stackTrace_tempReturn22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos119
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn22 = __wurst_safe_BlzGroupGetSize(this100)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn22
end

function group_isEmpty(this258, __wurst_stackPos457) 
	local stackTrace_tempReturn23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos457
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn23 = not(group_hasNext(this258, "when calling hasNext in Group, line 70"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn23
end

function group_hasNext(this130, __wurst_stackPos151) 
	local stackTrace_tempReturn24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos151
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn24 = not((__wurst_safe_FirstOfGroup(this130) == nil))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn24
end

function group_get(this93, index1, __wurst_stackPos112) 
	local stackTrace_tempReturn25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos112
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn25 = __wurst_safe_BlzGroupUnitAt(this93, index1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn25
end

function group_iterator(this2, __wurst_stackPos2) 
	local stackTrace_tempReturn26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos2
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn26 = GroupIterator_new_GroupIterator(this2, "when calling new_GroupIterator in Group, line 141")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn26
end

function group_next(this131, __wurst_stackPos152) 
	local iterUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos152
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterUnit = __wurst_safe_FirstOfGroup(this131)
	__wurst_safe_GroupRemoveUnit(this131, iterUnit)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return iterUnit
end

function init_HashList(__wurst_stackPos320) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos320
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashList_ht = hashtable_compiletime
	HashList_occurences = hashtable_compiletime1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_hasBoolean(this252, parentKey21, childKey11, __wurst_stackPos436) 
	local stackTrace_tempReturn27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos436
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn27 = __wurst_HaveSavedBoolean(this252, parentKey21, childKey11)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn27
end

function hashtable_hasInt(this191, parentKey4, childKey, __wurst_stackPos223) 
	local stackTrace_tempReturn28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos223
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn28 = __wurst_HaveSavedInteger(this191, parentKey4, childKey)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn28
end

function hashtable_hasString(this193, parentKey6, childKey1, __wurst_stackPos225) 
	local stackTrace_tempReturn29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos225
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn29 = __wurst_HaveSavedString(this193, parentKey6, childKey1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn29
end

function hashtable_loadBoolean(this253, parentKey22, childKey12, __wurst_stackPos437) 
	local stackTrace_tempReturn30 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos437
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn30 = __wurst_LoadBoolean(this253, parentKey22, childKey12)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn30
end

function hashtable_loadInt(this194, parentKey8, childKey3, __wurst_stackPos226) 
	local stackTrace_tempReturn31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos226
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn31 = __wurst_LoadInteger(this194, parentKey8, childKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn31
end

function hashtable_loadString(this197, parentKey11, childKey5, __wurst_stackPos229) 
	local stackTrace_tempReturn32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos229
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn32 = __wurst_LoadStr(this197, parentKey11, childKey5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn32
end

function hashtable_loadTriggerHandle(this203, parentKey17, childKey8, __wurst_stackPos235) 
	local stackTrace_tempReturn33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos235
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn33 = __wurst_LoadTriggerHandle(this203, parentKey17, childKey8)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn33
end

function hashtable_loadUnitHandle(this201, parentKey15, childKey7, __wurst_stackPos233) 
	local stackTrace_tempReturn34 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos233
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn34 = __wurst_LoadUnitHandle(this201, parentKey15, childKey7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn34
end

function hashtable_saveBoolean(this251, parentKey20, childKey10, value11, __wurst_stackPos435) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos435
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveBoolean(this251, parentKey20, childKey10, value11)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveFogStateHandle(this205, parentKey19, childKey9, value7, __wurst_stackPos237) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos237
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveFogStateHandle(this205, parentKey19, childKey9, value7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveInt(this195, parentKey9, childKey4, value3, __wurst_stackPos227) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos227
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveInteger(this195, parentKey9, childKey4, value3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveString(this199, parentKey13, childKey6, value5, __wurst_stackPos231) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos231
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveStr(this199, parentKey13, childKey6, value5)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_HeroTrainer(__wurst_stackPos354) 
	local clVar24 = nil
	local temp57 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos354
	wurst_stack_depth = (wurst_stack_depth + 1)
	HeroTrainer_TAVERN_ID = 1848651827
	temp57 = EVENT_PLAYER_UNIT_TRAIN_FINISH
	clVar24 = EventListener_add_HeroTrainer:create25()
	EventListener_construct_EventListener(clVar24, "when calling construct_EventListener in HeroTrainer, line 9")
	EventListener_add(temp57, clVar24, "when calling add in HeroTrainer, line 9")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Hibernate(__wurst_stackPos355) 
	local clVar25 = nil
	local temp58 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos355
	wurst_stack_depth = (wurst_stack_depth + 1)
	Hibernate_HIBERNATE_ID = intEnsure(1095577697)
	Hibernate_HIBERNATE_BUFF_ID = intEnsure(1112354867)
	Hibernate_HIBERNATE_DURATION = 4.
	Hibernate_HEAL_INTERVAL = 0.1
	Hibernate_ARMOR_BONUS = 20.
	Hibernate_HP_PCT[0] = 0.30
	Hibernate_HP_PCT[1] = 0.40
	Hibernate_HP_PCT[2] = 0.50
	Hibernate_HP_FLAT[0] = 125.
	Hibernate_HP_FLAT[1] = 175.
	Hibernate_HP_FLAT[2] = 250.
	temp58 = Hibernate_HIBERNATE_ID
	clVar25 = OnCastListener_onCast_Hibernate:create26()
	OnCastListener_construct_OnCastListener(clVar25, "when calling construct_OnCastListener in Hibernate, line 65")
	EventListener_onCast(temp58, clVar25, "when calling onCast in Hibernate, line 65")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Icons(__wurst_stackPos327) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos327
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_InitFocusCamera(__wurst_stackPos356) 
	local clVar26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos356
	wurst_stack_depth = (wurst_stack_depth + 1)
	clVar26 = CallbackSingle_doAfter_InitFocusCamera:create29()
	CallbackSingle_construct_CallbackSingle(clVar26, "when calling construct_CallbackSingle in InitFocusCamera, line 6")
	doAfter(0.0, clVar26, "when calling doAfter in InitFocusCamera, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_InstantDummyCaster(__wurst_stackPos357) 
	local receiver26 = nil
	local receiver27 = nil
	local receiver28 = nil
	local receiver29 = nil
	local receiver30 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos357
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_DUMMY_CASTER_UNIT_ID = intEnsure(2016423985)
	InstantDummyCaster_DUMMY_ROOT_ABIL_ID = intEnsure(1095577651)
	receiver26 = createUnit(Basics_DUMMY_PLAYER, InstantDummyCaster_DUMMY_CASTER_UNIT_ID, MapBounds_boundMax, ({0., }), "when calling createUnit in InstantDummyCaster, line 97")
	unit_setPathing(receiver26, false, "when calling setPathing in InstantDummyCaster, line 98")
	receiver27 = receiver26
	unit_addAbility(receiver27, Basics_HEIGHT_ENABLER, "when calling addAbility in InstantDummyCaster, line 98")
	receiver28 = receiver27
	unit_removeAbility(receiver28, Basics_HEIGHT_ENABLER, "when calling removeAbility in InstantDummyCaster, line 98")
	receiver29 = receiver28
	unit_addAbility(receiver29, InstantDummyCaster_DUMMY_ROOT_ABIL_ID, "when calling addAbility in InstantDummyCaster, line 98")
	receiver30 = receiver29
	unit_removeAbility(receiver30, InstantDummyCaster_DUMMY_ROOT_ABIL_ID, "when calling removeAbility in InstantDummyCaster, line 98")
	InstantDummyCaster_caster = receiver30
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_prepare(owner3, id9, lvl1, pos11, __wurst_stackPos458) 
	local receiver31 = nil
	local receiver32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos458
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver31 = InstantDummyCaster_caster
	unit_addAbility(receiver31, id9, "when calling addAbility in InstantDummyCaster, line 27")
	receiver32 = receiver31
	unit_setMana(receiver32, 1000000., "when calling setMana in InstantDummyCaster, line 27")
	if vec3_inBounds(pos11, "when calling inBounds in InstantDummyCaster, line 28") then
		unit_setXYZ(InstantDummyCaster_caster, pos11, "when calling setXYZ in InstantDummyCaster, line 29")
	end
	if (lvl1 > 1) then
		unit_setAbilityLevel(InstantDummyCaster_caster, id9, lvl1, "when calling setAbilityLevel in InstantDummyCaster, line 31")
	end
	if not((owner3 == nil)) then
		unit_setOwner(InstantDummyCaster_caster, owner3, false, "when calling setOwner in InstantDummyCaster, line 33")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_finish(id10, __wurst_stackPos463) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos463
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setOwner(InstantDummyCaster_caster, Basics_DUMMY_PLAYER, false, "when calling setOwner in InstantDummyCaster, line 36")
	unit_removeAbility(InstantDummyCaster_caster, id10, "when calling removeAbility in InstantDummyCaster, line 37")
	unit_setPos(InstantDummyCaster_caster, MapBounds_boundMax, "when calling setPos in InstantDummyCaster, line 38")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_castTarget1(owner4, abilityId3, lvl3, orderId1, target10, casterPos1, __wurst_stackPos465) 
	local success = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos465
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_prepare(owner4, abilityId3, lvl3, casterPos1, "when calling prepare in InstantDummyCaster, line 47")
	unit_setFacing(InstantDummyCaster_caster, vec2_angleTo(unit_getPos(InstantDummyCaster_caster, "when calling getPos in InstantDummyCaster, line 48"), widget_getPos(target10, "when calling getPos in InstantDummyCaster, line 48"), "when calling angleTo in InstantDummyCaster, line 48"), "when calling setFacing in InstantDummyCaster, line 48")
	success = unit_issueTargetOrderById(InstantDummyCaster_caster, orderId1, target10, "when calling issueTargetOrderById in InstantDummyCaster, line 49")
	InstantDummyCaster_finish(abilityId3, "when calling finish in InstantDummyCaster, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return success
end

function InstantDummyCaster_castTarget(owner1, abilityId2, lvl, orderId, target7, __wurst_stackPos184) 
	local stackTrace_tempReturn35 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos184
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn35 = InstantDummyCaster_castTarget1(owner1, abilityId2, lvl, orderId, target7, vec2_toVec3(({__wurst_safe_GetWidgetX(target7), __wurst_safe_GetWidgetY(target7), }), "when calling toVec3 in InstantDummyCaster, line 62"), "when calling castTarget in InstantDummyCaster, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn35
end

function init_Integer(__wurst_stackPos296) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos296
	wurst_stack_depth = (wurst_stack_depth + 1)
	Integer_INT_MAX = 2147483647
	Integer_INT_MIN = -2147483648
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function int_toReal(this183, __wurst_stackPos214) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos214
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this183 * 1.)
end

function int_toString(this132, __wurst_stackPos153) 
	local stackTrace_tempReturn36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos153
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn36 = tostring(this132)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn36
end

function int_bitOr(this232, other, __wurst_stackPos375) 
	local stackTrace_tempReturn37 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos375
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn37 = BlzBitOr(this232, other)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn37
end

function int_bitXor(this233, other1, __wurst_stackPos376) 
	local stackTrace_tempReturn38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos376
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn38 = BlzBitXor(this233, other1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn38
end

function init_Invigorate(__wurst_stackPos343) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos343
	wurst_stack_depth = (wurst_stack_depth + 1)
	Invigorate_seedlingCount = 0
	Invigorate_INVIGORATE_ID = intEnsure(1095577655)
	Invigorate_MAX_SEEDLING_STACKS = 5
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getSeedlingCount(__wurst_stackPos220) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos220
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Invigorate_seedlingCount
end

function addSeedlingStack(__wurst_stackPos23) 
	local clVar27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos23
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount >= Invigorate_MAX_SEEDLING_STACKS) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	Invigorate_seedlingCount = (Invigorate_seedlingCount + 1)
	clVar27 = CallbackSingle_doAfter_Invigorate:create30()
	CallbackSingle_construct_CallbackSingle(clVar27, "when calling construct_CallbackSingle in Invigorate, line 24")
	doAfter(12., clVar27, "when calling doAfter in Invigorate, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Isolation(__wurst_stackPos360) 
	local clVar28 = nil
	local temp59 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos360
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1095577653)
	Isolation_ISOLATION_BUFF_ID = intEnsure(1112354866)
	Isolation_ISOLATION_DAMAGE = 15.
	Isolation_ISOLATION_PERIOD = 1.
	temp59 = Isolation_ISOLATION_PERIOD
	clVar28 = CallbackPeriodic_doPeriodically_Isolation:create31()
	CallbackPeriodic_construct_CallbackPeriodic(clVar28, "when calling construct_CallbackPeriodic in Isolation, line 77")
	doPeriodically(temp59, clVar28, "when calling doPeriodically in Isolation, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos317) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos317
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_LinkedList(__wurst_stackPos323) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos323
	wurst_stack_depth = (wurst_stack_depth + 1)
	realToIndex(0., "when calling realToIndex in LinkedList, line 617")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos305) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos305
	wurst_stack_depth = (wurst_stack_depth + 1)
	MagicFunctions_compiletime = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function compileError(msg3, __wurst_stackPos433) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos433
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MapBounds(__wurst_stackPos331) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos331
	wurst_stack_depth = (wurst_stack_depth + 1)
	initMapBounds("when calling initMapBounds in MapBounds, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function inBoundsXY(x5, y4, __wurst_stackPos472) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos472
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((((x5 > MapBounds_boundMin[1]) and (x5 < MapBounds_boundMax[1])) and (y4 > MapBounds_boundMin[2])) and (y4 < MapBounds_boundMax[2]))
end

function vec3_inBounds(this260, __wurst_stackPos460) 
	local stackTrace_tempReturn39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos460
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn39 = inBoundsXY(this260[1], this260[2], "when calling inBoundsXY in MapBounds, line 40")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn39
end

function initMapBounds(__wurst_stackPos471) 
	local cond_result1 = nil
	local receiver33 = nil
	local cond_result2 = nil
	local receiver34 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos471
	wurst_stack_depth = (wurst_stack_depth + 1)
	if MagicFunctions_compiletime then
		cond_result1 = Rect(-1024., -1024., 1024., 1024.)
	else
		cond_result1 = GetPlayableMapRect()
	end
	MapBounds_playableMapRect = cond_result1
	receiver33 = CreateRegion()
	region_addRect(receiver33, MapBounds_playableMapRect, "when calling addRect in MapBounds, line 49")
	if MagicFunctions_compiletime then
		cond_result2 = Rect(-1536., -1536., 1536., 1536.)
	else
		cond_result2 = GetWorldBounds()
	end
	MapBounds_boundRect = cond_result2
	receiver34 = CreateRegion()
	region_addRect(receiver34, MapBounds_boundRect, "when calling addRect in MapBounds, line 51")
	MapBounds_boundRegion = receiver34
	MapBounds_playableMin = ({rect_getMinX(MapBounds_playableMapRect, "when calling getMinX in MapBounds, line 52"), rect_getMinY(MapBounds_playableMapRect, "when calling getMinY in MapBounds, line 52"), })
	MapBounds_playableMax = ({rect_getMaxX(MapBounds_playableMapRect, "when calling getMaxX in MapBounds, line 53"), rect_getMaxY(MapBounds_playableMapRect, "when calling getMaxY in MapBounds, line 53"), })
	MapBounds_boundMin = ({rect_getMinX(MapBounds_boundRect, "when calling getMinX in MapBounds, line 54"), rect_getMinY(MapBounds_boundRect, "when calling getMinY in MapBounds, line 54"), })
	MapBounds_boundMax = ({rect_getMaxX(MapBounds_boundRect, "when calling getMaxX in MapBounds, line 55"), rect_getMaxY(MapBounds_boundRect, "when calling getMaxY in MapBounds, line 55"), })
	vec2_op_mult(vec2_op_plus(MapBounds_playableMin, MapBounds_playableMax, "when calling op_plus in MapBounds, line 56"), .5, "when calling op_mult in MapBounds, line 56")
	vec2_op_mult(vec2_op_plus(MapBounds_boundMin, MapBounds_boundMax, "when calling op_plus in MapBounds, line 57"), .5, "when calling op_mult in MapBounds, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Maths(__wurst_stackPos299) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos299
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function max(__wurst_stackPos452, ...) 
	local maxNumber = nil
	local cond_result3 = nil
	local number2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos452
	wurst_stack_depth = (wurst_stack_depth + 1)
	maxNumber = Integer_INT_MIN
	local __args4 = table.pack(...)
	for i18=1,__args4.n do
	number2 = __args4[i18]
	if (number2 > maxNumber) then
		cond_result3 = number2
	else
		cond_result3 = maxNumber
	end
	maxNumber = cond_result3
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return maxNumber
end

function min(__wurst_stackPos453, ...) 
	local minNumber = nil
	local cond_result4 = nil
	local number3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos453
	wurst_stack_depth = (wurst_stack_depth + 1)
	minNumber = Integer_INT_MAX
	local __args5 = table.pack(...)
	for i19=1,__args5.n do
	number3 = __args5[i19]
	if (number3 < minNumber) then
		cond_result4 = number3
	else
		cond_result4 = minNumber
	end
	minNumber = cond_result4
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return minNumber
end

function init_Matrices(__wurst_stackPos309) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos309
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboard_getItem(this275, row, column, __wurst_stackPos480) 
	local stackTrace_tempReturn40 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos480
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn40 = __wurst_safe_MultiboardGetItem(this275, row, column)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn40
end

function multiboarditem_release(this276, __wurst_stackPos481) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos481
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_MultiboardReleaseItem(this276)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboard_setItemValueColor(this277, row2, column2, r5, g6, b3, a2, __wurst_stackPos482) 
	local receiver35 = nil
	local receiver36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos482
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver35 = multiboard_getItem(this277, row2, column2, "when calling getItem in Multiboard, line 115")
	multiboarditem_setValueColor(receiver35, r5, g6, b3, a2, "when calling setValueColor in Multiboard, line 116")
	receiver36 = receiver35
	multiboarditem_release(receiver36, "when calling release in Multiboard, line 117")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboarditem_setValueColor(this278, r6, g7, b4, a3, __wurst_stackPos483) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos483
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_MultiboardSetItemValueColor(this278, r6, g7, b4, a3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboard_setItemValueColor1(this279, row3, column3, col, __wurst_stackPos484) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos484
	wurst_stack_depth = (wurst_stack_depth + 1)
	multiboard_setItemValueColor(this279, row3, column3, col[1], col[2], col[3], col[4], "when calling setItemValueColor in Multiboard, line 120")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Nightmare(__wurst_stackPos359) 
	local clVar29 = nil
	local clVar30 = nil
	local temp61 = nil
	local temp62 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos359
	wurst_stack_depth = (wurst_stack_depth + 1)
	Nightmare_NIGHTMARE_ID = intEnsure(1095577652)
	Nightmare_NIGHTMARE_BUFF_ID = intEnsure(1112354865)
	Nightmare_NIGHTMARE_RADIUS = 400.
	Nightmare_NIGHTMARE_DURATION = 10.
	Nightmare_CORRUPT_SFX = "Abilities\\Spells\\Undead\\UndeadDismember\\UndeadDismemberTarget.mdl"
	Nightmare_NIGHTMARE_SFX = "Abilities\\Spells\\Undead\\Sleep\\SleepSpecialArt.mdl"
	Nightmare_sleepingUnits = HashMap_new_HashMap("when calling new_HashMap in Nightmare, line 30")
	temp61 = Nightmare_NIGHTMARE_ID
	clVar29 = OnCastListener_onCast_Nightmare:create37()
	OnCastListener_construct_OnCastListener(clVar29, "when calling construct_OnCastListener in Nightmare, line 59")
	EventListener_onCast(temp61, clVar29, "when calling onCast in Nightmare, line 59")
	temp62 = EVENT_PLAYER_UNIT_DAMAGED
	clVar30 = EventListener_add_Nightmare:create39()
	EventListener_construct_EventListener(clVar30, "when calling construct_EventListener in Nightmare, line 95")
	EventListener_add(temp62, clVar30, "when calling add in Nightmare, line 95")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createObjectDefinition(fileType, newId4, deriveFrom, __wurst_stackPos261) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos261
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({"", })
end

function init_ObjectIdGenerator(__wurst_stackPos333) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos333
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_new_IdGenerator(2016423984, "when calling new_IdGenerator in ObjectIdGenerator, line 6")
	IdGenerator_new_IdGenerator(1213018160, "when calling new_IdGenerator in ObjectIdGenerator, line 7")
	IdGenerator_new_IdGenerator(1095577648, "when calling new_IdGenerator in ObjectIdGenerator, line 8")
	IdGenerator_new_IdGenerator(1112354864, "when calling new_IdGenerator in ObjectIdGenerator, line 9")
	IdGenerator_new_IdGenerator(1229795376, "when calling new_IdGenerator in ObjectIdGenerator, line 10")
	IdGenerator_new_IdGenerator(1380790320, "when calling new_IdGenerator in ObjectIdGenerator, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIds(__wurst_stackPos324) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos324
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_OnUnitEnterLeave(__wurst_stackPos336) 
	local i20 = nil
	local temp10 = nil
	local clVar31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos336
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_eventTrigger = CreateTrigger()
	OnUnitEnterLeave_preplacedUnits = CreateGroup()
	OnUnitEnterLeave_tempUnitsCount = 0
	OnUnitEnterLeave_ABILITY_ID = intEnsure(1095577649)
	i20 = 0
	temp10 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i20 > temp10) then
			break
		end
		player_setAbilityAvailable(Player_players[i20], OnUnitEnterLeave_ABILITY_ID, false, "when calling setAbilityAvailable in OnUnitEnterLeave, line 64")
		i20 = (i20 + 1)
	end
	clVar31 = CallbackSingle_nullTimer_OnUnitEnterLeave:create41()
	CallbackSingle_construct_CallbackSingle(clVar31, "when calling construct_CallbackSingle in OnUnitEnterLeave, line 66")
	nullTimer(clVar31, "when calling nullTimer in OnUnitEnterLeave, line 66")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushUnit1(u25, __wurst_stackPos486) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos486
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnits[OnUnitEnterLeave_tempUnitsCount] = u25
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit1(__wurst_stackPos487) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos487
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getEnterLeaveUnit(__wurst_stackPos488) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos488
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (OnUnitEnterLeave_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return OnUnitEnterLeave_tempUnits[(OnUnitEnterLeave_tempUnitsCount - 1)]
end

function onEnter(c4, __wurst_stackPos489) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos489
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(OnUnitEnterLeave_eventTrigger, __wurst_safe_Filter(c4), "when calling addCondition in OnUnitEnterLeave, line 46")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onLeave(c5, __wurst_stackPos491) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos491
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addAction(OnUnitEnterLeave_eventTrigger, c5, "when calling addAction in OnUnitEnterLeave, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function prepareUnit(u9, __wurst_stackPos197) 
	local receiver37 = nil
	local receiver38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos197
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver37 = u9
	unit_addAbility(receiver37, OnUnitEnterLeave_ABILITY_ID, "when calling addAbility in OnUnitEnterLeave, line 56")
	receiver38 = receiver37
	unit_makeAbilityPermanent(receiver38, OnUnitEnterLeave_ABILITY_ID, true, "when calling makeAbilityPermanent in OnUnitEnterLeave, line 56")
	pushUnit1(u9, "when calling pushUnit in OnUnitEnterLeave, line 57")
	trigger_evaluate(OnUnitEnterLeave_eventTrigger, "when calling evaluate in OnUnitEnterLeave, line 58")
	popUnit1("when calling popUnit in OnUnitEnterLeave, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave(__wurst_stackPos493) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos493
	wurst_stack_depth = (wurst_stack_depth + 1)
	prepareUnit(GetFilterUnit(), "when calling prepareUnit in OnUnitEnterLeave, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave(__wurst_stackPos494) 
	local leavingUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos494
	wurst_stack_depth = (wurst_stack_depth + 1)
	leavingUnit = GetTriggerUnit()
	if ((unit_getAbilityLevel(leavingUnit, OnUnitEnterLeave_ABILITY_ID, "when calling getAbilityLevel in OnUnitEnterLeave, line 73") == 0) and (GetIssuedOrderId() == OrderIds_undefend)) then
		pushUnit1(leavingUnit, "when calling pushUnit in OnUnitEnterLeave, line 74")
		trigger_execute(OnUnitEnterLeave_eventTrigger, "when calling execute in OnUnitEnterLeave, line 75")
		popUnit1("when calling popUnit in OnUnitEnterLeave, line 76")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Orders(__wurst_stackPos335) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos335
	wurst_stack_depth = (wurst_stack_depth + 1)
	OrderIds_rejuvination = 852160
	OrderIds_sleep = 852227
	OrderIds_thunderbolt = 852095
	OrderIds_undefend = 852056
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos303) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos303
	wurst_stack_depth = (wurst_stack_depth + 1)
	Player_localPlayer = GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos496) 
	local i21 = nil
	local temp11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos496
	wurst_stack_depth = (wurst_stack_depth + 1)
	i21 = 0
	temp11 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i21 > temp11) then
			break
		end
		Player_players[i21] = Player(i21)
		i21 = (i21 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setGold(this284, val3, __wurst_stackPos497) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos497
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this284, PLAYER_STATE_RESOURCE_GOLD, val3, "when calling setState in Player, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setState(this285, state, val4, __wurst_stackPos498) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos498
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this285, state, val4)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addGold(this246, val1, __wurst_stackPos419) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos419
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_addState(this246, PLAYER_STATE_RESOURCE_GOLD, val1, "when calling addState in Player, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addState(this286, state1, val5, __wurst_stackPos499) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos499
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this286, state1, (player_getState(this286, state1, "when calling getState in Player, line 31") + val5))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setLumber(this288, val6, __wurst_stackPos501) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos501
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this288, PLAYER_STATE_RESOURCE_LUMBER, val6, "when calling setState in Player, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_getState(this287, state2, __wurst_stackPos500) 
	local stackTrace_tempReturn41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos500
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn41 = __wurst_safe_GetPlayerState(this287, state2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn41
end

function player_getId(this289, __wurst_stackPos502) 
	local stackTrace_tempReturn42 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos502
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn42 = __wurst_safe_GetPlayerId(this289)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn42
end

function player_getName(this290, __wurst_stackPos503) 
	local stackTrace_tempReturn43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos503
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn43 = player_getName1(this290, false, "when calling getName in Player, line 83")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn43
end

function player_getName1(this291, removeHash, __wurst_stackPos504) 
	local cond_result5 = nil
	local stackTrace_tempReturn44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos504
	wurst_stack_depth = (wurst_stack_depth + 1)
	if removeHash then
		cond_result5 = string_substring(__wurst_safe_GetPlayerName(this291), 0, string_indexOf(__wurst_safe_GetPlayerName(this291), "#", "when calling indexOf in Player, line 87"), "when calling substring in Player, line 87")
	else
		cond_result5 = __wurst_safe_GetPlayerName(this291)
	end
	stackTrace_tempReturn44 = cond_result5
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn44
end

function player_isAllyOf(this6, p, __wurst_stackPos6) 
	local stackTrace_tempReturn45 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos6
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn45 = __wurst_safe_IsPlayerAlly(this6, p)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn45
end

function player_isEnemyOf(this58, p2, __wurst_stackPos68) 
	local stackTrace_tempReturn46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos68
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn46 = __wurst_safe_IsPlayerEnemy(this58, p2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn46
end

function player_setAbilityAvailable(this280, abilityId4, avail, __wurst_stackPos485) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos485
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerAbilityAvailable(this280, abilityId4, avail)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Playercolor(__wurst_stackPos313) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos313
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Preloader(__wurst_stackPos332) 
	local clVar32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos332
	wurst_stack_depth = (wurst_stack_depth + 1)
	Preloader_autoFinish = true
	Preloader_dumg = CreateGroup()
	Preloader_dum = createUnit(Basics_DUMMY_PLAYER, UnitIds_shade, MapBounds_playableMin, ({0., }), "when calling createUnit in Preloader, line 53")
	unit_setInvulnerable(Preloader_dum, true, "when calling setInvulnerable in Preloader, line 54")
	if (Preloader_dum == nil) then
		error1("DUMMY_UNITID not added correctly to the map.", "when calling error in Preloader, line 56")
	end
	if Preloader_autoFinish then
		clVar32 = CallbackSingle_nullTimer_Preloader:create43()
		CallbackSingle_construct_CallbackSingle(clVar32, "when calling construct_CallbackSingle in Preloader, line 58")
		nullTimer(clVar32, "when calling nullTimer in Preloader, line 58")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function finishPreload(__wurst_stackPos200) 
	local clVar33 = nil
	local temp63 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos200
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(Preloader_dum, "when calling remove in Preloader, line 47")
	temp63 = Preloader_dumg
	clVar33 = ForGroupCallback_forEachFrom_Preloader:create42()
	group_forEachFrom(temp63, clVar33, "when calling forEachFrom in Preloader, line 48")
	group_destr(Preloader_dumg, "when calling destr in Preloader, line 49")
	Preloader_dumg = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos304) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos304
	wurst_stack_depth = (wurst_stack_depth + 1)
	Printing_DEBUG_LEVEL = 2
	Printing_DEBUG_MSG_DURATION = 45.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Loglevel_getTag(this294, __wurst_stackPos507) 
	local temp12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos507
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp12 = this294
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

function printLog(showTo, loglvl, msg6, __wurst_stackPos508) 
	local compositeMsg = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos508
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Printing_DEBUG_LEVEL <= loglvl) then
		compositeMsg = stringConcat(stringConcat(Loglevel_getTag(loglvl, "when calling getTag in Printing, line 81"), " - "), msg6)
		__wurst_safe_DisplayTimedTextToPlayer(showTo, 0., 0., Printing_DEBUG_MSG_DURATION, compositeMsg)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print1(msg1, __wurst_stackPos75) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos75
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_trace(msg2, __wurst_stackPos390) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos390
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 0, msg2, "when calling printLog in Printing, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_warn(msg5, __wurst_stackPos454) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos454
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 3, msg5, "when calling printLog in Printing, line 45")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_error(msg4, __wurst_stackPos434) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos434
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 4, msg4, "when calling printLog in Printing, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos310) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos310
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos295) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos295
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function real_squared(this295, __wurst_stackPos509) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos509
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this295 * this295)
end

function real_toInt(this189, __wurst_stackPos221) 
	local stackTrace_tempReturn47 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos221
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn47 = R2I(this189)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn47
end

function rect_getMinX(this269, __wurst_stackPos474) 
	local stackTrace_tempReturn48 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos474
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn48 = __wurst_safe_GetRectMinX(this269)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn48
end

function rect_getMaxX(this271, __wurst_stackPos476) 
	local stackTrace_tempReturn49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos476
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn49 = __wurst_safe_GetRectMaxX(this271)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn49
end

function rect_getMinY(this270, __wurst_stackPos475) 
	local stackTrace_tempReturn50 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos475
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn50 = __wurst_safe_GetRectMinY(this270)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn50
end

function rect_getMaxY(this272, __wurst_stackPos477) 
	local stackTrace_tempReturn51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos477
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn51 = __wurst_safe_GetRectMaxY(this272)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn51
end

function init_Recycle(__wurst_stackPos361) 
	local iterator15 = nil
	local u26 = nil
	local clVar34 = nil
	local temp64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos361
	wurst_stack_depth = (wurst_stack_depth + 1)
	Recycle_RECYCLE_ID = intEnsure(1095577703)
	group_enumUnitsOfType(Group_ENUM_GROUP, 1697656882, nil, "when calling enumUnitsOfType in Recycle, line 36")
	iterator15 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Recycle, line 37")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator15, "when calling hasNext in Recycle, line 37")) then
			break
		end
		u26 = GroupIterator_GroupIterator_next(iterator15, "when calling next in Recycle, line 37")
		__wurst_safe_UnitAddAbility(u26, Recycle_RECYCLE_ID)
	end
	GroupIterator_GroupIterator_close(iterator15, "when calling close in Recycle, line 37")
	temp64 = EVENT_PLAYER_UNIT_DEATH
	clVar34 = EventListener_add_Recycle:create44()
	EventListener_construct_EventListener(clVar34, "when calling construct_EventListener in Recycle, line 41")
	EventListener_add(temp64, clVar34, "when calling add in Recycle, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function region_addRect(this268, rct, __wurst_stackPos473) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos473
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RegionAddRect(this268, rct)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_RegisterEvents(__wurst_stackPos334) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos334
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

function registerPlayerUnitEvent1(p5, c, __wurst_stackPos196) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos196
	wurst_stack_depth = (wurst_stack_depth + 1)
	registerPlayerUnitEvent(p5, nil, c, nil, "when calling registerPlayerUnitEvent in RegisterEvents, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function registerPlayerUnitEvent(p1, filter2, condition, action, __wurst_stackPos29) 
	local hid = nil
	local k = nil
	local cond_result6 = nil
	local temp65 = nil
	local temp66 = nil
	local temp67 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos29
	wurst_stack_depth = (wurst_stack_depth + 1)
	hid = handle_getHandleId(p1, "when calling getHandleId in RegisterEvents, line 17")
	if (RegisterEvents_t[hid] == nil) then
		RegisterEvents_t[hid] = CreateTrigger()
		k = (bj_MAX_PLAYER_SLOTS - 1)
		while true do
			if (k < 0) then
				break
			end
			temp65 = RegisterEvents_t[hid]
			temp66 = Player_players[k]
			temp67 = p1
			if not((filter2 == nil)) then
				cond_result6 = __wurst_safe_Filter(filter2)
			else
				cond_result6 = nil
			end
			trigger_registerPlayerUnitEvent(temp65, temp66, temp67, cond_result6, "when calling registerPlayerUnitEvent in RegisterEvents, line 21")
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

function code__registerPlayerUnitEvent_RegisterEvents(__wurst_stackPos511) 
	local stackTrace_tempReturn52 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos511
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn52 = trigger_evaluate(__wurst_objectFromIndex(intEnsure(HashMap_HashMap_get(RegisterEvents_onCastMap, GetSpellAbilityId(), "when calling get in RegisterEvents, line 58"))), "when calling evaluate in RegisterEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn52
end

function init_Scoreboard(__wurst_stackPos347) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos347
	wurst_stack_depth = (wurst_stack_depth + 1)
	setupPlayerColors("when calling setupPlayerColors in Scoreboard, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupPlayerColors(__wurst_stackPos512) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos512
	wurst_stack_depth = (wurst_stack_depth + 1)
	Scoreboard_playerColors[0] = ({255, 2, 2, 255, })
	Scoreboard_playerColors[1] = ({0, 65, 255, 255, })
	Scoreboard_playerColors[2] = ({27, 229, 184, 255, })
	Scoreboard_playerColors[3] = ({83, 0, 128, 255, })
	Scoreboard_playerColors[4] = ({255, 252, 0, 255, })
	Scoreboard_playerColors[5] = ({254, 137, 13, 255, })
	Scoreboard_playerColors[6] = ({31, 191, 0, 255, })
	Scoreboard_playerColors[7] = ({228, 90, 175, 255, })
	Scoreboard_playerColors[8] = ({148, 149, 150, 255, })
	Scoreboard_playerColors[9] = ({125, 190, 241, 255, })
	Scoreboard_playerColors[10] = ({15, 97, 69, 255, })
	Scoreboard_playerColors[11] = ({77, 41, 3, 255, })
	Scoreboard_playerColors[12] = ({155, 0, 0, 255, })
	Scoreboard_playerColors[13] = ({0, 0, 195, 255, })
	Scoreboard_playerColors[14] = ({0, 234, 255, 255, })
	Scoreboard_playerColors[15] = ({190, 0, 254, 255, })
	Scoreboard_playerColors[16] = ({235, 205, 135, 255, })
	Scoreboard_playerColors[17] = ({248, 164, 139, 255, })
	Scoreboard_playerColors[18] = ({191, 255, 128, 255, })
	Scoreboard_playerColors[19] = ({220, 185, 235, 255, })
	Scoreboard_playerColors[20] = ({40, 40, 40, 255, })
	Scoreboard_playerColors[21] = ({235, 240, 255, 255, })
	Scoreboard_playerColors[22] = ({0, 120, 30, 255, })
	Scoreboard_playerColors[23] = ({164, 111, 51, 255, })
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getActivePlayers(__wurst_stackPos513) 
	local count1 = nil
	local i22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos513
	wurst_stack_depth = (wurst_stack_depth + 1)
	count1 = 0
	i22 = 0
	while true do
		if (i22 > 23) then
			break
		end
		if (__wurst_safe_GetPlayerSlotState(Player_players[i22]) == PLAYER_SLOT_STATE_PLAYING) then
			count1 = (count1 + 1)
		end
		i22 = (i22 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return count1
end

function updatePlayerIncome(__wurst_stackPos514) 
	local playerCount = nil
	local i23 = nil
	local temp13 = nil
	local iterator16 = nil
	local cp2 = nil
	local owner5 = nil
	local ownerId = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos514
	wurst_stack_depth = (wurst_stack_depth + 1)
	playerCount = getActivePlayers("when calling getActivePlayers in Scoreboard, line 50")
	i23 = 0
	temp13 = (playerCount - 1)
	while true do
		if (i23 > temp13) then
			break
		end
		ControlPoint_playerIncome[i23] = 0
		ControlPoint_playerCpCount[i23] = 0
		i23 = (i23 + 1)
	end
	iterator16 = group_iterator(ControlPoint_controlPoints, "when calling iterator in Scoreboard, line 57")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator16, "when calling hasNext in Scoreboard, line 57")) then
			break
		end
		cp2 = GroupIterator_GroupIterator_next(iterator16, "when calling next in Scoreboard, line 57")
		owner5 = playerFromIndex(intEnsure(HashMap_HashMap_get(ControlPoint_cpOwners, __wurst_objectToIndex(cp2), "when calling get in Scoreboard, line 58")), "when calling playerFromIndex in Scoreboard, line 58")
		ownerId = player_getId(owner5, "when calling getId in Scoreboard, line 59")
		ControlPoint_playerIncome[ownerId] = (intEnsure(ControlPoint_playerIncome[ownerId]) + intEnsure(HashMap_HashMap_get(ControlPoint_cpValues, __wurst_objectToIndex(cp2), "when calling get in Scoreboard, line 60")))
		ControlPoint_playerCpCount[ownerId] = (intEnsure(ControlPoint_playerCpCount[ownerId]) + 1)
	end
	GroupIterator_GroupIterator_close(iterator16, "when calling close in Scoreboard, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupMultiboard(__wurst_stackPos64) 
	local h0 = nil
	local h1 = nil
	local h2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos64
	wurst_stack_depth = (wurst_stack_depth + 1)
	Scoreboard_incomeBoard = CreateMultiboard()
	__wurst_safe_MultiboardSetColumnCount(Scoreboard_incomeBoard, 3)
	__wurst_safe_MultiboardSetRowCount(Scoreboard_incomeBoard, (getActivePlayers("when calling getActivePlayers in Scoreboard, line 81") + 1))
	__wurst_safe_MultiboardSetTitleText(Scoreboard_incomeBoard, "Statistics")
	h0 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, 0, 0)
	h1 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, 0, 1)
	h2 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, 0, 2)
	__wurst_safe_MultiboardSetItemValue(h0, "")
	__wurst_safe_MultiboardSetItemValue(h1, "CP")
	__wurst_safe_MultiboardSetItemValue(h2, "Income")
	__wurst_safe_MultiboardSetItemWidth(h0, 0.08)
	__wurst_safe_MultiboardSetItemWidth(h1, 0.05)
	__wurst_safe_MultiboardSetItemWidth(h2, 0.05)
	__wurst_safe_MultiboardSetItemStyle(h0, false, false)
	__wurst_safe_MultiboardSetItemIcon(h1, "ReplaceableTextures\\CommandButtons\\BTNCOP.blp")
	__wurst_safe_MultiboardSetItemStyle(h1, false, true)
	__wurst_safe_MultiboardSetItemIcon(h2, "ReplaceableTextures\\CommandButtons\\btnmgexchange.blp")
	__wurst_safe_MultiboardSetItemStyle(h2, false, true)
	__wurst_safe_MultiboardReleaseItem(h0)
	__wurst_safe_MultiboardReleaseItem(h1)
	__wurst_safe_MultiboardReleaseItem(h2)
	__wurst_safe_MultiboardDisplay(Scoreboard_incomeBoard, true)
	__wurst_safe_MultiboardMinimize(Scoreboard_incomeBoard, false)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function updateMultiboard(__wurst_stackPos65) 
	local row4 = nil
	local playerCount1 = nil
	local i24 = nil
	local temp14 = nil
	local item1 = nil
	local item2 = nil
	local item3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos65
	wurst_stack_depth = (wurst_stack_depth + 1)
	updatePlayerIncome("when calling updatePlayerIncome in Scoreboard, line 110")
	row4 = 1
	playerCount1 = getActivePlayers("when calling getActivePlayers in Scoreboard, line 112")
	i24 = 0
	temp14 = (playerCount1 - 1)
	while true do
		if (i24 > temp14) then
			break
		end
		if (__wurst_safe_GetPlayerSlotState(Player_players[i24]) == PLAYER_SLOT_STATE_PLAYING) then
			item1 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, row4, 0)
			item2 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, row4, 1)
			item3 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, row4, 2)
			__wurst_safe_MultiboardSetItemWidth(item1, 0.08)
			__wurst_safe_MultiboardSetItemWidth(item2, 0.05)
			__wurst_safe_MultiboardSetItemWidth(item3, 0.05)
			__wurst_safe_MultiboardSetItemStyle(item1, true, false)
			__wurst_safe_MultiboardSetItemStyle(item2, true, false)
			__wurst_safe_MultiboardSetItemStyle(item3, true, false)
			__wurst_safe_MultiboardSetItemValue(item1, player_getName(Player_players[i24], "when calling getName in Scoreboard, line 124"))
			multiboard_setItemValueColor1(Scoreboard_incomeBoard, row4, 0, Scoreboard_playerColors[i24], "when calling setItemValueColor in Scoreboard, line 125")
			__wurst_safe_MultiboardSetItemValue(item2, int_toString(intEnsure(ControlPoint_playerCpCount[i24]), "when calling toString in Scoreboard, line 126"))
			__wurst_safe_MultiboardSetItemValue(item3, int_toString(intEnsure(ControlPoint_playerIncome[i24]), "when calling toString in Scoreboard, line 127"))
			__wurst_safe_MultiboardReleaseItem(item1)
			__wurst_safe_MultiboardReleaseItem(item2)
			__wurst_safe_MultiboardReleaseItem(item3)
			row4 = (row4 + 1)
		end
		i24 = (i24 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_SeedBurst(__wurst_stackPos345) 
	local clVar35 = nil
	local temp68 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos345
	wurst_stack_depth = (wurst_stack_depth + 1)
	SeedBurst_SEED_BURST_ID = intEnsure(1095577657)
	SeedBurst_BURST_DAMAGE[0] = 75.
	SeedBurst_BURST_DAMAGE[1] = 125.
	SeedBurst_BURST_DAMAGE[2] = 200.
	SeedBurst_BURST_RADIUS[0] = 256.
	SeedBurst_BURST_RADIUS[1] = 320.
	SeedBurst_BURST_RADIUS[2] = 384.
	SeedBurst_BURST_DELAY = 0.15
	SeedBurst_BURST_SFX = "Abilities\\Spells\\Other\\Entangle\\EntangledTarget.mdl"
	SeedBurst_EXPLOSION_SFX = "Abilities\\Weapons\\GryphonRider\\GryphonRiderMissileArt.mdl"
	SeedBurst_INVIGORATE_BUFF_ID = 1114793322
	temp68 = SeedBurst_SEED_BURST_ID
	clVar35 = OnCastListener_onCast_SeedBurst:create45()
	OnCastListener_construct_OnCastListener(clVar35, "when calling construct_OnCastListener in SeedBurst, line 80")
	EventListener_onCast(temp68, clVar35, "when calling onCast in SeedBurst, line 80")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ShieldBash(__wurst_stackPos362) 
	local clVar36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos362
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1112354870)
	ShieldBash_MY_ABILITY_ID = intEnsure(1095577701)
	intEnsure(1095577702)
	intEnsure(2016423986)
	ShieldBash_ARMOR_BONUS = 4
	ShieldBash_REFLECT_CHANCE = 0.25
	ShieldBash_REFLECT_DAMAGE = 40.
	ShieldBash_REFLECT_SFX = "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl"
	stringConcat(stringConcat(stringConcat(stringConcat("Increases armor by ", int_toString(ShieldBash_ARMOR_BONUS, "when calling toString in ShieldBash, line 23")), " and has a "), int_toString(real_toInt((ShieldBash_REFLECT_CHANCE * 100.), "when calling toInt in ShieldBash, line 23"), "when calling toString in ShieldBash, line 23")), "% chance to retaliate.")
	clVar36 = DamageListener_addListener_ShieldBash:create48()
	DamageListener_construct_DamageListener(clVar36, "when calling construct_DamageListener in ShieldBash, line 85")
	DamageEvent_addListener(clVar36, "when calling addListener in ShieldBash, line 85")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onDamageTaken(__wurst_stackPos212) 
	local victim = nil
	local attacker1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos212
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

function init_SpiritWisps(__wurst_stackPos352) 
	local clVar37 = nil
	local temp69 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos352
	wurst_stack_depth = (wurst_stack_depth + 1)
	SpiritWisps_SPIRIT_WISPS_ID = intEnsure(1095577700)
	SpiritWisps_WISP_BUFF_ID = intEnsure(1112354869)
	SpiritWisps_WISP_UNIT_ID = UnitIds_wisp
	SpiritWisps_WISP_COUNT = 3
	SpiritWisps_WISP_DURATION = 10.
	SpiritWisps_WISP_HEAL = 15.
	SpiritWisps_WISP_RADIUS = 400.
	SpiritWisps_HEAL_INTERVAL = 1.
	SpiritWisps_ORBIT_RADIUS = 150.
	SpiritWisps_UPDATE_INTERVAL = 0.05
	temp69 = SpiritWisps_SPIRIT_WISPS_ID
	clVar37 = OnCastListener_onCast_SpiritWisps:create49()
	OnCastListener_construct_OnCastListener(clVar37, "when calling construct_OnCastListener in SpiritWisps, line 58")
	EventListener_onCast(temp69, clVar37, "when calling onCast in SpiritWisps, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_String(__wurst_stackPos300) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos300
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_StringUtils(__wurst_stackPos358) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos358
	wurst_stack_depth = (wurst_stack_depth + 1)
	StringUtils_MAX_INDEX = (126 + 1)
	initialize1("when calling initialize in StringUtils, line 186")
	__wurst_stringToIndex("")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initialize1(__wurst_stackPos516) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos516
	wurst_stack_depth = (wurst_stack_depth + 1)
	c2sInit("when calling c2sInit in StringUtils, line 181")
	s2cInit("when calling s2cInit in StringUtils, line 182")
	widthInit("when calling widthInit in StringUtils, line 183")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function c2sInit(__wurst_stackPos517) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos517
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

function s2cInit(__wurst_stackPos518) 
	local i25 = nil
	local temp15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos518
	wurst_stack_depth = (wurst_stack_depth + 1)
	i25 = 0
	temp15 = StringUtils_MAX_INDEX
	while true do
		if (i25 > temp15) then
			break
		end
		if (string_toUpperCase(stringEnsure(StringUtils_c2s[i25]), "when calling toUpperCase in StringUtils, line 321") == stringEnsure(StringUtils_c2s[i25])) then
		end
		i25 = (i25 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widthInit(__wurst_stackPos519) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos519
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this297, __wurst_stackPos515) 
	local stackTrace_tempReturn53 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos515
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn53 = StringLength(this297)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn53
end

function string_substring(this292, start2, stop, __wurst_stackPos505) 
	local stackTrace_tempReturn54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos505
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn54 = SubString(this292, start2, stop)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn54
end

function string_toUpperCase(this298, __wurst_stackPos520) 
	local stackTrace_tempReturn55 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos520
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn55 = StringCase(this298, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn55
end

function string_indexOf(this293, s, __wurst_stackPos506) 
	local len = nil
	local i26 = nil
	local temp16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos506
	wurst_stack_depth = (wurst_stack_depth + 1)
	len = string_length(s, "when calling length in String, line 143")
	i26 = 0
	temp16 = (string_length(this293, "when calling length in String, line 144") - len)
	while true do
		if (i26 > temp16) then
			break
		end
		if (string_substring(this293, i26, (i26 + len), "when calling substring in String, line 145") == s) then
			wurst_stack_depth = (wurst_stack_depth - 1)
			return i26
		end
		i26 = (i26 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return -1
end

function string_getHash(this245, __wurst_stackPos415) 
	local stackTrace_tempReturn56 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos415
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn56 = StringHash(this245)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn56
end

function init_SummonTreant(__wurst_stackPos344) 
	local clVar38 = nil
	local temp70 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos344
	wurst_stack_depth = (wurst_stack_depth + 1)
	SummonTreant_SUMMON_TREANT_ID = intEnsure(1095577656)
	SummonTreant_TREANT_UNIT_ID = 1697656882
	SummonTreant_TREANT_DURATION[0] = 15.
	SummonTreant_TREANT_DURATION[1] = 20.
	SummonTreant_TREANT_DURATION[2] = 25.
	SummonTreant_BONUS_TREANTS[0] = 0
	SummonTreant_BONUS_TREANTS[1] = 1
	SummonTreant_BONUS_TREANTS[2] = 2
	temp70 = SummonTreant_SUMMON_TREANT_ID
	clVar38 = OnCastListener_onCast_SummonTreant:create53()
	OnCastListener_construct_OnCastListener(clVar38, "when calling construct_OnCastListener in SummonTreant, line 69")
	EventListener_onCast(temp70, clVar38, "when calling onCast in SummonTreant, line 69")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Table(__wurst_stackPos311) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos311
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime3
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TargetsAllowed(__wurst_stackPos325) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos325
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ThickBark(__wurst_stackPos364) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos364
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1095577704)
	intEnsure(1380790321)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ThrowExplosives(__wurst_stackPos365) 
	local clVar39 = nil
	local temp71 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos365
	wurst_stack_depth = (wurst_stack_depth + 1)
	ThrowExplosives_THROW_EXPLOSIVES_ID = intEnsure(1095577705)
	ThrowExplosives_BARREL_UNIT_ID = 1697656886
	ThrowExplosives_FUSE_DURATION = 3.
	ThrowExplosives_EXPLODE_RADIUS = 350.
	ThrowExplosives_EXPLODE_DAMAGE = 400.
	ThrowExplosives_FUSE_SFX = "Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeEmbers.mdl"
	ThrowExplosives_EXPLODE_SFX = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"
	temp71 = ThrowExplosives_THROW_EXPLOSIVES_ID
	clVar39 = OnCastListener_onCast_ThrowExplosives:create56()
	OnCastListener_construct_OnCastListener(clVar39, "when calling construct_OnCastListener in ThrowExplosives, line 60")
	EventListener_onCast(temp71, clVar39, "when calling onCast in ThrowExplosives, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_createTimerDialog(this247, __wurst_stackPos420) 
	local stackTrace_tempReturn57 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos420
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn57 = __wurst_safe_CreateTimerDialog(this247)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn57
end

function init_TimerUtils(__wurst_stackPos328) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos328
	wurst_stack_depth = (wurst_stack_depth + 1)
	TimerUtils_freeTimersCount = 0
	TimerUtils_timerData = Table_new_Table("when calling new_Table in TimerUtils, line 13")
	TimerUtils_HELD = 679645218
	HashMap_new_HashMap("when calling new_HashMap in TimerUtils, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_setData(this42, data, __wurst_stackPos48) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos48
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveInt(TimerUtils_timerData, handle_getTCHandleId(this42, "when calling getTCHandleId in TimerUtils, line 18"), data, "when calling saveInt in TimerUtils, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_getData(this243, __wurst_stackPos409) 
	local stackTrace_tempReturn58 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos409
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn58 = Table_Table_loadInt(TimerUtils_timerData, handle_getTCHandleId(this243, "when calling getTCHandleId in TimerUtils, line 22"), "when calling loadInt in TimerUtils, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn58
end

function getTimer(__wurst_stackPos406) 
	local receiver39 = nil
	local stackTrace_tempReturn59 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos406
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (TimerUtils_freeTimersCount > 0) then
		TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount - 1)
		timer_setData(TimerUtils_freeTimers[TimerUtils_freeTimersCount], 0, "when calling setData in TimerUtils, line 30")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return TimerUtils_freeTimers[TimerUtils_freeTimersCount]
	else
		receiver39 = CreateTimer()
		timer_setData(receiver39, 0, "when calling setData in TimerUtils, line 33")
		stackTrace_tempReturn59 = receiver39
		wurst_stack_depth = (wurst_stack_depth - 1)
		return stackTrace_tempReturn59
	end
end

function timer_release(this48, __wurst_stackPos54) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos54
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (this48 == nil) then
		error1("Trying to release a null timer", "when calling error in TimerUtils, line 38")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	if (timer_getData(this48, "when calling getData in TimerUtils, line 40") == TimerUtils_HELD) then
		error1("ReleaseTimer: Double free!", "when calling error in TimerUtils, line 41")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	timer_setData(this48, TimerUtils_HELD, "when calling setData in TimerUtils, line 43")
	timer_pause(this48, "when calling pause in TimerUtils, line 44")
	TimerUtils_freeTimers[TimerUtils_freeTimersCount] = this48
	TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_pause(this300, __wurst_stackPos522) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos522
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseTimer(this300)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_start(this50, time3, timerCallBack1, __wurst_stackPos56) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos56
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this50, time3, false, timerCallBack1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_startPeriodic(this43, time1, timerCallBack, __wurst_stackPos49) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos49
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this43, time1, true, timerCallBack)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_addAction(this21, actionFunc, __wurst_stackPos25) 
	local stackTrace_tempReturn60 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos25
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn60 = __wurst_safe_TriggerAddAction(this21, actionFunc)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn60
end

function trigger_addCondition(this281, condition1, __wurst_stackPos490) 
	local stackTrace_tempReturn61 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos490
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn61 = __wurst_safe_TriggerAddCondition(this281, condition1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn61
end

function trigger_evaluate(this217, __wurst_stackPos250) 
	local stackTrace_tempReturn62 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos250
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn62 = __wurst_safe_TriggerEvaluate(this217)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn62
end

function trigger_execute(this283, __wurst_stackPos495) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos495
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TriggerExecute(this283)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_registerEnterRegion(this169, whichRegion, filter3, __wurst_stackPos195) 
	local stackTrace_tempReturn63 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos195
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn63 = __wurst_safe_TriggerRegisterEnterRegion(this169, whichRegion, filter3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn63
end

function trigger_registerPlayerChatEvent(this23, whichPlayer1, chatMessageToDetect, exactMatchOnly, __wurst_stackPos28) 
	local stackTrace_tempReturn64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos28
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn64 = __wurst_safe_TriggerRegisterPlayerChatEvent(this23, whichPlayer1, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn64
end

function trigger_registerPlayerEvent(this22, whichPlayer, whichPlayerEvent, __wurst_stackPos27) 
	local stackTrace_tempReturn65 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos27
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn65 = __wurst_safe_TriggerRegisterPlayerEvent(this22, whichPlayer, whichPlayerEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn65
end

function trigger_registerPlayerUnitEvent(this296, whichPlayer18, whichPlayerUnitEvent, filter9, __wurst_stackPos510) 
	local stackTrace_tempReturn66 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos510
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn66 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this296, whichPlayer18, whichPlayerUnitEvent, filter9)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn66
end

function trigger_registerUnitEvent(this248, whichUnit7, whichEvent1, __wurst_stackPos422) 
	local stackTrace_tempReturn67 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos422
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn67 = __wurst_safe_TriggerRegisterUnitEvent(this248, whichUnit7, whichEvent1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn67
end

function init_TypeCasting(__wurst_stackPos319) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos319
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	TypeCasting_R2I_PRECISION = 1000.
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos523) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos523
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function handle_getTCHandleId(this299, __wurst_stackPos521) 
	local stackTrace_tempReturn68 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos521
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn68 = GetHandleId(this299)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn68
end

function realToIndex(r4, __wurst_stackPos470) 
	local stackTrace_tempReturn69 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos470
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn69 = real_toInt((r4 * TypeCasting_R2I_PRECISION), "when calling toInt in TypeCasting, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn69
end

function stringToIndex(s1, __wurst_stackPos524) 
	return __wurst_stringToIndex(s1)
end

function playerFromIndex(index7, __wurst_stackPos418) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos418
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Player_players[index7]
end

function playerToIndex(object, __wurst_stackPos424) 
	local stackTrace_tempReturn70 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos424
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn70 = player_getId(object, "when calling getId in TypeCasting, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn70
end

function unitFromIndex(index9, __wurst_stackPos525) 
	return __wurst_objectFromIndex(index9)
end

function unitToIndex(object1, __wurst_stackPos526) 
	return __wurst_objectToIndex(object1)
end

function groupToIndex(object2, __wurst_stackPos527) 
	return __wurst_objectToIndex(object2)
end

function triggerFromIndex(index10, __wurst_stackPos528) 
	return __wurst_objectFromIndex(index10)
end

function booleanToIndex(u8, __wurst_stackPos185) 
	local cond_result7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos185
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	if u8 then
		cond_result7 = 1
	else
		cond_result7 = 0
	end
	return cond_result7
end

function booleanFromIndex(index2, __wurst_stackPos187) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos187
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (index2 == 1)
end

function init_UnitIds(__wurst_stackPos330) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos330
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIds_shade = 1970497636
	UnitIds_wisp = 1702327152
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UnitIndexer(__wurst_stackPos337) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos337
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

function pushUnit(u17, __wurst_stackPos249) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos249
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnits[UnitIndexer_tempUnitsCount] = u17
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit(__wurst_stackPos251) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos251
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function shouldIndex(_u1, __wurst_stackPos529) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos529
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function unit_getIndex(this33, __wurst_stackPos39) 
	local stackTrace_tempReturn71 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos39
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn71 = unit_getUserData(this33, "when calling getUserData in UnitIndexer, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn71
end

function unit_toUnitIndex(this302, __wurst_stackPos531) 
	local instance = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos531
	wurst_stack_depth = (wurst_stack_depth + 1)
	instance = __wurst_objectFromIndex(unit_getUserData(this302, "when calling getUserData in UnitIndexer, line 132"))
	if (instance == nil) then
		instance = UnitIndex_new_UnitIndex(this302, "when calling new_UnitIndex in UnitIndexer, line 135")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return instance
end

function getIndexingUnit(__wurst_stackPos392) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos392
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (UnitIndexer_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return UnitIndexer_tempUnits[(UnitIndexer_tempUnitsCount - 1)]
end

function onUnitDeindex(func1, __wurst_stackPos379) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos379
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(UnitIndexer_onDeindexTrigger, __wurst_safe_Condition(func1), "when calling addCondition in UnitIndexer, line 150")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_deindex(this303, __wurst_stackPos532) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos532
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (unit_getUserData(this303, "when calling getUserData in UnitIndexer, line 160") == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return false
	else
		UnitIndex_destroyUnitIndex(unit_toUnitIndex(this303, "when calling toUnitIndex in UnitIndexer, line 163"), "when calling destroyUnitIndex in UnitIndexer, line 163")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return true
	end
end

function code__onEnter_UnitIndexer(__wurst_stackPos533) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos533
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling shouldIndex in UnitIndexer, line 190") then
		unit_toUnitIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling toUnitIndex in UnitIndexer, line 190")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onLeave_UnitIndexer(__wurst_stackPos534) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos534
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling shouldIndex in UnitIndexer, line 191") then
		unit_deindex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling deindex in UnitIndexer, line 191")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getTypeId(this113, __wurst_stackPos133) 
	local stackTrace_tempReturn72 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos133
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn72 = __wurst_safe_GetUnitTypeId(this113)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn72
end

function unit_isType(this160, utype, __wurst_stackPos182) 
	local stackTrace_tempReturn73 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos182
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn73 = __wurst_safe_IsUnitType(this160, utype)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn73
end

function createUnit(p3, unitId, pos3, facing, __wurst_stackPos74) 
	local stackTrace_tempReturn74 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos74
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn74 = __wurst_safe_CreateUnit(p3, unitId, pos3[1], pos3[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn74
end

function unit_setFlyHeight(this304, height, rate, __wurst_stackPos535) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos535
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFlyHeight(this304, height, rate)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addAbility(this65, abil, __wurst_stackPos77) 
	local stackTrace_tempReturn75 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos77
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn75 = __wurst_safe_UnitAddAbility(this65, abil)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn75
end

function unit_setAbilityLevel(this262, abilId3, lvl2, __wurst_stackPos462) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos462
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAbilityLevel(this262, abilId3, lvl2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_makeAbilityPermanent(this282, abil2, flag1, __wurst_stackPos492) 
	local stackTrace_tempReturn76 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos492
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn76 = __wurst_safe_UnitMakeAbilityPermanent(this282, flag1, abil2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn76
end

function unit_addHP(this8, val, __wurst_stackPos8) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos8
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_addState(this8, UNIT_STATE_LIFE, val, "when calling addState in Unit, line 81")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addState(this305, state3, value17, __wurst_stackPos536) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos536
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this305, state3, (unit_getState(this305, state3, "when calling getState in Unit, line 96") + value17))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getState(this306, state4, __wurst_stackPos537) 
	local stackTrace_tempReturn77 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos537
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn77 = __wurst_safe_GetUnitState(this306, state4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn77
end

function unit_damageTarget(this59, target1, amount, attack, ranged, attackType, damageType, weaponType, __wurst_stackPos69) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos69
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_UnitDamageTarget(this59, target1, amount, attack, ranged, attackType, damageType, weaponType)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_kill(this12, __wurst_stackPos13) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos13
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_KillUnit(this12)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getAbilityLevel(this15, id, __wurst_stackPos16) 
	local stackTrace_tempReturn78 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos16
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn78 = __wurst_safe_GetUnitAbilityLevel(this15, id)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn78
end

function unit_getHP(this185, __wurst_stackPos216) 
	local stackTrace_tempReturn79 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos216
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn79 = unit_getState(this185, UNIT_STATE_LIFE, "when calling getState in Unit, line 211")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn79
end

function unit_getMaxHP(this116, __wurst_stackPos136) 
	local stackTrace_tempReturn80 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos136
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn80 = unit_getState(this116, UNIT_STATE_MAX_LIFE, "when calling getState in Unit, line 223")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn80
end

function handle_getHandleId(this236, __wurst_stackPos383) 
	local stackTrace_tempReturn81 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos383
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn81 = GetHandleId(this236)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn81
end

function unit_getName(this64, __wurst_stackPos76) 
	local stackTrace_tempReturn82 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos76
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn82 = __wurst_safe_GetUnitName(this64)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn82
end

function unit_getOwner(this7, __wurst_stackPos7) 
	local stackTrace_tempReturn83 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos7
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn83 = __wurst_safe_GetOwningPlayer(this7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn83
end

function unit_getPos(this18, __wurst_stackPos20) 
	local stackTrace_tempReturn84 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos20
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn84 = ({unit_getX(this18, "when calling getX in Unit, line 249"), unit_getY(this18, "when calling getY in Unit, line 249"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn84
end

function unit_getX(this125, __wurst_stackPos146) 
	local stackTrace_tempReturn85 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos146
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn85 = __wurst_safe_GetUnitX(this125)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn85
end

function unit_getY(this126, __wurst_stackPos147) 
	local stackTrace_tempReturn86 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos147
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn86 = __wurst_safe_GetUnitY(this126)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn86
end

function unit_getUserData(this301, __wurst_stackPos530) 
	local stackTrace_tempReturn87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos530
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn87 = __wurst_safe_GetUnitUserData(this301)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn87
end

function unit_hasAbility(this17, id1, __wurst_stackPos18) 
	local stackTrace_tempReturn88 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos18
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn88 = (__wurst_safe_GetUnitAbilityLevel(this17, id1) > 0)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn88
end

function unit_isAlive(this5, __wurst_stackPos5) 
	local stackTrace_tempReturn89 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos5
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn89 = UnitAlive(this5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn89
end

if UnitAlive then
else
	UnitAlive = function (id13) 
			error("The native 'UnitAlive' is not implemented.")
		end
end

function unit_issueTargetOrderById(this266, id11, target11, __wurst_stackPos468) 
	local stackTrace_tempReturn90 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos468
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn90 = __wurst_safe_IssueTargetOrderById(this266, id11, target11)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn90
end

function unit_pause(this119, __wurst_stackPos139) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos139
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this119, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_unpause(this123, __wurst_stackPos144) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos144
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this123, false)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_remove(this114, __wurst_stackPos134) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos134
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RemoveUnit(this114)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_removeAbility(this174, abil1, __wurst_stackPos205) 
	local stackTrace_tempReturn91 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos205
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn91 = __wurst_safe_UnitRemoveAbility(this174, abil1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn91
end

function unit_setAnimation(this234, name2, __wurst_stackPos378) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos378
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAnimation(this234, name2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setFacing(this264, a1, __wurst_stackPos466) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos466
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFacing(this264, angle_degrees(a1, "when calling degrees in Unit, line 516"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setState(this307, state5, value18, __wurst_stackPos538) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos538
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this307, state5, value18)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setInvulnerable(this66, flag, __wurst_stackPos78) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos78
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitInvulnerable(this66, flag)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setMana(this259, val2, __wurst_stackPos459) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos459
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setState(this259, UNIT_STATE_MANA, val2, "when calling setState in Unit, line 528")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setOwner(this163, p4, changeColor, __wurst_stackPos188) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos188
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitOwner(this163, p4, changeColor)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPathing(this120, value2, __wurst_stackPos140) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos140
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPathing(this120, value2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPos(this263, pos13, __wurst_stackPos464) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos464
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPosition(this263, pos13[1], pos13[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setScale(this67, scale1, __wurst_stackPos79) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos79
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitScale(this67, scale1, scale1, scale1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setUserData(this216, data1, __wurst_stackPos248) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos248
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitUserData(this216, data1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setVertexColor(this68, r1, g1, b1, a, __wurst_stackPos80) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos80
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitVertexColor(this68, r1, g1, b1, a)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setX(this308, x8, __wurst_stackPos539) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos539
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitX(this308, x8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setXY(this72, pos5, __wurst_stackPos87) 
	local receiver40 = nil
	local receiver41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos87
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver40 = this72
	unit_setX(receiver40, pos5[1], "when calling setX in Unit, line 598")
	receiver41 = receiver40
	unit_setY(receiver41, pos5[2], "when calling setY in Unit, line 598")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setY(this309, y7, __wurst_stackPos540) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos540
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitY(this309, y7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setXYZ(this261, pos12, __wurst_stackPos461) 
	local receiver42 = nil
	local receiver43 = nil
	local receiver44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos461
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver42 = this261
	unit_setX(receiver42, pos12[1], "when calling setX in Unit, line 608")
	receiver43 = receiver42
	unit_setY(receiver43, pos12[2], "when calling setY in Unit, line 608")
	receiver44 = receiver43
	unit_setFlyHeight(receiver44, pos12[3], 0., "when calling setFlyHeight in Unit, line 609")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getArmor(this118, __wurst_stackPos138) 
	local stackTrace_tempReturn92 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos138
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn92 = __wurst_safe_BlzGetUnitArmor(this118)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn92
end

function unit_setArmor(this117, armorAmount, __wurst_stackPos137) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos137
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetUnitArmor(this117, armorAmount)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UpgradeObjEditing(__wurst_stackPos363) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos363
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UrsocCharge(__wurst_stackPos366) 
	local clVar40 = nil
	local temp72 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos366
	wurst_stack_depth = (wurst_stack_depth + 1)
	UrsocCharge_URSOC_CHARGE_ID = intEnsure(1095577698)
	UrsocCharge_CHARGE_STUN_ID = intEnsure(1095577699)
	intEnsure(1112354868)
	UrsocCharge_CHARGE_DAMAGE = 100.
	UrsocCharge_CHARGE_SFX = "Abilities\\Spells\\Human\\Charge\\ChargeTarget.mdl"
	UrsocCharge_IMPACT_SFX = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"
	temp72 = UrsocCharge_URSOC_CHARGE_ID
	clVar40 = OnCastListener_onCast_UrsocCharge:create64()
	OnCastListener_construct_OnCastListener(clVar40, "when calling construct_OnCastListener in UrsocCharge, line 93")
	EventListener_onCast(temp72, clVar40, "when calling onCast in UrsocCharge, line 93")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UrsocMain(__wurst_stackPos367) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos367
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Vectors(__wurst_stackPos301) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos301
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function vec2_op_plus(this274, v2, __wurst_stackPos479) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos479
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this274[1] + v2[1]), (this274[2] + v2[2]), })
end

function vec2_op_mult(this273, factor, __wurst_stackPos478) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos478
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this273[1] * factor), (this273[2] * factor), })
end

function vec2_toVec3(this267, __wurst_stackPos469) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos469
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this267[1], this267[2], 0., })
end

function vec2_angleTo(this71, v1, __wurst_stackPos86) 
	local stackTrace_tempReturn93 = ({0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos86
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn93 = tupleCopy1(real_asAngleRadians(Atan2((v1[2] - this71[2]), (v1[1] - this71[1])), "when calling asAngleRadians in Vectors, line 127"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn93
end

function vec2_polarOffset(this73, ang, dist1, __wurst_stackPos88) 
	local stackTrace_tempReturn94 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos88
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn94 = tupleCopy(vec2_op_plus(this73, angle_toVec(ang, dist1, "when calling toVec in Vectors, line 131"), "when calling op_plus in Vectors, line 131"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn94
end

function angle_toVec(this310, len1, __wurst_stackPos541) 
	local stackTrace_tempReturn95 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos541
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn95 = ({(Cos(this310[1]) * len1), (Sin(this310[1]) * len1), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn95
end

function vec2_distanceTo(this70, v, __wurst_stackPos85) 
	local stackTrace_tempReturn96 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos85
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn96 = SquareRoot((real_squared((v[1] - this70[1]), "when calling squared in Vectors, line 157") + real_squared((v[2] - this70[2]), "when calling squared in Vectors, line 157")))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn96
end

function init_WeatherEffects(__wurst_stackPos318) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos318
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widget_getPos(this265, __wurst_stackPos467) 
	local stackTrace_tempReturn97 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos467
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn97 = ({widget_getX(this265, "when calling getX in Widget, line 12"), widget_getY(this265, "when calling getY in Widget, line 12"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn97
end

function widget_getX(this311, __wurst_stackPos542) 
	local stackTrace_tempReturn98 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos542
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn98 = __wurst_safe_GetWidgetX(this311)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn98
end

function widget_getY(this312, __wurst_stackPos543) 
	local stackTrace_tempReturn99 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos543
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn99 = __wurst_safe_GetWidgetY(this312)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn99
end

function widget_addEffect(this61, modelName, attachment, __wurst_stackPos71) 
	local stackTrace_tempReturn100 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos71
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn100 = __wurst_safe_AddSpecialEffectTarget(modelName, this61, attachment)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn100
end

function init_XaviusMain(__wurst_stackPos368) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos368
	wurst_stack_depth = (wurst_stack_depth + 1)
	XaviusMain_XAVIUS_ID = 1311780916
	UnitDefinition_new_UnitDefinition(XaviusMain_XAVIUS_ID, XaviusMain_XAVIUS_ID, "when calling new_UnitDefinition in XaviusMain, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_winLoss(__wurst_stackPos369) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos369
	wurst_stack_depth = (wurst_stack_depth + 1)
	winLoss_footmen = CreateGroup()
	setupDefeatCondition("when calling setupDefeatCondition in winLoss, line 21")
	setupVictoryCondition("when calling setupVictoryCondition in winLoss, line 22")
	player_setGold(Player_players[0], 1000, "when calling setGold in winLoss, line 23")
	player_setLumber(Player_players[0], 1000, "when calling setLumber in winLoss, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupVictoryCondition(__wurst_stackPos545) 
	local receiver45 = nil
	local receiver46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos545
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver45 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver45, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 7")
	receiver46 = receiver45
	trigger_addAction(receiver46, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss(__wurst_stackPos546) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos546
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_remove(winLoss_footmen, "when calling remove in winLoss, line 9", GetTriggerUnit())
	if group_isEmpty(winLoss_footmen, "when calling isEmpty in winLoss, line 10") then
		__wurst_safe_CustomVictoryBJ(Player_players[0], true, true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupDefeatCondition(__wurst_stackPos544) 
	local receiver47 = nil
	local receiver48 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos544
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver47 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver47, Player_players[0], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 15")
	receiver48 = receiver47
	trigger_addAction(receiver48, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 16")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss1(__wurst_stackPos547) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos547
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (GetTriggerUnit() == udg_townHall) then
		__wurst_safe_CustomDefeatBJ(Player_players[0], "You have been defeated!")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos292) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos292
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos548) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos548
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_compiletime3 = __wurst_InitHashtable()
	hashtable_compiletime2 = __wurst_InitHashtable()
	hashtable_compiletime1 = __wurst_InitHashtable()
	hashtable_compiletime = __wurst_InitHashtable()
	__wurst_SaveInteger(hashtable_compiletime3, 1, -242600650, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 1, 1132341824, 1)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -647782241, 2)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -854572045, 3)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -680649701, 4)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -943650483, 5)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -671760605, 6)
	__wurst_SaveInteger(hashtable_compiletime3, 1, 349230650, 7)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -1894922563, 8)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -1474492777, 9)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -1587459251, 10)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -1676716706, 11)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -1559655710, 12)
	__wurst_SaveInteger(hashtable_compiletime3, 1, -1663695754, 13)
	__wurst_SaveInteger(hashtable_compiletime3, 1, 597637742, 14)
	__wurst_SaveInteger(hashtable_compiletime3, 1, 789744696, 15)
	__wurst_SaveStr(hashtable_compiletime3, 2, 0, "")
	__wurst_SaveInteger(hashtable_compiletime3, 3, 0, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 1, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 2, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 3, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 4, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 5, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 6, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 7, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 8, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 9, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 10, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 11, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 12, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 13, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 14, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 15, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 16, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 17, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 18, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 19, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 20, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 21, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 22, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 23, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 24, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 25, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 26, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 27, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 28, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 29, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 30, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 31, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 32, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 33, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 34, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 35, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 36, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 37, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 38, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 39, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 40, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 41, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 42, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 43, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 44, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 45, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 46, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 47, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 48, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 49, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 50, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 51, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 52, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 53, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 54, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 55, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 56, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 57, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 58, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 59, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 60, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 61, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 62, 0)
	__wurst_SaveInteger(hashtable_compiletime3, 3, 63, 0)
	__wurst_SaveStr(hashtable_compiletime3, 2, 1282521876, "Aloc")
	__wurst_SaveStr(hashtable_compiletime3, 2, 512215473, "Agho")
	__wurst_SaveStr(hashtable_compiletime3, 2, -644213493, "AM04")
	__wurst_SaveStr(hashtable_compiletime3, 2, -2032846969, "AM05")
	__wurst_SaveStr(hashtable_compiletime3, 2, -844489484, "AM02")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1581872253, "AM07")
	__wurst_SaveStr(hashtable_compiletime3, 2, -540326714, "AInv")
	__wurst_SaveStr(hashtable_compiletime3, 2, 1032637, "Ault")
	__wurst_SaveStr(hashtable_compiletime3, 2, 264091612, "AM08")
	__wurst_SaveStr(hashtable_compiletime3, 2, 1141672410, "AM09")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1194720164, "AM06")
	__wurst_SaveStr(hashtable_compiletime3, 2, -809044371, "A001")
	__wurst_SaveStr(hashtable_compiletime3, 2, 500847566, "AM0b")
	__wurst_SaveStr(hashtable_compiletime3, 2, 16258522, "A002")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1945487672, "AM0a")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1432153523, "AHav")
	__wurst_SaveStr(hashtable_compiletime3, 2, 960411499, "AM0d")
	__wurst_SaveStr(hashtable_compiletime3, 2, 79905753, "ACm2")
	__wurst_SaveStr(hashtable_compiletime3, 2, -849326328, "Aien")
	__wurst_SaveStr(hashtable_compiletime3, 2, -690706802, "Aadm")
	__wurst_SaveStr(hashtable_compiletime3, 2, 860156185, "Aspo")
	__wurst_SaveStr(hashtable_compiletime3, 2, 1783581612, "AM0g")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1169939221, "AM0i")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function bridge_Unit000038_DropItems() 
	Unit000038_DropItems("via function reference war3map, line 725")
end

function bridge_Unit000043_DropItems() 
	Unit000043_DropItems("via function reference war3map, line 739")
end

function bridge_Unit000080_DropItems() 
	Unit000080_DropItems("via function reference war3map, line 771")
end

function bridge_Unit000077_DropItems() 
	Unit000077_DropItems("via function reference war3map, line 781")
end

function bridge_Unit000090_DropItems() 
	Unit000090_DropItems("via function reference war3map, line 805")
end

function bridge_Unit000097_DropItems() 
	Unit000097_DropItems("via function reference war3map, line 819")
end

function bridge_Unit000003_DropItems() 
	Unit000003_DropItems("via function reference war3map, line 843")
end

function bridge_Unit000116_DropItems() 
	Unit000116_DropItems("via function reference war3map, line 859")
end

function bridge_Trig_Other_Actions() 
	Trig_Other_Actions("via function reference war3map, line 1205")
end

function bridge_Trig_ControlPointInitialVariables_Actions() 
	Trig_ControlPointInitialVariables_Actions("via function reference war3map, line 1249")
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
	income("via function reference ControlPoint, line 31")
end

function bridge_code__addAction_ControlPoint() 
	code__addAction_ControlPoint("via function reference ControlPoint, line 37")
end

function bridge_executeCurrentCallback() 
	executeCurrentCallback("via function reference Execute, line 99")
end

function bridge_code__startPeriodic_GameTimer() 
	code__startPeriodic_GameTimer("via function reference GameTimer, line 15")
end

function bridge_code__registerPlayerUnitEvent_RegisterEvents() 
	local bridge_return = nil
	bridge_return = code__registerPlayerUnitEvent_RegisterEvents("via function reference RegisterEvents, line 58")
	return bridge_return
end

function bridge_code__onEnter_UnitIndexer() 
	code__onEnter_UnitIndexer("via function reference UnitIndexer, line 190")
end

function bridge_code__onLeave_UnitIndexer() 
	code__onLeave_UnitIndexer("via function reference UnitIndexer, line 191")
end

function bridge_code__addAction_winLoss() 
	code__addAction_winLoss("via function reference winLoss, line 8")
end

function bridge_code__addAction_winLoss1() 
	code__addAction_winLoss1("via function reference winLoss, line 16")
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

function __wurst_safe_DisplayTimedTextToPlayer(toPlayer, x6, y5, duration3, message) 
	if (toPlayer == nil) then
		return nil
	end
	DisplayTimedTextToPlayer(toPlayer, x6, y5, duration3, message)
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

function __wurst_safe_GetUnitX(whichUnit23) 
	if (whichUnit23 == nil) then
		return 0.0
	end
	return GetUnitX(whichUnit23)
end

function __wurst_safe_GetUnitY(whichUnit24) 
	if (whichUnit24 == nil) then
		return 0.0
	end
	return GetUnitY(whichUnit24)
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

function __wurst_safe_TriggerRegisterPlayerUnitEvent(whichTrigger9, whichPlayer22, whichPlayerUnitEvent1, filter11) 
	if (whichTrigger9 == nil) then
		return nil
	end
	if (whichPlayer22 == nil) then
		return nil
	end
	if (whichPlayerUnitEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerUnitEvent(whichTrigger9, whichPlayer22, whichPlayerUnitEvent1, filter11)
end

function __wurst_safe_TriggerRegisterPlayerEvent(whichTrigger8, whichPlayer21, whichPlayerEvent1) 
	if (whichTrigger8 == nil) then
		return nil
	end
	if (whichPlayer21 == nil) then
		return nil
	end
	if (whichPlayerEvent1 == nil) then
		return nil
	end
	return TriggerRegisterPlayerEvent(whichTrigger8, whichPlayer21, whichPlayerEvent1)
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

function __wurst_safe_RegionAddRect(whichRegion1, r7) 
	if (whichRegion1 == nil) then
		return nil
	end
	if (r7 == nil) then
		return nil
	end
	RegionAddRect(whichRegion1, r7)
end

function __wurst_safe_StopSound(soundHandle1, killWhenDone, fadeOut) 
	if (soundHandle1 == nil) then
		return nil
	end
	StopSound(soundHandle1, killWhenDone, fadeOut)
end

function __wurst_safe_VolumeGroupSetVolume(vgroup, scale4) 
	if (vgroup == nil) then
		return nil
	end
	VolumeGroupSetVolume(vgroup, scale4)
end

function __wurst_safe_AddSpecialEffectTarget(modelName1, targetWidget, attachPointName2) 
	if (targetWidget == nil) then
		return nil
	end
	return AddSpecialEffectTarget(modelName1, targetWidget, attachPointName2)
end

function __wurst_safe_DestroyEffect(whichEffect) 
	if (whichEffect == nil) then
		return nil
	end
	DestroyEffect(whichEffect)
end

function __wurst_safe_SetUnitAbilityLevel(whichUnit16, abilcode, level4) 
	if (whichUnit16 == nil) then
		return 0
	end
	return SetUnitAbilityLevel(whichUnit16, abilcode, level4)
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

function __wurst_safe_GetItemTypeId(i27) 
	if (i27 == nil) then
		return 0
	end
	return GetItemTypeId(i27)
end

function __wurst_safe_ChooseRandomItemEx(whichType, level5) 
	if (whichType == nil) then
		return 0
	end
	return ChooseRandomItemEx(whichType, level5)
end

function __wurst_safe_GroupClear(whichGroup4) 
	if (whichGroup4 == nil) then
		return nil
	end
	GroupClear(whichGroup4)
end

function __wurst_safe_GroupAddUnit(whichGroup5, whichUnit11) 
	if (whichGroup5 == nil) then
		return false
	end
	if (whichUnit11 == nil) then
		return false
	end
	return GroupAddUnit(whichGroup5, whichUnit11)
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

function __wurst_safe_UnitSuspendDecay(whichUnit41, suspend) 
	if (whichUnit41 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit41, suspend)
end

function __wurst_safe_GetUnitState(whichUnit8, whichUnitState) 
	if (whichUnit8 == nil) then
		return 0.0
	end
	if (whichUnitState == nil) then
		return 0.0
	end
	return GetUnitState(whichUnit8, whichUnitState)
end

function __wurst_safe_SetUnitTimeScale(whichUnit42, timeScale) 
	if (whichUnit42 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit42, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit29, whichAnimation) 
	if (whichUnit29 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit29, whichAnimation)
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

function __wurst_safe_SetUnitState(whichUnit10, whichUnitState1, newVal) 
	if (whichUnit10 == nil) then
		return nil
	end
	if (whichUnitState1 == nil) then
		return nil
	end
	SetUnitState(whichUnit10, whichUnitState1, newVal)
end

function __wurst_safe_IsUnitDeadBJ(whichUnit43) 
	if (whichUnit43 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit43)
end

function __wurst_safe_IsUnitHidden(whichUnit4) 
	if (whichUnit4 == nil) then
		return false
	end
	return IsUnitHidden(whichUnit4)
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

function __wurst_safe_GetUnitTypeId(whichUnit13) 
	if (whichUnit13 == nil) then
		return 0
	end
	return GetUnitTypeId(whichUnit13)
end

function __wurst_safe_FirstOfGroup(whichGroup9) 
	if (whichGroup9 == nil) then
		return nil
	end
	return FirstOfGroup(whichGroup9)
end

function __wurst_safe_IssueTargetOrderById(whichUnit26, order, targetWidget1) 
	if (whichUnit26 == nil) then
		return false
	end
	if (targetWidget1 == nil) then
		return false
	end
	return IssueTargetOrderById(whichUnit26, order, targetWidget1)
end

function __wurst_safe_SetUnitFlyHeight(whichUnit15, newHeight, rate1) 
	if (whichUnit15 == nil) then
		return nil
	end
	SetUnitFlyHeight(whichUnit15, newHeight, rate1)
end

function __wurst_safe_SetUnitAcquireRange(whichUnit5, newAcquireRange) 
	if (whichUnit5 == nil) then
		return nil
	end
	SetUnitAcquireRange(whichUnit5, newAcquireRange)
end

function __wurst_safe_SetPlayerState(whichPlayer11, whichPlayerState, value16) 
	if (whichPlayer11 == nil) then
		return nil
	end
	if (whichPlayerState == nil) then
		return nil
	end
	SetPlayerState(whichPlayer11, whichPlayerState, value16)
end

function __wurst_safe_PauseUnit(whichUnit27, flag2) 
	if (whichUnit27 == nil) then
		return nil
	end
	PauseUnit(whichUnit27, flag2)
end

function __wurst_safe_GetPlayerController(whichPlayer25) 
	if (whichPlayer25 == nil) then
		return nil
	end
	return GetPlayerController(whichPlayer25)
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

function __wurst_safe_RemoveUnit(whichUnit28) 
	if (whichUnit28 == nil) then
		return nil
	end
	RemoveUnit(whichUnit28)
end

function __wurst_safe_SetUnitFacing(whichUnit30, facingAngle) 
	if (whichUnit30 == nil) then
		return nil
	end
	SetUnitFacing(whichUnit30, facingAngle)
end

function __wurst_safe_AddItemToStock(whichUnit44, itemId, currentStock, stockMax) 
	if (whichUnit44 == nil) then
		return nil
	end
	AddItemToStock(whichUnit44, itemId, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit45, itemId1) 
	if (whichUnit45 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit45, itemId1)
end

function __wurst_safe_UnitDamageTarget(whichUnit18, target12, amount3, attack1, ranged1, attackType3, damageType4, weaponType2) 
	if (whichUnit18 == nil) then
		return false
	end
	if (target12 == nil) then
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
	return UnitDamageTarget(whichUnit18, target12, amount3, attack1, ranged1, attackType3, damageType4, weaponType2)
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

function __wurst_safe_SetUnitPosition(whichUnit33, newX, newY) 
	if (whichUnit33 == nil) then
		return nil
	end
	SetUnitPosition(whichUnit33, newX, newY)
end

function __wurst_safe_GroupEnumUnitsInRect(whichGroup1, r3, filter6) 
	if (whichGroup1 == nil) then
		return nil
	end
	if (r3 == nil) then
		return nil
	end
	GroupEnumUnitsInRect(whichGroup1, r3, filter6)
end

function __wurst_safe_GroupRemoveUnit(whichGroup6, whichUnit12) 
	if (whichGroup6 == nil) then
		return false
	end
	if (whichUnit12 == nil) then
		return false
	end
	return GroupRemoveUnit(whichGroup6, whichUnit12)
end

function __wurst_safe_ForceAddPlayer(whichForce, whichPlayer10) 
	if (whichForce == nil) then
		return nil
	end
	if (whichPlayer10 == nil) then
		return nil
	end
	ForceAddPlayer(whichForce, whichPlayer10)
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

function __wurst_safe_IsUnitAliveBJ(whichUnit46) 
	if (whichUnit46 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit46)
end

function __wurst_safe_SetUnitScale(whichUnit34, scaleX, scaleY, scaleZ) 
	if (whichUnit34 == nil) then
		return nil
	end
	SetUnitScale(whichUnit34, scaleX, scaleY, scaleZ)
end

function __wurst_safe_SetUnitVertexColor(whichUnit36, red1, green1, blue1, alpha1) 
	if (whichUnit36 == nil) then
		return nil
	end
	SetUnitVertexColor(whichUnit36, red1, green1, blue1, alpha1)
end

function __wurst_safe_DialogDisplay(whichPlayer26, whichDialog2, flag5) 
	if (whichPlayer26 == nil) then
		return nil
	end
	if (whichDialog2 == nil) then
		return nil
	end
	DialogDisplay(whichPlayer26, whichDialog2, flag5)
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

function __wurst_safe_SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value19) 
	if (sourcePlayer == nil) then
		return nil
	end
	if (otherPlayer2 == nil) then
		return nil
	end
	if (whichAllianceSetting == nil) then
		return nil
	end
	SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value19)
end

function __wurst_safe_SetUnitOwner(whichUnit9, whichPlayer8, changeColor1) 
	if (whichUnit9 == nil) then
		return nil
	end
	if (whichPlayer8 == nil) then
		return nil
	end
	SetUnitOwner(whichUnit9, whichPlayer8, changeColor1)
end

function __wurst_safe_DisplayTimedTextFromPlayer(toPlayer1, x9, y8, duration4, message2) 
	if (toPlayer1 == nil) then
		return nil
	end
	DisplayTimedTextFromPlayer(toPlayer1, x9, y8, duration4, message2)
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

function __wurst_safe_StartSoundForPlayerBJ(whichPlayer27, soundHandle2) 
	if (whichPlayer27 == nil) then
		return nil
	end
	if (soundHandle2 == nil) then
		return nil
	end
	StartSoundForPlayerBJ(whichPlayer27, soundHandle2)
end

function __wurst_safe_AllowVictoryDefeat(gameResult) 
	if (gameResult == nil) then
		return false
	end
	return AllowVictoryDefeat(gameResult)
end

function __wurst_safe_RemovePlayer(whichPlayer28, gameResult1) 
	if (whichPlayer28 == nil) then
		return nil
	end
	if (gameResult1 == nil) then
		return nil
	end
	RemovePlayer(whichPlayer28, gameResult1)
end

function __wurst_safe_SetGameDifficulty(whichdifficulty) 
	if (whichdifficulty == nil) then
		return nil
	end
	SetGameDifficulty(whichdifficulty)
end

function __wurst_safe_VolumeGroupSetVolumeForPlayerBJ(whichPlayer29, vgroup1, scale5) 
	if (whichPlayer29 == nil) then
		return nil
	end
	if (vgroup1 == nil) then
		return nil
	end
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer29, vgroup1, scale5)
end

function __wurst_safe_CustomVictoryDialogBJ(whichPlayer30) 
	if (whichPlayer30 == nil) then
		return nil
	end
	CustomVictoryDialogBJ(whichPlayer30)
end

function __wurst_safe_CustomVictorySkipBJ(whichPlayer31) 
	if (whichPlayer31 == nil) then
		return nil
	end
	CustomVictorySkipBJ(whichPlayer31)
end

function __wurst_safe_CustomDefeatDialogBJ(whichPlayer32, message3) 
	if (whichPlayer32 == nil) then
		return nil
	end
	CustomDefeatDialogBJ(whichPlayer32, message3)
end

function __wurst_safe_CreateTimerDialog(t4) 
	if (t4 == nil) then
		return nil
	end
	return CreateTimerDialog(t4)
end

function __wurst_safe_TimerDialogSetTitle(whichDialog, title) 
	if (whichDialog == nil) then
		return nil
	end
	TimerDialogSetTitle(whichDialog, title)
end

function __wurst_safe_TimerDialogDisplay(whichDialog1, display) 
	if (whichDialog1 == nil) then
		return nil
	end
	TimerDialogDisplay(whichDialog1, display)
end

function __wurst_safe_MultiboardSetRowCount(lb2, count3) 
	if (lb2 == nil) then
		return nil
	end
	MultiboardSetRowCount(lb2, count3)
end

function __wurst_safe_MultiboardSetColumnCount(lb1, count2) 
	if (lb1 == nil) then
		return nil
	end
	MultiboardSetColumnCount(lb1, count2)
end

function __wurst_safe_MultiboardSetTitleText(lb3, label) 
	if (lb3 == nil) then
		return nil
	end
	MultiboardSetTitleText(lb3, label)
end

function __wurst_safe_MultiboardDisplay(lb4, show) 
	if (lb4 == nil) then
		return nil
	end
	MultiboardDisplay(lb4, show)
end

function __wurst_safe_MultiboardMinimize(lb5, minimize) 
	if (lb5 == nil) then
		return nil
	end
	MultiboardMinimize(lb5, minimize)
end

function __wurst_safe_MultiboardGetItem(lb, row1, column1) 
	if (lb == nil) then
		return nil
	end
	return MultiboardGetItem(lb, row1, column1)
end

function __wurst_safe_MultiboardSetItemStyle(mbi4, showValue, showIcon) 
	if (mbi4 == nil) then
		return nil
	end
	MultiboardSetItemStyle(mbi4, showValue, showIcon)
end

function __wurst_safe_MultiboardReleaseItem(mbi) 
	if (mbi == nil) then
		return nil
	end
	MultiboardReleaseItem(mbi)
end

function __wurst_safe_MultiboardSetItemValue(mbi2, val7) 
	if (mbi2 == nil) then
		return nil
	end
	MultiboardSetItemValue(mbi2, val7)
end

function __wurst_safe_MultiboardSetItemValueColor(mbi1, red, green, blue, alpha) 
	if (mbi1 == nil) then
		return nil
	end
	MultiboardSetItemValueColor(mbi1, red, green, blue, alpha)
end

function __wurst_safe_MultiboardSetItemWidth(mbi3, width) 
	if (mbi3 == nil) then
		return nil
	end
	MultiboardSetItemWidth(mbi3, width)
end

function __wurst_safe_MultiboardSetItemIcon(mbi5, iconFileName) 
	if (mbi5 == nil) then
		return nil
	end
	MultiboardSetItemIcon(mbi5, iconFileName)
end

function __wurst_safe_PingMinimapForPlayer(whichPlayer33, x10, y9, duration5) 
	if (whichPlayer33 == nil) then
		return nil
	end
	PingMinimapForPlayer(whichPlayer33, x10, y9, duration5)
end

function __wurst_safe_UnitAddIndicator(whichUnit47, red2, green2, blue2, alpha2) 
	if (whichUnit47 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit47, red2, green2, blue2, alpha2)
end

function __wurst_safe_RescueUnitBJ(whichUnit48, rescuer, changeColor2) 
	if (whichUnit48 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit48, rescuer, changeColor2)
end

function __wurst_safe_SetPlayerTechMaxAllowed(whichPlayer34, techid, maximum) 
	if (whichPlayer34 == nil) then
		return nil
	end
	SetPlayerTechMaxAllowed(whichPlayer34, techid, maximum)
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

function __wurst_safe_GetPlayerSlotState(whichPlayer19) 
	if (whichPlayer19 == nil) then
		return nil
	end
	return GetPlayerSlotState(whichPlayer19)
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

function __wurst_safe_GetPlayerId(whichPlayer13) 
	if (whichPlayer13 == nil) then
		return 0
	end
	return GetPlayerId(whichPlayer13)
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

function __wurst_safe_GroupEnumUnitsInRange(whichGroup, x4, y3, radius3, filter5) 
	if (whichGroup == nil) then
		return nil
	end
	GroupEnumUnitsInRange(whichGroup, x4, y3, radius3, filter5)
end

function __wurst_safe_GetPlayerName(whichPlayer14) 
	if (whichPlayer14 == nil) then
		return ""
	end
	return GetPlayerName(whichPlayer14)
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

function __wurst_safe_GroupEnumUnitsOfType(whichGroup2, unitname, filter8) 
	if (whichGroup2 == nil) then
		return nil
	end
	GroupEnumUnitsOfType(whichGroup2, unitname, filter8)
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

function __wurst_safe_TriggerRegisterUnitEvent(whichTrigger1, whichUnit6, whichEvent) 
	if (whichTrigger1 == nil) then
		return nil
	end
	if (whichUnit6 == nil) then
		return nil
	end
	if (whichEvent == nil) then
		return nil
	end
	return TriggerRegisterUnitEvent(whichTrigger1, whichUnit6, whichEvent)
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

function __wurst_safe_BlzSetSpecialEffectScale(whichEffect1, scale3) 
	if (whichEffect1 == nil) then
		return nil
	end
	BlzSetSpecialEffectScale(whichEffect1, scale3)
end

function __wurst_safe_BlzSetSpecialEffectYaw(whichEffect2, yaw2) 
	if (whichEffect2 == nil) then
		return nil
	end
	BlzSetSpecialEffectYaw(whichEffect2, yaw2)
end

function __wurst_safe_BlzSetSpecialEffectPosition(whichEffect4, x3, y2, z) 
	if (whichEffect4 == nil) then
		return nil
	end
	BlzSetSpecialEffectPosition(whichEffect4, x3, y2, z)
end

function __wurst_safe_BlzSetSpecialEffectColor(whichEffect3, r2, g4, b2) 
	if (whichEffect3 == nil) then
		return nil
	end
	BlzSetSpecialEffectColor(whichEffect3, r2, g4, b2)
end

function __wurst_safe_BlzGetLocalSpecialEffectZ(whichEffect5) 
	if (whichEffect5 == nil) then
		return 0.0
	end
	return BlzGetLocalSpecialEffectZ(whichEffect5)
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

function __wurst_safe_BlzGroupUnitAt(whichGroup10, index8) 
	if (whichGroup10 == nil) then
		return nil
	end
	return BlzGroupUnitAt(whichGroup10, index8)
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

function __wurst_safe_TriggerRegisterPlayerChatEvent(whichTrigger7, whichPlayer20, chatMessageToDetect1, exactMatchOnly1) 
	if (whichTrigger7 == nil) then
		return nil
	end
	if (whichPlayer20 == nil) then
		return nil
	end
	return TriggerRegisterPlayerChatEvent(whichTrigger7, whichPlayer20, chatMessageToDetect1, exactMatchOnly1)
end

function __wurst_safe_Condition(func2) 
	return Condition(func2)
end

function __wurst_safe_GetUnitName(whichUnit21) 
	if (whichUnit21 == nil) then
		return ""
	end
	return GetUnitName(whichUnit21)
end

function __wurst_safe_GetUnitUserData(whichUnit25) 
	if (whichUnit25 == nil) then
		return 0
	end
	return GetUnitUserData(whichUnit25)
end

function __wurst_safe_SetUnitInvulnerable(whichUnit31, flag3) 
	if (whichUnit31 == nil) then
		return nil
	end
	SetUnitInvulnerable(whichUnit31, flag3)
end

function __wurst_safe_SetUnitPathing(whichUnit32, flag4) 
	if (whichUnit32 == nil) then
		return nil
	end
	SetUnitPathing(whichUnit32, flag4)
end

function __wurst_safe_SetUnitUserData(whichUnit35, data2) 
	if (whichUnit35 == nil) then
		return nil
	end
	SetUnitUserData(whichUnit35, data2)
end

function __wurst_safe_SetUnitX(whichUnit37, newX1) 
	if (whichUnit37 == nil) then
		return nil
	end
	SetUnitX(whichUnit37, newX1)
end

function __wurst_safe_SetUnitY(whichUnit38, newY1) 
	if (whichUnit38 == nil) then
		return nil
	end
	SetUnitY(whichUnit38, newY1)
end

function __wurst_safe_BlzGetUnitArmor(whichUnit39) 
	if (whichUnit39 == nil) then
		return 0.0
	end
	return BlzGetUnitArmor(whichUnit39)
end

function __wurst_safe_BlzSetUnitArmor(whichUnit40, armorAmount1) 
	if (whichUnit40 == nil) then
		return nil
	end
	BlzSetUnitArmor(whichUnit40, armorAmount1)
end

function __wurst_safe_CustomVictoryBJ(whichPlayer23, showDialog, showScores) 
	if (whichPlayer23 == nil) then
		return nil
	end
	CustomVictoryBJ(whichPlayer23, showDialog, showScores)
end

function __wurst_safe_CustomDefeatBJ(whichPlayer24, message1) 
	if (whichPlayer24 == nil) then
		return nil
	end
	CustomDefeatBJ(whichPlayer24, message1)
end

