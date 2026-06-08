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
gg_unit_h006_0015 = nil
gg_unit_h008_0011 = nil
gg_unit_h003_0016 = nil
gg_unit_h00E_0013 = nil
gg_unit_h009_0014 = nil
gg_unit_h00A_0009 = nil
gg_unit_h001_0008 = nil
gg_unit_h000_0407 = nil
gg_unit_etol_0001 = nil
gg_unit_h00K_0176 = nil
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
Dive_CROW_TACKLE_ID = nil
Dive_TACKLE_DAMAGE = nil
Dive_DASH_SPEED = nil
Dive_UPDATE_INTERVAL = nil
Dive_DASH_SFX = nil
Dive_IMPACT_SFX = nil
DummyRecycler_DUMMY_UNIT_ID = nil
DummyRecycler_ROOT_ENABLER = nil
DummyRecycler_DIFFERENT_ANGLES = nil
DummyRecycler_ANGLE_DEGREE = nil
DummyRecycler_SAVED_UNITS_PER_ANGLE = nil
DummyRecycler_angleQueues = nil
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
Invigorate_INVIGORATE_BUFF_ID = nil
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
MoonWarrior_MOON_WARRIOR_ID = nil
MoonWarrior_MOON_WARRIOR_BUFF_ID = nil
MoonWarrior_TYRANDE_MODEL_ID = nil
MoonWarrior_TIGER_UNIT_ID = nil
MoonWarrior_TIGER_DURATION = nil
MoonWarrior_BONUS_ATTACK_SPEED = nil
MoonWarrior_BONUS_DAMAGE = nil
MoonWarrior_DISMOUNT_SFX = nil
MoonWarrior_SUMMON_SFX = nil
Nightmare_NIGHTMARE_ID = nil
Nightmare_NIGHTMARE_BUFF_ID = nil
Nightmare_NIGHTMARE_RADIUS = nil
Nightmare_NIGHTMARE_DURATION = nil
Nightmare_CORRUPT_SFX = nil
Nightmare_NIGHTMARE_SFX = nil
Nightmare_sleepingUnits = nil
ObjectIds_CHARMAP = nil
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
SeedlingTracker_SEEDLING_TRACKER_ITEM_ID = nil
SeedlingTracker_trackerItem = nil
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
Starfall_STARFALL_ID = nil
Starfall_STARFALL_RADIUS = nil
Starfall_STAR_DAMAGE = nil
Starfall_STAR_AOE = nil
Starfall_CHANNEL_DURATION = nil
Starfall_BASE_INTERVAL = nil
Starfall_MIN_INTERVAL = nil
Starfall_STAR_SFX = nil
Starfall_IMPACT_SFX = nil
Starfall_CHANNEL_SFX = nil
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
UnitIds_abomination = nil
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
test_GPROJECTILE_ID = nil
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
OnPointCast = ({})
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
OnCastListener_onCast_Dive = ({})
CallbackPeriodic_doPeriodically_onCast_Dive = ({})
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
OnCastListener_onCast_MoonWarrior = ({})
CallbackSingle_doAfter_onCast_MoonWarrior = ({})
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
CallbackPeriodic_doPeriodically_SeedlingTracker = ({})
EventListener_add_SeedlingTracker = ({})
DamageListener_addListener_ShieldBash = ({})
OnCastListener_onCast_SpiritWisps = ({})
CallbackPeriodic_doPeriodically_onCast_SpiritWisps = ({})
CallbackPeriodic_doPeriodically_onCast_SpiritWisps1 = ({})
CallbackSingle_doAfter_onCast_SpiritWisps = ({})
OnCastListener_onCast_Starfall = ({})
CallbackPeriodic_doPeriodically_onCast_Starfall = ({})
CallbackSingle_doAfter_doPeriodically_onCast_Starfall = ({})
CallbackSingle_doAfter_onCast_Starfall = ({})
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
CallbackPeriodic_doPeriodically_test = ({})
OnPointCast_onPointCast_test = ({})

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
	group_enumUnitsInRange(Group_ENUM_GROUP, this.pos, this.radius, nil, "when calling enumUnitsInRange in Bloom, line 83")
	iterator = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 84")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator, "when calling hasNext in Bloom, line 84")) then
			break
		end
		u = GroupIterator_GroupIterator_next(iterator, "when calling next in Bloom, line 84")
		if (unit_isAlive(u, "when calling isAlive in Bloom, line 85") and player_isAllyOf(unit_getOwner(u, "when calling getOwner in Bloom, line 85"), this.owner, "when calling isAllyOf in Bloom, line 85")) then
			unit_addHP(u, this.heal, "when calling addHP in Bloom, line 86")
			flashEffect("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u, "origin", "when calling flashEffect in Bloom, line 87")
		end
	end
	GroupIterator_GroupIterator_close(iterator, "when calling close in Bloom, line 84")
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
	CallbackPeriodic_destroyCallbackPeriodic(this10.healTimer, "when calling destroyCallbackPeriodic in Bloom, line 90")
	unit_kill(this10.cloud, "when calling kill in Bloom, line 91")
	effect_destr(this10.sfx, "when calling destr in Bloom, line 92")
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
	level = (unit_getAbilityLevel(caster, Bloom_HEALING_CLOUD_ID, "when calling getAbilityLevel in Bloom, line 96") - 1)
	heal = realEnsure(Bloom_CLOUD_HEAL[level])
	radius = realEnsure(Bloom_CLOUD_RADIUS[level])
	duration = realEnsure(Bloom_CLOUD_DURATION[level])
	group_enumUnitsInRect(Group_ENUM_GROUP, bj_mapInitialPlayableArea, nil, "when calling enumUnitsInRect in Bloom, line 101")
	iterator1 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Bloom, line 102")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator1, "when calling hasNext in Bloom, line 102")) then
			break
		end
		u1 = GroupIterator_GroupIterator_next(iterator1, "when calling next in Bloom, line 102")
		if unit_hasAbility(u1, Invigorate_INVIGORATE_BUFF_ID, "when calling hasAbility in Bloom, line 103") then
			spawnCloud(unit_getOwner(caster, "when calling getOwner in Bloom, line 104"), unit_getPos(u1, "when calling getPos in Bloom, line 104"), heal, radius, duration, "when calling spawnCloud in Bloom, line 104")
		end
	end
	GroupIterator_GroupIterator_close(iterator1, "when calling close in Bloom, line 102")
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

function OnPointCast:create7() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnPointCast, }))
	return new_inst
end

function OnPointCast_OnPointCast_fire(this38, caster3, __wurst_stackPos44) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos44
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (EventData_getSpellTargetUnit("when calling getSpellTargetUnit in ClosureEvents, line 95") == nil) then
		this38:fireEx(caster3, EventData_getSpellTargetPos("when calling getSpellTargetPos in ClosureEvents, line 96"), "when calling fireEx in ClosureEvents, line 96")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnPointCast_OnPointCast_fireEx(this39, caster4, target1, __wurst_stackPos46) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos46
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnPointCast_OnPointCast_init(this40, __wurst_stackPos47) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos47
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnPointCast_construct_OnPointCast(this41, __wurst_stackPos48) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos48
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnCastListener_construct_OnCastListener(this41, "when calling construct_OnCastListener in ClosureEvents, line 92")
	OnPointCast_OnPointCast_init(this41, "when calling OnPointCast_init in ClosureEvents, line 92")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback:create8() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback, }))
	return new_inst
end

function ForGroupCallback_ForGroupCallback_callback(this42, u2, __wurst_stackPos49) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos49
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallback_destroyForGroupCallback(this43, __wurst_stackPos50) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos50
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForGroupCallbackUntil:create9() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallbackUntil, }))
	return new_inst
end

function ForGroupCallbackUntil_ForGroupCallbackUntil_callback(this44, u3, __wurst_stackPos51) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos51
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic:create10() 
	local new_inst = ({CallbackPeriodic_t=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic, }))
	return new_inst
end

function CallbackPeriodic_CallbackPeriodic_start(this45, whichTimer, time, __wurst_stackPos52) 
	local receiver10 = nil
	local receiver11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos52
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

function CallbackPeriodic_CallbackPeriodic_call(this48, cb1, __wurst_stackPos55) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos55
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_init(this49, __wurst_stackPos56) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos56
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_construct_CallbackPeriodic(this50, __wurst_stackPos57) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos57
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_init(this50, "when calling CallbackPeriodic_init in ClosureTimers, line 151")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_CallbackPeriodic_onDestroy(this51, __wurst_stackPos58) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos58
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

function CallbackSingle:create11() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle, }))
	return new_inst
end

function CallbackSingle_CallbackSingle_start(this53, whichTimer1, time2, __wurst_stackPos60) 
	local receiver12 = nil
	local receiver13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos60
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

function CallbackSingle_CallbackSingle_call(this55, __wurst_stackPos62) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos62
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_construct_CallbackSingle(this56, __wurst_stackPos63) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos63
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_init(this56, "when calling CallbackSingle_init in ClosureTimers, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_destroyCallbackSingle(this58, __wurst_stackPos65) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos65
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_onDestroy(this58, "when calling CallbackSingle_onDestroy in ClosureTimers, line 147")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_init(this57, __wurst_stackPos64) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos64
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_CallbackSingle_onDestroy(this59, __wurst_stackPos66) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos66
	wurst_stack_depth = (wurst_stack_depth + 1)
	timer_release(this59.CallbackSingle_t, "when calling release in ClosureTimers, line 148")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_ControlPoint:create12() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_ControlPoint, }))
	return new_inst
end

function CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint(this60, __wurst_stackPos67) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos67
	wurst_stack_depth = (wurst_stack_depth + 1)
	incomeTimer("when calling incomeTimer in ControlPoint, line 93")
	setupMultiboard("when calling setupMultiboard in ControlPoint, line 94")
	updateMultiboard("when calling updateMultiboard in ControlPoint, line 95")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_CorruptedBlood:create13() 
	local new_inst = ({CallbackSingle_t=nil, sfx=nil, pos=({0., 0., }), caster=nil, slime=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_CorruptedBlood, }))
	return new_inst
end

function CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood(this61, __wurst_stackPos71) 
	local iterator2 = nil
	local u4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos71
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(this61.sfx, "when calling destr in CorruptedBlood, line 50")
	flashEffect1(CorruptedBlood_EXPLODE_SFX, this61.pos, "when calling flashEffect in CorruptedBlood, line 51")
	group_enumUnitsInRange(Group_ENUM_GROUP, this61.pos, CorruptedBlood_EXPLODE_RADIUS, nil, "when calling enumUnitsInRange in CorruptedBlood, line 52")
	iterator2 = group_iterator(Group_ENUM_GROUP, "when calling iterator in CorruptedBlood, line 53")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator2, "when calling hasNext in CorruptedBlood, line 53")) then
			break
		end
		u4 = GroupIterator_GroupIterator_next(iterator2, "when calling next in CorruptedBlood, line 53")
		if (unit_isAlive(u4, "when calling isAlive in CorruptedBlood, line 54") and player_isEnemyOf(unit_getOwner(u4, "when calling getOwner in CorruptedBlood, line 54"), unit_getOwner(this61.caster, "when calling getOwner in CorruptedBlood, line 54"), "when calling isEnemyOf in CorruptedBlood, line 54")) then
			unit_damageTarget(this61.caster, u4, CorruptedBlood_EXPLODE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in CorruptedBlood, line 55")
		end
	end
	GroupIterator_GroupIterator_close(iterator2, "when calling close in CorruptedBlood, line 53")
	unit_kill(this61.slime, "when calling kill in CorruptedBlood, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_CorruptedBlood:create14() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_CorruptedBlood, }))
	return new_inst
end

function OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood(this64, caster5, __wurst_stackPos75) 
	local target3 = nil
	local targetSfx = nil
	local slime = nil
	local sfx = nil
	local proximityTime = nil
	local exploded = nil
	local clVar = nil
	local clVar1 = nil
	local temp49 = nil
	local temp50 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos75
	wurst_stack_depth = (wurst_stack_depth + 1)
	target3 = EventData_getSpellTargetUnit("when calling getSpellTargetUnit in CorruptedBlood, line 61")
	targetSfx = widget_addEffect(target3, "Abilities\\Spells\\Other\\Doom\\DoomTarget.mdl", "overhead", "when calling addEffect in CorruptedBlood, line 62")
	effect_setScale(targetSfx, 0.8, "when calling setScale in CorruptedBlood, line 63")
	effect_setColor(targetSfx, 0, 255, 0, "when calling setColor in CorruptedBlood, line 64")
	slime = createUnit(unit_getOwner(caster5, "when calling getOwner in CorruptedBlood, line 66"), CorruptedBlood_SLIME_UNIT_ID, unit_getPos(caster5, "when calling getPos in CorruptedBlood, line 66"), ({0., }), "when calling createUnit in CorruptedBlood, line 66")
	if (target3 == nil) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	print1(stringConcat("Corrupted Blood cast on: ", unit_getName(target3, "when calling getName in CorruptedBlood, line 72")), "when calling print in CorruptedBlood, line 72")
	unit_addAbility(slime, 1097625443, "when calling addAbility in CorruptedBlood, line 75")
	unit_setInvulnerable(slime, true, "when calling setInvulnerable in CorruptedBlood, line 76")
	unit_setScale(slime, 0.5, "when calling setScale in CorruptedBlood, line 77")
	unit_setVertexColor(slime, 150, 80, 200, 255, "when calling setVertexColor in CorruptedBlood, line 78")
	sfx = addEffect(CorruptedBlood_GROW_SFX, unit_getPos(slime, "when calling getPos in CorruptedBlood, line 81"), "when calling addEffect in CorruptedBlood, line 81")
	effect_setScale(sfx, 1., "when calling setScale in CorruptedBlood, line 82")
	proximityTime = 0.
	exploded = false
	temp49 = CorruptedBlood_UPDATE_INTERVAL
	clVar = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood:create15()
	CallbackPeriodic_construct_CallbackPeriodic(clVar, "when calling construct_CallbackPeriodic in CorruptedBlood, line 87")
	clVar.exploded = exploded
	clVar.slime = slime
	clVar.target = target3
	clVar.targetSfx = targetSfx
	clVar.sfx = sfx
	clVar.proximityTime = proximityTime
	clVar.caster = caster5
	doPeriodically(temp49, clVar, "when calling doPeriodically in CorruptedBlood, line 87")
	temp50 = CorruptedBlood_SLIME_LIFETIME
	clVar1 = CallbackSingle_doAfter_onCast_CorruptedBlood:create16()
	CallbackSingle_construct_CallbackSingle(clVar1, "when calling construct_CallbackSingle in CorruptedBlood, line 118")
	clVar1.exploded = exploded
	clVar1.slime = slime
	clVar1.sfx = sfx
	clVar1.targetSfx = targetSfx
	doAfter(temp50, clVar1, "when calling doAfter in CorruptedBlood, line 118")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_CorruptedBlood:create15() 
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

function CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood(this73, cb4, __wurst_stackPos89) 
	local slimePos = ({0., 0., })
	local targetPos = ({0., 0., })
	local dist = nil
	local moveDir = ({0., })
	local growProgress = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos89
	wurst_stack_depth = (wurst_stack_depth + 1)
	if ((this73.exploded or not(unit_isAlive(this73.slime, "when calling isAlive in CorruptedBlood, line 88"))) or not(unit_isAlive(this73.target, "when calling isAlive in CorruptedBlood, line 88"))) then
		effect_destr(this73.targetSfx, "when calling destr in CorruptedBlood, line 89")
		CallbackPeriodic_destroyCallbackPeriodic(cb4, "when calling destroyCallbackPeriodic in CorruptedBlood, line 90")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	slimePos = tupleCopy(unit_getPos(this73.slime, "when calling getPos in CorruptedBlood, line 94"))
	targetPos = tupleCopy(unit_getPos(this73.target, "when calling getPos in CorruptedBlood, line 95"))
	dist = vec2_distanceTo(slimePos, targetPos, "when calling distanceTo in CorruptedBlood, line 96")
	moveDir = tupleCopy1(vec2_angleTo(slimePos, targetPos, "when calling angleTo in CorruptedBlood, line 97"))
	unit_setXY(this73.slime, vec2_polarOffset(slimePos, moveDir, (CorruptedBlood_SLIME_SPEED * CorruptedBlood_UPDATE_INTERVAL), "when calling polarOffset in CorruptedBlood, line 98"), "when calling setXY in CorruptedBlood, line 98")
	effect_setPos(this73.sfx, unit_getPos(this73.slime, "when calling getPos in CorruptedBlood, line 99"), "when calling setPos in CorruptedBlood, line 99")
	if (dist <= CorruptedBlood_SLIME_PROXIMITY) then
		this73.proximityTime = (this73.proximityTime + CorruptedBlood_UPDATE_INTERVAL)
		growProgress = (this73.proximityTime / CorruptedBlood_GROW_DURATION)
		unit_setScale(this73.slime, (0.5 + (growProgress * 2.0)), "when calling setScale in CorruptedBlood, line 104")
		effect_setScale(this73.sfx, (0.5 + (growProgress * 2.0)), "when calling setScale in CorruptedBlood, line 105")
		if (this73.proximityTime >= CorruptedBlood_GROW_DURATION) then
			this73.exploded = true
			effect_destr(this73.sfx, "when calling destr in CorruptedBlood, line 109")
			effect_destr(this73.targetSfx, "when calling destr in CorruptedBlood, line 110")
			explodeSlime(this73.slime, this73.caster, "when calling explodeSlime in CorruptedBlood, line 111")
			CallbackPeriodic_destroyCallbackPeriodic(cb4, "when calling destroyCallbackPeriodic in CorruptedBlood, line 112")
		end
	else
		this73.proximityTime = 0.
		unit_setScale(this73.slime, 0.5, "when calling setScale in CorruptedBlood, line 115")
		effect_setScale(this73.sfx, 0.5, "when calling setScale in CorruptedBlood, line 116")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_CorruptedBlood:create16() 
	local new_inst = ({CallbackSingle_t=nil, exploded=false, slime=nil, sfx=nil, targetSfx=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_CorruptedBlood, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood(this79, __wurst_stackPos96) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos96
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (not(this79.exploded) and unit_isAlive(this79.slime, "when calling isAlive in CorruptedBlood, line 119")) then
		effect_destr(this79.sfx, "when calling destr in CorruptedBlood, line 120")
		effect_destr(this79.targetSfx, "when calling destr in CorruptedBlood, line 121")
		flashEffect1(CorruptedBlood_EXPLODE_SFX, unit_getPos(this79.slime, "when calling getPos in CorruptedBlood, line 122"), "when calling flashEffect in CorruptedBlood, line 122")
		unit_kill(this79.slime, "when calling kill in CorruptedBlood, line 123")
		this79.exploded = true
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent:create17() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent(this80, __wurst_stackPos97) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos97
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onUnreducedDamage("when calling onUnreducedDamage in DamageEvent, line 476")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_DamageEvent1:create18() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_DamageEvent1, }))
	return new_inst
end

function EventListener_add_DamageEvent_onEvent_add_DamageEvent1(this81, __wurst_stackPos99) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos99
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageEvent_onDamage("when calling onDamage in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement:create19() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=DamageElement, }))
	return new_inst
end

function DamageElement_new_DamageElement(name, color, __wurst_stackPos101) 
	local this82 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos101
	wurst_stack_depth = (wurst_stack_depth + 1)
	this82 = DamageElement:create19()
	DamageElement_construct_DamageElement(this82, name, color, "when calling construct_DamageElement in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this82
end

function DamageElement_DamageElement_init(this84, __wurst_stackPos103) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos103
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageElement_construct_DamageElement(this83, name1, color1, __wurst_stackPos102) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos102
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageElement_DamageElement_init(this83, "when calling DamageElement_init in DamageEvent, line 101")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance:create20() 
	local new_inst = ({DamageInstance_source=nil, DamageInstance_target=nil, DamageInstance_amount=0., DamageInstance_nativeAttackType=nil, DamageInstance_nativeDamageType=nil, DamageInstance_nativeWeaponType=nil, })
	setmetatable(new_inst, ({__index=DamageInstance, }))
	return new_inst
end

function DamageInstance_DamageInstance_setReducedAmount(this85, amount1, __wurst_stackPos104) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos104
	wurst_stack_depth = (wurst_stack_depth + 1)
	this85.DamageInstance_amount = amount1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_init(this86, __wurst_stackPos105) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos105
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_new_DamageInstance(id2, source, target4, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType1, damageElement, __wurst_stackPos106) 
	local this87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos106
	wurst_stack_depth = (wurst_stack_depth + 1)
	this87 = DamageInstance:create20()
	DamageInstance_construct_DamageInstance(this87, id2, source, target4, unreducedAmount, nativeAttackType, nativeDamageType, nativeWeaponType, damageType1, damageElement, "when calling construct_DamageInstance in DamageEvent, line 133")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this87
end

function DamageInstance_construct_DamageInstance(this88, id3, source1, target5, unreducedAmount1, nativeAttackType1, nativeDamageType1, nativeWeaponType1, damageType2, damageElement1, __wurst_stackPos107) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos107
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_init(this88, "when calling DamageInstance_init in DamageEvent, line 133")
	this88.DamageInstance_source = source1
	this88.DamageInstance_target = target5
	this88.DamageInstance_amount = unreducedAmount1
	this88.DamageInstance_nativeAttackType = nativeAttackType1
	this88.DamageInstance_nativeDamageType = nativeDamageType1
	this88.DamageInstance_nativeWeaponType = nativeWeaponType1
	DamageInstance_count = (DamageInstance_count + 1)
	DamageInstance_stack[DamageInstance_count] = this88
	DamageInstance_current = this88
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_DamageInstance_onDestroy(this89, __wurst_stackPos108) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos108
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_count = (DamageInstance_count - 1)
	DamageInstance_current = DamageInstance_stack[DamageInstance_count]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageInstance_destroyDamageInstance(this90, __wurst_stackPos109) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos109
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageInstance_DamageInstance_onDestroy(this90, "when calling DamageInstance_onDestroy in DamageEvent, line 162")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener:create21() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener, }))
	return new_inst
end

function DamageListener_DamageListener_onEvent(this91, __wurst_stackPos110) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos110
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_DamageListener_init(this92, __wurst_stackPos111) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos111
	wurst_stack_depth = (wurst_stack_depth + 1)
	this92.DamageListener_next = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_construct_DamageListener(this93, __wurst_stackPos112) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos112
	wurst_stack_depth = (wurst_stack_depth + 1)
	DamageListener_DamageListener_init(this93, "when calling DamageListener_init in DamageEvent, line 431")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Dive:create22() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Dive, }))
	return new_inst
end

function OnCastListener_onCast_Dive_fire_onCast_Dive(this94, caster7, __wurst_stackPos113) 
	local target6 = nil
	local clVar2 = nil
	local temp51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos113
	wurst_stack_depth = (wurst_stack_depth + 1)
	target6 = EventData_getSpellTargetUnit("when calling getSpellTargetUnit in Dive, line 53")
	if (target6 == nil) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	temp51 = Dive_UPDATE_INTERVAL
	clVar2 = CallbackPeriodic_doPeriodically_onCast_Dive:create23()
	CallbackPeriodic_construct_CallbackPeriodic(clVar2, "when calling construct_CallbackPeriodic in Dive, line 60")
	clVar2.caster = caster7
	clVar2.target = target6
	doPeriodically(temp51, clVar2, "when calling doPeriodically in Dive, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_Dive:create23() 
	local new_inst = ({CallbackPeriodic_t=nil, caster=nil, target=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_Dive, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive(this95, cb5, __wurst_stackPos114) 
	local casterPos = ({0., 0., })
	local targetPos1 = ({0., 0., })
	local dist2 = nil
	local moveDir1 = ({0., })
	local moveAmount = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos114
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (not(unit_isAlive(this95.caster, "when calling isAlive in Dive, line 61")) or not(unit_isAlive(this95.target, "when calling isAlive in Dive, line 61"))) then
		CallbackPeriodic_destroyCallbackPeriodic(cb5, "when calling destroyCallbackPeriodic in Dive, line 62")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	casterPos = tupleCopy(unit_getPos(this95.caster, "when calling getPos in Dive, line 65"))
	targetPos1 = tupleCopy(unit_getPos(this95.target, "when calling getPos in Dive, line 66"))
	dist2 = vec2_distanceTo(casterPos, targetPos1, "when calling distanceTo in Dive, line 67")
	moveDir1 = tupleCopy1(vec2_angleTo(casterPos, targetPos1, "when calling angleTo in Dive, line 68"))
	if (dist2 <= 80.) then
		unit_damageTarget(this95.caster, this95.target, Dive_TACKLE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in Dive, line 72")
		flashEffect1(Dive_IMPACT_SFX, targetPos1, "when calling flashEffect in Dive, line 73")
		flashEffect1(Dive_DASH_SFX, casterPos, "when calling flashEffect in Dive, line 75")
		CallbackPeriodic_destroyCallbackPeriodic(cb5, "when calling destroyCallbackPeriodic in Dive, line 77")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	moveAmount = (Dive_DASH_SPEED * Dive_UPDATE_INTERVAL)
	unit_setXY(this95.caster, vec2_polarOffset(casterPos, moveDir1, moveAmount, "when calling polarOffset in Dive, line 82"), "when calling setXY in Dive, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback:create24() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForForceCallback, }))
	return new_inst
end

function ForForceCallback_ForForceCallback_run(this96, __wurst_stackPos115) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos115
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_destroyForForceCallback(this97, __wurst_stackPos116) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos116
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function ForForceCallback_execute_GroupUtils:create25() 
	local new_inst = ({createNow=0, })
	setmetatable(new_inst, ({__index=ForForceCallback_execute_GroupUtils, }))
	return new_inst
end

function ForForceCallback_execute_GroupUtils_run_execute_GroupUtils(this98, __wurst_stackPos117) 
	local i1 = nil
	local temp1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos117
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_numTotal = (GroupUtils_numTotal + this98.createNow)
	i1 = 1
	temp1 = this98.createNow
	while true do
		if (i1 > temp1) then
			break
		end
		push(CreateGroup(), "when calling push in GroupUtils, line 93")
		i1 = (i1 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator:create26() 
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

function GroupIterator_destroyGroupIterator(this100, __wurst_stackPos120) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos120
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_onDestroy(this100, "when calling GroupIterator_onDestroy in Group, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_init(this102, __wurst_stackPos122) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos122
	wurst_stack_depth = (wurst_stack_depth + 1)
	this102.GroupIterator_i = 0
	this102.GroupIterator_n = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_new_GroupIterator(source2, __wurst_stackPos123) 
	local this103 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos123
	wurst_stack_depth = (wurst_stack_depth + 1)
	this103 = GroupIterator:create26()
	GroupIterator_construct_GroupIterator(this103, source2, "when calling construct_GroupIterator in Group, line 119")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this103
end

function GroupIterator_construct_GroupIterator(this104, source3, __wurst_stackPos124) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos124
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupIterator_GroupIterator_init(this104, "when calling GroupIterator_init in Group, line 119")
	this104.GroupIterator_g = CreateGroup()
	group_add(this104.GroupIterator_g, "when calling add in Group, line 121", source3)
	this104.GroupIterator_n = group_size(this104.GroupIterator_g, "when calling size in Group, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function GroupIterator_GroupIterator_onDestroy(this101, __wurst_stackPos121) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos121
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_clear(this101.GroupIterator_g, "when calling clear in Group, line 136")
	group_destr(this101.GroupIterator_g, "when calling destr in Group, line 137")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap:create27() 
	local new_inst = ({HashMap_size=0, })
	setmetatable(new_inst, ({__index=HashMap, }))
	return new_inst
end

function HashMap_HashMap_has(this109, key3, __wurst_stackPos129) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos129
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Table_Table_hasInt(this109, __wurst_objectToIndex(key3), "when calling hasInt in HashMap, line 14")
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

function HashMap_HashMap_init(this114, __wurst_stackPos134) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos134
	wurst_stack_depth = (wurst_stack_depth + 1)
	this114.HashMap_size = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function HashMap_new_HashMap(__wurst_stackPos135) 
	local this115 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos135
	wurst_stack_depth = (wurst_stack_depth + 1)
	this115 = HashMap:create27()
	HashMap_construct_HashMap(this115, "when calling construct_HashMap in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this115
end

function HashMap_construct_HashMap(this116, __wurst_stackPos136) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos136
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_construct_Table(this116, "when calling construct_Table in HashMap, line 7")
	HashMap_HashMap_init(this116, "when calling HashMap_init in HashMap, line 7")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_HeroTrainer:create28() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_HeroTrainer, }))
	return new_inst
end

function EventListener_add_HeroTrainer_onEvent_add_HeroTrainer(this118, __wurst_stackPos138) 
	local building = nil
	local trained = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos138
	wurst_stack_depth = (wurst_stack_depth + 1)
	building = EventData_getTrainedUnit("when calling getTrainedUnit in HeroTrainer, line 10")
	trained = EventData_getTrainedUnit("when calling getTrainedUnit in HeroTrainer, line 11")
	if (unit_getTypeId(building, "when calling getTypeId in HeroTrainer, line 13") == HeroTrainer_TAVERN_ID) then
		unit_remove(building, "when calling remove in HeroTrainer, line 14")
		print1(stringConcat("Hero chosen: ", unit_getName(trained, "when calling getName in HeroTrainer, line 15")), "when calling print in HeroTrainer, line 15")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Hibernate:create29() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Hibernate, }))
	return new_inst
end

function OnCastListener_onCast_Hibernate_fire_onCast_Hibernate(this121, caster8, __wurst_stackPos142) 
	local level1 = nil
	local totalHeal = nil
	local healPerTick = nil
	local sfx1 = nil
	local healTimer = nil
	local clVar3 = nil
	local clVar4 = nil
	local temp53 = nil
	local temp54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos142
	wurst_stack_depth = (wurst_stack_depth + 1)
	level1 = (unit_getAbilityLevel(caster8, Hibernate_HIBERNATE_ID, "when calling getAbilityLevel in Hibernate, line 67") - 1)
	totalHeal = ((unit_getMaxHP(caster8, "when calling getMaxHP in Hibernate, line 69") * realEnsure(Hibernate_HP_PCT[level1])) + realEnsure(Hibernate_HP_FLAT[level1]))
	healPerTick = (totalHeal / (Hibernate_HIBERNATE_DURATION / Hibernate_HEAL_INTERVAL))
	unit_setArmor(caster8, (unit_getArmor(caster8, "when calling getArmor in Hibernate, line 72") + Hibernate_ARMOR_BONUS), "when calling setArmor in Hibernate, line 72")
	unit_pause(caster8, "when calling pause in Hibernate, line 73")
	unit_setPathing(caster8, false, "when calling setPathing in Hibernate, line 74")
	__wurst_safe_UnitAddAbility(caster8, Hibernate_HIBERNATE_BUFF_ID)
	sfx1 = addEffect1("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", caster8, "origin", "when calling addEffect in Hibernate, line 78")
	temp53 = Hibernate_HEAL_INTERVAL
	clVar3 = CallbackPeriodic_doPeriodically_onCast_Hibernate:create30()
	CallbackPeriodic_construct_CallbackPeriodic(clVar3, "when calling construct_CallbackPeriodic in Hibernate, line 80")
	clVar3.caster = caster8
	clVar3.healPerTick = healPerTick
	healTimer = doPeriodically(temp53, clVar3, "when calling doPeriodically in Hibernate, line 80")
	temp54 = Hibernate_HIBERNATE_DURATION
	clVar4 = CallbackSingle_doAfter_onCast_Hibernate:create31()
	CallbackSingle_construct_CallbackSingle(clVar4, "when calling construct_CallbackSingle in Hibernate, line 85")
	clVar4.healTimer = healTimer
	clVar4.caster = caster8
	clVar4.sfx = sfx1
	doAfter(temp54, clVar4, "when calling doAfter in Hibernate, line 85")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_Hibernate:create30() 
	local new_inst = ({CallbackPeriodic_t=nil, caster=nil, healPerTick=0., })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_Hibernate, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate(this127, cb6, __wurst_stackPos149) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos149
	wurst_stack_depth = (wurst_stack_depth + 1)
	if unit_isAlive(this127.caster, "when calling isAlive in Hibernate, line 81") then
		unit_addHP(this127.caster, this127.healPerTick, "when calling addHP in Hibernate, line 82")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_Hibernate:create31() 
	local new_inst = ({CallbackSingle_t=nil, healTimer=nil, caster=nil, sfx=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_Hibernate, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate(this128, __wurst_stackPos150) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos150
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this128.healTimer, "when calling destroyCallbackPeriodic in Hibernate, line 86")
	unit_unpause(this128.caster, "when calling unpause in Hibernate, line 87")
	unit_setPathing(this128.caster, true, "when calling setPathing in Hibernate, line 88")
	unit_setArmor(this128.caster, (unit_getArmor(this128.caster, "when calling getArmor in Hibernate, line 89") - Hibernate_ARMOR_BONUS), "when calling setArmor in Hibernate, line 89")
	__wurst_safe_UnitRemoveAbility(this128.caster, Hibernate_HIBERNATE_BUFF_ID)
	effect_destr(this128.sfx, "when calling destr in Hibernate, line 91")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_InitFocusCamera:create32() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_InitFocusCamera, }))
	return new_inst
end

function CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera(this130, __wurst_stackPos152) 
	local tree = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos152
	wurst_stack_depth = (wurst_stack_depth + 1)
	tree = gg_unit_etol_0001
	if (GetLocalPlayer() == Player(0)) then
		PanCameraToTimed(unit_getX(tree, "when calling getX in InitFocusCamera, line 10"), unit_getY(tree, "when calling getY in InitFocusCamera, line 10"), 0.)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_Invigorate:create33() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_Invigorate, }))
	return new_inst
end

function CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate(this133, __wurst_stackPos155) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos155
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount > 0) then
		Invigorate_seedlingCount = (Invigorate_seedlingCount - 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_Isolation:create34() 
	local new_inst = ({CallbackPeriodic_t=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_Isolation, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation(this134, cb7, __wurst_stackPos156) 
	local g3 = nil
	local u6 = nil
	local from = nil
	local clVar5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos156
	wurst_stack_depth = (wurst_stack_depth + 1)
	g3 = CreateGroup()
	group_enumUnitsInRect1(g3, bj_mapInitialPlayableArea, "when calling enumUnitsInRect in Isolation, line 71")
	from = g3
	while true do
		if not(group_hasNext(from, "when calling hasNext in Isolation, line 73")) then
			break
		end
		u6 = group_next(from, "when calling next in Isolation, line 73")
		if (unit_hasAbility(u6, Isolation_ISOLATION_BUFF_ID, "when calling hasAbility in Isolation, line 74") and not(unit_hasAbility(u6, Nightmare_NIGHTMARE_BUFF_ID, "when calling hasAbility in Isolation, line 74"))) then
			group_enumUnitsInRange(Group_ENUM_GROUP, unit_getPos(u6, "when calling getPos in Isolation, line 75"), 300., nil, "when calling enumUnitsInRange in Isolation, line 75")
			if not((group_size(Group_ENUM_GROUP, "when calling size in Isolation, line 76") > 1)) then
				print1(stringConcat("print size is: ", int_toString(group_size(Group_ENUM_GROUP, "when calling size in Isolation, line 77"), "when calling toString in Isolation, line 77")), "when calling print in Isolation, line 77")
				unit_damageTarget(u6, u6, Isolation_ISOLATION_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in Isolation, line 78")
			end
		end
	end
	clVar5 = CallbackSingle_doAfter_doPeriodically_Isolation:create35()
	CallbackSingle_construct_CallbackSingle(clVar5, "when calling construct_CallbackSingle in Isolation, line 82")
	clVar5.g = g3
	doAfter(5., clVar5, "when calling doAfter in Isolation, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_doPeriodically_Isolation:create35() 
	local new_inst = ({CallbackSingle_t=nil, g=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_doPeriodically_Isolation, }))
	return new_inst
end

function CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation(this139, __wurst_stackPos161) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos161
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_destr(this139.g, "when calling destr in Isolation, line 83")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator:create36() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=LLBackIterator, }))
	return new_inst
end

function LLBackIterator_destroyLLBackIterator(this140, __wurst_stackPos162) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos162
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLBackIterator_LLBackIterator_onDestroy(this140, "when calling LLBackIterator_onDestroy in LinkedList, line 499")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLBackIterator_LLBackIterator_onDestroy(this141, __wurst_stackPos163) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos163
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry:create37() 
	local new_inst = ({LLEntry_elem=nil, LLEntry_prev=nil, LLEntry_next=nil, })
	setmetatable(new_inst, ({__index=LLEntry, }))
	return new_inst
end

function LLEntry_new_LLEntry(elem, prev, next, __wurst_stackPos164) 
	local this142 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos164
	wurst_stack_depth = (wurst_stack_depth + 1)
	this142 = LLEntry:create37()
	LLEntry_construct_LLEntry(this142, elem, prev, next, "when calling construct_LLEntry in LinkedList, line 433")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this142
end

function LLEntry_destroyLLEntry(this144, __wurst_stackPos166) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos166
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_onDestroy(this144, "when calling LLEntry_onDestroy in LinkedList, line 428")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_init(this146, __wurst_stackPos168) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos168
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_construct_LLEntry(this143, elem1, prev1, next1, __wurst_stackPos165) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos165
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLEntry_LLEntry_init(this143, "when calling LLEntry_init in LinkedList, line 433")
	this143.LLEntry_elem = elem1
	this143.LLEntry_prev = prev1
	this143.LLEntry_next = next1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLEntry_LLEntry_onDestroy(this145, __wurst_stackPos167) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos167
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator:create38() 
	local new_inst = ({LLIterator_dummy=nil, LLIterator_current=nil, LLIterator_parent=nil, LLIterator_destroyOnClose=false, })
	setmetatable(new_inst, ({__index=LLIterator, }))
	return new_inst
end

function LLIterator_LLIterator_next(this147, __wurst_stackPos169) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos169
	wurst_stack_depth = (wurst_stack_depth + 1)
	this147.LLIterator_current = this147.LLIterator_current.LLEntry_next
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this147.LLIterator_current.LLEntry_elem
end

function LLIterator_LLIterator_hasNext(this148, __wurst_stackPos170) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos170
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return not((this148.LLIterator_current.LLEntry_next == this148.LLIterator_dummy))
end

function LLIterator_LLIterator_close(this149, __wurst_stackPos171) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos171
	wurst_stack_depth = (wurst_stack_depth + 1)
	if this149.LLIterator_destroyOnClose then
		LLIterator_destroyLLIterator(this149, "when calling destroyLLIterator in LinkedList, line 497")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_reset(this151, __wurst_stackPos173) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos173
	wurst_stack_depth = (wurst_stack_depth + 1)
	this151.LLIterator_dummy = LinkedList_LinkedList_getDummy(this151.LLIterator_parent, "when calling getDummy in LinkedList, line 454")
	this151.LLIterator_current = this151.LLIterator_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_new_LLIterator(parent, __wurst_stackPos175) 
	local this153 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos175
	wurst_stack_depth = (wurst_stack_depth + 1)
	this153 = LLIterator:create38()
	LLIterator_construct_LLIterator(this153, parent, "when calling construct_LLIterator in LinkedList, line 444")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this153
end

function LLIterator_destroyLLIterator(this150, __wurst_stackPos172) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos172
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_onDestroy(this150, "when calling LLIterator_onDestroy in LinkedList, line 438")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_init(this156, __wurst_stackPos178) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos178
	wurst_stack_depth = (wurst_stack_depth + 1)
	this156.LLIterator_destroyOnClose = true
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_construct_LLIterator(this154, parent1, __wurst_stackPos176) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos176
	wurst_stack_depth = (wurst_stack_depth + 1)
	LLIterator_LLIterator_init(this154, "when calling LLIterator_init in LinkedList, line 444")
	this154.LLIterator_parent = parent1
	LLIterator_LLIterator_reset(this154, "when calling reset in LinkedList, line 446")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LLIterator_LLIterator_onDestroy(this155, __wurst_stackPos177) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos177
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList:create39() 
	local new_inst = ({LinkedList_dummy=nil, LinkedList_size=0, LinkedList_staticItr=nil, LinkedList_staticBackItr=nil, })
	setmetatable(new_inst, ({__index=LinkedList, }))
	return new_inst
end

function LinkedList_LinkedList_add(this157, __wurst_stackPos179, ...) 
	local entry = nil
	local elem2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos179
	wurst_stack_depth = (wurst_stack_depth + 1)
	local __args = table.pack(...)
	for i2=1,__args.n do
	elem2 = __args[i2]
	entry = LLEntry_new_LLEntry(elem2, this157.LinkedList_dummy.LLEntry_prev, this157.LinkedList_dummy, "when calling new_LLEntry in LinkedList, line 39")
	this157.LinkedList_dummy.LLEntry_prev.LLEntry_next = entry
	this157.LinkedList_dummy.LLEntry_prev = entry
	this157.LinkedList_size = (this157.LinkedList_size + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_iterator(this158, __wurst_stackPos180) 
	local stackTrace_tempReturn = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos180
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn = LLIterator_new_LLIterator(this158, "when calling new_LLIterator in LinkedList, line 179")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn
end

function LinkedList_LinkedList_has(this159, elem3, __wurst_stackPos181) 
	local entry1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos181
	wurst_stack_depth = (wurst_stack_depth + 1)
	entry1 = this159.LinkedList_dummy.LLEntry_next
	while true do
		if not(not((entry1 == this159.LinkedList_dummy))) then
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

function LinkedList_new_LinkedList(__wurst_stackPos182) 
	local this160 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos182
	wurst_stack_depth = (wurst_stack_depth + 1)
	this160 = LinkedList:create39()
	LinkedList_construct_LinkedList2(this160, "when calling construct_LinkedList2 in LinkedList, line 31")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this160
end

function LinkedList_LinkedList_enqueue(this162, elem4, __wurst_stackPos184) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos184
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_add(this162, "when calling add in LinkedList, line 187", elem4)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_getDummy(this152, __wurst_stackPos174) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos174
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this152.LinkedList_dummy
end

function LinkedList_LinkedList_init(this163, __wurst_stackPos185) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos185
	wurst_stack_depth = (wurst_stack_depth + 1)
	this163.LinkedList_dummy = LLEntry_new_LLEntry(nil, nil, nil, "when calling new_LLEntry in LinkedList, line 18")
	this163.LinkedList_size = 0
	this163.LinkedList_staticItr = nil
	this163.LinkedList_staticBackItr = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_construct_LinkedList2(this161, __wurst_stackPos183) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos183
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_init(this161, "when calling LinkedList_init in LinkedList, line 31")
	this161.LinkedList_dummy.LLEntry_next = this161.LinkedList_dummy
	this161.LinkedList_dummy.LLEntry_prev = this161.LinkedList_dummy
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_LinkedList_onDestroy(this164, __wurst_stackPos186) 
	local current = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos186
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((this164.LinkedList_staticItr == nil)) then
		LLIterator_destroyLLIterator(this164.LinkedList_staticItr, "when calling destroyLLIterator in LinkedList, line 413")
	end
	if not((this164.LinkedList_staticBackItr == nil)) then
		LLBackIterator_destroyLLBackIterator(this164.LinkedList_staticBackItr, "when calling destroyLLBackIterator in LinkedList, line 415")
	end
	current = this164.LinkedList_dummy.LLEntry_next
	while true do
		if not(not((current == this164.LinkedList_dummy))) then
			break
		end
		current = current.LLEntry_next
		LLEntry_destroyLLEntry(current.LLEntry_prev, "when calling destroyLLEntry in LinkedList, line 419")
	end
	LLEntry_destroyLLEntry(this164.LinkedList_dummy, "when calling destroyLLEntry in LinkedList, line 420")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function LinkedList_destroyLinkedList(this165, __wurst_stackPos187) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos187
	wurst_stack_depth = (wurst_stack_depth + 1)
	LinkedList_LinkedList_onDestroy(this165, "when calling LinkedList_onDestroy in LinkedList, line 411")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_MoonWarrior:create40() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_MoonWarrior, }))
	return new_inst
end

function OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior(this166, caster9, __wurst_stackPos188) 
	local pos7 = ({0., 0., })
	local owner1 = nil
	local originalCooldown = nil
	local tiger = nil
	local clVar6 = nil
	local temp56 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos188
	wurst_stack_depth = (wurst_stack_depth + 1)
	pos7 = tupleCopy(unit_getPos(caster9, "when calling getPos in MoonWarrior, line 78"))
	owner1 = unit_getOwner(caster9, "when calling getOwner in MoonWarrior, line 79")
	flashEffect1(MoonWarrior_DISMOUNT_SFX, pos7, "when calling flashEffect in MoonWarrior, line 82")
	originalCooldown = unit_getAttackCooldown(caster9, 1, "when calling getAttackCooldown in MoonWarrior, line 85")
	unit_setAttackCooldown(caster9, (unit_getAttackCooldown(caster9, 1, "when calling getAttackCooldown in MoonWarrior, line 86") * MoonWarrior_BONUS_ATTACK_SPEED), 1, "when calling setAttackCooldown in MoonWarrior, line 86")
	unit_setBaseDamage(caster9, (unit_getBaseDamage(caster9, 0, "when calling getBaseDamage in MoonWarrior, line 87") + real_toInt(MoonWarrior_BONUS_DAMAGE, "when calling toInt in MoonWarrior, line 87")), 0, "when calling setBaseDamage in MoonWarrior, line 87")
	__wurst_safe_UnitAddAbility(caster9, MoonWarrior_MOON_WARRIOR_BUFF_ID)
	tiger = createUnit(owner1, MoonWarrior_TIGER_UNIT_ID, vec2_polarOffset(pos7, unit_getFacingAngle(caster9, "when calling getFacingAngle in MoonWarrior, line 97"), 100., "when calling polarOffset in MoonWarrior, line 97"), unit_getFacingAngle(caster9, "when calling getFacingAngle in MoonWarrior, line 97"), "when calling createUnit in MoonWarrior, line 97")
	flashEffect1(MoonWarrior_SUMMON_SFX, unit_getPos(tiger, "when calling getPos in MoonWarrior, line 98"), "when calling flashEffect in MoonWarrior, line 98")
	print1("Tiger summoned!", "when calling print in MoonWarrior, line 99")
	temp56 = MoonWarrior_TIGER_DURATION
	clVar6 = CallbackSingle_doAfter_onCast_MoonWarrior:create41()
	CallbackSingle_construct_CallbackSingle(clVar6, "when calling construct_CallbackSingle in MoonWarrior, line 102")
	clVar6.caster = caster9
	clVar6.originalCooldown = originalCooldown
	clVar6.tiger = tiger
	doAfter(temp56, clVar6, "when calling doAfter in MoonWarrior, line 102")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_MoonWarrior:create41() 
	local new_inst = ({CallbackSingle_t=nil, caster=nil, originalCooldown=0., tiger=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_MoonWarrior, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior(this173, __wurst_stackPos195) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos195
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setAttackCooldown(this173.caster, this173.originalCooldown, 1, "when calling setAttackCooldown in MoonWarrior, line 104")
	unit_setBaseDamage(this173.caster, (unit_getBaseDamage(this173.caster, 0, "when calling getBaseDamage in MoonWarrior, line 105") - real_toInt(MoonWarrior_BONUS_DAMAGE, "when calling toInt in MoonWarrior, line 105")), 0, "when calling setBaseDamage in MoonWarrior, line 105")
	__wurst_safe_UnitRemoveAbility(this173.caster, MoonWarrior_MOON_WARRIOR_BUFF_ID)
	if unit_isAlive(this173.tiger, "when calling isAlive in MoonWarrior, line 109") then
		flashEffect1(MoonWarrior_DISMOUNT_SFX, unit_getPos(this173.tiger, "when calling getPos in MoonWarrior, line 110"), "when calling flashEffect in MoonWarrior, line 110")
		unit_kill(this173.tiger, "when calling kill in MoonWarrior, line 111")
	end
	print1("Moon Warrior ended.", "when calling print in MoonWarrior, line 113")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Nightmare:create42() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Nightmare, }))
	return new_inst
end

function OnCastListener_onCast_Nightmare_fire_onCast_Nightmare(this174, caster10, __wurst_stackPos196) 
	local targetPos2 = ({0., 0., })
	local iterator3 = nil
	local u7 = nil
	local target8 = nil
	local clVar7 = nil
	local temp57 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos196
	wurst_stack_depth = (wurst_stack_depth + 1)
	targetPos2 = tupleCopy(EventData_getSpellTargetPos("when calling getSpellTargetPos in Nightmare, line 59"))
	flashEffect1(Nightmare_NIGHTMARE_SFX, targetPos2, "when calling flashEffect in Nightmare, line 60")
	group_enumUnitsInRange(Group_ENUM_GROUP, targetPos2, Nightmare_NIGHTMARE_RADIUS, nil, "when calling enumUnitsInRange in Nightmare, line 62")
	iterator3 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Nightmare, line 63")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator3, "when calling hasNext in Nightmare, line 63")) then
			break
		end
		u7 = GroupIterator_GroupIterator_next(iterator3, "when calling next in Nightmare, line 63")
		if (((unit_isAlive(u7, "when calling isAlive in Nightmare, line 64") and player_isEnemyOf(unit_getOwner(u7, "when calling getOwner in Nightmare, line 64"), unit_getOwner(caster10, "when calling getOwner in Nightmare, line 64"), "when calling isEnemyOf in Nightmare, line 64")) and not(unit_isType(u7, UNIT_TYPE_HERO, "when calling isType in Nightmare, line 64"))) and not(unit_isType(u7, UNIT_TYPE_MAGIC_IMMUNE, "when calling isType in Nightmare, line 65"))) then
			target8 = u7
			unit_getOwner(u7, "when calling getOwner in Nightmare, line 67")
			print1(stringConcat("Has buff: ", boolean_toString(unit_hasAbility(target8, 1098216300, "when calling hasAbility in Nightmare, line 71"), "when calling toString in Nightmare, line 71")), "when calling print in Nightmare, line 71")
			InstantDummyCaster_castTarget(Player_players[PLAYER_NEUTRAL_AGGRESSIVE], 1096119148, 1, OrderIds_sleep, u7, "when calling castTarget in Nightmare, line 72")
			flashEffect(Nightmare_NIGHTMARE_SFX, target8, "origin", "when calling flashEffect in Nightmare, line 73")
			HashMap_HashMap_put(Nightmare_sleepingUnits, __wurst_objectToIndex(target8), booleanToIndex(true, "when calling booleanToIndex in Nightmare, line 74"), "when calling put in Nightmare, line 74")
			flashEffect(Nightmare_NIGHTMARE_SFX, target8, "origin", "when calling flashEffect in Nightmare, line 75")
			print1(stringConcat(unit_getName(target8, "when calling getName in Nightmare, line 76"), " falls into the Nightmare!"), "when calling print in Nightmare, line 76")
			temp57 = Nightmare_NIGHTMARE_DURATION
			clVar7 = CallbackSingle_doAfter_onCast_Nightmare:create43()
			CallbackSingle_construct_CallbackSingle(clVar7, "when calling construct_CallbackSingle in Nightmare, line 78")
			clVar7.target = target8
			clVar7.caster = caster10
			doAfter(temp57, clVar7, "when calling doAfter in Nightmare, line 78")
		end
	end
	GroupIterator_GroupIterator_close(iterator3, "when calling close in Nightmare, line 63")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_Nightmare:create43() 
	local new_inst = ({CallbackSingle_t=nil, target=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_Nightmare, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare(this177, __wurst_stackPos201) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos201
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (HashMap_HashMap_has(Nightmare_sleepingUnits, __wurst_objectToIndex(this177.target), "when calling has in Nightmare, line 79") and booleanFromIndex(intEnsure(HashMap_HashMap_get(Nightmare_sleepingUnits, __wurst_objectToIndex(this177.target), "when calling get in Nightmare, line 79")), "when calling booleanFromIndex in Nightmare, line 79")) then
		unit_setOwner(this177.target, unit_getOwner(this177.caster, "when calling getOwner in Nightmare, line 82"), true, "when calling setOwner in Nightmare, line 82")
		__wurst_safe_UnitRemoveAbility(this177.target, 1112896364)
		__wurst_safe_UnitRemoveAbility(this177.target, 1112896368)
		__wurst_safe_UnitRemoveAbility(this177.target, 1114993524)
		HashMap_HashMap_remove(Nightmare_sleepingUnits, __wurst_objectToIndex(this177.target), "when calling remove in Nightmare, line 87")
		flashEffect(Nightmare_CORRUPT_SFX, this177.target, "origin", "when calling flashEffect in Nightmare, line 88")
	else
		HashMap_HashMap_remove(Nightmare_sleepingUnits, __wurst_objectToIndex(this177.target), "when calling remove in Nightmare, line 91")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_Nightmare:create44() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_Nightmare, }))
	return new_inst
end

function EventListener_add_Nightmare_onEvent_add_Nightmare(this179, __wurst_stackPos204) 
	local damaged = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos204
	wurst_stack_depth = (wurst_stack_depth + 1)
	damaged = EventData_getTriggerUnit("when calling getTriggerUnit in Nightmare, line 95")
	if (HashMap_HashMap_has(Nightmare_sleepingUnits, __wurst_objectToIndex(damaged), "when calling has in Nightmare, line 96") and booleanFromIndex(intEnsure(HashMap_HashMap_get(Nightmare_sleepingUnits, __wurst_objectToIndex(damaged), "when calling get in Nightmare, line 96")), "when calling booleanFromIndex in Nightmare, line 96")) then
		unit_unpause(damaged, "when calling unpause in Nightmare, line 98")
		HashMap_HashMap_put(Nightmare_sleepingUnits, __wurst_objectToIndex(damaged), booleanToIndex(false, "when calling booleanToIndex in Nightmare, line 99"), "when calling put in Nightmare, line 99")
		flashEffect("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", damaged, "origin", "when calling flashEffect in Nightmare, line 100")
		print1(stringConcat(unit_getName(damaged, "when calling getName in Nightmare, line 101"), " has been woken from the Nightmare!"), "when calling print in Nightmare, line 101")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator:create45() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=IdGenerator, }))
	return new_inst
end

function IdGenerator_new_IdGenerator(start, __wurst_stackPos206) 
	local this180 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos206
	wurst_stack_depth = (wurst_stack_depth + 1)
	this180 = IdGenerator:create45()
	IdGenerator_construct_IdGenerator(this180, start, "when calling construct_IdGenerator in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this180
end

function IdGenerator_IdGenerator_init(this182, __wurst_stackPos208) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos208
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function IdGenerator_construct_IdGenerator(this181, start1, __wurst_stackPos207) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos207
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_IdGenerator_init(this181, "when calling IdGenerator_init in ObjectIdGenerator, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_OnUnitEnterLeave:create46() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_OnUnitEnterLeave, }))
	return new_inst
end

function CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave(this183, __wurst_stackPos209) 
	local receiver14 = nil
	local count = nil
	local i3 = nil
	local temp2 = nil
	local receiver15 = nil
	local receiver16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos209
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

function ForGroupCallback_forEachFrom_Preloader:create47() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=ForGroupCallback_forEachFrom_Preloader, }))
	return new_inst
end

function ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader(this185, u10, __wurst_stackPos213) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos213
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(u10, "when calling remove in Preloader, line 48")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_nullTimer_Preloader:create48() 
	local new_inst = ({CallbackSingle_t=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_nullTimer_Preloader, }))
	return new_inst
end

function CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader(this186, __wurst_stackPos214) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos214
	wurst_stack_depth = (wurst_stack_depth + 1)
	finishPreload("when calling finishPreload in Preloader, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_Recycle:create49() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_Recycle, }))
	return new_inst
end

function EventListener_add_Recycle_onEvent_add_Recycle(this187, __wurst_stackPos216) 
	local dying = nil
	local pos8 = ({0., 0., })
	local closest = nil
	local closestDist = nil
	local iterator4 = nil
	local u11 = nil
	local dist3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos216
	wurst_stack_depth = (wurst_stack_depth + 1)
	dying = EventData_getDyingUnit("when calling getDyingUnit in Recycle, line 42")
	if unit_hasAbility(dying, Recycle_RECYCLE_ID, "when calling hasAbility in Recycle, line 43") then
		pos8 = tupleCopy(unit_getPos(dying, "when calling getPos in Recycle, line 44"))
		closest = nil
		closestDist = 99999.
		group_enumUnitsInRange(Group_ENUM_GROUP, pos8, 99999., nil, "when calling enumUnitsInRange in Recycle, line 48")
		iterator4 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Recycle, line 49")
		while true do
			if not(GroupIterator_GroupIterator_hasNext(iterator4, "when calling hasNext in Recycle, line 49")) then
				break
			end
			u11 = GroupIterator_GroupIterator_next(iterator4, "when calling next in Recycle, line 49")
			if ((not((u11 == dying)) and unit_isAlive(u11, "when calling isAlive in Recycle, line 50")) and player_isAllyOf(unit_getOwner(u11, "when calling getOwner in Recycle, line 50"), unit_getOwner(dying, "when calling getOwner in Recycle, line 50"), "when calling isAllyOf in Recycle, line 50")) then
				dist3 = vec2_distanceTo(pos8, unit_getPos(u11, "when calling getPos in Recycle, line 51"), "when calling distanceTo in Recycle, line 51")
				if (dist3 < closestDist) then
					closestDist = dist3
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

function OnCastListener_onCast_SeedBurst:create50() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SeedBurst, }))
	return new_inst
end

function OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst(this188, caster11, __wurst_stackPos218) 
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
	local clVar8 = nil
	local iterator7 = nil
	local wrapper1 = nil
	local temp58 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos218
	wurst_stack_depth = (wurst_stack_depth + 1)
	level2 = (unit_getAbilityLevel(caster11, SeedBurst_SEED_BURST_ID, "when calling getAbilityLevel in SeedBurst, line 82") - 1)
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
		temp58 = delay
		clVar8 = CallbackSingle_doAfter_onCast_SeedBurst:create51()
		CallbackSingle_construct_CallbackSingle(clVar8, "when calling construct_CallbackSingle in SeedBurst, line 96")
		clVar8.explodePos = tupleCopy(explodePos)
		clVar8.radius = radius2
		clVar8.caster = caster11
		clVar8.damage = damage
		doAfter(temp58, clVar8, "when calling doAfter in SeedBurst, line 96")
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

function CallbackSingle_doAfter_onCast_SeedBurst:create51() 
	local new_inst = ({CallbackSingle_t=nil, explodePos=({0., 0., }), radius=0., caster=nil, damage=0., })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SeedBurst, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst(this191, __wurst_stackPos222) 
	local iterator8 = nil
	local u13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos222
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect1(SeedBurst_BURST_SFX, this191.explodePos, "when calling flashEffect in SeedBurst, line 97")
	flashEffect1(SeedBurst_EXPLOSION_SFX, this191.explodePos, "when calling flashEffect in SeedBurst, line 98")
	group_enumUnitsInRange(Group_ENUM_GROUP, this191.explodePos, this191.radius, nil, "when calling enumUnitsInRange in SeedBurst, line 99")
	iterator8 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SeedBurst, line 100")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator8, "when calling hasNext in SeedBurst, line 100")) then
			break
		end
		u13 = GroupIterator_GroupIterator_next(iterator8, "when calling next in SeedBurst, line 100")
		if (unit_isAlive(u13, "when calling isAlive in SeedBurst, line 101") and player_isEnemyOf(unit_getOwner(u13, "when calling getOwner in SeedBurst, line 101"), unit_getOwner(this191.caster, "when calling getOwner in SeedBurst, line 101"), "when calling isEnemyOf in SeedBurst, line 101")) then
			unit_damageTarget(this191.caster, u13, this191.damage, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in SeedBurst, line 102")
		end
	end
	GroupIterator_GroupIterator_close(iterator8, "when calling close in SeedBurst, line 100")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper:create52() 
	local new_inst = ({Vec2Wrapper_pos=({0., 0., }), })
	setmetatable(new_inst, ({__index=Vec2Wrapper, }))
	return new_inst
end

function Vec2Wrapper_Vec2Wrapper_init(this192, __wurst_stackPos223) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos223
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_new_Vec2Wrapper(p6, __wurst_stackPos219) 
	local this193 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos219
	wurst_stack_depth = (wurst_stack_depth + 1)
	this193 = Vec2Wrapper:create52()
	Vec2Wrapper_construct_Vec2Wrapper(this193, p6, "when calling construct_Vec2Wrapper in SeedBurst, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this193
end

function Vec2Wrapper_construct_Vec2Wrapper(this194, p7, __wurst_stackPos224) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos224
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_init(this194, "when calling Vec2Wrapper_init in SeedBurst, line 24")
	this194.Vec2Wrapper_pos = tupleCopy(p7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_Vec2Wrapper_onDestroy(this195, __wurst_stackPos225) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos225
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Vec2Wrapper_destroyVec2Wrapper(this190, __wurst_stackPos221) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos221
	wurst_stack_depth = (wurst_stack_depth + 1)
	Vec2Wrapper_Vec2Wrapper_onDestroy(this190, "when calling Vec2Wrapper_onDestroy in SeedBurst, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_SeedlingTracker:create53() 
	local new_inst = ({CallbackPeriodic_t=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_SeedlingTracker, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker(this196, cb8, __wurst_stackPos226) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos226
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((SeedlingTracker_trackerItem == nil)) then
		item_setCharges(SeedlingTracker_trackerItem, getSeedlingCount("when calling getSeedlingCount in SeedlingTracker, line 48"), "when calling setCharges in SeedlingTracker, line 48")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add_SeedlingTracker:create54() 
	local new_inst = ({EventListener_eventId=0, EventListener_uid=0, EventListener_next=nil, EventListener_prev=nil, })
	setmetatable(new_inst, ({__index=EventListener_add_SeedlingTracker, }))
	return new_inst
end

function EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker(this198, __wurst_stackPos229) 
	local trained1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos229
	wurst_stack_depth = (wurst_stack_depth + 1)
	trained1 = EventData_getTrainedUnit("when calling getTrainedUnit in SeedlingTracker, line 52")
	if (unit_getTypeId(trained1, "when calling getTypeId in SeedlingTracker, line 53") == 1164666213) then
		initSeedlingTracker(trained1, "when calling initSeedlingTracker in SeedlingTracker, line 54")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageListener_addListener_ShieldBash:create55() 
	local new_inst = ({DamageListener_next=nil, })
	setmetatable(new_inst, ({__index=DamageListener_addListener_ShieldBash, }))
	return new_inst
end

function DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash(this199, __wurst_stackPos231) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos231
	wurst_stack_depth = (wurst_stack_depth + 1)
	onDamageTaken("when calling onDamageTaken in ShieldBash, line 86")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_SpiritWisps:create56() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SpiritWisps, }))
	return new_inst
end

function OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps(this200, caster12, __wurst_stackPos233) 
	local wisps = nil
	local i4 = nil
	local temp3 = nil
	local startAngle = nil
	local spawnPos = ({0., 0., })
	local wisp = nil
	local moveTimer = nil
	local clVar9 = nil
	local healTimer1 = nil
	local clVar10 = nil
	local clVar11 = nil
	local temp59 = nil
	local temp60 = nil
	local temp61 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos233
	wurst_stack_depth = (wurst_stack_depth + 1)
	wisps = LinkedList_new_LinkedList("when calling new_LinkedList in SpiritWisps, line 60")
	i4 = 0
	temp3 = (SpiritWisps_WISP_COUNT - 1)
	while true do
		if (i4 > temp3) then
			break
		end
		startAngle = (((2. * bj_PI) * int_toReal(i4, "when calling toReal in SpiritWisps, line 63")) / int_toReal(SpiritWisps_WISP_COUNT, "when calling toReal in SpiritWisps, line 63"))
		spawnPos = tupleCopy(vec2_polarOffset(unit_getPos(caster12, "when calling getPos in SpiritWisps, line 64"), ({startAngle, }), SpiritWisps_ORBIT_RADIUS, "when calling polarOffset in SpiritWisps, line 64"))
		wisp = createUnit(unit_getOwner(caster12, "when calling getOwner in SpiritWisps, line 65"), SpiritWisps_WISP_UNIT_ID, spawnPos, ({0., }), "when calling createUnit in SpiritWisps, line 65")
		unit_addAbility(wisp, 1097625443, "when calling addAbility in SpiritWisps, line 66")
		unit_setVertexColor(wisp, 50, 255, 50, 255, "when calling setVertexColor in SpiritWisps, line 67")
		widget_addEffect(wisp, "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes2.mdl", "origin", "when calling addEffect in SpiritWisps, line 69")
		LinkedList_LinkedList_add(wisps, "when calling add in SpiritWisps, line 70", __wurst_objectToIndex(wisp))
		i4 = (i4 + 1)
	end
	temp59 = SpiritWisps_UPDATE_INTERVAL
	clVar9 = CallbackPeriodic_doPeriodically_onCast_SpiritWisps:create57()
	CallbackPeriodic_construct_CallbackPeriodic(clVar9, "when calling construct_CallbackPeriodic in SpiritWisps, line 72")
	clVar9.wisps = wisps
	clVar9.caster = caster12
	moveTimer = doPeriodically(temp59, clVar9, "when calling doPeriodically in SpiritWisps, line 72")
	temp60 = SpiritWisps_HEAL_INTERVAL
	clVar10 = CallbackPeriodic_doPeriodically_onCast_SpiritWisps1:create58()
	CallbackPeriodic_construct_CallbackPeriodic(clVar10, "when calling construct_CallbackPeriodic in SpiritWisps, line 114")
	clVar10.caster = caster12
	healTimer1 = doPeriodically(temp60, clVar10, "when calling doPeriodically in SpiritWisps, line 114")
	temp61 = SpiritWisps_WISP_DURATION
	clVar11 = CallbackSingle_doAfter_onCast_SpiritWisps:create59()
	CallbackSingle_construct_CallbackSingle(clVar11, "when calling construct_CallbackSingle in SpiritWisps, line 122")
	clVar11.moveTimer = moveTimer
	clVar11.healTimer = healTimer1
	clVar11.wisps = wisps
	clVar11.caster = caster12
	doAfter(temp61, clVar11, "when calling doAfter in SpiritWisps, line 122")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps:create57() 
	local new_inst = ({CallbackPeriodic_t=nil, wisps=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_SpiritWisps, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps(this202, cb9, __wurst_stackPos235) 
	local wispTargets = nil
	local iterator9 = nil
	local wisp1 = nil
	local casterPos1 = ({0., 0., })
	local nearestInjured = nil
	local nearestDist = nil
	local iterator10 = nil
	local u14 = nil
	local dist4 = nil
	local targetPos3 = ({0., 0., })
	local randomAngle = ({0., })
	local randomDist = nil
	local moveDir2 = ({0., })
	local moveSpeed = nil
	local newPos = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos235
	wurst_stack_depth = (wurst_stack_depth + 1)
	wispTargets = LinkedList_new_LinkedList("when calling new_LinkedList in SpiritWisps, line 73")
	iterator9 = LinkedList_LinkedList_iterator(this202.wisps, "when calling iterator in SpiritWisps, line 74")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator9, "when calling hasNext in SpiritWisps, line 74")) then
			break
		end
		wisp1 = __wurst_objectFromIndex(intEnsure(LLIterator_LLIterator_next(iterator9, "when calling next in SpiritWisps, line 74")))
		casterPos1 = tupleCopy(unit_getPos(this202.caster, "when calling getPos in SpiritWisps, line 75"))
		nearestInjured = nil
		nearestDist = 99999.
		group_enumUnitsInRange(Group_ENUM_GROUP, casterPos1, SpiritWisps_WISP_RADIUS, nil, "when calling enumUnitsInRange in SpiritWisps, line 79")
		iterator10 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SpiritWisps, line 81")
		while true do
			if not(GroupIterator_GroupIterator_hasNext(iterator10, "when calling hasNext in SpiritWisps, line 81")) then
				break
			end
			u14 = GroupIterator_GroupIterator_next(iterator10, "when calling next in SpiritWisps, line 81")
			if ((unit_isAlive(u14, "when calling isAlive in SpiritWisps, line 82") and player_isAllyOf(unit_getOwner(u14, "when calling getOwner in SpiritWisps, line 82"), unit_getOwner(this202.caster, "when calling getOwner in SpiritWisps, line 82"), "when calling isAllyOf in SpiritWisps, line 82")) and (unit_getHP(u14, "when calling getHP in SpiritWisps, line 82") < unit_getMaxHP(u14, "when calling getMaxHP in SpiritWisps, line 82"))) then
				dist4 = vec2_distanceTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 83"), unit_getPos(u14, "when calling getPos in SpiritWisps, line 83"), "when calling distanceTo in SpiritWisps, line 83")
				if ((dist4 < nearestDist) and not(LinkedList_LinkedList_has(wispTargets, __wurst_objectToIndex(u14), "when calling has in SpiritWisps, line 84"))) then
					nearestDist = dist4
					nearestInjured = u14
					LinkedList_LinkedList_add(wispTargets, "when calling add in SpiritWisps, line 87", __wurst_objectToIndex(u14))
				end
			end
		end
		GroupIterator_GroupIterator_close(iterator10, "when calling close in SpiritWisps, line 81")
		if not((nearestInjured == nil)) then
			targetPos3 = tupleCopy(vec2_polarOffset(unit_getPos(nearestInjured, "when calling getPos in SpiritWisps, line 92"), vec2_angleTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 93"), unit_getPos(nearestInjured, "when calling getPos in SpiritWisps, line 93"), "when calling angleTo in SpiritWisps, line 93"), -(50.), "when calling polarOffset in SpiritWisps, line 92"))
		else
			randomAngle = ({GetRandomReal(0., (2. * bj_PI)), })
			randomDist = GetRandomReal(50., SpiritWisps_ORBIT_RADIUS)
			targetPos3 = tupleCopy(vec2_polarOffset(casterPos1, randomAngle, randomDist, "when calling polarOffset in SpiritWisps, line 100"))
		end
		moveDir2 = tupleCopy1(vec2_angleTo(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 103"), targetPos3, "when calling angleTo in SpiritWisps, line 103"))
		moveSpeed = (200. * SpiritWisps_UPDATE_INTERVAL)
		newPos = tupleCopy(vec2_polarOffset(unit_getPos(wisp1, "when calling getPos in SpiritWisps, line 105"), moveDir2, moveSpeed, "when calling polarOffset in SpiritWisps, line 105"))
		if (vec2_distanceTo(newPos, casterPos1, "when calling distanceTo in SpiritWisps, line 108") > SpiritWisps_WISP_RADIUS) then
			unit_setXY(wisp1, vec2_polarOffset(casterPos1, vec2_angleTo(newPos, casterPos1, "when calling angleTo in SpiritWisps, line 109"), (-(SpiritWisps_WISP_RADIUS) + 20.), "when calling polarOffset in SpiritWisps, line 109"), "when calling setXY in SpiritWisps, line 109")
		else
			unit_setXY(wisp1, newPos, "when calling setXY in SpiritWisps, line 111")
		end
	end
	LLIterator_LLIterator_close(iterator9, "when calling close in SpiritWisps, line 74")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps1:create58() 
	local new_inst = ({CallbackPeriodic_t=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_SpiritWisps1, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1(this204, cb10, __wurst_stackPos237) 
	local iterator11 = nil
	local u15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos237
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRange(Group_ENUM_GROUP, unit_getPos(this204.caster, "when calling getPos in SpiritWisps, line 115"), SpiritWisps_WISP_RADIUS, nil, "when calling enumUnitsInRange in SpiritWisps, line 115")
	iterator11 = group_iterator(Group_ENUM_GROUP, "when calling iterator in SpiritWisps, line 116")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator11, "when calling hasNext in SpiritWisps, line 116")) then
			break
		end
		u15 = GroupIterator_GroupIterator_next(iterator11, "when calling next in SpiritWisps, line 116")
		if ((unit_isAlive(u15, "when calling isAlive in SpiritWisps, line 117") and player_isAllyOf(unit_getOwner(u15, "when calling getOwner in SpiritWisps, line 117"), unit_getOwner(this204.caster, "when calling getOwner in SpiritWisps, line 117"), "when calling isAllyOf in SpiritWisps, line 117")) and (unit_getHP(u15, "when calling getHP in SpiritWisps, line 117") < unit_getMaxHP(u15, "when calling getMaxHP in SpiritWisps, line 117"))) then
			unit_addHP(u15, SpiritWisps_WISP_HEAL, "when calling addHP in SpiritWisps, line 118")
			flashEffect("Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl", u15, "origin", "when calling flashEffect in SpiritWisps, line 119")
		end
	end
	GroupIterator_GroupIterator_close(iterator11, "when calling close in SpiritWisps, line 116")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_SpiritWisps:create59() 
	local new_inst = ({CallbackSingle_t=nil, moveTimer=nil, healTimer=nil, wisps=nil, caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SpiritWisps, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps(this205, __wurst_stackPos238) 
	local iterator12 = nil
	local wisp2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos238
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this205.moveTimer, "when calling destroyCallbackPeriodic in SpiritWisps, line 123")
	CallbackPeriodic_destroyCallbackPeriodic(this205.healTimer, "when calling destroyCallbackPeriodic in SpiritWisps, line 124")
	iterator12 = LinkedList_LinkedList_iterator(this205.wisps, "when calling iterator in SpiritWisps, line 125")
	while true do
		if not(LLIterator_LLIterator_hasNext(iterator12, "when calling hasNext in SpiritWisps, line 125")) then
			break
		end
		wisp2 = __wurst_objectFromIndex(intEnsure(LLIterator_LLIterator_next(iterator12, "when calling next in SpiritWisps, line 125")))
		unit_kill(wisp2, "when calling kill in SpiritWisps, line 126")
	end
	LLIterator_LLIterator_close(iterator12, "when calling close in SpiritWisps, line 125")
	LinkedList_destroyLinkedList(this205.wisps, "when calling destroyLinkedList in SpiritWisps, line 127")
	__wurst_safe_UnitRemoveAbility(this205.caster, SpiritWisps_WISP_BUFF_ID)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_Starfall:create60() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_Starfall, }))
	return new_inst
end

function OnCastListener_onCast_Starfall_fire_onCast_Starfall(this206, caster13, __wurst_stackPos239) 
	local targetPos4 = ({0., 0., })
	local channelSfx = nil
	local elapsed = nil
	local currentInterval = nil
	local timeSinceLastStar = nil
	local clVar12 = nil
	local clVar13 = nil
	local temp62 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos239
	wurst_stack_depth = (wurst_stack_depth + 1)
	targetPos4 = tupleCopy(EventData_getSpellTargetPos("when calling getSpellTargetPos in Starfall, line 63"))
	channelSfx = widget_addEffect(caster13, Starfall_CHANNEL_SFX, "overhead", "when calling addEffect in Starfall, line 66")
	elapsed = 0.
	currentInterval = Starfall_BASE_INTERVAL
	timeSinceLastStar = 0.
	clVar12 = CallbackPeriodic_doPeriodically_onCast_Starfall:create61()
	CallbackPeriodic_construct_CallbackPeriodic(clVar12, "when calling construct_CallbackPeriodic in Starfall, line 73")
	clVar12.elapsed = elapsed
	clVar12.timeSinceLastStar = timeSinceLastStar
	clVar12.currentInterval = currentInterval
	clVar12.targetPos = tupleCopy(targetPos4)
	clVar12.caster = caster13
	clVar12.channelSfx = channelSfx
	doPeriodically(0.05, clVar12, "when calling doPeriodically in Starfall, line 73")
	temp62 = (Starfall_CHANNEL_DURATION + 0.1)
	clVar13 = CallbackSingle_doAfter_onCast_Starfall:create62()
	CallbackSingle_construct_CallbackSingle(clVar13, "when calling construct_CallbackSingle in Starfall, line 105")
	clVar13.channelSfx = channelSfx
	doAfter(temp62, clVar13, "when calling doAfter in Starfall, line 105")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_Starfall:create61() 
	local new_inst = ({CallbackPeriodic_t=nil, elapsed=0., timeSinceLastStar=0., currentInterval=0., targetPos=({0., 0., }), caster=nil, channelSfx=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_Starfall, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall(this207, cb11, __wurst_stackPos240) 
	local randomAngle1 = ({0., })
	local randomDist1 = nil
	local starPos = ({0., 0., })
	local clVar14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos240
	wurst_stack_depth = (wurst_stack_depth + 1)
	this207.elapsed = (this207.elapsed + 0.05)
	this207.timeSinceLastStar = (this207.timeSinceLastStar + 0.05)
	this207.currentInterval = (Starfall_BASE_INTERVAL - ((Starfall_BASE_INTERVAL - Starfall_MIN_INTERVAL) * (this207.elapsed / Starfall_CHANNEL_DURATION)))
	if (this207.timeSinceLastStar >= this207.currentInterval) then
		this207.timeSinceLastStar = 0.
		randomAngle1 = ({GetRandomReal(0., (2. * bj_PI)), })
		randomDist1 = GetRandomReal(0., Starfall_STARFALL_RADIUS)
		starPos = tupleCopy(vec2_polarOffset(this207.targetPos, randomAngle1, randomDist1, "when calling polarOffset in Starfall, line 86"))
		flashEffect1(Starfall_STAR_SFX, starPos, "when calling flashEffect in Starfall, line 89")
		clVar14 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall:create63()
		CallbackSingle_construct_CallbackSingle(clVar14, "when calling construct_CallbackSingle in Starfall, line 92")
		clVar14.starPos = tupleCopy(starPos)
		clVar14.caster = this207.caster
		doAfter(0.5, clVar14, "when calling doAfter in Starfall, line 92")
	end
	if (this207.elapsed >= Starfall_CHANNEL_DURATION) then
		CallbackPeriodic_destroyCallbackPeriodic(cb11, "when calling destroyCallbackPeriodic in Starfall, line 101")
		effect_destr(this207.channelSfx, "when calling destr in Starfall, line 102")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_doPeriodically_onCast_Starfall:create63() 
	local new_inst = ({CallbackSingle_t=nil, starPos=({0., 0., }), caster=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_doPeriodically_onCast_Starfall, }))
	return new_inst
end

function CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall(this208, __wurst_stackPos241) 
	local iterator13 = nil
	local u16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos241
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect1(Starfall_IMPACT_SFX, this208.starPos, "when calling flashEffect in Starfall, line 93")
	group_enumUnitsInRange(Group_ENUM_GROUP, this208.starPos, Starfall_STAR_AOE, nil, "when calling enumUnitsInRange in Starfall, line 94")
	iterator13 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Starfall, line 95")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator13, "when calling hasNext in Starfall, line 95")) then
			break
		end
		u16 = GroupIterator_GroupIterator_next(iterator13, "when calling next in Starfall, line 95")
		if (unit_isAlive(u16, "when calling isAlive in Starfall, line 96") and player_isEnemyOf(unit_getOwner(u16, "when calling getOwner in Starfall, line 96"), unit_getOwner(this208.caster, "when calling getOwner in Starfall, line 96"), "when calling isEnemyOf in Starfall, line 96")) then
			unit_damageTarget(this208.caster, u16, Starfall_STAR_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in Starfall, line 97")
		end
	end
	GroupIterator_GroupIterator_close(iterator13, "when calling close in Starfall, line 95")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_Starfall:create62() 
	local new_inst = ({CallbackSingle_t=nil, channelSfx=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_Starfall, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall(this209, __wurst_stackPos242) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos242
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(this209.channelSfx, "when calling destr in Starfall, line 106")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_SummonTreant:create64() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_SummonTreant, }))
	return new_inst
end

function OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant(this210, caster14, __wurst_stackPos243) 
	local level3 = nil
	local duration2 = nil
	local totalTreants = nil
	local pos9 = ({0., 0., })
	local i5 = nil
	local temp4 = nil
	local treant = nil
	local clVar15 = nil
	local temp63 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos243
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (getSeedlingCount("when calling getSeedlingCount in SummonTreant, line 69") <= 0) then
		print1("No seedling stacks available!", "when calling print in SummonTreant, line 70")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	level3 = (unit_getAbilityLevel(caster14, SummonTreant_SUMMON_TREANT_ID, "when calling getAbilityLevel in SummonTreant, line 73") - 1)
	duration2 = realEnsure(SummonTreant_TREANT_DURATION[level3])
	totalTreants = (getSeedlingCount("when calling getSeedlingCount in SummonTreant, line 75") + intEnsure(SummonTreant_BONUS_TREANTS[level3]))
	pos9 = tupleCopy(unit_getPos(caster14, "when calling getPos in SummonTreant, line 76"))
	Invigorate_seedlingCount = 0
	print1(stringConcat(stringConcat(stringConcat(stringConcat("Spawning ", int_toString(totalTreants, "when calling toString in SummonTreant, line 79")), " treants for "), int_toString(real_toInt(duration2, "when calling toInt in SummonTreant, line 79"), "when calling toString in SummonTreant, line 79")), "s."), "when calling print in SummonTreant, line 79")
	i5 = 1
	temp4 = totalTreants
	while true do
		if (i5 > temp4) then
			break
		end
		treant = createUnit(unit_getOwner(caster14, "when calling getOwner in SummonTreant, line 82"), SummonTreant_TREANT_UNIT_ID, pos9, ({0., }), "when calling createUnit in SummonTreant, line 82")
		temp63 = duration2
		clVar15 = CallbackSingle_doAfter_onCast_SummonTreant:create65()
		CallbackSingle_construct_CallbackSingle(clVar15, "when calling construct_CallbackSingle in SummonTreant, line 83")
		clVar15.treant = treant
		doAfter(temp63, clVar15, "when calling doAfter in SummonTreant, line 83")
		i5 = (i5 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_SummonTreant:create65() 
	local new_inst = ({CallbackSingle_t=nil, treant=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_SummonTreant, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant(this211, __wurst_stackPos244) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos244
	wurst_stack_depth = (wurst_stack_depth + 1)
	if unit_isAlive(this211.treant, "when calling isAlive in SummonTreant, line 84") then
		unit_kill(this211.treant, "when calling kill in SummonTreant, line 85")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table:create66() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=Table, }))
	return new_inst
end

function Table_Table_hasInt(this110, parentKey, __wurst_stackPos130) 
	local stackTrace_tempReturn1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos130
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn1 = hashtable_hasInt(Table_ht, __wurst_objectToIndex(this110), parentKey, "when calling hasInt in Table, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn1
end

function Table_Table_hasString(this213, parentKey5, __wurst_stackPos246) 
	local stackTrace_tempReturn2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos246
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn2 = hashtable_hasString(Table_ht, __wurst_objectToIndex(this213), parentKey5, "when calling hasString in Table, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn2
end

function Table_Table_removeInt(this113, parentKey3, __wurst_stackPos133) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos133
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_RemoveSavedInteger(Table_ht, __wurst_objectToIndex(this113), parentKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadInt(this112, parentKey2, __wurst_stackPos132) 
	local stackTrace_tempReturn3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos132
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn3 = hashtable_loadInt(Table_ht, __wurst_objectToIndex(this112), parentKey2, "when calling loadInt in Table, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn3
end

function Table_Table_saveInt(this111, parentKey1, value1, __wurst_stackPos131) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos131
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveInt(Table_ht, __wurst_objectToIndex(this111), parentKey1, value1, "when calling saveInt in Table, line 44")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadString(this217, parentKey10, __wurst_stackPos250) 
	local stackTrace_tempReturn4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos250
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn4 = hashtable_loadString(Table_ht, __wurst_objectToIndex(this217), parentKey10, "when calling loadString in Table, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn4
end

function Table_Table_saveString(this219, parentKey12, value4, __wurst_stackPos252) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos252
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveString(Table_ht, __wurst_objectToIndex(this219), parentKey12, value4, "when calling saveString in Table, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_loadUnit(this221, parentKey14, __wurst_stackPos254) 
	local stackTrace_tempReturn5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos254
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn5 = hashtable_loadUnitHandle(Table_ht, __wurst_objectToIndex(this221), parentKey14, "when calling loadUnitHandle in Table, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn5
end

function Table_Table_loadTrigger(this223, parentKey16, __wurst_stackPos256) 
	local stackTrace_tempReturn6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos256
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn6 = hashtable_loadTriggerHandle(Table_ht, __wurst_objectToIndex(this223), parentKey16, "when calling loadTriggerHandle in Table, line 113")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn6
end

function Table_Table_saveFogState(this225, parentKey18, value6, __wurst_stackPos258) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos258
	wurst_stack_depth = (wurst_stack_depth + 1)
	hashtable_saveFogStateHandle(Table_ht, __wurst_objectToIndex(this225), parentKey18, value6, "when calling saveFogStateHandle in Table, line 170")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_Table_init(this227, __wurst_stackPos260) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos260
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Table_new_Table(__wurst_stackPos261) 
	local this228 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos261
	wurst_stack_depth = (wurst_stack_depth + 1)
	this228 = Table:create66()
	Table_construct_Table(this228, "when calling construct_Table in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this228
end

function Table_construct_Table(this117, __wurst_stackPos137) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos137
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_init(this117, "when calling Table_init in Table, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_ThrowExplosives:create67() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_ThrowExplosives, }))
	return new_inst
end

function OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives(this229, caster15, __wurst_stackPos262) 
	local targetPos5 = ({0., 0., })
	local barrel = nil
	local fuseSfx = nil
	local barrelScale = nil
	local pulseTimer = nil
	local clVar16 = nil
	local clVar17 = nil
	local temp64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos262
	wurst_stack_depth = (wurst_stack_depth + 1)
	targetPos5 = tupleCopy(EventData_getSpellTargetPos("when calling getSpellTargetPos in ThrowExplosives, line 59"))
	print1("cast spell", "when calling print in ThrowExplosives, line 60")
	barrel = createUnit(unit_getOwner(caster15, "when calling getOwner in ThrowExplosives, line 63"), ThrowExplosives_BARREL_UNIT_ID, targetPos5, ({0., }), "when calling createUnit in ThrowExplosives, line 63")
	unit_addAbility(barrel, 1097625443, "when calling addAbility in ThrowExplosives, line 64")
	unit_setInvulnerable(barrel, true, "when calling setInvulnerable in ThrowExplosives, line 65")
	unit_pause(barrel, "when calling pause in ThrowExplosives, line 66")
	fuseSfx = widget_addEffect(barrel, ThrowExplosives_FUSE_SFX, "origin", "when calling addEffect in ThrowExplosives, line 69")
	effect_setScale(fuseSfx, 1., "when calling setScale in ThrowExplosives, line 70")
	barrelScale = 1.
	unit_setScale(barrel, barrelScale, "when calling setScale in ThrowExplosives, line 73")
	clVar16 = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives:create68()
	CallbackPeriodic_construct_CallbackPeriodic(clVar16, "when calling construct_CallbackPeriodic in ThrowExplosives, line 75")
	clVar16.barrelScale = barrelScale
	clVar16.barrel = barrel
	pulseTimer = doPeriodically(0.5, clVar16, "when calling doPeriodically in ThrowExplosives, line 75")
	temp64 = ThrowExplosives_FUSE_DURATION
	clVar17 = CallbackSingle_doAfter_onCast_ThrowExplosives:create69()
	CallbackSingle_construct_CallbackSingle(clVar17, "when calling construct_CallbackSingle in ThrowExplosives, line 79")
	clVar17.pulseTimer = pulseTimer
	clVar17.fuseSfx = fuseSfx
	clVar17.targetPos = tupleCopy(targetPos5)
	clVar17.caster = caster15
	clVar17.barrel = barrel
	doAfter(temp64, clVar17, "when calling doAfter in ThrowExplosives, line 79")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_onCast_ThrowExplosives:create68() 
	local new_inst = ({CallbackPeriodic_t=nil, barrelScale=0., barrel=nil, })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_onCast_ThrowExplosives, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives(this230, cb12, __wurst_stackPos263) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos263
	wurst_stack_depth = (wurst_stack_depth + 1)
	this230.barrelScale = (this230.barrelScale + 0.05)
	unit_setScale(this230.barrel, this230.barrelScale, "when calling setScale in ThrowExplosives, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_doAfter_onCast_ThrowExplosives:create69() 
	local new_inst = ({CallbackSingle_t=nil, pulseTimer=nil, fuseSfx=nil, targetPos=({0., 0., }), caster=nil, barrel=nil, })
	setmetatable(new_inst, ({__index=CallbackSingle_doAfter_onCast_ThrowExplosives, }))
	return new_inst
end

function CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives(this231, __wurst_stackPos264) 
	local iterator14 = nil
	local u17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos264
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_destroyCallbackPeriodic(this231.pulseTimer, "when calling destroyCallbackPeriodic in ThrowExplosives, line 80")
	effect_destr(this231.fuseSfx, "when calling destr in ThrowExplosives, line 81")
	flashEffect1(ThrowExplosives_EXPLODE_SFX, this231.targetPos, "when calling flashEffect in ThrowExplosives, line 82")
	flashEffect1("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", this231.targetPos, "when calling flashEffect in ThrowExplosives, line 83")
	group_enumUnitsInRange(Group_ENUM_GROUP, this231.targetPos, ThrowExplosives_EXPLODE_RADIUS, nil, "when calling enumUnitsInRange in ThrowExplosives, line 85")
	iterator14 = group_iterator(Group_ENUM_GROUP, "when calling iterator in ThrowExplosives, line 86")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator14, "when calling hasNext in ThrowExplosives, line 86")) then
			break
		end
		u17 = GroupIterator_GroupIterator_next(iterator14, "when calling next in ThrowExplosives, line 86")
		if (unit_isAlive(u17, "when calling isAlive in ThrowExplosives, line 87") and player_isEnemyOf(unit_getOwner(u17, "when calling getOwner in ThrowExplosives, line 87"), unit_getOwner(this231.caster, "when calling getOwner in ThrowExplosives, line 87"), "when calling isEnemyOf in ThrowExplosives, line 87")) then
			unit_damageTarget(this231.caster, u17, ThrowExplosives_EXPLODE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in ThrowExplosives, line 88")
		end
	end
	GroupIterator_GroupIterator_close(iterator14, "when calling close in ThrowExplosives, line 86")
	unit_kill(this231.barrel, "when calling kill in ThrowExplosives, line 90")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex:create70() 
	local new_inst = ({UnitIndex__unit=nil, })
	setmetatable(new_inst, ({__index=UnitIndex, }))
	return new_inst
end

function UnitIndex_new_UnitIndex(whichUnit2, __wurst_stackPos265) 
	local this232 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos265
	wurst_stack_depth = (wurst_stack_depth + 1)
	this232 = UnitIndex:create70()
	UnitIndex_construct_UnitIndex(this232, whichUnit2, "when calling construct_UnitIndex in UnitIndexer, line 175")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this232
end

function UnitIndex_destroyUnitIndex(this234, __wurst_stackPos267) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos267
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_onDestroy(this234, "when calling UnitIndex_onDestroy in UnitIndexer, line 182")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_init(this236, __wurst_stackPos269) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos269
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_construct_UnitIndex(this233, whichUnit3, __wurst_stackPos266) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos266
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndex_UnitIndex_init(this233, "when calling UnitIndex_init in UnitIndexer, line 175")
	this233.UnitIndex__unit = whichUnit3
	unit_setUserData(this233.UnitIndex__unit, __wurst_objectToIndex(this233), "when calling setUserData in UnitIndexer, line 177")
	pushUnit(whichUnit3, "when calling pushUnit in UnitIndexer, line 178")
	trigger_evaluate(UnitIndexer_onIndexTrigger, "when calling evaluate in UnitIndexer, line 179")
	popUnit("when calling popUnit in UnitIndexer, line 180")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitIndex_UnitIndex_onDestroy(this235, __wurst_stackPos268) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos268
	wurst_stack_depth = (wurst_stack_depth + 1)
	pushUnit(this235.UnitIndex__unit, "when calling pushUnit in UnitIndexer, line 183")
	trigger_evaluate(UnitIndexer_onDeindexTrigger, "when calling evaluate in UnitIndexer, line 184")
	popUnit("when calling popUnit in UnitIndexer, line 185")
	unit_setUserData(this235.UnitIndex__unit, 0, "when calling setUserData in UnitIndexer, line 186")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitDefinition:create71() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=UnitDefinition, }))
	return new_inst
end

function UnitDefinition_UnitDefinition_init(this239, __wurst_stackPos274) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos274
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitDefinition_new_UnitDefinition(newId, origId, __wurst_stackPos275) 
	local this240 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos275
	wurst_stack_depth = (wurst_stack_depth + 1)
	this240 = UnitDefinition:create71()
	UnitDefinition_construct_UnitDefinition(this240, newId, origId, "when calling construct_UnitDefinition in UnitObjEditing, line 707")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this240
end

function UnitDefinition_construct_UnitDefinition(this241, newId1, origId1, __wurst_stackPos276) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos276
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitOrHeroDefinition_construct_UnitOrHeroDefinition(this241, newId1, origId1, "when calling construct_UnitOrHeroDefinition in UnitObjEditing, line 707")
	UnitDefinition_UnitDefinition_init(this241, "when calling UnitDefinition_init in UnitObjEditing, line 707")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrBuildingOrHeroDefinition:create72() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=UnitOrBuildingOrHeroDefinition, }))
	return new_inst
end

function UnitOrBuildingOrHeroDefinition_UnitOrBuildingOrHeroDefinition_init(this243, __wurst_stackPos278) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos278
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrBuildingOrHeroDefinition_construct_UnitOrBuildingOrHeroDefinition(this244, newUnitId, origUnitId, __wurst_stackPos279) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos279
	wurst_stack_depth = (wurst_stack_depth + 1)
	W3UDefinition_construct_W3UDefinition(this244, newUnitId, origUnitId, "when calling construct_W3UDefinition in UnitObjEditing, line 56")
	UnitOrBuildingOrHeroDefinition_UnitOrBuildingOrHeroDefinition_init(this244, "when calling UnitOrBuildingOrHeroDefinition_init in UnitObjEditing, line 56")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrHeroDefinition:create73() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=UnitOrHeroDefinition, }))
	return new_inst
end

function UnitOrHeroDefinition_UnitOrHeroDefinition_init(this246, __wurst_stackPos281) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos281
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function UnitOrHeroDefinition_construct_UnitOrHeroDefinition(this242, newId2, origId2, __wurst_stackPos277) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos277
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitOrBuildingOrHeroDefinition_construct_UnitOrBuildingOrHeroDefinition(this242, newId2, origId2, "when calling construct_UnitOrBuildingOrHeroDefinition in UnitObjEditing, line 604")
	UnitOrHeroDefinition_UnitOrHeroDefinition_init(this242, "when calling UnitOrHeroDefinition_init in UnitObjEditing, line 604")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function W3UDefinition:create74() 
	local new_inst = ({})
	setmetatable(new_inst, ({__index=W3UDefinition, }))
	return new_inst
end

function W3UDefinition_W3UDefinition_init(this247, __wurst_stackPos282) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos282
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function W3UDefinition_construct_W3UDefinition(this245, newId3, baseId, __wurst_stackPos280) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos280
	wurst_stack_depth = (wurst_stack_depth + 1)
	W3UDefinition_W3UDefinition_init(this245, "when calling W3UDefinition_init in UnitObjEditing, line 21")
	createObjectDefinition("w3u", newId3, baseId, "when calling createObjectDefinition in UnitObjEditing, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnCastListener_onCast_UrsocCharge:create75() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnCastListener_onCast_UrsocCharge, }))
	return new_inst
end

function OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge(this248, caster16, __wurst_stackPos284) 
	local target10 = nil
	local targetPos6 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos284
	wurst_stack_depth = (wurst_stack_depth + 1)
	target10 = EventData_getSpellTargetUnit("when calling getSpellTargetUnit in UrsocCharge, line 94")
	targetPos6 = tupleCopy(unit_getPos(target10, "when calling getPos in UrsocCharge, line 95"))
	unit_setXY(caster16, targetPos6, "when calling setXY in UrsocCharge, line 98")
	flashEffect1(UrsocCharge_CHARGE_SFX, targetPos6, "when calling flashEffect in UrsocCharge, line 100")
	flashEffect1(UrsocCharge_IMPACT_SFX, targetPos6, "when calling flashEffect in UrsocCharge, line 101")
	unit_damageTarget(caster16, target10, UrsocCharge_CHARGE_DAMAGE, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS, "when calling damageTarget in UrsocCharge, line 103")
	InstantDummyCaster_castTarget(unit_getOwner(caster16, "when calling getOwner in UrsocCharge, line 114"), UrsocCharge_CHARGE_STUN_ID, 1, OrderIds_thunderbolt, target10, "when calling castTarget in UrsocCharge, line 114")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackPeriodic_doPeriodically_test:create76() 
	local new_inst = ({CallbackPeriodic_t=nil, u=nil, targetPos=({0., 0., }), speed=0., update=0., dist=0., })
	setmetatable(new_inst, ({__index=CallbackPeriodic_doPeriodically_test, }))
	return new_inst
end

function CallbackPeriodic_doPeriodically_test_call_doPeriodically_test(this249, cb13, __wurst_stackPos285) 
	local dir = ({0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos285
	wurst_stack_depth = (wurst_stack_depth + 1)
	dir = tupleCopy1(vec2_angleTo(unit_getPos(this249.u, "when calling getPos in test, line 35"), this249.targetPos, "when calling angleTo in test, line 35"))
	unit_setXY(this249.u, vec2_polarOffset(unit_getPos(this249.u, "when calling getPos in test, line 36"), dir, (this249.speed * this249.update), "when calling polarOffset in test, line 36"), "when calling setXY in test, line 36")
	if (vec2_distanceTo(unit_getPos(this249.u, "when calling getPos in test, line 37"), this249.targetPos, "when calling distanceTo in test, line 37") < this249.dist) then
		unit_remove(this249.u, "when calling remove in test, line 38")
		CallbackPeriodic_destroyCallbackPeriodic(cb13, "when calling destroyCallbackPeriodic in test, line 39")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function OnPointCast_onPointCast_test:create77() 
	local new_inst = ({OnCastListener_next=nil, OnCastListener_prev=nil, OnCastListener_abilId=0, OnCastListener_eventUnit=nil, })
	setmetatable(new_inst, ({__index=OnPointCast_onPointCast_test, }))
	return new_inst
end

function OnPointCast_onPointCast_test_fireEx_onPointCast_test(this250, caster17, targetPos7, __wurst_stackPos286) 
	local casterPos2 = ({0., 0., })
	local u19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos286
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_getFacingAngle(caster17, "when calling getFacingAngle in test, line 74")
	casterPos2 = tupleCopy(unit_getPos(caster17, "when calling getPos in test, line 75"))
	u19 = abc(unit_getOwner(caster17, "when calling getOwner in test, line 76"), UnitIds_abomination, casterPos2, ({0., }), "when calling abc in test, line 76")
	moveUnit(u19, targetPos7, 10., 0.05, 300., "when calling moveUnit in test, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initGlobals(__wurst_stackPos289) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos289
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
	gg_unit_h006_0015 = nil
	gg_unit_h008_0011 = nil
	gg_unit_h003_0016 = nil
	gg_unit_h00E_0013 = nil
	gg_unit_h009_0014 = nil
	gg_unit_h00A_0009 = nil
	gg_unit_h001_0008 = nil
	gg_unit_h000_0407 = nil
	gg_unit_etol_0001 = nil
	gg_unit_h00K_0176 = nil
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
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitGlobals(__wurst_stackPos290) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos290
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_townHall = nil
	CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Unit000003_DropItems(__wurst_stackPos291) 
	local trigWidget = nil
	local trigUnit = nil
	local itemID = nil
	local canDrop = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos291
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

function Unit000038_DropItems(__wurst_stackPos292) 
	local trigWidget1 = nil
	local trigUnit1 = nil
	local itemID1 = nil
	local canDrop1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos292
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

function Unit000043_DropItems(__wurst_stackPos293) 
	local trigWidget2 = nil
	local trigUnit2 = nil
	local itemID2 = nil
	local canDrop2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos293
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

function Unit000077_DropItems(__wurst_stackPos294) 
	local trigWidget3 = nil
	local trigUnit3 = nil
	local itemID3 = nil
	local canDrop3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos294
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

function Unit000080_DropItems(__wurst_stackPos295) 
	local trigWidget4 = nil
	local trigUnit4 = nil
	local itemID4 = nil
	local canDrop4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos295
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

function Unit000090_DropItems(__wurst_stackPos296) 
	local trigWidget5 = nil
	local trigUnit5 = nil
	local itemID5 = nil
	local canDrop5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos296
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

function Unit000097_DropItems(__wurst_stackPos297) 
	local trigWidget6 = nil
	local trigUnit6 = nil
	local itemID6 = nil
	local canDrop6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos297
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

function Unit000116_DropItems(__wurst_stackPos298) 
	local trigWidget7 = nil
	local trigUnit7 = nil
	local itemID7 = nil
	local canDrop7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos298
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

function CreateBuildingsForPlayer0(__wurst_stackPos299) 
	local p8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos299
	wurst_stack_depth = (wurst_stack_depth + 1)
	p8 = Player(0)
	gg_unit_etol_0001 = __wurst_safe_BlzCreateUnitWithSkin(p8, 1702129516, 1536.0, 18816.0, 270.000, 1702129516)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1752659063, 640.0, 18624.0, 270.000, 1752659063)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1701670775, 1056.0, 18848.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700884333, 960.0, 18496.0, 270.000, 1700884333)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700885605, 672.0, 19104.0, 270.000, 1700885605)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1701670775, 1888.0, 18784.0, 270.000, 1701670775)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1852334958, -(1408.0), 24512.0, 270.000, 1852334958)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700885605, -(2144.0), 11232.0, 270.000, 1700885605)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700884343, -(2496.0), 10560.0, 270.000, 1700884343)
	__wurst_safe_BlzCreateUnitWithSkin(p8, 1700884325, -(4096.0), 12288.0, 270.000, 1700884325)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateUnitsForPlayer0(__wurst_stackPos300) 
	local p9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos300
	wurst_stack_depth = (wurst_stack_depth + 1)
	p9 = Player(0)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 784.9, 18019.4, 16.183, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 830.5, 18261.7, 202.847, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1752328550, 1272.1, 18233.8, 172.864, 1752328550)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1701082221, 204.1, 18635.6, 103.978, 1701082221)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1701082221, 468.4, 18425.1, 228.731, 1701082221)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1701081721, 1053.8, 18200.4, 335.588, 1701081721)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1701081721, 1075.1, 18052.2, 180.917, 1701081721)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1702061422, 1138.1, 17892.5, 323.052, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1700885091, 931.8, 17890.1, 134.345, 1700885091)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1700885091, 987.1, 17718.1, 22.160, 1700885091)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1702061422, 1097.9, 17735.7, 268.184, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 608.8, 18306.6, 76.335, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656882, 571.0, 18062.6, 40.706, 1697656882)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1853317492, 788.5, 17792.9, 328.227, 1853317492)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1701733731, 718.2, 17702.3, 157.472, 1701733731)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1697656884, 1285.7, 18056.6, 235.137, 1697656884)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1164799855, 839.8, 17573.2, 327.545, 1164799855)
	__wurst_safe_BlzCreateUnitWithSkin(p9, 1432646245, 340.4, 17904.7, 342.279, 1432646245)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer1(__wurst_stackPos301) 
	local p10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos301
	wurst_stack_depth = (wurst_stack_depth + 1)
	p10 = Player(1)
	__wurst_safe_BlzCreateUnitWithSkin(p10, 1752659063, 5248.0, 6080.0, 270.000, 1752659063)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateBuildingsForPlayer5(__wurst_stackPos302) 
	local p11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos302
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

function CreateUnitsForPlayer5(__wurst_stackPos303) 
	local p12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos303
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

function CreateBuildingsForPlayer18(__wurst_stackPos304) 
	local p13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos304
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

function CreateUnitsForPlayer18(__wurst_stackPos305) 
	local p14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos305
	wurst_stack_depth = (wurst_stack_depth + 1)
	p14 = Player(18)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1165261170, -(9733.8), 24998.7, 295.102, 1165261170)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1164799855, -(9546.1), 24986.0, 208.219, 1164799855)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1700885091, -(9965.1), 24762.3, 309.055, 1700885091)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1700885091, -(10053.6), 24644.6, 130.730, 1700885091)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1702061422, -(9813.3), 24590.9, 224.469, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1702061422, -(9786.6), 24475.1, 163.855, 1702061422)
	__wurst_safe_BlzCreateUnitWithSkin(p14, 1853317492, -(9998.2), 24467.5, 62.954, 1853317492)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostileBuildings(__wurst_stackPos306) 
	local p15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos306
	wurst_stack_depth = (wurst_stack_depth + 1)
	p15 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	gg_unit_h001_0008 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988529, -(1798.5), 17804.8, 270.000, 1747988529)
	gg_unit_h00A_0009 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988545, -(1627.2), 24241.2, 270.000, 1747988545)
	gg_unit_h00D_0010 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988548, -(3538.6), 13625.4, 270.000, 1747988548)
	gg_unit_h008_0011 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988536, 3767.3, 24074.8, 270.000, 1747988536)
	gg_unit_h00E_0013 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988549, -(5198.1), 17582.0, 270.000, 1747988549)
	gg_unit_h009_0014 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988537, 1238.7, 25400.3, 270.000, 1747988537)
	gg_unit_h006_0015 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988534, 3134.0, 21074.3, 270.000, 1747988534)
	gg_unit_h003_0016 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988531, -(1297.8), 15771.1, 270.000, 1747988531)
	gg_unit_h00O_0019 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988559, -(2242.8), 10951.6, 270.000, 1747988559)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852207665, 3328.0, 16192.0, 270.000, 1852207665)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852207666, 4224.0, 16704.0, 270.000, 1852207666)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663601, -(864.0), 24224.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663601, -(2208.0), 24288.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663601, -(2336.0), 24096.0, 270.000, 1852663601)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663600, -(2400.0), 23712.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663600, -(2144.0), 23712.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663600, -(1184.0), 24352.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663600, -(2592.0), 23968.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852663600, -(2144.0), 23392.0, 270.000, 1852663600)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1853122608, 1536.0, 23680.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1853122608, 2304.0, 23744.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852076661, 4096.0, 24448.0, 270.000, 1852076661)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852006768, -(5408.0), 17120.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1853122609, 5024.0, 20064.0, 270.000, 1853122609)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1853122608, 4544.0, 20096.0, 270.000, 1853122608)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852006775, -(3200.0), 14336.0, 270.000, 1852006775)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852011628, -(4032.0), 13568.0, 270.000, 1852011628)
	gg_unit_h00I_0135 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988553, -(2423.8), 7874.8, 270.000, 1747988553)
	gg_unit_h00M_0136 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988557, -(5708.5), 11743.7, 270.000, 1747988557)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852009847, -(3040.0), 13984.0, 270.000, 1852009847)
	gg_unit_h00F_0163 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988550, -(10812.8), 10843.1, 270.000, 1747988550)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852009847, -(4320.0), 13984.0, 270.000, 1852009847)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852006768, -(4384.0), 14240.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852006768, -(3232.0), 14752.0, 270.000, 1852006768)
	gg_unit_h00C_0174 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988547, -(7778.2), 7822.0, 270.000, 1747988547)
	gg_unit_h00U_0175 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988565, 1720.8, 10287.2, 270.000, 1747988565)
	gg_unit_h00K_0176 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988555, -(5186.3), 9785.8, 270.000, 1747988555)
	gg_unit_h00J_0177 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988554, -(9994.0), 9485.2, 270.000, 1747988554)
	gg_unit_h00P_0178 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988560, -(1461.7), 13433.8, 270.000, 1747988560)
	gg_unit_h00S_0179 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988563, 1183.1, 7094.8, 270.000, 1747988563)
	gg_unit_h00H_0183 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988552, -(6601.3), 9382.6, 270.000, 1747988552)
	gg_unit_h00L_0184 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988556, -(8085.1), 10076.2, 270.000, 1747988556)
	gg_unit_h00G_0185 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988551, -(11701.8), 9545.5, 270.000, 1747988551)
	gg_unit_h00R_0196 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988562, 1069.2, 11646.9, 270.000, 1747988562)
	gg_unit_h00Q_0197 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988561, 1917.4, 13090.1, 270.000, 1747988561)
	gg_unit_h00N_0200 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988558, 54.1, 10226.1, 270.000, 1747988558)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852009847, -(7392.0), 10656.0, 270.000, 1852009847)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852006768, -(6816.0), 10080.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852011628, -(5120.0), 11520.0, 270.000, 1852011628)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852006768, -(5408.0), 11232.0, 270.000, 1852006768)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852207666, -(512.0), 8896.0, 270.000, 1852207666)
	__wurst_safe_BlzCreateUnitWithSkin(p15, 1852207665, -(896.0), 9024.0, 270.000, 1852207665)
	gg_unit_h000_0407 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1747988528, 1546.5, 18490.7, 270.000, 1747988528)
	gg_unit_cp00_0425 = __wurst_safe_BlzCreateUnitWithSkin(p15, 1668296752, -(6226.7), 6887.4, 270.000, 1668296752)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralHostile(__wurst_stackPos307) 
	local p16 = nil
	local u21 = nil
	local t = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos307
	wurst_stack_depth = (wurst_stack_depth + 1)
	p16 = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	u21 = nil
	t = nil
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059186, -(1075.0), 15970.7, 45.652, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059186, -(1022.8), 15875.7, 37.961, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853056884, -(1217.2), 15962.4, 20.181, 1853056884)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060200, -(3939.2), 14287.8, 105.934, 1853060200)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(5499.6), 17496.7, 70.295, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(3837.3), 19729.3, 166.584, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(3987.5), 19573.8, 137.695, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(4913.6), 17331.0, 99.296, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(4123.8), 19532.3, 104.475, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(3882.2), 19867.3, 191.766, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(4010.1), 19729.0, 148.868, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320295, -(2296.4), 17184.2, 30.504, 1853320295)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320308, -(2083.9), 17385.9, 25.441, 1853320308)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207713, 3607.2, 16191.4, 84.573, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000038_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207724, 3668.4, 16419.3, 82.999, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207724, 3465.3, 16447.0, 42.384, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207724, 3897.1, 16450.9, 147.349, 1852207724)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207717, 4021.7, 16636.5, 195.989, 1852207717)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852270642, 1463.0, 15379.0, 132.066, 1852270642)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000043_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852270641, 1655.0, 15488.2, 120.553, 1852270641)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852270641, 1278.8, 15412.4, 135.758, 1852270641)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852270641, 1438.6, 15561.8, 138.055, 1852270641)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651824, 422.5, -(52.9), 184.565, 1848651824)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651826, 5154.2, 21381.0, 326.520, 1848651826)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651824, -(884.2), 18208.5, 333.940, 1848651824)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852662375, -(1933.6), 23799.9, 64.932, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852662375, -(1753.1), 23778.5, 121.334, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852662375, -(2064.0), 23952.7, 314.984, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852662375, -(2003.8), 24140.9, 309.917, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852662375, -(1624.7), 23872.9, 154.000, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852662375, -(1689.4), 24200.1, 238.030, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852662375, -(1867.5), 24208.6, 257.251, 1852662375)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852340580, 1431.5, 25397.3, 200.087, 1852340580)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000080_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666999, -(1563.2), 23947.3, 186.648, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666999, -(1591.2), 24115.3, 205.128, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666723, -(1487.9), 24031.3, 184.270, 1852666723)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000077_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853056872, 1154.8, 25799.5, 271.491, 1853056872)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853056872, 1203.8, 25050.1, 77.603, 1853056872)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852340580, 964.5, 25675.1, 271.744, 1852340580)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852340580, 928.3, 25210.0, 98.638, 1852340580)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852599148, -(10529.4), 8084.6, 92.035, 1852599148)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852601198, -(10293.0), 8172.0, 153.416, 1852601198)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853318510, 2758.1, 22874.2, 242.161, 1853318510)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207728, 2802.6, 22698.5, 164.835, 1852207728)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207728, 2707.6, 22558.6, 96.867, 1852207728)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207203, 1818.5, 23747.5, 260.600, 1852207203)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000090_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207220, 2103.1, 23582.4, 211.507, 1852207220)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207220, 1789.6, 23579.7, 261.892, 1852207220)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207219, 1328.0, 23512.7, 341.217, 1852207219)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207219, 1557.9, 23541.6, 352.364, 1852207219)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320801, 2885.7, 22493.5, 125.320, 1853320801)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000097_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 4900.5, 21637.4, 284.950, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 4947.2, 21584.4, 133.894, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 4991.0, 21639.5, 341.619, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 5025.5, 21698.5, 38.442, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 4923.9, 21729.4, 280.654, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 5261.6, 21483.7, 266.196, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 5339.8, 21456.6, 332.973, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 5316.8, 21555.5, 347.146, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852008242, 5399.3, 21563.6, 297.460, 1852008242)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1316252014, 5024.0, 21516.2, 18.400, 1316252014)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000003_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651826, 4749.7, 21508.9, 280.650, 1848651826)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1851876471, 3648.4, 24134.3, 223.727, 1851876471)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1851876471, 3532.9, 24270.9, 240.700, 1851876471)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1851876471, 3777.2, 24005.4, 202.447, 1851876471)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1851876466, 3844.8, 24200.3, 232.760, 1851876466)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	t = CreateTrigger()
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_DEATH)
	__wurst_safe_TriggerRegisterUnitEvent(t, u21, EVENT_UNIT_CHANGE_OWNER)
	__wurst_safe_TriggerAddAction(t, function (...) 
			xpcall(function (...) 
					bridge_Unit000116_DropItems(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1851876459, 3970.0, 24084.2, 193.369, 1851876459)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1851876459, 3699.7, 24421.6, 256.144, 1851876459)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320292, -(2227.9), 17428.5, 23.784, 1853320292)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320308, -(2384.9), 17282.9, 36.400, 1853320308)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320308, -(2300.4), 17593.5, 22.273, 1853320308)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320295, -(2420.5), 17505.7, 2.949, 1853320295)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852404840, 4621.8, 19915.2, 265.540, 1852404840)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852404855, 5017.7, 19526.7, 220.147, 1852404855)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852404852, 4949.6, 19360.0, 271.836, 1852404852)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852404852, 4693.9, 19729.1, 266.265, 1852404852)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852404852, 4963.7, 19785.5, 261.087, 1852404852)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651824, -(871.6), 18105.9, 333.940, 1848651824)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651824, -(888.7), 18327.5, 333.940, 1848651824)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651824, -(779.3), 18234.1, 333.940, 1848651824)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1848651824, -(1019.0), 18218.8, 333.940, 1848651824)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(3699.8), 14255.5, 101.876, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(4834.3), 17598.8, 94.733, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(5169.0), 17475.6, 93.685, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(5089.8), 17110.1, 96.945, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(4035.2), 14066.9, 94.506, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(3604.3), 14467.3, 87.511, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(5390.8), 17343.4, 44.658, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(5034.9), 17663.6, 256.692, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(4050.9), 14454.2, 140.684, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(5288.4), 17707.1, 147.386, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(3821.6), 14496.8, 35.519, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(3860.9), 14138.9, 116.712, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(3527.7), 14356.7, 103.805, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(5151.8), 17712.7, 310.082, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055348, -(5399.6), 17594.4, 72.787, 1853055348)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853056884, -(1107.4), 15740.7, 38.455, 1853056884)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059186, -(925.9), 15843.8, 37.961, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059186, -(1127.1), 16121.3, 18.959, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059186, -(1040.3), 16057.0, 347.569, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059186, -(1009.9), 15739.0, 37.961, 1853059186)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1311780918, -(3486.0), 13467.2, 88.520, 1311780918)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666723, -(11935.3), 9716.7, 318.489, 1852666723)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666486, -(11876.1), 9943.2, 296.661, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666486, -(12037.8), 9887.2, 311.319, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666486, -(12167.1), 9714.1, 337.297, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666486, -(12173.2), 9587.3, 352.502, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666486, -(12028.2), 9489.9, 7.068, 1852666486)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666734, -(11786.5), 9791.0, 283.788, 1852666734)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666734, -(11900.1), 9573.4, 345.672, 1852666734)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666999, -(11790.3), 9654.0, 298.452, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666999, -(11629.4), 9726.6, 245.035, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666999, -(11850.8), 9469.5, 24.356, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666999, -(11869.8), 9318.0, 54.830, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666999, -(11439.8), 9736.5, 216.482, 1852666999)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853125220, -(11560.4), 8954.5, 53.920, 1853125220)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852467042, -(10298.9), 9814.3, 303.919, 1852467042)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852467042, -(10036.4), 9933.3, 278.130, 1852467042)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852466993, -(10248.2), 9691.0, 330.954, 1852466993)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852466993, -(10073.8), 9781.7, 312.043, 1852466993)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852466993, -(9851.3), 9770.5, 260.418, 1852466993)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852600950, -(10710.9), 10687.9, 151.012, 1852600950)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852076662, -(11024.4), 10814.4, 359.121, 1852076662)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852076662, -(10577.6), 10877.6, 127.665, 1852076662)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059702, -(10783.0), 11005.9, 141.882, 1853059702)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059702, -(10508.2), 11027.5, 311.032, 1853059702)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853059702, -(11019.9), 10983.4, 145.540, 1853059702)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852601198, -(10718.0), 8115.6, 74.173, 1852601198)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852597363, -(10376.6), 7799.8, 114.988, 1852597363)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852597363, -(10556.9), 7817.7, 86.108, 1852597363)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852597363, -(10224.8), 7943.2, 151.870, 1852597363)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666477, -(9739.1), 11871.6, 261.759, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666477, -(9916.1), 11840.3, 286.329, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666477, -(10072.3), 11810.3, 306.749, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666477, -(9949.4), 11713.4, 299.124, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852666477, -(9799.5), 11758.7, 269.768, 1852666477)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320292, -(8814.1), 8901.5, 169.496, 1853320292)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320292, -(8756.6), 9067.6, 179.402, 1853320292)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853320295, -(8854.2), 8765.3, 154.633, 1853320295)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207713, -(936.5), 8794.8, 324.424, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060215, -(3325.0), 9599.6, 273.158, 1853060215)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853122668, -(3560.4), 9462.5, 297.033, 1853122668)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853122668, -(3161.4), 9386.0, 206.902, 1853122668)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060200, -(5503.0), 11603.3, 230.714, 1853060200)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060200, -(5835.3), 11435.1, 241.856, 1853060200)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(5858.1), 11655.2, 253.218, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(5701.3), 11561.8, 239.774, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(5563.7), 11406.0, 246.106, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(5852.3), 11814.4, 251.068, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(5605.8), 11863.2, 243.740, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(5394.9), 11748.6, 214.145, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(7247.7), 10088.4, 30.273, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(7050.3), 10135.0, 47.477, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060204, -(7356.8), 10241.5, 8.636, 1853060204)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(7330.0), 10433.0, 6.534, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(7146.8), 10332.4, 20.556, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853060211, -(6908.7), 10257.1, 38.241, 1853060211)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852272246, -(5144.6), 7654.7, 321.361, 1852272246)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852272247, -(5345.7), 7666.5, 334.423, 1852272247)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852272247, -(5284.6), 7828.5, 316.372, 1852272247)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852272247, -(5094.7), 7868.0, 296.714, 1852272247)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852272226, -(5227.7), 7554.3, 342.382, 1852272226)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852272226, -(5002.6), 7741.3, 292.185, 1852272226)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852798827, 1251.6, 7315.2, 225.237, 1852798827)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852798827, 1550.6, 7094.4, 223.608, 1852798827)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852798821, 1060.6, 7195.9, 218.629, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852798821, 1331.1, 7145.9, 219.766, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852798821, 1349.1, 6950.2, 224.981, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207713, -(711.7), 8844.7, 236.093, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207713, -(911.2), 8629.7, 18.359, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207713, -(389.4), 8507.4, 173.740, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207719, -(685.0), 8649.7, 308.571, 1852207719)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207719, -(845.5), 8463.8, 311.505, 1852207719)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207717, -(494.5), 8681.6, 261.084, 1852207717)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207713, -(2356.0), 6975.8, 39.641, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207713, -(2153.3), 6854.3, 48.919, 1852207713)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852207717, -(2322.8), 6807.4, 48.432, 1852207717)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055597, -(7673.4), 9546.4, 145.353, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055597, -(7908.0), 9633.1, 118.470, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055597, -(2041.0), 8826.2, 141.795, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055597, -(2302.7), 8802.4, 104.083, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055597, -(1992.1), 9044.7, 184.191, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1853055597, -(7957.1), 9401.0, 119.808, 1853055597)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852798821, -(1663.6), 6484.8, 22.995, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852798821, -(1563.7), 6665.6, 331.113, 1852798821)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852270450, 231.7, 10116.9, 147.531, 1852270450)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852270450, 270.3, 10530.2, 226.933, 1852270450)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852270450, -(78.7), 9939.9, 96.375, 1852270450)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852273524, -(20.1), 10405.6, 167.877, 1852273524)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852273524, -(211.7), 10157.7, 148.748, 1852273524)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852273252, -(1531.4), 13530.0, 295.646, 1852273252)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852269675, -(1748.2), 13290.4, 320.206, 1852269675)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852269675, -(1450.9), 13299.6, 309.601, 1852269675)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852269675, -(1216.0), 13390.2, 272.132, 1852269675)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852273271, -(1249.6), 13220.2, 277.941, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852273271, -(1683.8), 13109.1, 114.170, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852273271, -(1344.8), 13631.1, 280.580, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	u21 = __wurst_safe_BlzCreateUnitWithSkin(p16, 1852273271, -(1767.8), 13579.1, 307.387, 1852273271)
	__wurst_safe_SetUnitAcquireRange(u21, 200.0)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateNeutralPassiveBuildings(__wurst_stackPos308) 
	local p17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos308
	wurst_stack_depth = (wurst_stack_depth + 1)
	p17 = Player(PLAYER_NEUTRAL_PASSIVE)
	__wurst_safe_BlzCreateUnitWithSkin(p17, 1852206952, 1408.0, 25664.0, 270.000, 1852206952)
	__wurst_safe_BlzCreateUnitWithSkin(p17, 1851942508, 1536.0, 7360.0, 270.000, 1851942508)
	__wurst_safe_BlzCreateUnitWithSkin(p17, 1852268900, 2560.0, 13312.0, 270.000, 1852268900)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerBuildings(__wurst_stackPos309) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos309
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateBuildingsForPlayer0("when calling CreateBuildingsForPlayer0 in war3map, line 1138")
	CreateBuildingsForPlayer1("when calling CreateBuildingsForPlayer1 in war3map, line 1139")
	CreateBuildingsForPlayer5("when calling CreateBuildingsForPlayer5 in war3map, line 1140")
	CreateBuildingsForPlayer18("when calling CreateBuildingsForPlayer18 in war3map, line 1141")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreatePlayerUnits(__wurst_stackPos310) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos310
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateUnitsForPlayer0("when calling CreateUnitsForPlayer0 in war3map, line 1146")
	CreateUnitsForPlayer5("when calling CreateUnitsForPlayer5 in war3map, line 1147")
	CreateUnitsForPlayer18("when calling CreateUnitsForPlayer18 in war3map, line 1148")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateAllUnits(__wurst_stackPos311) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos311
	wurst_stack_depth = (wurst_stack_depth + 1)
	CreateNeutralHostileBuildings("when calling CreateNeutralHostileBuildings in war3map, line 1153")
	CreateNeutralPassiveBuildings("when calling CreateNeutralPassiveBuildings in war3map, line 1154")
	CreatePlayerBuildings("when calling CreatePlayerBuildings in war3map, line 1155")
	CreateNeutralHostile("when calling CreateNeutralHostile in war3map, line 1156")
	CreatePlayerUnits("when calling CreatePlayerUnits in war3map, line 1157")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CreateRegions(__wurst_stackPos312) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos312
	wurst_stack_depth = (wurst_stack_depth + 1)
	Rect(-(4960.0), -(6336.0), -(4512.0), -(5984.0))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_Other_Actions(__wurst_stackPos313) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos313
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_townHall = gg_unit_etol_0001
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitTrig_Other(__wurst_stackPos314) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos314
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_Other = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_Other, function (...) 
			xpcall(function (...) 
					bridge_Trig_Other_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Trig_ControlPointInitialVariables_Actions(__wurst_stackPos315) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos315
	wurst_stack_depth = (wurst_stack_depth + 1)
	udg_mountHyjal = gg_unit_h000_0407
	udg_mountHyjalGrove = gg_unit_h001_0008
	udg_mountHyjalTown = gg_unit_h003_0016
	udg_winterspringNorth = gg_unit_h006_0015
	udg_winterspringRoost = gg_unit_h008_0011
	udg_moongladeEast = gg_unit_h009_0014
	udg_moongladeWest = gg_unit_h00A_0009
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

function InitTrig_ControlPointInitialVariables(__wurst_stackPos316) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos316
	wurst_stack_depth = (wurst_stack_depth + 1)
	gg_trg_ControlPointInitialVariables = CreateTrigger()
	__wurst_safe_TriggerAddAction(gg_trg_ControlPointInitialVariables, function (...) 
			xpcall(function (...) 
					bridge_Trig_ControlPointInitialVariables_Actions(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InitCustomTriggers(__wurst_stackPos317) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos317
	wurst_stack_depth = (wurst_stack_depth + 1)
	InitTrig_Other("when calling InitTrig_Other in war3map, line 1232")
	InitTrig_ControlPointInitialVariables("when calling InitTrig_ControlPointInitialVariables in war3map, line 1233")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function RunInitializationTriggers(__wurst_stackPos318) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos318
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
	gg_unit_h006_0015 = nil
	gg_unit_h008_0011 = nil
	gg_unit_h003_0016 = nil
	gg_unit_h00E_0013 = nil
	gg_unit_h009_0014 = nil
	gg_unit_h00A_0009 = nil
	gg_unit_h001_0008 = nil
	gg_unit_h000_0407 = nil
	gg_unit_etol_0001 = nil
	gg_unit_h00K_0176 = nil
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
	Dive_CROW_TACKLE_ID = 0
	Dive_TACKLE_DAMAGE = 0.
	Dive_DASH_SPEED = 0.
	Dive_UPDATE_INTERVAL = 0.
	Dive_DASH_SFX = ""
	Dive_IMPACT_SFX = ""
	DummyRecycler_DUMMY_UNIT_ID = 0
	DummyRecycler_ROOT_ENABLER = 0
	DummyRecycler_DIFFERENT_ANGLES = 0
	DummyRecycler_ANGLE_DEGREE = 0.
	DummyRecycler_SAVED_UNITS_PER_ANGLE = 0
	DummyRecycler_angleQueues = defaultArray(function () 
			return nil
		end)
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
	Invigorate_INVIGORATE_BUFF_ID = 0
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
	MoonWarrior_MOON_WARRIOR_ID = 0
	MoonWarrior_MOON_WARRIOR_BUFF_ID = 0
	MoonWarrior_TYRANDE_MODEL_ID = 0
	MoonWarrior_TIGER_UNIT_ID = 0
	MoonWarrior_TIGER_DURATION = 0.
	MoonWarrior_BONUS_ATTACK_SPEED = 0.
	MoonWarrior_BONUS_DAMAGE = 0.
	MoonWarrior_DISMOUNT_SFX = ""
	MoonWarrior_SUMMON_SFX = ""
	Nightmare_NIGHTMARE_ID = 0
	Nightmare_NIGHTMARE_BUFF_ID = 0
	Nightmare_NIGHTMARE_RADIUS = 0.
	Nightmare_NIGHTMARE_DURATION = 0.
	Nightmare_CORRUPT_SFX = ""
	Nightmare_NIGHTMARE_SFX = ""
	Nightmare_sleepingUnits = nil
	ObjectIds_CHARMAP = ""
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
	SeedlingTracker_SEEDLING_TRACKER_ITEM_ID = 0
	SeedlingTracker_trackerItem = nil
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
	Starfall_STARFALL_ID = 0
	Starfall_STARFALL_RADIUS = 0.
	Starfall_STAR_DAMAGE = 0.
	Starfall_STAR_AOE = 0.
	Starfall_CHANNEL_DURATION = 0.
	Starfall_BASE_INTERVAL = 0.
	Starfall_MIN_INTERVAL = 0.
	Starfall_STAR_SFX = ""
	Starfall_IMPACT_SFX = ""
	Starfall_CHANNEL_SFX = ""
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
	UnitIds_abomination = 0
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
	test_GPROJECTILE_ID = 0
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
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
	CallbackPeriodic_doPeriodically_Bloom.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_Bloom_call_doPeriodically_Bloom
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
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
	CallbackSingle_doAfter_Bloom.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_Bloom_call_doAfter_Bloom
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
	CallbackSingle_doAfter_Bloom.__typeId__ = 14
	OnCastListener_onCast_Bloom.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.OnPointCast_fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Bloom.fire = OnCastListener_onCast_Bloom_fire_onCast_Bloom
	OnCastListener_onCast_Bloom.__wurst_supertypes = ({[OnCastListener_onCast_Bloom] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Bloom.__typeId__ = 56
	OnCastListener_onCast_CenariusCharacter.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.OnPointCast_fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CenariusCharacter.fire = OnCastListener_onCast_CenariusCharacter_fire_onCast_CenariusCharacter
	OnCastListener_onCast_CenariusCharacter.__wurst_supertypes = ({[OnCastListener_onCast_CenariusCharacter] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CenariusCharacter.__typeId__ = 57
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
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
	CallbackSingle_nullTimer_ClosureEvents.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_nullTimer_ClosureEvents_call_nullTimer_ClosureEvents
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
	CallbackSingle_nullTimer_ClosureEvents.__typeId__ = 30
	EventListener.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener.destroyEventListener = EventListener_destroyEventListener
	EventListener.__wurst_supertypes = ({[EventListener] = true, })
	EventListener.__typeId__ = 37
	OnCastListener.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener.__wurst_supertypes = ({[OnCastListener] = true, })
	OnCastListener.__typeId__ = 55
	OnPointCast.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnPointCast.OnCastListener_fire = OnPointCast_OnPointCast_fire
	OnPointCast.OnPointCast_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnPointCast.OnPointCast_fire = OnPointCast_OnPointCast_fire
	OnPointCast.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnPointCast.fire = OnPointCast_OnPointCast_fire
	OnPointCast.__wurst_supertypes = ({[OnPointCast] = true, [OnCastListener] = true, })
	OnPointCast.__typeId__ = 69
	ForGroupCallback.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback.__wurst_supertypes = ({[ForGroupCallback] = true, })
	ForGroupCallback.__typeId__ = 46
	ForGroupCallbackUntil.__wurst_supertypes = ({[ForGroupCallbackUntil] = true, })
	ForGroupCallbackUntil.__typeId__ = 48
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
	CallbackSingle.__typeId__ = 13
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
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
	CallbackSingle_doAfter_ControlPoint.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_ControlPoint_call_doAfter_ControlPoint
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
	CallbackSingle_doAfter_ControlPoint.__typeId__ = 15
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
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
	CallbackSingle_doAfter_CorruptedBlood.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_CorruptedBlood_call_doAfter_CorruptedBlood
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
	CallbackSingle_doAfter_CorruptedBlood.__typeId__ = 16
	OnCastListener_onCast_CorruptedBlood.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CorruptedBlood.OnCastListener_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_CorruptedBlood_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.OnPointCast_fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_CorruptedBlood.fire = OnCastListener_onCast_CorruptedBlood_fire_onCast_CorruptedBlood
	OnCastListener_onCast_CorruptedBlood.__wurst_supertypes = ({[OnCastListener_onCast_CorruptedBlood] = true, [OnCastListener] = true, })
	OnCastListener_onCast_CorruptedBlood.__typeId__ = 58
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.call = CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call_doPeriodically_onCast_CorruptedBlood
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_CorruptedBlood] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_CorruptedBlood.__typeId__ = 5
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
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_call = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_CorruptedBlood_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
	CallbackSingle_doAfter_onCast_CorruptedBlood.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_CorruptedBlood_call_doAfter_onCast_CorruptedBlood
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
	CallbackSingle_doAfter_onCast_CorruptedBlood.__typeId__ = 21
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_Nightmare_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_add_SeedlingTracker_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent
	EventListener_add_DamageEvent.__wurst_supertypes = ({[EventListener_add_DamageEvent] = true, [EventListener] = true, })
	EventListener_add_DamageEvent.__typeId__ = 38
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_DamageEvent_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_Nightmare_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_Recycle_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_add_SeedlingTracker_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.EventListener_onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.EventListener_onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_DamageEvent1.onEvent = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.onEvent1 = EventListener_add_DamageEvent_onEvent_add_DamageEvent1
	EventListener_add_DamageEvent1.__wurst_supertypes = ({[EventListener_add_DamageEvent1] = true, [EventListener] = true, })
	EventListener_add_DamageEvent1.__typeId__ = 39
	DamageElement.__wurst_supertypes = ({[DamageElement] = true, })
	DamageElement.__typeId__ = 33
	DamageInstance.DamageInstance_DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.DamageInstance_destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.DamageInstance_setReducedAmount = DamageInstance_DamageInstance_setReducedAmount
	DamageInstance.destroyDamageInstance = DamageInstance_destroyDamageInstance
	DamageInstance.__wurst_supertypes = ({[DamageInstance] = true, })
	DamageInstance.__typeId__ = 34
	DamageListener.__wurst_supertypes = ({[DamageListener] = true, })
	DamageListener.__typeId__ = 35
	OnCastListener_onCast_Dive.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Dive.OnCastListener_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_Dive_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Dive.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.OnPointCast_fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Dive.fire = OnCastListener_onCast_Dive_fire_onCast_Dive
	OnCastListener_onCast_Dive.__wurst_supertypes = ({[OnCastListener_onCast_Dive] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Dive.__typeId__ = 59
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_Dive_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_Dive_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Dive.call = CallbackPeriodic_doPeriodically_onCast_Dive_call_doPeriodically_onCast_Dive
	CallbackPeriodic_doPeriodically_onCast_Dive.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Dive.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_Dive] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_Dive.__typeId__ = 6
	ForForceCallback.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback.__wurst_supertypes = ({[ForForceCallback] = true, })
	ForForceCallback.__typeId__ = 44
	ForForceCallback_execute_GroupUtils.ForForceCallback_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.ForForceCallback_execute_GroupUtils_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.ForForceCallback_run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.destroyForForceCallback = ForForceCallback_destroyForForceCallback
	ForForceCallback_execute_GroupUtils.run = ForForceCallback_execute_GroupUtils_run_execute_GroupUtils
	ForForceCallback_execute_GroupUtils.__wurst_supertypes = ({[ForForceCallback_execute_GroupUtils] = true, [ForForceCallback] = true, })
	ForForceCallback_execute_GroupUtils.__typeId__ = 45
	GroupIterator.GroupIterator_destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.destroyGroupIterator = GroupIterator_destroyGroupIterator
	GroupIterator.__wurst_supertypes = ({[GroupIterator] = true, })
	GroupIterator.__typeId__ = 49
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
	HashMap.__typeId__ = 72
	EventListener_add_HeroTrainer.EventListener_add_DamageEvent_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_Nightmare_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_Recycle_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_add_SeedlingTracker_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.EventListener_onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.EventListener_onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_HeroTrainer.onEvent = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.onEvent1 = EventListener_add_HeroTrainer_onEvent_add_HeroTrainer
	EventListener_add_HeroTrainer.__wurst_supertypes = ({[EventListener_add_HeroTrainer] = true, [EventListener] = true, })
	EventListener_add_HeroTrainer.__typeId__ = 40
	OnCastListener_onCast_Hibernate.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.OnCastListener_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Hibernate_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.OnPointCast_fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Hibernate.fire = OnCastListener_onCast_Hibernate_fire_onCast_Hibernate
	OnCastListener_onCast_Hibernate.__wurst_supertypes = ({[OnCastListener_onCast_Hibernate] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Hibernate.__typeId__ = 60
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Hibernate_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Hibernate.call = CallbackPeriodic_doPeriodically_onCast_Hibernate_call_doPeriodically_onCast_Hibernate
	CallbackPeriodic_doPeriodically_onCast_Hibernate.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Hibernate.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_Hibernate] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_Hibernate.__typeId__ = 7
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
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_call = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Hibernate_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
	CallbackSingle_doAfter_onCast_Hibernate.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_Hibernate_call_doAfter_onCast_Hibernate
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
	CallbackSingle_doAfter_onCast_Hibernate.__typeId__ = 22
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
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
	CallbackSingle_doAfter_InitFocusCamera.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_InitFocusCamera_call_doAfter_InitFocusCamera
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
	CallbackSingle_doAfter_InitFocusCamera.__typeId__ = 17
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
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
	CallbackSingle_doAfter_Invigorate.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_Invigorate_call_doAfter_Invigorate
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
	CallbackSingle_doAfter_Invigorate.__typeId__ = 18
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Isolation_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_Isolation_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
	CallbackPeriodic_doPeriodically_Isolation.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_Isolation_call_doPeriodically_Isolation
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
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
	CallbackSingle_doAfter_doPeriodically_Isolation.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_doPeriodically_Isolation_call_doAfter_doPeriodically_Isolation
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
	CallbackSingle_doAfter_doPeriodically_Isolation.__typeId__ = 19
	LLBackIterator.LLBackIterator_destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.destroyLLBackIterator = LLBackIterator_destroyLLBackIterator
	LLBackIterator.__wurst_supertypes = ({[LLBackIterator] = true, })
	LLBackIterator.__typeId__ = 51
	LLEntry.LLEntry_destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.destroyLLEntry = LLEntry_destroyLLEntry
	LLEntry.__wurst_supertypes = ({[LLEntry] = true, })
	LLEntry.__typeId__ = 52
	LLIterator.LLIterator_LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.LLIterator_destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.LLIterator_reset = LLIterator_LLIterator_reset
	LLIterator.destroyLLIterator = LLIterator_destroyLLIterator
	LLIterator.__wurst_supertypes = ({[LLIterator] = true, })
	LLIterator.__typeId__ = 53
	LinkedList.LinkedList_LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_LinkedList_enqueue = LinkedList_LinkedList_enqueue
	LinkedList.LinkedList_LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.LinkedList_LinkedList_has = LinkedList_LinkedList_has
	LinkedList.LinkedList_add = LinkedList_LinkedList_add
	LinkedList.LinkedList_destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.LinkedList_enqueue = LinkedList_LinkedList_enqueue
	LinkedList.LinkedList_getDummy = LinkedList_LinkedList_getDummy
	LinkedList.LinkedList_has = LinkedList_LinkedList_has
	LinkedList.destroyLinkedList = LinkedList_destroyLinkedList
	LinkedList.__wurst_supertypes = ({[LinkedList] = true, })
	LinkedList.__typeId__ = 54
	OnCastListener_onCast_MoonWarrior.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_MoonWarrior.OnCastListener_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_MoonWarrior_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.OnPointCast_fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_MoonWarrior.fire = OnCastListener_onCast_MoonWarrior_fire_onCast_MoonWarrior
	OnCastListener_onCast_MoonWarrior.__wurst_supertypes = ({[OnCastListener_onCast_MoonWarrior] = true, [OnCastListener] = true, })
	OnCastListener_onCast_MoonWarrior.__typeId__ = 61
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_call = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_MoonWarrior_call = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_MoonWarrior_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_MoonWarrior_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_MoonWarrior.call = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.call1 = CallbackSingle_doAfter_onCast_MoonWarrior_call_doAfter_onCast_MoonWarrior
	CallbackSingle_doAfter_onCast_MoonWarrior.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_MoonWarrior.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_MoonWarrior] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_MoonWarrior.__typeId__ = 23
	OnCastListener_onCast_Nightmare.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Nightmare.OnCastListener_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Nightmare_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.OnPointCast_fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Nightmare.fire = OnCastListener_onCast_Nightmare_fire_onCast_Nightmare
	OnCastListener_onCast_Nightmare.__wurst_supertypes = ({[OnCastListener_onCast_Nightmare] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Nightmare.__typeId__ = 62
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
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_call = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Nightmare_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
	CallbackSingle_doAfter_onCast_Nightmare.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_Nightmare_call_doAfter_onCast_Nightmare
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
	CallbackSingle_doAfter_onCast_Nightmare.__typeId__ = 24
	EventListener_add_Nightmare.EventListener_add_DamageEvent_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_Nightmare_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Nightmare.EventListener_add_Nightmare_onEvent = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_Nightmare_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_Recycle_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_add_SeedlingTracker_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Nightmare.EventListener_onEvent = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.EventListener_onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Nightmare.onEvent = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.onEvent1 = EventListener_add_Nightmare_onEvent_add_Nightmare
	EventListener_add_Nightmare.__wurst_supertypes = ({[EventListener_add_Nightmare] = true, [EventListener] = true, })
	EventListener_add_Nightmare.__typeId__ = 41
	IdGenerator.__wurst_supertypes = ({[IdGenerator] = true, })
	IdGenerator.__typeId__ = 50
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
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
	CallbackSingle_nullTimer_OnUnitEnterLeave.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_nullTimer_OnUnitEnterLeave_call_nullTimer_OnUnitEnterLeave
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
	CallbackSingle_nullTimer_OnUnitEnterLeave.__typeId__ = 31
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.ForGroupCallback_forEachFrom_Preloader_destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.callback = ForGroupCallback_forEachFrom_Preloader_callback_forEachFrom_Preloader
	ForGroupCallback_forEachFrom_Preloader.destroyForGroupCallback = ForGroupCallback_destroyForGroupCallback
	ForGroupCallback_forEachFrom_Preloader.__wurst_supertypes = ({[ForGroupCallback_forEachFrom_Preloader] = true, [ForGroupCallback] = true, })
	ForGroupCallback_forEachFrom_Preloader.__typeId__ = 47
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
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
	CallbackSingle_nullTimer_Preloader.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_nullTimer_Preloader_call_nullTimer_Preloader
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
	CallbackSingle_nullTimer_Preloader.__typeId__ = 32
	EventListener_add_Recycle.EventListener_add_DamageEvent_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_Nightmare_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_Recycle_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Recycle.EventListener_add_Recycle_onEvent = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_Recycle_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_add_SeedlingTracker_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Recycle.EventListener_onEvent = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.EventListener_onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_Recycle.onEvent = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.onEvent1 = EventListener_add_Recycle_onEvent_add_Recycle
	EventListener_add_Recycle.__wurst_supertypes = ({[EventListener_add_Recycle] = true, [EventListener] = true, })
	EventListener_add_Recycle.__typeId__ = 42
	OnCastListener_onCast_SeedBurst.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.OnPointCast_fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SeedBurst.fire = OnCastListener_onCast_SeedBurst_fire_onCast_SeedBurst
	OnCastListener_onCast_SeedBurst.__wurst_supertypes = ({[OnCastListener_onCast_SeedBurst] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SeedBurst.__typeId__ = 63
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
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SeedBurst_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
	CallbackSingle_doAfter_onCast_SeedBurst.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_SeedBurst_call_doAfter_onCast_SeedBurst
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
	CallbackSingle_doAfter_onCast_SeedBurst.__typeId__ = 25
	Vec2Wrapper.Vec2Wrapper_destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.destroyVec2Wrapper = Vec2Wrapper_destroyVec2Wrapper
	Vec2Wrapper.__wurst_supertypes = ({[Vec2Wrapper] = true, })
	Vec2Wrapper.__typeId__ = 74
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_SeedlingTracker_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_SeedlingTracker_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_SeedlingTracker.call = CallbackPeriodic_doPeriodically_SeedlingTracker_call_doPeriodically_SeedlingTracker
	CallbackPeriodic_doPeriodically_SeedlingTracker.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_SeedlingTracker.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_SeedlingTracker] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_SeedlingTracker.__typeId__ = 4
	EventListener_add_SeedlingTracker.EventListener_add_DamageEvent_onEvent1 = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.EventListener_add_HeroTrainer_onEvent1 = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.EventListener_add_Nightmare_onEvent1 = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.EventListener_add_Recycle_onEvent1 = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.EventListener_add_SeedlingTracker_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_SeedlingTracker.EventListener_add_SeedlingTracker_onEvent = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.EventListener_add_SeedlingTracker_onEvent1 = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.EventListener_destroyEventListener = EventListener_destroyEventListener
	EventListener_add_SeedlingTracker.EventListener_onEvent = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.EventListener_onEvent1 = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.destroyEventListener = EventListener_destroyEventListener
	EventListener_add_SeedlingTracker.onEvent = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.onEvent1 = EventListener_add_SeedlingTracker_onEvent_add_SeedlingTracker
	EventListener_add_SeedlingTracker.__wurst_supertypes = ({[EventListener_add_SeedlingTracker] = true, [EventListener] = true, })
	EventListener_add_SeedlingTracker.__typeId__ = 43
	DamageListener_addListener_ShieldBash.DamageListener_addListener_ShieldBash_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.DamageListener_onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.onEvent = DamageListener_addListener_ShieldBash_onEvent_addListener_ShieldBash
	DamageListener_addListener_ShieldBash.__wurst_supertypes = ({[DamageListener_addListener_ShieldBash] = true, [DamageListener] = true, })
	DamageListener_addListener_ShieldBash.__typeId__ = 36
	OnCastListener_onCast_SpiritWisps.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.OnCastListener_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SpiritWisps_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.OnPointCast_fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SpiritWisps.fire = OnCastListener_onCast_SpiritWisps_fire_onCast_SpiritWisps
	OnCastListener_onCast_SpiritWisps.__wurst_supertypes = ({[OnCastListener_onCast_SpiritWisps] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SpiritWisps.__typeId__ = 64
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_SpiritWisps] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps.__typeId__ = 8
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.call = CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call_doPeriodically_onCast_SpiritWisps1
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_SpiritWisps1] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_SpiritWisps1.__typeId__ = 9
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
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_call = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_SpiritWisps_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_SpiritWisps.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_SpiritWisps_call_doAfter_onCast_SpiritWisps
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
	CallbackSingle_doAfter_onCast_SpiritWisps.__typeId__ = 26
	OnCastListener_onCast_Starfall.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Starfall.OnCastListener_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_Starfall_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Starfall.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.OnPointCast_fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_Starfall.fire = OnCastListener_onCast_Starfall_fire_onCast_Starfall
	OnCastListener_onCast_Starfall.__wurst_supertypes = ({[OnCastListener_onCast_Starfall] = true, [OnCastListener] = true, })
	OnCastListener_onCast_Starfall.__typeId__ = 65
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_Starfall_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_Starfall_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_Starfall.call = CallbackPeriodic_doPeriodically_onCast_Starfall_call_doPeriodically_onCast_Starfall
	CallbackPeriodic_doPeriodically_onCast_Starfall.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_Starfall.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_Starfall] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_Starfall.__typeId__ = 10
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_call = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.call = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.call1 = CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call_doAfter_doPeriodically_onCast_Starfall
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.__wurst_supertypes = ({[CallbackSingle_doAfter_doPeriodically_onCast_Starfall] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_doPeriodically_onCast_Starfall.__typeId__ = 20
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_call = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_Bloom_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_ControlPoint_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_InitFocusCamera_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_Invigorate_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_doPeriodically_Isolation_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_Starfall_call = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_Starfall_destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_Starfall_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_SummonTreant_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_doAfter_onCast_ThrowExplosives_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_nullTimer_ClosureEvents_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_nullTimer_OnUnitEnterLeave_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_nullTimer_Preloader_call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.CallbackSingle_start = CallbackSingle_CallbackSingle_start
	CallbackSingle_doAfter_onCast_Starfall.call = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.call1 = CallbackSingle_doAfter_onCast_Starfall_call_doAfter_onCast_Starfall
	CallbackSingle_doAfter_onCast_Starfall.destroyCallbackSingle = CallbackSingle_destroyCallbackSingle
	CallbackSingle_doAfter_onCast_Starfall.__wurst_supertypes = ({[CallbackSingle_doAfter_onCast_Starfall] = true, [CallbackSingle] = true, })
	CallbackSingle_doAfter_onCast_Starfall.__typeId__ = 27
	OnCastListener_onCast_SummonTreant.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SummonTreant.OnCastListener_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SummonTreant_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.OnPointCast_fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_SummonTreant.fire = OnCastListener_onCast_SummonTreant_fire_onCast_SummonTreant
	OnCastListener_onCast_SummonTreant.__wurst_supertypes = ({[OnCastListener_onCast_SummonTreant] = true, [OnCastListener] = true, })
	OnCastListener_onCast_SummonTreant.__typeId__ = 66
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
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
	CallbackSingle_doAfter_onCast_SummonTreant.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_SummonTreant_call_doAfter_onCast_SummonTreant
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
	CallbackSingle_doAfter_onCast_SummonTreant.__typeId__ = 28
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
	Table.__typeId__ = 71
	OnCastListener_onCast_ThrowExplosives.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_ThrowExplosives.OnCastListener_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_ThrowExplosives_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.OnPointCast_fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_ThrowExplosives.fire = OnCastListener_onCast_ThrowExplosives_fire_onCast_ThrowExplosives
	OnCastListener_onCast_ThrowExplosives.__wurst_supertypes = ({[OnCastListener_onCast_ThrowExplosives] = true, [OnCastListener] = true, })
	OnCastListener_onCast_ThrowExplosives.__typeId__ = 67
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.call = CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call_doPeriodically_onCast_ThrowExplosives
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_onCast_ThrowExplosives] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_onCast_ThrowExplosives.__typeId__ = 11
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
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_doPeriodically_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_CorruptedBlood_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_Hibernate_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_MoonWarrior_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_Nightmare_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_SeedBurst_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_SpiritWisps_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
	CallbackSingle_doAfter_onCast_ThrowExplosives.CallbackSingle_doAfter_onCast_Starfall_call1 = CallbackSingle_doAfter_onCast_ThrowExplosives_call_doAfter_onCast_ThrowExplosives
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
	CallbackSingle_doAfter_onCast_ThrowExplosives.__typeId__ = 29
	UnitIndex.UnitIndex_destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.destroyUnitIndex = UnitIndex_destroyUnitIndex
	UnitIndex.__wurst_supertypes = ({[UnitIndex] = true, })
	UnitIndex.__typeId__ = 73
	UnitDefinition.__wurst_supertypes = ({[UnitDefinition] = true, [UnitOrHeroDefinition] = true, [UnitOrBuildingOrHeroDefinition] = true, [W3UDefinition] = true, })
	UnitDefinition.__typeId__ = 78
	UnitOrBuildingOrHeroDefinition.__wurst_supertypes = ({[UnitOrBuildingOrHeroDefinition] = true, [W3UDefinition] = true, })
	UnitOrBuildingOrHeroDefinition.__typeId__ = 76
	UnitOrHeroDefinition.__wurst_supertypes = ({[UnitOrHeroDefinition] = true, [UnitOrBuildingOrHeroDefinition] = true, [W3UDefinition] = true, })
	UnitOrHeroDefinition.__typeId__ = 77
	W3UDefinition.__wurst_supertypes = ({[W3UDefinition] = true, })
	W3UDefinition.__typeId__ = 75
	OnCastListener_onCast_UrsocCharge.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.OnCastListener_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Bloom_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_CenariusCharacter_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_CorruptedBlood_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Dive_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Hibernate_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_MoonWarrior_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Nightmare_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SeedBurst_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SpiritWisps_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_Starfall_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_SummonTreant_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_ThrowExplosives_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_UrsocCharge_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.OnCastListener_onCast_UrsocCharge_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.OnPointCast_fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnCastListener_onCast_UrsocCharge.fire = OnCastListener_onCast_UrsocCharge_fire_onCast_UrsocCharge
	OnCastListener_onCast_UrsocCharge.__wurst_supertypes = ({[OnCastListener_onCast_UrsocCharge] = true, [OnCastListener] = true, })
	OnCastListener_onCast_UrsocCharge.__typeId__ = 68
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_Bloom_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_Isolation_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_SeedlingTracker_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_onCast_CorruptedBlood_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_onCast_Dive_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_onCast_Hibernate_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_onCast_SpiritWisps_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_onCast_Starfall_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_onCast_ThrowExplosives_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_test_call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_test_destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_doPeriodically_test_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_test.CallbackPeriodic_start = CallbackPeriodic_CallbackPeriodic_start
	CallbackPeriodic_doPeriodically_test.call = CallbackPeriodic_doPeriodically_test_call_doPeriodically_test
	CallbackPeriodic_doPeriodically_test.destroyCallbackPeriodic = CallbackPeriodic_destroyCallbackPeriodic
	CallbackPeriodic_doPeriodically_test.__wurst_supertypes = ({[CallbackPeriodic_doPeriodically_test] = true, [CallbackPeriodic] = true, })
	CallbackPeriodic_doPeriodically_test.__typeId__ = 12
	OnPointCast_onPointCast_test.OnCastListener_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnPointCast_onPointCast_test.OnCastListener_fire = OnPointCast_OnPointCast_fire
	OnPointCast_onPointCast_test.OnCastListener_fireEx = OnPointCast_onPointCast_test_fireEx_onPointCast_test
	OnPointCast_onPointCast_test.OnPointCast_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnPointCast_onPointCast_test.OnPointCast_fire = OnPointCast_OnPointCast_fire
	OnPointCast_onPointCast_test.OnPointCast_fireEx = OnPointCast_onPointCast_test_fireEx_onPointCast_test
	OnPointCast_onPointCast_test.OnPointCast_onPointCast_test_destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnPointCast_onPointCast_test.OnPointCast_onPointCast_test_fire = OnPointCast_OnPointCast_fire
	OnPointCast_onPointCast_test.OnPointCast_onPointCast_test_fireEx = OnPointCast_onPointCast_test_fireEx_onPointCast_test
	OnPointCast_onPointCast_test.destroyOnCastListener = OnCastListener_destroyOnCastListener
	OnPointCast_onPointCast_test.fire = OnPointCast_OnPointCast_fire
	OnPointCast_onPointCast_test.fireEx = OnPointCast_onPointCast_test_fireEx_onPointCast_test
	OnPointCast_onPointCast_test.__wurst_supertypes = ({[OnPointCast_onPointCast_test] = true, [OnPointCast] = true, [OnCastListener] = true, })
	OnPointCast_onPointCast_test.__typeId__ = 70
	initGlobals("when calling initGlobals")
	initCompiletimeState("when calling initCompiletimeState in blizzard, line 1")
	SetCameraBounds((-(26880.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (-(31232.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)), (32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (-(26880.0) + GetCameraMargin(CAMERA_MARGIN_LEFT)), (29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP)), (32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT)), (-(31232.0) + GetCameraMargin(CAMERA_MARGIN_BOTTOM)))
	SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("AshenvaleDay")
	SetAmbientNightSound("AshenvaleNight")
	SetMapMusic("Music", true, 0)
	CreateRegions("when calling CreateRegions in war3map, line 1279")
	CreateAllUnits("when calling CreateAllUnits in war3map, line 1280")
	InitBlizzard()
	InitGlobals("when calling InitGlobals in war3map, line 1282")
	InitCustomTriggers("when calling InitCustomTriggers in war3map, line 1283")
	RunInitializationTriggers("when calling RunInitializationTriggers in war3map, line 1284")
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
	  local __wurst_init_ok = xpcall(init_StringUtils, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package StringUtils.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Textures, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Textures.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Invigorate, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Invigorate.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_ItemIds, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package ItemIds.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_SeedlingTracker, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package SeedlingTracker.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_Dive, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Dive.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_DummyRecycler, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package DummyRecycler.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_Execute, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Execute.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_GlaiveThrow, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package GlaiveThrow.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_GroupUtils, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package GroupUtils.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_Units, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Units.", "<lua error>")
	  end
	end
	do
	  local __wurst_init_ok = xpcall(init_MoonWarrior, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package MoonWarrior.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_Starfall, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package Starfall.", "<lua error>")
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
	  local __wurst_init_ok = xpcall(init_test, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua init error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) end) end)
	  if not __wurst_init_ok then
	    error1("Could not initialize package test.", "<lua error>")
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

function init_Abilities(__wurst_stackPos320) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos320
	wurst_stack_depth = (wurst_stack_depth + 1)
	Abilities_tranquility = "Abilities\\Spells\\NightElf\\Tranquility\\Tranquility.mdx"
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityIds(__wurst_stackPos321) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos321
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_AbilityObjEditing(__wurst_stackPos353) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos353
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Angle(__wurst_stackPos325) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos325
	wurst_stack_depth = (wurst_stack_depth + 1)
	Angle_DEGTORAD = 0.017453293
	Angle_RADTODEG = 57.295779513
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function angle_degrees(this251, __wurst_stackPos407) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos407
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this251[1] * Angle_RADTODEG)
end

function angle_radians(this252, __wurst_stackPos408) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos408
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return this252[1]
end

function real_asAngleDegrees(this253, __wurst_stackPos409) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos409
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this253 * Angle_DEGTORAD), })
end

function real_fromDeg(this254, __wurst_stackPos410) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos410
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this254 * Angle_DEGTORAD), })
end

function real_asAngleRadians(this255, __wurst_stackPos411) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos411
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this255, })
end

function init_Basics(__wurst_stackPos333) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos333
	wurst_stack_depth = (wurst_stack_depth + 1)
	Basics_ANIMATION_PERIOD = 0.030
	Basics_HEIGHT_ENABLER = 1097691750
	Basics_DUMMY_PLAYER = Player_players[PLAYER_NEUTRAL_PASSIVE]
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_BitSet(__wurst_stackPos324) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos324
	wurst_stack_depth = (wurst_stack_depth + 1)
	BitSet_BITSET_SIZE = 32
	initPows("when calling initPows in BitSet, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPows(__wurst_stackPos412) 
	local allPows = nil
	local i6 = nil
	local temp5 = nil
	local i7 = nil
	local temp6 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos412
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

function init_Bloom(__wurst_stackPos369) 
	local clVar18 = nil
	local temp12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos369
	wurst_stack_depth = (wurst_stack_depth + 1)
	Bloom_HEALING_CLOUD_ID = intEnsure(1095577655)
	Bloom_CLOUD_UNIT_ID = 1701212014
	Bloom_HEAL_INTERVAL = 1.
	Bloom_CLOUD_RADIUS[0] = 256.
	Bloom_CLOUD_RADIUS[1] = 270.
	Bloom_CLOUD_RADIUS[2] = 300.
	Bloom_CLOUD_HEAL[0] = 20.
	Bloom_CLOUD_HEAL[1] = 30.
	Bloom_CLOUD_HEAL[2] = 35.
	Bloom_CLOUD_DURATION[0] = 10.
	Bloom_CLOUD_DURATION[1] = 10.
	Bloom_CLOUD_DURATION[2] = 10.
	temp12 = Bloom_HEALING_CLOUD_ID
	clVar18 = OnCastListener_onCast_Bloom:create2()
	OnCastListener_construct_OnCastListener(clVar18, "when calling construct_OnCastListener in Bloom, line 95")
	EventListener_onCast(temp12, clVar18, "when calling onCast in Bloom, line 95")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function spawnCloud(owner, pos1, heal1, radius1, duration1, __wurst_stackPos19) 
	local cloud = nil
	local sfx2 = nil
	local healTimer2 = nil
	local clVar19 = nil
	local clVar20 = nil
	local temp13 = nil
	local temp14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos19
	wurst_stack_depth = (wurst_stack_depth + 1)
	cloud = createUnit(owner, Bloom_CLOUD_UNIT_ID, pos1, ({0., }), "when calling createUnit in Bloom, line 71")
	unit_setInvulnerable(cloud, true, "when calling setInvulnerable in Bloom, line 72")
	unit_addAbility(cloud, 1097625443, "when calling addAbility in Bloom, line 73")
	unit_setPathing(cloud, false, "when calling setPathing in Bloom, line 74")
	unit_setAnimation(cloud, "stand 4", "when calling setAnimation in Bloom, line 75")
	unit_pause(cloud, "when calling pause in Bloom, line 76")
	sfx2 = widget_addEffect(cloud, Abilities_tranquility, "origin", "when calling addEffect in Bloom, line 78")
	effect_setScale(sfx2, 1., "when calling setScale in Bloom, line 79")
	effect_setColor(sfx2, 0, 255, 0, "when calling setColor in Bloom, line 80")
	temp13 = Bloom_HEAL_INTERVAL
	clVar19 = CallbackPeriodic_doPeriodically_Bloom:create()
	CallbackPeriodic_construct_CallbackPeriodic(clVar19, "when calling construct_CallbackPeriodic in Bloom, line 82")
	clVar19.pos = tupleCopy(pos1)
	clVar19.radius = radius1
	clVar19.owner = owner
	clVar19.heal = heal1
	healTimer2 = doPeriodically(temp13, clVar19, "when calling doPeriodically in Bloom, line 82")
	temp14 = duration1
	clVar20 = CallbackSingle_doAfter_Bloom:create1()
	CallbackSingle_construct_CallbackSingle(clVar20, "when calling construct_CallbackSingle in Bloom, line 89")
	clVar20.healTimer = healTimer2
	clVar20.cloud = cloud
	clVar20.sfx = sfx2
	doAfter(temp14, clVar20, "when calling doAfter in Bloom, line 89")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function boolean_toString(this176, __wurst_stackPos198) 
	local cond_result = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos198
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	if this176 then
		cond_result = "true"
	else
		cond_result = "false"
	end
	return cond_result
end

function init_BuffIds(__wurst_stackPos370) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos370
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CenariusCharacter(__wurst_stackPos375) 
	local clVar21 = nil
	local temp15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos375
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp15 = Invigorate_INVIGORATE_ID
	clVar21 = OnCastListener_onCast_CenariusCharacter:create3()
	OnCastListener_construct_OnCastListener(clVar21, "when calling construct_OnCastListener in CenariusCharacter, line 27")
	EventListener_onCast(temp15, clVar21, "when calling onCast in CenariusCharacter, line 27")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureEvents(__wurst_stackPos365) 
	local clVar22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos365
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
	clVar22 = CallbackSingle_nullTimer_ClosureEvents:create4()
	CallbackSingle_construct_CallbackSingle(clVar22, "when calling construct_CallbackSingle in ClosureEvents, line 306")
	nullTimer(clVar22, "when calling nullTimer in ClosureEvents, line 306")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function fireEvents(_u, __wurst_stackPos419) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos419
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function eventid_toIntId(this259, __wurst_stackPos420) 
	local id5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos420
	wurst_stack_depth = (wurst_stack_depth + 1)
	id5 = intEnsure(ClosureEvents_eventidToIndex[handle_getHandleId(this259, "when calling getHandleId in ClosureEvents, line 248")])
	if (id5 == 0) then
		id5 = registerEventId(this259, "when calling registerEventId in ClosureEvents, line 250")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return id5
end

function registerEventId(evnt, __wurst_stackPos422) 
	local eventId = nil
	local i8 = nil
	local temp7 = nil
	local receiver17 = nil
	local receiver18 = nil
	local receiver19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos422
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

function unregisterEventsForUnit(u22, __wurst_stackPos426) 
	local index3 = nil
	local listener5 = nil
	local t1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos426
	wurst_stack_depth = (wurst_stack_depth + 1)
	if fireEvents(u22, "when calling fireEvents in ClosureEvents, line 279") then
		index3 = unit_getIndex(u22, "when calling getIndex in ClosureEvents, line 280")
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

function unregisterEvents(id6, __wurst_stackPos427) 
	local listener6 = nil
	local t2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos427
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

function code__onUnitDeindex_ClosureEvents(__wurst_stackPos429) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos429
	wurst_stack_depth = (wurst_stack_depth + 1)
	unregisterEventsForUnit(getIndexingUnit("when calling getIndexingUnit in ClosureEvents, line 304"), "when calling unregisterEventsForUnit in ClosureEvents, line 304")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents(__wurst_stackPos431) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos431
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 307")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_nullTimer_ClosureEvents1(__wurst_stackPos433) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos433
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_generalEventCallback("when calling generalEventCallback in ClosureEvents, line 308")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_ClosureEvents(__wurst_stackPos434) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos434
	wurst_stack_depth = (wurst_stack_depth + 1)
	EventListener_onSpellEffect("when calling onSpellEffect in ClosureEvents, line 323")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function EventListener_add(eventId1, listener7, __wurst_stackPos436) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos436
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

function EventListener_addSpellInternal(u23, abilId1, listener8, __wurst_stackPos437) 
	local index4 = nil
	local entry2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos437
	wurst_stack_depth = (wurst_stack_depth + 1)
	listener8.OnCastListener_abilId = abilId1
	if not((u23 == nil)) then
		listener8.OnCastListener_eventUnit = u23
		index4 = unit_getIndex(u23, "when calling getIndex in ClosureEvents, line 170")
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

function EventListener_onCast(abilId, listener4, __wurst_stackPos415) 
	local stackTrace_tempReturn7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos415
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn7 = EventListener_addSpellInternal(nil, abilId, listener4, "when calling addSpellInternal in ClosureEvents, line 155")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn7
end

function EventListener_onPointCast(abilId2, listener9, __wurst_stackPos438) 
	local stackTrace_tempReturn8 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos438
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn8 = __wurst_objectFromIndex(EventListener_addSpellInternal(nil, abilId2, listener9, "when calling addSpellInternal in ClosureEvents, line 164"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn8
end

function EventListener_generalEventCallback(__wurst_stackPos432) 
	local trigUnit8 = nil
	local id7 = nil
	local index5 = nil
	local listener10 = nil
	local nextListener = nil
	local globalListener = nil
	local nextListener1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos432
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit8 = GetTriggerUnit()
	id7 = eventid_toIntId(GetTriggerEventId(), "when calling toIntId in ClosureEvents, line 186")
	if not((trigUnit8 == nil)) then
		index5 = unit_getIndex(trigUnit8, "when calling getIndex in ClosureEvents, line 189")
		if (index5 > 0) then
			listener10 = EventListener_unitListenersFirsts[index5]
			if (not((listener10 == nil)) and fireEvents(trigUnit8, "when calling fireEvents in ClosureEvents, line 192")) then
				while true do
					if not(not((listener10 == nil))) then
						break
					end
					nextListener = listener10.EventListener_next
					if (listener10.EventListener_eventId == id7) then
						listener10:onEvent1("when calling onEvent in ClosureEvents, line 196")
					end
					listener10 = nextListener
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

function EventListener_onSpellEffect(__wurst_stackPos435) 
	local trigUnit9 = nil
	local abilId3 = nil
	local caster18 = nil
	local index6 = nil
	local listener11 = nil
	local nextListener2 = nil
	local nextListener3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos435
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigUnit9 = GetTriggerUnit()
	abilId3 = GetSpellAbilityId()
	caster18 = GetSpellAbilityUnit()
	index6 = unit_getIndex(trigUnit9, "when calling getIndex in ClosureEvents, line 210")
	listener11 = EventListener_castMapCasters[index6]
	while true do
		if not(not((listener11 == nil))) then
			break
		end
		nextListener2 = listener11.OnCastListener_next
		if ((listener11.OnCastListener_abilId == -1) or (listener11.OnCastListener_abilId == abilId3)) then
			listener11:fire(caster18, "when calling fire in ClosureEvents, line 215")
		end
		listener11 = nextListener2
	end
	listener11 = HashMap_HashMap_get(EventListener_castMap, abilId3, "when calling get in ClosureEvents, line 218")
	while true do
		if not(not((listener11 == nil))) then
			break
		end
		nextListener3 = listener11.OnCastListener_next
		if ((listener11.OnCastListener_eventUnit == nil) or (listener11.OnCastListener_eventUnit == trigUnit9)) then
			listener11:fire(caster18, "when calling fire in ClosureEvents, line 222")
		end
		listener11 = nextListener3
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureForGroups(__wurst_stackPos349) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos349
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

function code__Filter_ClosureForGroups(__wurst_stackPos439) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos439
	wurst_stack_depth = (wurst_stack_depth + 1)
	filterCallback(GetFilterUnit(), "when calling filterCallback in ClosureForGroups, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function filterCallback(filter4, __wurst_stackPos440) 
	local idx = nil
	local mode = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos440
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

function currentCallback(__wurst_stackPos441) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos441
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacks[(ClosureForGroups_tempCallbacksCount - 1)]
end

function currentCallbackUntil(__wurst_stackPos442) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos442
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ClosureForGroups_tempCallbacksUntil[(ClosureForGroups_tempCallbacksCount - 1)]
end

function group_forEachFrom(this264, cb15, __wurst_stackPos443) 
	local u24 = nil
	local from1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos443
	wurst_stack_depth = (wurst_stack_depth + 1)
	from1 = this264
	while true do
		if not(group_hasNext(from1, "when calling hasNext in ClosureForGroups, line 80")) then
			break
		end
		u24 = group_next(from1, "when calling next in ClosureForGroups, line 80")
		cb15:callback(u24, "when calling callback in ClosureForGroups, line 81")
	end
	ForGroupCallback_destroyForGroupCallback(cb15, "when calling destroyForGroupCallback in ClosureForGroups, line 82")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ClosureTimers(__wurst_stackPos356) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos356
	wurst_stack_depth = (wurst_stack_depth + 1)
	ClosureTimers_x = 200
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_doAfter(this265, timeToWait1, cb16, __wurst_stackPos444) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos444
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_CallbackSingle_start(cb16, this265, timeToWait1, "when calling start in ClosureTimers, line 17")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb16
end

function doAfter(timeToWait, cb3, __wurst_stackPos88) 
	local stackTrace_tempReturn9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos88
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn9 = timer_doAfter(getTimer("when calling getTimer in ClosureTimers, line 28"), timeToWait, cb3, "when calling doAfter in ClosureTimers, line 28")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn9
end

function nullTimer(cb14, __wurst_stackPos418) 
	local stackTrace_tempReturn10 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos418
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn10 = doAfter(0., cb14, "when calling doAfter in ClosureTimers, line 51")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn10
end

function timer_doPeriodically(this266, time5, cb17, __wurst_stackPos446) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos446
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackPeriodic_CallbackPeriodic_start(cb17, this266, time5, "when calling start in ClosureTimers, line 63")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return cb17
end

function doPeriodically(time4, cb2, __wurst_stackPos87) 
	local stackTrace_tempReturn11 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos87
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn11 = timer_doPeriodically(getTimer("when calling getTimer in ClosureTimers, line 75"), time4, cb2, "when calling doPeriodically in ClosureTimers, line 75")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn11
end

function CallbackPeriodic_staticCallback(__wurst_stackPos447) 
	local cb18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos447
	wurst_stack_depth = (wurst_stack_depth + 1)
	cb18 = __wurst_objectFromIndex(timer_getData(GetExpiredTimer(), "when calling getData in ClosureTimers, line 162"))
	cb18:call(cb18, "when calling call in ClosureTimers, line 163")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__start_CallbackSingle_ClosureTimers(__wurst_stackPos449) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos449
	wurst_stack_depth = (wurst_stack_depth + 1)
	CallbackSingle_staticCallback("when calling staticCallback in ClosureTimers, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function CallbackSingle_staticCallback(__wurst_stackPos450) 
	local t3 = nil
	local cb19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos450
	wurst_stack_depth = (wurst_stack_depth + 1)
	t3 = GetExpiredTimer()
	cb19 = __wurst_objectFromIndex(timer_getData(t3, "when calling getData in ClosureTimers, line 140"))
	cb19:call1("when calling call in ClosureTimers, line 141")
	CallbackSingle_destroyCallbackSingle(cb19, "when calling destroyCallbackSingle in ClosureTimers, line 142")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Colors(__wurst_stackPos341) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos341
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

function colorA_toColorString(this268, __wurst_stackPos451) 
	local stackTrace_tempReturn12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos451
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn12 = stringConcat(stringConcat(stringConcat(stringConcat("|c", toHex(this268[4], "when calling toHex in Colors, line 194")), toHex(this268[1], "when calling toHex in Colors, line 194")), toHex(this268[2], "when calling toHex in Colors, line 194")), toHex(this268[3], "when calling toHex in Colors, line 194"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn12
end

function toHex(number, __wurst_stackPos453) 
	local firstpart = nil
	local secondpart = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos453
	wurst_stack_depth = (wurst_stack_depth + 1)
	firstpart = (number // 16)
	secondpart = (number - (firstpart * 16))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stringConcat(stringEnsure(Colors_hexs[firstpart]), stringEnsure(Colors_hexs[secondpart]))
end

function initializeTable(__wurst_stackPos452) 
	local i9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos452
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

function init_ControlPoint(__wurst_stackPos377) 
	local clVar23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos377
	wurst_stack_depth = (wurst_stack_depth + 1)
	ControlPoint_controlPoints = CreateGroup()
	ControlPoint_cpOwners = HashMap_new_HashMap("when calling new_HashMap in ControlPoint, line 9")
	ControlPoint_cpValues = HashMap_new_HashMap("when calling new_HashMap in ControlPoint, line 10")
	setupAllControlPoints("when calling setupAllControlPoints in ControlPoint, line 91")
	clVar23 = CallbackSingle_doAfter_ControlPoint:create12()
	CallbackSingle_construct_CallbackSingle(clVar23, "when calling construct_CallbackSingle in ControlPoint, line 92")
	doAfter(0., clVar23, "when calling doAfter in ControlPoint, line 92")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function income(__wurst_stackPos456) 
	local iterator15 = nil
	local cp = nil
	local owner5 = nil
	local value9 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos456
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterator15 = group_iterator(ControlPoint_controlPoints, "when calling iterator in ControlPoint, line 19")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator15, "when calling hasNext in ControlPoint, line 19")) then
			break
		end
		cp = GroupIterator_GroupIterator_next(iterator15, "when calling next in ControlPoint, line 19")
		owner5 = playerFromIndex(intEnsure(HashMap_HashMap_get(ControlPoint_cpOwners, __wurst_objectToIndex(cp), "when calling get in ControlPoint, line 20")), "when calling playerFromIndex in ControlPoint, line 20")
		value9 = intEnsure(HashMap_HashMap_get(ControlPoint_cpValues, __wurst_objectToIndex(cp), "when calling get in ControlPoint, line 21"))
		player_addGold(owner5, value9, "when calling addGold in ControlPoint, line 22")
		updateMultiboard("when calling updateMultiboard in ControlPoint, line 23")
	end
	GroupIterator_GroupIterator_close(iterator15, "when calling close in ControlPoint, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function incomeTimer(__wurst_stackPos68) 
	local countdown = nil
	local d = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos68
	wurst_stack_depth = (wurst_stack_depth + 1)
	countdown = CreateTimer()
	d = timer_createTimerDialog(countdown, "when calling createTimerDialog in ControlPoint, line 28")
	__wurst_safe_TimerDialogSetTitle(d, "Income")
	__wurst_safe_TimerDialogDisplay(d, true)
	__wurst_safe_TimerStart(countdown, 60., true, function (...) 
			xpcall(function (...) 
					bridge_income(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupCaptureOnHalf(target11, __wurst_stackPos460) 
	local receiver20 = nil
	local receiver21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos460
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver20 = CreateTrigger()
	trigger_registerUnitEvent(receiver20, target11, EVENT_UNIT_DAMAGED, "when calling registerUnitEvent in ControlPoint, line 36")
	receiver21 = receiver20
	trigger_addAction(receiver21, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_ControlPoint(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in ControlPoint, line 37")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_ControlPoint(__wurst_stackPos462) 
	local u25 = nil
	local attacker = nil
	local hp = nil
	local maxHp = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos462
	wurst_stack_depth = (wurst_stack_depth + 1)
	u25 = GetTriggerUnit()
	attacker = GetEventDamageSource()
	hp = __wurst_safe_GetUnitState(u25, UNIT_STATE_LIFE)
	maxHp = __wurst_safe_GetUnitState(u25, UNIT_STATE_MAX_LIFE)
	if ((hp / maxHp) <= 0.5) then
		HashMap_HashMap_put(ControlPoint_cpOwners, __wurst_objectToIndex(u25), playerToIndex(unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 43"), "when calling playerToIndex in ControlPoint, line 43"), "when calling put in ControlPoint, line 43")
		__wurst_safe_SetUnitOwner(u25, unit_getOwner(attacker, "when calling getOwner in ControlPoint, line 44"), true)
		__wurst_safe_SetUnitState(u25, UNIT_STATE_LIFE, maxHp)
		updateMultiboard("when calling updateMultiboard in ControlPoint, line 46")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addControlPoint(cp1, value10, __wurst_stackPos464) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos464
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_HashMap_put(ControlPoint_cpValues, __wurst_objectToIndex(cp1), value10, "when calling put in ControlPoint, line 50")
	HashMap_HashMap_put(ControlPoint_cpOwners, __wurst_objectToIndex(cp1), playerToIndex(unit_getOwner(cp1, "when calling getOwner in ControlPoint, line 51"), "when calling playerToIndex in ControlPoint, line 51"), "when calling put in ControlPoint, line 51")
	group_add1(ControlPoint_controlPoints, "when calling add in ControlPoint, line 52", cp1)
	setupCaptureOnHalf(cp1, "when calling setupCaptureOnHalf in ControlPoint, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupAllControlPoints(__wurst_stackPos455) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos455
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

function init_CorruptedBlood(__wurst_stackPos378) 
	local clVar24 = nil
	local temp18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos378
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
	temp18 = CorruptedBlood_CORRUPTED_BLOOD_ID
	clVar24 = OnCastListener_onCast_CorruptedBlood:create14()
	OnCastListener_construct_OnCastListener(clVar24, "when calling construct_OnCastListener in CorruptedBlood, line 60")
	EventListener_onCast(temp18, clVar24, "when calling onCast in CorruptedBlood, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function explodeSlime(slime1, caster6, __wurst_stackPos95) 
	local pos11 = ({0., 0., })
	local sfx3 = nil
	local clVar25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos95
	wurst_stack_depth = (wurst_stack_depth + 1)
	pos11 = tupleCopy(unit_getPos(slime1, "when calling getPos in CorruptedBlood, line 45"))
	sfx3 = addEffect(CorruptedBlood_GROW_SFX, pos11, "when calling addEffect in CorruptedBlood, line 46")
	effect_setScale(sfx3, 3.0, "when calling setScale in CorruptedBlood, line 47")
	clVar25 = CallbackSingle_doAfter_CorruptedBlood:create13()
	CallbackSingle_construct_CallbackSingle(clVar25, "when calling construct_CallbackSingle in CorruptedBlood, line 49")
	clVar25.sfx = sfx3
	clVar25.pos = tupleCopy(pos11)
	clVar25.caster = caster6
	clVar25.slime = slime1
	doAfter(0.5, clVar25, "when calling doAfter in CorruptedBlood, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_CustomIcons(__wurst_stackPos379) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos379
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DamageEvent(__wurst_stackPos380) 
	local clVar26 = nil
	local clVar27 = nil
	local temp19 = nil
	local temp20 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos380
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
	temp19 = EVENT_PLAYER_UNIT_DAMAGING
	clVar26 = EventListener_add_DamageEvent:create17()
	EventListener_construct_EventListener(clVar26, "when calling construct_EventListener in DamageEvent, line 476")
	EventListener_add(temp19, clVar26, "when calling add in DamageEvent, line 476")
	temp20 = EVENT_PLAYER_UNIT_DAMAGED
	clVar27 = EventListener_add_DamageEvent1:create18()
	EventListener_construct_EventListener(clVar27, "when calling construct_EventListener in DamageEvent, line 477")
	EventListener_add(temp20, clVar27, "when calling add in DamageEvent, line 477")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onUnreducedDamage(__wurst_stackPos98) 
	local amount2 = nil
	local attackType1 = nil
	local dmg = nil
	local i10 = nil
	local temp8 = nil
	local listener12 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos98
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
		listener12 = DamageEvent_firstUnreducedListeners[i10]
		while true do
			if not(not((listener12 == nil))) then
				break
			end
			listener12:onEvent("when calling onEvent in DamageEvent, line 205")
			if DamageEvent_abort then
				dmg.DamageInstance_amount = 0.
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
	__wurst_safe_BlzSetEventAttackType(dmg.DamageInstance_nativeAttackType)
	__wurst_safe_BlzSetEventDamageType(dmg.DamageInstance_nativeDamageType)
	__wurst_safe_BlzSetEventWeaponType(dmg.DamageInstance_nativeWeaponType)
	BlzSetEventDamage(dmg.DamageInstance_amount)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function DamageEvent_onDamage(__wurst_stackPos100) 
	local dmg1 = nil
	local i11 = nil
	local temp9 = nil
	local listener13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos100
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
			listener13 = DamageEvent_firstListeners[i11]
			while true do
				if not(not((listener13 == nil))) then
					break
				end
				listener13:onEvent("when calling onEvent in DamageEvent, line 226")
				if DamageEvent_abort then
					dmg1.DamageInstance_amount = 0.
					if true then
						break
					end
				else
					listener13 = listener13.DamageListener_next
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

function DamageEvent_addListener(listener14, __wurst_stackPos466) 
	local stackTrace_tempReturn13 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos466
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn13 = DamageEvent_addListener1(DamageEvent_maxPriority, listener14, "when calling addListener in DamageEvent, line 248")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn13
end

function DamageEvent_addListener1(priority, listener15, __wurst_stackPos467) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos467
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not((DamageEvent_firstListeners[priority] == nil)) then
		listener15.DamageListener_next = DamageEvent_firstListeners[priority]
	end
	DamageEvent_firstListeners[priority] = listener15
	if (DamageEvent_maxPriority < priority) then
		DamageEvent_maxPriority = priority
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return listener15
end

function DamageEvent_getSource(__wurst_stackPos468) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos468
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_source
end

function DamageEvent_getTarget(__wurst_stackPos469) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos469
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return DamageInstance_current.DamageInstance_target
end

function init_Destructable(__wurst_stackPos329) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos329
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Dive(__wurst_stackPos381) 
	local clVar28 = nil
	local temp21 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos381
	wurst_stack_depth = (wurst_stack_depth + 1)
	Dive_CROW_TACKLE_ID = intEnsure(1095577706)
	Dive_TACKLE_DAMAGE = 200.
	Dive_DASH_SPEED = 1200.
	Dive_UPDATE_INTERVAL = 0.05
	Dive_DASH_SFX = "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl"
	Dive_IMPACT_SFX = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"
	temp21 = Dive_CROW_TACKLE_ID
	clVar28 = OnCastListener_onCast_Dive:create22()
	OnCastListener_construct_OnCastListener(clVar28, "when calling construct_OnCastListener in Dive, line 52")
	EventListener_onCast(temp21, clVar28, "when calling onCast in Dive, line 52")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DryadCasterMain(__wurst_stackPos383) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos383
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_DummyRecycler(__wurst_stackPos384) 
	local i12 = nil
	local temp10 = nil
	local facing2 = ({0., })
	local j = nil
	local temp11 = nil
	local dummy = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos384
	wurst_stack_depth = (wurst_stack_depth + 1)
	DummyRecycler_DUMMY_UNIT_ID = intEnsure(2016423988)
	DummyRecycler_ROOT_ENABLER = intEnsure(1095577710)
	intEnsure(1095577711)
	DummyRecycler_DIFFERENT_ANGLES = 8
	DummyRecycler_ANGLE_DEGREE = ((360 * 1.) / DummyRecycler_DIFFERENT_ANGLES)
	DummyRecycler_SAVED_UNITS_PER_ANGLE = 6
	realToIndex(1., "when calling realToIndex in DummyRecycler, line 77")
	i12 = 0
	temp10 = (DummyRecycler_DIFFERENT_ANGLES - 1)
	while true do
		if (i12 > temp10) then
			break
		end
		DummyRecycler_angleQueues[i12] = LinkedList_new_LinkedList("when calling new_LinkedList in DummyRecycler, line 79")
		facing2 = ({(i12 * DummyRecycler_ANGLE_DEGREE), })
		j = 0
		temp11 = (DummyRecycler_SAVED_UNITS_PER_ANGLE - 1)
		while true do
			if (j > temp11) then
				break
			end
			dummy = createDummy(vec2_op_minus(MapBounds_boundMax, ({16., 16., }), "when calling op_minus in DummyRecycler, line 82"), facing2, "when calling createDummy in DummyRecycler, line 82")
			LinkedList_LinkedList_enqueue(DummyRecycler_angleQueues[i12], __wurst_objectToIndex(dummy), "when calling enqueue in DummyRecycler, line 83")
			j = (j + 1)
		end
		i12 = (i12 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createDummy(pos12, facing3, __wurst_stackPos471) 
	local u26 = nil
	local receiver22 = nil
	local receiver23 = nil
	local receiver24 = nil
	local receiver25 = nil
	local receiver26 = nil
	local receiver27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos471
	wurst_stack_depth = (wurst_stack_depth + 1)
	u26 = createUnit(Basics_DUMMY_PLAYER, DummyRecycler_DUMMY_UNIT_ID, pos12, facing3, "when calling createUnit in DummyRecycler, line 69")
	receiver22 = u26
	unit_addAbility(receiver22, Basics_HEIGHT_ENABLER, "when calling addAbility in DummyRecycler, line 70")
	receiver23 = receiver22
	unit_removeAbility(receiver23, Basics_HEIGHT_ENABLER, "when calling removeAbility in DummyRecycler, line 70")
	receiver24 = receiver23
	unit_addAbility(receiver24, DummyRecycler_ROOT_ENABLER, "when calling addAbility in DummyRecycler, line 71")
	receiver25 = receiver24
	unit_removeAbility(receiver25, DummyRecycler_ROOT_ENABLER, "when calling removeAbility in DummyRecycler, line 71")
	receiver26 = receiver25
	unit_setXY(receiver26, pos12, "when calling setXY in DummyRecycler, line 72")
	receiver27 = receiver26
	unit_setFacing(receiver27, facing3, "when calling setFacing in DummyRecycler, line 72")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return u26
end

function effect_destr(this13, __wurst_stackPos14) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos14
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyEffect(this13)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect1(path1, pos2, __wurst_stackPos72) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos72
	wurst_stack_depth = (wurst_stack_depth + 1)
	flashEffect2(path1, pos2, 1.0, real_fromDeg(GetRandomReal(0., 359.), "when calling fromDeg in Effect, line 14"), "when calling flashEffect in Effect, line 14")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect2(path4, pos13, scale2, yaw, __wurst_stackPos474) 
	local receiver28 = nil
	local receiver29 = nil
	local receiver30 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos474
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver28 = addEffect(path4, pos13, "when calling addEffect in Effect, line 23")
	effect_setScale(receiver28, scale2, "when calling setScale in Effect, line 23")
	receiver29 = receiver28
	effect_setYaw(receiver29, yaw, "when calling setYaw in Effect, line 23")
	receiver30 = receiver29
	effect_destr(receiver30, "when calling destr in Effect, line 23")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect(path2, pos4, __wurst_stackPos86) 
	local stackTrace_tempReturn14 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos86
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn14 = AddSpecialEffect(path2, pos4[1], pos4[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn14
end

function effect_setScale(this66, scale, __wurst_stackPos77) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos77
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectScale(this66, scale)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_setYaw(this276, yaw1, __wurst_stackPos475) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos475
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectYaw(this276, angle_radians(yaw1, "when calling radians in Effect, line 171"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function flashEffect(path, target, attachPointName, __wurst_stackPos9) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos9
	wurst_stack_depth = (wurst_stack_depth + 1)
	effect_destr(addEffect1(path, target, attachPointName, "when calling addEffect in Effect, line 29"), "when calling destr in Effect, line 29")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function addEffect1(path3, target7, attachPointName1, __wurst_stackPos148) 
	local stackTrace_tempReturn15 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos148
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn15 = __wurst_safe_AddSpecialEffectTarget(path3, target7, attachPointName1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn15
end

function effect_setColor(this67, r, g, b, __wurst_stackPos78) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos78
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectColor(this67, r, g, b)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function effect_setPos(this78, pos6, __wurst_stackPos94) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos94
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetSpecialEffectPosition(this78, pos6[1], pos6[2], __wurst_safe_BlzGetLocalSpecialEffectZ(this78))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ErrorHandling(__wurst_stackPos335) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos335
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
	local temp23 = nil
	local temp24 = nil
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
					temp23 = msg
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
					Log_error(stringConcat(temp23, stacktraceStr), "when calling error in ErrorHandling, line 58")
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
				temp24 = stringConcat("Message: ", msg)
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
				Log_error(stringConcat(temp24, stacktraceStr1), "when calling error in ErrorHandling, line 70")
			end
		end
		ErrorHandling_lastError = msg
		error("__wurst_abort_thread", 0)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_EventHelper(__wurst_stackPos348) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos348
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 6")
	HashMap_new_HashMap("when calling new_HashMap in EventHelper, line 7")
	Table_new_Table("when calling new_Table in EventHelper, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function eventid_isPlayerunitEvent(this261, __wurst_stackPos423) 
	local eventId2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos423
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId2 = handle_getHandleId(this261, "when calling getHandleId in EventHelper, line 53")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((((eventId2 >= 18) and (eventId2 <= 51)) or ((eventId2 >= 269) and (eventId2 <= 277))) or (eventId2 == 315)) or (eventId2 == 308))
end

function eventid_isKeyboardEvent(this262, __wurst_stackPos424) 
	local eventId3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos424
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId3 = handle_getHandleId(this262, "when calling getHandleId in EventHelper, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (((eventId3 >= 261) and (eventId3 <= 268)) or (eventId3 == 17))
end

function eventid_isMouseEvent(this263, __wurst_stackPos425) 
	local eventId4 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos425
	wurst_stack_depth = (wurst_stack_depth + 1)
	eventId4 = handle_getHandleId(this263, "when calling getHandleId in EventHelper, line 61")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((eventId4 >= 305) and (eventId4 <= 307))
end

function EventData_getTriggerUnit(__wurst_stackPos205) 
	local stackTrace_tempReturn16 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos205
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn16 = GetTriggerUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn16
end

function EventData_getDyingUnit(__wurst_stackPos217) 
	local stackTrace_tempReturn17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos217
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn17 = GetDyingUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn17
end

function EventData_getTrainedUnit(__wurst_stackPos139) 
	local stackTrace_tempReturn18 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos139
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn18 = GetTrainedUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn18
end

function EventData_getSpellTargetUnit(__wurst_stackPos22) 
	local stackTrace_tempReturn19 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos22
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn19 = GetSpellTargetUnit()
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn19
end

function EventData_getAbilityTargetPos(__wurst_stackPos481) 
	local stackTrace_tempReturn20 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos481
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn20 = ({GetSpellTargetX(), GetSpellTargetY(), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn20
end

function EventData_getSpellTargetPos(__wurst_stackPos45) 
	local stackTrace_tempReturn21 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos45
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn21 = tupleCopy(EventData_getAbilityTargetPos("when calling getAbilityTargetPos in EventHelper, line 384"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn21
end

function init_Execute(__wurst_stackPos385) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos385
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_executeForce = CreateForce()
	force_addPlayer(Execute_executeForce, Player_localPlayer, "when calling addPlayer in Execute, line 15")
	Execute_tempCallbacksCount = 0
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function executeCurrentCallback(__wurst_stackPos483) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos483
	wurst_stack_depth = (wurst_stack_depth + 1)
	ErrorHandling_lastError = ""
	getCurrentCallback("when calling getCurrentCallback in Execute, line 19"):run("when calling run in Execute, line 19")
	setCurrentCallbackSuccess(true, "when calling setCurrentCallbackSuccess in Execute, line 20")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getCurrentCallback(__wurst_stackPos484) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos484
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Execute_tempCallbacks[(Execute_tempCallbacksCount - 1)]
end

function setCurrentCallbackSuccess(value12, __wurst_stackPos485) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos485
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksSuccess[(Execute_tempCallbacksCount - 1)] = value12
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushCallback(c1, __wurst_stackPos486) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos486
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacks[Execute_tempCallbacksCount] = c1
	Execute_tempCallbacksSuccess[Execute_tempCallbacksCount] = false
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popCallback(__wurst_stackPos487) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos487
	wurst_stack_depth = (wurst_stack_depth + 1)
	Execute_tempCallbacksCount = (Execute_tempCallbacksCount - 1)
	ForForceCallback_destroyForForceCallback(Execute_tempCallbacks[Execute_tempCallbacksCount], "when calling destroyForForceCallback in Execute, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function isLastCallbackSuccessful(__wurst_stackPos488) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos488
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return boolEnsure(Execute_tempCallbacksSuccess[Execute_tempCallbacksCount])
end

function execute(c2, __wurst_stackPos489) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos489
	wurst_stack_depth = (wurst_stack_depth + 1)
	if not(try(c2, "when calling try in Execute, line 78")) then
		error1(stringConcat("execute: thread has crashed. caused by:\n| - ", ErrorHandling_lastError), "when calling error in Execute, line 79")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function try(c3, __wurst_stackPos490) 
	local suppressErrors = nil
	local stackTrace_tempReturn22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos490
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
	stackTrace_tempReturn22 = isLastCallbackSuccessful("when calling isLastCallbackSuccessful in Execute, line 102")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn22
end

function init_Force(__wurst_stackPos339) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos339
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_addPlayer(this280, whichPlayer9, __wurst_stackPos482) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos482
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_ForceAddPlayer(this280, whichPlayer9)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function force_forEach(this281, callback, __wurst_stackPos491) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos491
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_ForForce(this281, callback)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Framehandle(__wurst_stackPos342) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos342
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GameTimer(__wurst_stackPos334) 
	local receiver31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos334
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver31 = CreateTimer()
	timer_start(receiver31, 100000., nil, "when calling start in GameTimer, line 7")
	timer_startPeriodic(CreateTimer(), Basics_ANIMATION_PERIOD, function (...) 
			xpcall(function (...) 
					bridge_code__startPeriodic_GameTimer(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling startPeriodic in GameTimer, line 15")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__startPeriodic_GameTimer(__wurst_stackPos492) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos492
	wurst_stack_depth = (wurst_stack_depth + 1)
	GameTimer_currentTime = (GameTimer_currentTime + Basics_ANIMATION_PERIOD)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GlaiveThrow(__wurst_stackPos386) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos386
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1095577709)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Group(__wurst_stackPos343) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos343
	wurst_stack_depth = (wurst_stack_depth + 1)
	Group_ENUM_GROUP = CreateGroup()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_GroupUtils(__wurst_stackPos387) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos387
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

function createGroups(number1, __wurst_stackPos494) 
	local maxCreatePerCycle = nil
	local actualLimit = nil
	local numTarget = nil
	local overflow = nil
	local toCreate = nil
	local createNow = nil
	local clVar29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos494
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
		clVar29 = ForForceCallback_execute_GroupUtils:create25()
		clVar29.createNow = createNow
		execute(clVar29, "when calling execute in GroupUtils, line 90")
	end
	if ((GroupUtils_numTotal >= GroupUtils_GROUP_NUMBER_LIMIT) and not(GroupUtils_shownMaxError)) then
		Log_warn(stringConcat(stringConcat(stringConcat("Maximum number of GroupUtils groups (", int_toString(GroupUtils_GROUP_NUMBER_LIMIT, "when calling toString in GroupUtils, line 96")), ") created. "), "All newly created groups will be non-recyclable."), "when calling warn in GroupUtils, line 96")
		GroupUtils_shownMaxError = true
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function push(g2, __wurst_stackPos118) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos118
	wurst_stack_depth = (wurst_stack_depth + 1)
	GroupUtils_stack[GroupUtils_numStack] = g2
	HashMap_HashMap_put(GroupUtils_used, __wurst_objectToIndex(GroupUtils_stack[GroupUtils_numStack]), booleanToIndex(false, "when calling booleanToIndex in GroupUtils, line 118"), "when calling put in GroupUtils, line 118")
	GroupUtils_numStack = (GroupUtils_numStack + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initialize(__wurst_stackPos493) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos493
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

function group_enumUnitsInRect1(this135, rec1, __wurst_stackPos157) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos157
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_enumUnitsInRect(this135, rec1, nil, "when calling enumUnitsInRect in Group, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsInRect(this16, rec, filter1, __wurst_stackPos17) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos17
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsInRect(this16, rec, filter1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_enumUnitsOfType(this282, id8, filter7, __wurst_stackPos498) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos498
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupEnumUnitsOfType(this282, UnitId2String(id8), filter7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add(this105, __wurst_stackPos125, ...) 
	local i13 = nil
	local g5 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos125
	wurst_stack_depth = (wurst_stack_depth + 1)
	i13 = 0
	local __args1 = table.pack(...)
	for i14=1,__args1.n do
	g5 = __args1[i14]
	i13 = (i13 + __wurst_safe_BlzGroupAddGroupFast(g5, this105))
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i13
end

function group_clear(this107, __wurst_stackPos127) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos127
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_GroupClear(this107)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_add1(this273, __wurst_stackPos465, ...) 
	local i15 = nil
	local u27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos465
	wurst_stack_depth = (wurst_stack_depth + 1)
	i15 = 0
	local __args2 = table.pack(...)
	for i16=1,__args2.n do
	u27 = __args2[i16]
	if __wurst_safe_GroupAddUnit(this273, u27) then
		i15 = (i15 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i15
end

function group_remove(this283, __wurst_stackPos499, ...) 
	local i17 = nil
	local u28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos499
	wurst_stack_depth = (wurst_stack_depth + 1)
	i17 = 0
	local __args3 = table.pack(...)
	for i18=1,__args3.n do
	u28 = __args3[i18]
	if __wurst_safe_GroupRemoveUnit(this283, u28) then
		i17 = (i17 + 1)
	end
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return i17
end

function group_destr(this108, __wurst_stackPos128) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos128
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DestroyGroup(this108)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function group_size(this106, __wurst_stackPos126) 
	local stackTrace_tempReturn23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos126
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn23 = __wurst_safe_BlzGroupGetSize(this106)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn23
end

function group_isEmpty(this284, __wurst_stackPos500) 
	local stackTrace_tempReturn24 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos500
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn24 = not(group_hasNext(this284, "when calling hasNext in Group, line 70"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn24
end

function group_hasNext(this136, __wurst_stackPos158) 
	local stackTrace_tempReturn25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos158
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn25 = not((__wurst_safe_FirstOfGroup(this136) == nil))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn25
end

function group_get(this99, index1, __wurst_stackPos119) 
	local stackTrace_tempReturn26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos119
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn26 = __wurst_safe_BlzGroupUnitAt(this99, index1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn26
end

function group_iterator(this2, __wurst_stackPos2) 
	local stackTrace_tempReturn27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos2
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn27 = GroupIterator_new_GroupIterator(this2, "when calling new_GroupIterator in Group, line 141")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn27
end

function group_next(this137, __wurst_stackPos159) 
	local iterUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos159
	wurst_stack_depth = (wurst_stack_depth + 1)
	iterUnit = __wurst_safe_FirstOfGroup(this137)
	__wurst_safe_GroupRemoveUnit(this137, iterUnit)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return iterUnit
end

function init_HashList(__wurst_stackPos347) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos347
	wurst_stack_depth = (wurst_stack_depth + 1)
	HashList_ht = hashtable_compiletime
	HashList_occurences = hashtable_compiletime1
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_hasBoolean(this278, parentKey21, childKey11, __wurst_stackPos479) 
	local stackTrace_tempReturn28 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos479
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn28 = __wurst_HaveSavedBoolean(this278, parentKey21, childKey11)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn28
end

function hashtable_hasInt(this212, parentKey4, childKey, __wurst_stackPos245) 
	local stackTrace_tempReturn29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos245
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn29 = __wurst_HaveSavedInteger(this212, parentKey4, childKey)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn29
end

function hashtable_hasString(this214, parentKey6, childKey1, __wurst_stackPos247) 
	local stackTrace_tempReturn30 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos247
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn30 = __wurst_HaveSavedString(this214, parentKey6, childKey1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn30
end

function hashtable_loadBoolean(this279, parentKey22, childKey12, __wurst_stackPos480) 
	local stackTrace_tempReturn31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos480
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn31 = __wurst_LoadBoolean(this279, parentKey22, childKey12)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn31
end

function hashtable_loadInt(this215, parentKey8, childKey3, __wurst_stackPos248) 
	local stackTrace_tempReturn32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos248
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn32 = __wurst_LoadInteger(this215, parentKey8, childKey3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn32
end

function hashtable_loadString(this218, parentKey11, childKey5, __wurst_stackPos251) 
	local stackTrace_tempReturn33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos251
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn33 = __wurst_LoadStr(this218, parentKey11, childKey5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn33
end

function hashtable_loadTriggerHandle(this224, parentKey17, childKey8, __wurst_stackPos257) 
	local stackTrace_tempReturn34 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos257
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn34 = __wurst_LoadTriggerHandle(this224, parentKey17, childKey8)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn34
end

function hashtable_loadUnitHandle(this222, parentKey15, childKey7, __wurst_stackPos255) 
	local stackTrace_tempReturn35 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos255
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn35 = __wurst_LoadUnitHandle(this222, parentKey15, childKey7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn35
end

function hashtable_saveBoolean(this277, parentKey20, childKey10, value11, __wurst_stackPos478) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos478
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveBoolean(this277, parentKey20, childKey10, value11)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveFogStateHandle(this226, parentKey19, childKey9, value7, __wurst_stackPos259) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos259
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveFogStateHandle(this226, parentKey19, childKey9, value7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveInt(this216, parentKey9, childKey4, value3, __wurst_stackPos249) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos249
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveInteger(this216, parentKey9, childKey4, value3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function hashtable_saveString(this220, parentKey13, childKey6, value5, __wurst_stackPos253) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos253
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_SaveStr(this220, parentKey13, childKey6, value5)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_HeroTrainer(__wurst_stackPos388) 
	local clVar30 = nil
	local temp25 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos388
	wurst_stack_depth = (wurst_stack_depth + 1)
	HeroTrainer_TAVERN_ID = 1848651827
	temp25 = EVENT_PLAYER_UNIT_TRAIN_FINISH
	clVar30 = EventListener_add_HeroTrainer:create28()
	EventListener_construct_EventListener(clVar30, "when calling construct_EventListener in HeroTrainer, line 9")
	EventListener_add(temp25, clVar30, "when calling add in HeroTrainer, line 9")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Hibernate(__wurst_stackPos389) 
	local clVar31 = nil
	local temp26 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos389
	wurst_stack_depth = (wurst_stack_depth + 1)
	Hibernate_HIBERNATE_ID = intEnsure(1095577697)
	Hibernate_HIBERNATE_BUFF_ID = intEnsure(1112354868)
	Hibernate_HIBERNATE_DURATION = 4.
	Hibernate_HEAL_INTERVAL = 0.1
	Hibernate_ARMOR_BONUS = 20.
	Hibernate_HP_PCT[0] = 0.30
	Hibernate_HP_PCT[1] = 0.40
	Hibernate_HP_PCT[2] = 0.50
	Hibernate_HP_FLAT[0] = 125.
	Hibernate_HP_FLAT[1] = 175.
	Hibernate_HP_FLAT[2] = 250.
	temp26 = Hibernate_HIBERNATE_ID
	clVar31 = OnCastListener_onCast_Hibernate:create29()
	OnCastListener_construct_OnCastListener(clVar31, "when calling construct_OnCastListener in Hibernate, line 65")
	EventListener_onCast(temp26, clVar31, "when calling onCast in Hibernate, line 65")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Icons(__wurst_stackPos354) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos354
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_InitFocusCamera(__wurst_stackPos390) 
	local clVar32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos390
	wurst_stack_depth = (wurst_stack_depth + 1)
	clVar32 = CallbackSingle_doAfter_InitFocusCamera:create32()
	CallbackSingle_construct_CallbackSingle(clVar32, "when calling construct_CallbackSingle in InitFocusCamera, line 6")
	doAfter(0.0, clVar32, "when calling doAfter in InitFocusCamera, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_InstantDummyCaster(__wurst_stackPos391) 
	local receiver32 = nil
	local receiver33 = nil
	local receiver34 = nil
	local receiver35 = nil
	local receiver36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos391
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_DUMMY_CASTER_UNIT_ID = intEnsure(2016423985)
	InstantDummyCaster_DUMMY_ROOT_ABIL_ID = intEnsure(1095577651)
	receiver32 = createUnit(Basics_DUMMY_PLAYER, InstantDummyCaster_DUMMY_CASTER_UNIT_ID, MapBounds_boundMax, ({0., }), "when calling createUnit in InstantDummyCaster, line 97")
	unit_setPathing(receiver32, false, "when calling setPathing in InstantDummyCaster, line 98")
	receiver33 = receiver32
	unit_addAbility(receiver33, Basics_HEIGHT_ENABLER, "when calling addAbility in InstantDummyCaster, line 98")
	receiver34 = receiver33
	unit_removeAbility(receiver34, Basics_HEIGHT_ENABLER, "when calling removeAbility in InstantDummyCaster, line 98")
	receiver35 = receiver34
	unit_addAbility(receiver35, InstantDummyCaster_DUMMY_ROOT_ABIL_ID, "when calling addAbility in InstantDummyCaster, line 98")
	receiver36 = receiver35
	unit_removeAbility(receiver36, InstantDummyCaster_DUMMY_ROOT_ABIL_ID, "when calling removeAbility in InstantDummyCaster, line 98")
	InstantDummyCaster_caster = receiver36
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_prepare(owner6, id9, lvl1, pos14, __wurst_stackPos501) 
	local receiver37 = nil
	local receiver38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos501
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver37 = InstantDummyCaster_caster
	unit_addAbility(receiver37, id9, "when calling addAbility in InstantDummyCaster, line 27")
	receiver38 = receiver37
	unit_setMana(receiver38, 1000000., "when calling setMana in InstantDummyCaster, line 27")
	if vec3_inBounds(pos14, "when calling inBounds in InstantDummyCaster, line 28") then
		unit_setXYZ(InstantDummyCaster_caster, pos14, "when calling setXYZ in InstantDummyCaster, line 29")
	end
	if (lvl1 > 1) then
		unit_setAbilityLevel(InstantDummyCaster_caster, id9, lvl1, "when calling setAbilityLevel in InstantDummyCaster, line 31")
	end
	if not((owner6 == nil)) then
		unit_setOwner(InstantDummyCaster_caster, owner6, false, "when calling setOwner in InstantDummyCaster, line 33")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_finish(id10, __wurst_stackPos506) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos506
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setOwner(InstantDummyCaster_caster, Basics_DUMMY_PLAYER, false, "when calling setOwner in InstantDummyCaster, line 36")
	unit_removeAbility(InstantDummyCaster_caster, id10, "when calling removeAbility in InstantDummyCaster, line 37")
	unit_setPos(InstantDummyCaster_caster, MapBounds_boundMax, "when calling setPos in InstantDummyCaster, line 38")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function InstantDummyCaster_castTarget1(owner7, abilityId3, lvl3, orderId1, target12, casterPos3, __wurst_stackPos508) 
	local success = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos508
	wurst_stack_depth = (wurst_stack_depth + 1)
	InstantDummyCaster_prepare(owner7, abilityId3, lvl3, casterPos3, "when calling prepare in InstantDummyCaster, line 47")
	unit_setFacing(InstantDummyCaster_caster, vec2_angleTo(unit_getPos(InstantDummyCaster_caster, "when calling getPos in InstantDummyCaster, line 48"), widget_getPos(target12, "when calling getPos in InstantDummyCaster, line 48"), "when calling angleTo in InstantDummyCaster, line 48"), "when calling setFacing in InstantDummyCaster, line 48")
	success = unit_issueTargetOrderById(InstantDummyCaster_caster, orderId1, target12, "when calling issueTargetOrderById in InstantDummyCaster, line 49")
	InstantDummyCaster_finish(abilityId3, "when calling finish in InstantDummyCaster, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return success
end

function InstantDummyCaster_castTarget(owner2, abilityId2, lvl, orderId, target9, __wurst_stackPos199) 
	local stackTrace_tempReturn36 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos199
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn36 = InstantDummyCaster_castTarget1(owner2, abilityId2, lvl, orderId, target9, vec2_toVec3(({__wurst_safe_GetWidgetX(target9), __wurst_safe_GetWidgetY(target9), }), "when calling toVec3 in InstantDummyCaster, line 62"), "when calling castTarget in InstantDummyCaster, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn36
end

function init_Integer(__wurst_stackPos323) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos323
	wurst_stack_depth = (wurst_stack_depth + 1)
	Integer_INT_MAX = 2147483647
	Integer_INT_MIN = -2147483648
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function int_toReal(this201, __wurst_stackPos234) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos234
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this201 * 1.)
end

function int_toString(this138, __wurst_stackPos160) 
	local stackTrace_tempReturn37 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos160
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn37 = tostring(this138)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn37
end

function int_bitOr(this256, other, __wurst_stackPos413) 
	local stackTrace_tempReturn38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos413
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn38 = BlzBitOr(this256, other)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn38
end

function int_bitXor(this257, other1, __wurst_stackPos414) 
	local stackTrace_tempReturn39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos414
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn39 = BlzBitXor(this257, other1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn39
end

function init_Invigorate(__wurst_stackPos368) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos368
	wurst_stack_depth = (wurst_stack_depth + 1)
	Invigorate_seedlingCount = 0
	Invigorate_INVIGORATE_ID = intEnsure(1095577654)
	Invigorate_INVIGORATE_BUFF_ID = intEnsure(1112354867)
	Invigorate_MAX_SEEDLING_STACKS = 5
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getSeedlingCount(__wurst_stackPos228) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos228
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Invigorate_seedlingCount
end

function addSeedlingStack(__wurst_stackPos23) 
	local clVar33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos23
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Invigorate_seedlingCount >= Invigorate_MAX_SEEDLING_STACKS) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return 
	end
	Invigorate_seedlingCount = (Invigorate_seedlingCount + 1)
	clVar33 = CallbackSingle_doAfter_Invigorate:create33()
	CallbackSingle_construct_CallbackSingle(clVar33, "when calling construct_CallbackSingle in Invigorate, line 37")
	doAfter(12., clVar33, "when calling doAfter in Invigorate, line 37")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Isolation(__wurst_stackPos393) 
	local clVar34 = nil
	local temp27 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos393
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1095577653)
	Isolation_ISOLATION_BUFF_ID = intEnsure(1112354866)
	Isolation_ISOLATION_DAMAGE = 15.
	Isolation_ISOLATION_PERIOD = 1.
	temp27 = Isolation_ISOLATION_PERIOD
	clVar34 = CallbackPeriodic_doPeriodically_Isolation:create34()
	CallbackPeriodic_construct_CallbackPeriodic(clVar34, "when calling construct_CallbackPeriodic in Isolation, line 68")
	doPeriodically(temp27, clVar34, "when calling doPeriodically in Isolation, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ItemIds(__wurst_stackPos373) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos373
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createItem(itemId, pos17, __wurst_stackPos512) 
	local stackTrace_tempReturn40 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos512
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn40 = createItem1(itemId, vec2_toVec3(pos17, "when calling toVec3 in Item, line 6"), "when calling createItem in Item, line 6")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn40
end

function createItem1(itemId1, pos18, __wurst_stackPos513) 
	local stackTrace_tempReturn41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos513
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn41 = CreateItem(itemId1, pos18[1], pos18[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn41
end

function item_setCharges(this197, charges, __wurst_stackPos227) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos227
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetItemCharges(this197, charges)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Lightning(__wurst_stackPos344) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos344
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_LinkedList(__wurst_stackPos350) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos350
	wurst_stack_depth = (wurst_stack_depth + 1)
	realToIndex(0., "when calling realToIndex in LinkedList, line 617")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MagicFunctions(__wurst_stackPos332) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos332
	wurst_stack_depth = (wurst_stack_depth + 1)
	MagicFunctions_compiletime = false
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function compileError(msg3, __wurst_stackPos476) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos476
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MapBounds(__wurst_stackPos358) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos358
	wurst_stack_depth = (wurst_stack_depth + 1)
	initMapBounds("when calling initMapBounds in MapBounds, line 60")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function inBoundsXY(x5, y4, __wurst_stackPos515) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos515
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ((((x5 > MapBounds_boundMin[1]) and (x5 < MapBounds_boundMax[1])) and (y4 > MapBounds_boundMin[2])) and (y4 < MapBounds_boundMax[2]))
end

function vec3_inBounds(this286, __wurst_stackPos503) 
	local stackTrace_tempReturn42 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos503
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn42 = inBoundsXY(this286[1], this286[2], "when calling inBoundsXY in MapBounds, line 40")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn42
end

function initMapBounds(__wurst_stackPos514) 
	local cond_result1 = nil
	local receiver39 = nil
	local cond_result2 = nil
	local receiver40 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos514
	wurst_stack_depth = (wurst_stack_depth + 1)
	if MagicFunctions_compiletime then
		cond_result1 = Rect(-1024., -1024., 1024., 1024.)
	else
		cond_result1 = GetPlayableMapRect()
	end
	MapBounds_playableMapRect = cond_result1
	receiver39 = CreateRegion()
	region_addRect(receiver39, MapBounds_playableMapRect, "when calling addRect in MapBounds, line 49")
	if MagicFunctions_compiletime then
		cond_result2 = Rect(-1536., -1536., 1536., 1536.)
	else
		cond_result2 = GetWorldBounds()
	end
	MapBounds_boundRect = cond_result2
	receiver40 = CreateRegion()
	region_addRect(receiver40, MapBounds_boundRect, "when calling addRect in MapBounds, line 51")
	MapBounds_boundRegion = receiver40
	MapBounds_playableMin = ({rect_getMinX(MapBounds_playableMapRect, "when calling getMinX in MapBounds, line 52"), rect_getMinY(MapBounds_playableMapRect, "when calling getMinY in MapBounds, line 52"), })
	MapBounds_playableMax = ({rect_getMaxX(MapBounds_playableMapRect, "when calling getMaxX in MapBounds, line 53"), rect_getMaxY(MapBounds_playableMapRect, "when calling getMaxY in MapBounds, line 53"), })
	MapBounds_boundMin = ({rect_getMinX(MapBounds_boundRect, "when calling getMinX in MapBounds, line 54"), rect_getMinY(MapBounds_boundRect, "when calling getMinY in MapBounds, line 54"), })
	MapBounds_boundMax = ({rect_getMaxX(MapBounds_boundRect, "when calling getMaxX in MapBounds, line 55"), rect_getMaxY(MapBounds_boundRect, "when calling getMaxY in MapBounds, line 55"), })
	vec2_op_mult(vec2_op_plus(MapBounds_playableMin, MapBounds_playableMax, "when calling op_plus in MapBounds, line 56"), .5, "when calling op_mult in MapBounds, line 56")
	vec2_op_mult(vec2_op_plus(MapBounds_boundMin, MapBounds_boundMax, "when calling op_plus in MapBounds, line 57"), .5, "when calling op_mult in MapBounds, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Maths(__wurst_stackPos326) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos326
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function max(__wurst_stackPos495, ...) 
	local maxNumber = nil
	local cond_result3 = nil
	local number2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos495
	wurst_stack_depth = (wurst_stack_depth + 1)
	maxNumber = Integer_INT_MIN
	local __args4 = table.pack(...)
	for i19=1,__args4.n do
	number2 = __args4[i19]
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

function min(__wurst_stackPos496, ...) 
	local minNumber = nil
	local cond_result4 = nil
	local number3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos496
	wurst_stack_depth = (wurst_stack_depth + 1)
	minNumber = Integer_INT_MAX
	local __args5 = table.pack(...)
	for i20=1,__args5.n do
	number3 = __args5[i20]
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

function init_Matrices(__wurst_stackPos336) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos336
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_MoonWarrior(__wurst_stackPos395) 
	local clVar35 = nil
	local temp29 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos395
	wurst_stack_depth = (wurst_stack_depth + 1)
	MoonWarrior_MOON_WARRIOR_ID = intEnsure(1095577707)
	MoonWarrior_MOON_WARRIOR_BUFF_ID = intEnsure(1112354872)
	MoonWarrior_TYRANDE_MODEL_ID = intEnsure(2016423987)
	MoonWarrior_TIGER_UNIT_ID = 1852203634
	MoonWarrior_TIGER_DURATION = 30.
	MoonWarrior_BONUS_ATTACK_SPEED = 0.50
	MoonWarrior_BONUS_DAMAGE = 40.
	MoonWarrior_DISMOUNT_SFX = "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl"
	MoonWarrior_SUMMON_SFX = "Abilities\\Spells\\NightElf\\Roar\\RoarCaster.mdl"
	print1(stringConcat("so this: ", toRawCode(MoonWarrior_TYRANDE_MODEL_ID, "when calling toRawCode in MoonWarrior, line 75")), "when calling print in MoonWarrior, line 75")
	temp29 = MoonWarrior_MOON_WARRIOR_ID
	clVar35 = OnCastListener_onCast_MoonWarrior:create40()
	OnCastListener_construct_OnCastListener(clVar35, "when calling construct_OnCastListener in MoonWarrior, line 77")
	EventListener_onCast(temp29, clVar35, "when calling onCast in MoonWarrior, line 77")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboard_getItem(this300, row, column, __wurst_stackPos524) 
	local stackTrace_tempReturn43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos524
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn43 = __wurst_safe_MultiboardGetItem(this300, row, column)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn43
end

function multiboarditem_release(this301, __wurst_stackPos525) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos525
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_MultiboardReleaseItem(this301)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboard_setItemValueColor(this302, row2, column2, r5, g6, b3, a2, __wurst_stackPos526) 
	local receiver41 = nil
	local receiver42 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos526
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver41 = multiboard_getItem(this302, row2, column2, "when calling getItem in Multiboard, line 115")
	multiboarditem_setValueColor(receiver41, r5, g6, b3, a2, "when calling setValueColor in Multiboard, line 116")
	receiver42 = receiver41
	multiboarditem_release(receiver42, "when calling release in Multiboard, line 117")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboarditem_setValueColor(this303, r6, g7, b4, a3, __wurst_stackPos527) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos527
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_MultiboardSetItemValueColor(this303, r6, g7, b4, a3)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function multiboard_setItemValueColor1(this304, row3, column3, col, __wurst_stackPos528) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos528
	wurst_stack_depth = (wurst_stack_depth + 1)
	multiboard_setItemValueColor(this304, row3, column3, col[1], col[2], col[3], col[4], "when calling setItemValueColor in Multiboard, line 120")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Nightmare(__wurst_stackPos392) 
	local clVar36 = nil
	local clVar37 = nil
	local temp30 = nil
	local temp31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos392
	wurst_stack_depth = (wurst_stack_depth + 1)
	Nightmare_NIGHTMARE_ID = intEnsure(1095577652)
	Nightmare_NIGHTMARE_BUFF_ID = intEnsure(1112354865)
	Nightmare_NIGHTMARE_RADIUS = 400.
	Nightmare_NIGHTMARE_DURATION = 10.
	Nightmare_CORRUPT_SFX = "Abilities\\Spells\\Undead\\UndeadDismember\\UndeadDismemberTarget.mdl"
	Nightmare_NIGHTMARE_SFX = "Abilities\\Spells\\Undead\\Sleep\\SleepSpecialArt.mdl"
	Nightmare_sleepingUnits = HashMap_new_HashMap("when calling new_HashMap in Nightmare, line 29")
	temp30 = Nightmare_NIGHTMARE_ID
	clVar36 = OnCastListener_onCast_Nightmare:create42()
	OnCastListener_construct_OnCastListener(clVar36, "when calling construct_OnCastListener in Nightmare, line 58")
	EventListener_onCast(temp30, clVar36, "when calling onCast in Nightmare, line 58")
	temp31 = EVENT_PLAYER_UNIT_DAMAGED
	clVar37 = EventListener_add_Nightmare:create44()
	EventListener_construct_EventListener(clVar37, "when calling construct_EventListener in Nightmare, line 94")
	EventListener_add(temp31, clVar37, "when calling add in Nightmare, line 94")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function createObjectDefinition(fileType, newId4, deriveFrom, __wurst_stackPos283) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos283
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({"", })
end

function init_ObjectIdGenerator(__wurst_stackPos360) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos360
	wurst_stack_depth = (wurst_stack_depth + 1)
	IdGenerator_new_IdGenerator(2016423984, "when calling new_IdGenerator in ObjectIdGenerator, line 6")
	IdGenerator_new_IdGenerator(1213018160, "when calling new_IdGenerator in ObjectIdGenerator, line 7")
	IdGenerator_new_IdGenerator(1095577648, "when calling new_IdGenerator in ObjectIdGenerator, line 8")
	IdGenerator_new_IdGenerator(1112354864, "when calling new_IdGenerator in ObjectIdGenerator, line 9")
	IdGenerator_new_IdGenerator(1229795376, "when calling new_IdGenerator in ObjectIdGenerator, line 10")
	IdGenerator_new_IdGenerator(1380790320, "when calling new_IdGenerator in ObjectIdGenerator, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ObjectIds(__wurst_stackPos351) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos351
	wurst_stack_depth = (wurst_stack_depth + 1)
	ObjectIds_CHARMAP = ".................................!.#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................."
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function toRawCode(value16, __wurst_stackPos523) 
	local result = nil
	local remainingValue = nil
	local byteno = nil
	local charValue = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos523
	wurst_stack_depth = (wurst_stack_depth + 1)
	result = ""
	remainingValue = value16
	byteno = 0
	while true do
		if (byteno > 3) then
			break
		end
		charValue = (math.floor)((remainingValue % 256))
		remainingValue = (remainingValue // 256)
		result = stringConcat(string_charAt(ObjectIds_CHARMAP, charValue, "when calling charAt in ObjectIds, line 20"), result)
		byteno = (byteno + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return result
end

function init_OnUnitEnterLeave(__wurst_stackPos363) 
	local i21 = nil
	local temp16 = nil
	local clVar38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos363
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_eventTrigger = CreateTrigger()
	OnUnitEnterLeave_preplacedUnits = CreateGroup()
	OnUnitEnterLeave_tempUnitsCount = 0
	OnUnitEnterLeave_ABILITY_ID = intEnsure(1095577649)
	i21 = 0
	temp16 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i21 > temp16) then
			break
		end
		player_setAbilityAvailable(Player_players[i21], OnUnitEnterLeave_ABILITY_ID, false, "when calling setAbilityAvailable in OnUnitEnterLeave, line 64")
		i21 = (i21 + 1)
	end
	clVar38 = CallbackSingle_nullTimer_OnUnitEnterLeave:create46()
	CallbackSingle_construct_CallbackSingle(clVar38, "when calling construct_CallbackSingle in OnUnitEnterLeave, line 66")
	nullTimer(clVar38, "when calling nullTimer in OnUnitEnterLeave, line 66")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function pushUnit1(u29, __wurst_stackPos531) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos531
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnits[OnUnitEnterLeave_tempUnitsCount] = u29
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit1(__wurst_stackPos532) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos532
	wurst_stack_depth = (wurst_stack_depth + 1)
	OnUnitEnterLeave_tempUnitsCount = (OnUnitEnterLeave_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function getEnterLeaveUnit(__wurst_stackPos533) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos533
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (OnUnitEnterLeave_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return OnUnitEnterLeave_tempUnits[(OnUnitEnterLeave_tempUnitsCount - 1)]
end

function onEnter(c4, __wurst_stackPos534) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos534
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(OnUnitEnterLeave_eventTrigger, __wurst_safe_Filter(c4), "when calling addCondition in OnUnitEnterLeave, line 46")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onLeave(c5, __wurst_stackPos536) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos536
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addAction(OnUnitEnterLeave_eventTrigger, c5, "when calling addAction in OnUnitEnterLeave, line 50")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function prepareUnit(u9, __wurst_stackPos212) 
	local receiver43 = nil
	local receiver44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos212
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver43 = u9
	unit_addAbility(receiver43, OnUnitEnterLeave_ABILITY_ID, "when calling addAbility in OnUnitEnterLeave, line 56")
	receiver44 = receiver43
	unit_makeAbilityPermanent(receiver44, OnUnitEnterLeave_ABILITY_ID, true, "when calling makeAbilityPermanent in OnUnitEnterLeave, line 56")
	pushUnit1(u9, "when calling pushUnit in OnUnitEnterLeave, line 57")
	trigger_evaluate(OnUnitEnterLeave_eventTrigger, "when calling evaluate in OnUnitEnterLeave, line 58")
	popUnit1("when calling popUnit in OnUnitEnterLeave, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__Filter_registerEnterRegion_nullTimer_OnUnitEnterLeave(__wurst_stackPos538) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos538
	wurst_stack_depth = (wurst_stack_depth + 1)
	prepareUnit(GetFilterUnit(), "when calling prepareUnit in OnUnitEnterLeave, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__registerPlayerUnitEvent_nullTimer_OnUnitEnterLeave(__wurst_stackPos539) 
	local leavingUnit = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos539
	wurst_stack_depth = (wurst_stack_depth + 1)
	leavingUnit = GetTriggerUnit()
	if ((unit_getAbilityLevel(leavingUnit, OnUnitEnterLeave_ABILITY_ID, "when calling getAbilityLevel in OnUnitEnterLeave, line 73") == 0) and (GetIssuedOrderId() == OrderIds_undefend)) then
		pushUnit1(leavingUnit, "when calling pushUnit in OnUnitEnterLeave, line 74")
		trigger_execute(OnUnitEnterLeave_eventTrigger, "when calling execute in OnUnitEnterLeave, line 75")
		popUnit1("when calling popUnit in OnUnitEnterLeave, line 76")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Orders(__wurst_stackPos362) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos362
	wurst_stack_depth = (wurst_stack_depth + 1)
	OrderIds_rejuvination = 852160
	OrderIds_sleep = 852227
	OrderIds_thunderbolt = 852095
	OrderIds_undefend = 852056
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Player(__wurst_stackPos330) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos330
	wurst_stack_depth = (wurst_stack_depth + 1)
	Player_localPlayer = GetLocalPlayer()
	initPlayerArray("when calling initPlayerArray in Player, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initPlayerArray(__wurst_stackPos541) 
	local i22 = nil
	local temp17 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos541
	wurst_stack_depth = (wurst_stack_depth + 1)
	i22 = 0
	temp17 = (bj_MAX_PLAYER_SLOTS - 1)
	while true do
		if (i22 > temp17) then
			break
		end
		Player_players[i22] = Player(i22)
		i22 = (i22 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setGold(this310, val3, __wurst_stackPos542) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos542
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this310, PLAYER_STATE_RESOURCE_GOLD, val3, "when calling setState in Player, line 19")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setState(this311, state, val4, __wurst_stackPos543) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos543
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this311, state, val4)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addGold(this270, val1, __wurst_stackPos458) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos458
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_addState(this270, PLAYER_STATE_RESOURCE_GOLD, val1, "when calling addState in Player, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_addState(this312, state1, val5, __wurst_stackPos544) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos544
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerState(this312, state1, (player_getState(this312, state1, "when calling getState in Player, line 31") + val5))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_setLumber(this314, val6, __wurst_stackPos546) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos546
	wurst_stack_depth = (wurst_stack_depth + 1)
	player_setState(this314, PLAYER_STATE_RESOURCE_LUMBER, val6, "when calling setState in Player, line 25")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function player_getState(this313, state2, __wurst_stackPos545) 
	local stackTrace_tempReturn44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos545
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn44 = __wurst_safe_GetPlayerState(this313, state2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn44
end

function player_getId(this315, __wurst_stackPos547) 
	local stackTrace_tempReturn45 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos547
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn45 = __wurst_safe_GetPlayerId(this315)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn45
end

function player_getName(this316, __wurst_stackPos548) 
	local stackTrace_tempReturn46 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos548
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn46 = player_getName1(this316, false, "when calling getName in Player, line 83")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn46
end

function player_getName1(this317, removeHash, __wurst_stackPos549) 
	local cond_result5 = nil
	local stackTrace_tempReturn47 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos549
	wurst_stack_depth = (wurst_stack_depth + 1)
	if removeHash then
		cond_result5 = string_substring(__wurst_safe_GetPlayerName(this317), 0, string_indexOf(__wurst_safe_GetPlayerName(this317), "#", "when calling indexOf in Player, line 87"), "when calling substring in Player, line 87")
	else
		cond_result5 = __wurst_safe_GetPlayerName(this317)
	end
	stackTrace_tempReturn47 = cond_result5
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn47
end

function player_isAllyOf(this6, p, __wurst_stackPos6) 
	local stackTrace_tempReturn48 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos6
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn48 = __wurst_safe_IsPlayerAlly(this6, p)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn48
end

function player_isEnemyOf(this62, p2, __wurst_stackPos73) 
	local stackTrace_tempReturn49 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos73
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn49 = __wurst_safe_IsPlayerEnemy(this62, p2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn49
end

function player_setAbilityAvailable(this306, abilityId4, avail, __wurst_stackPos530) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos530
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetPlayerAbilityAvailable(this306, abilityId4, avail)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Playercolor(__wurst_stackPos340) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos340
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Preloader(__wurst_stackPos359) 
	local clVar39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos359
	wurst_stack_depth = (wurst_stack_depth + 1)
	Preloader_autoFinish = true
	Preloader_dumg = CreateGroup()
	Preloader_dum = createUnit(Basics_DUMMY_PLAYER, UnitIds_shade, MapBounds_playableMin, ({0., }), "when calling createUnit in Preloader, line 53")
	unit_setInvulnerable(Preloader_dum, true, "when calling setInvulnerable in Preloader, line 54")
	if (Preloader_dum == nil) then
		error1("DUMMY_UNITID not added correctly to the map.", "when calling error in Preloader, line 56")
	end
	if Preloader_autoFinish then
		clVar39 = CallbackSingle_nullTimer_Preloader:create48()
		CallbackSingle_construct_CallbackSingle(clVar39, "when calling construct_CallbackSingle in Preloader, line 58")
		nullTimer(clVar39, "when calling nullTimer in Preloader, line 58")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function finishPreload(__wurst_stackPos215) 
	local clVar40 = nil
	local temp32 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos215
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_remove(Preloader_dum, "when calling remove in Preloader, line 47")
	temp32 = Preloader_dumg
	clVar40 = ForGroupCallback_forEachFrom_Preloader:create47()
	group_forEachFrom(temp32, clVar40, "when calling forEachFrom in Preloader, line 48")
	group_destr(Preloader_dumg, "when calling destr in Preloader, line 49")
	Preloader_dumg = nil
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Printing(__wurst_stackPos331) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos331
	wurst_stack_depth = (wurst_stack_depth + 1)
	Printing_DEBUG_LEVEL = 2
	Printing_DEBUG_MSG_DURATION = 45.
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Loglevel_getTag(this320, __wurst_stackPos552) 
	local temp22 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos552
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp22 = this320
	if (temp22 == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffADADADtrace|r"
	elseif (temp22 == 1) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cff2685DCdebug|r"
	elseif (temp22 == 2) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFFCC00info|r"
	elseif (temp22 == 3) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffF47E3Ewarning|r"
	else
		wurst_stack_depth = (wurst_stack_depth - 1)
		return "|cffFB2700error|r"
	end
end

function printLog(showTo, loglvl, msg6, __wurst_stackPos553) 
	local compositeMsg = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos553
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (Printing_DEBUG_LEVEL <= loglvl) then
		compositeMsg = stringConcat(stringConcat(Loglevel_getTag(loglvl, "when calling getTag in Printing, line 81"), " - "), msg6)
		__wurst_safe_DisplayTimedTextToPlayer(showTo, 0., 0., Printing_DEBUG_MSG_DURATION, compositeMsg)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function print1(msg1, __wurst_stackPos80) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos80
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_trace(msg2, __wurst_stackPos428) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos428
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 0, msg2, "when calling printLog in Printing, line 33")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_warn(msg5, __wurst_stackPos497) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos497
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 3, msg5, "when calling printLog in Printing, line 45")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function Log_error(msg4, __wurst_stackPos477) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos477
	wurst_stack_depth = (wurst_stack_depth + 1)
	printLog(Player_localPlayer, 4, msg4, "when calling printLog in Printing, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Quaternion(__wurst_stackPos337) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos337
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Real(__wurst_stackPos322) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos322
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function real_squared(this321, __wurst_stackPos554) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos554
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (this321 * this321)
end

function real_toInt(this171, __wurst_stackPos193) 
	local stackTrace_tempReturn50 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos193
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn50 = R2I(this171)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn50
end

function rect_getMinX(this294, __wurst_stackPos517) 
	local stackTrace_tempReturn51 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos517
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn51 = __wurst_safe_GetRectMinX(this294)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn51
end

function rect_getMaxX(this296, __wurst_stackPos519) 
	local stackTrace_tempReturn52 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos519
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn52 = __wurst_safe_GetRectMaxX(this296)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn52
end

function rect_getMinY(this295, __wurst_stackPos518) 
	local stackTrace_tempReturn53 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos518
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn53 = __wurst_safe_GetRectMinY(this295)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn53
end

function rect_getMaxY(this297, __wurst_stackPos520) 
	local stackTrace_tempReturn54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos520
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn54 = __wurst_safe_GetRectMaxY(this297)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn54
end

function init_Recycle(__wurst_stackPos396) 
	local iterator16 = nil
	local u30 = nil
	local clVar41 = nil
	local temp33 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos396
	wurst_stack_depth = (wurst_stack_depth + 1)
	Recycle_RECYCLE_ID = intEnsure(1095577703)
	group_enumUnitsOfType(Group_ENUM_GROUP, 1697656882, nil, "when calling enumUnitsOfType in Recycle, line 36")
	iterator16 = group_iterator(Group_ENUM_GROUP, "when calling iterator in Recycle, line 37")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator16, "when calling hasNext in Recycle, line 37")) then
			break
		end
		u30 = GroupIterator_GroupIterator_next(iterator16, "when calling next in Recycle, line 37")
		__wurst_safe_UnitAddAbility(u30, Recycle_RECYCLE_ID)
	end
	GroupIterator_GroupIterator_close(iterator16, "when calling close in Recycle, line 37")
	temp33 = EVENT_PLAYER_UNIT_DEATH
	clVar41 = EventListener_add_Recycle:create49()
	EventListener_construct_EventListener(clVar41, "when calling construct_EventListener in Recycle, line 41")
	EventListener_add(temp33, clVar41, "when calling add in Recycle, line 41")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function region_addRect(this293, rct, __wurst_stackPos516) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos516
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RegionAddRect(this293, rct)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_RegisterEvents(__wurst_stackPos361) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos361
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

function registerPlayerUnitEvent1(p5, c, __wurst_stackPos211) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos211
	wurst_stack_depth = (wurst_stack_depth + 1)
	registerPlayerUnitEvent(p5, nil, c, nil, "when calling registerPlayerUnitEvent in RegisterEvents, line 11")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function registerPlayerUnitEvent(p1, filter2, condition, action, __wurst_stackPos29) 
	local hid = nil
	local k = nil
	local cond_result6 = nil
	local temp34 = nil
	local temp35 = nil
	local temp36 = nil
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
			temp34 = RegisterEvents_t[hid]
			temp35 = Player_players[k]
			temp36 = p1
			if not((filter2 == nil)) then
				cond_result6 = __wurst_safe_Filter(filter2)
			else
				cond_result6 = nil
			end
			trigger_registerPlayerUnitEvent(temp34, temp35, temp36, cond_result6, "when calling registerPlayerUnitEvent in RegisterEvents, line 21")
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

function code__registerPlayerUnitEvent_RegisterEvents(__wurst_stackPos556) 
	local stackTrace_tempReturn55 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos556
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn55 = trigger_evaluate(__wurst_objectFromIndex(intEnsure(HashMap_HashMap_get(RegisterEvents_onCastMap, GetSpellAbilityId(), "when calling get in RegisterEvents, line 58"))), "when calling evaluate in RegisterEvents, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn55
end

function init_Scoreboard(__wurst_stackPos376) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos376
	wurst_stack_depth = (wurst_stack_depth + 1)
	setupPlayerColors("when calling setupPlayerColors in Scoreboard, line 135")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupPlayerColors(__wurst_stackPos557) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos557
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

function getActivePlayers(__wurst_stackPos558) 
	local count1 = nil
	local i23 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos558
	wurst_stack_depth = (wurst_stack_depth + 1)
	count1 = 0
	i23 = 0
	while true do
		if (i23 > 23) then
			break
		end
		if (__wurst_safe_GetPlayerSlotState(Player_players[i23]) == PLAYER_SLOT_STATE_PLAYING) then
			count1 = (count1 + 1)
		end
		i23 = (i23 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return count1
end

function updatePlayerIncome(__wurst_stackPos559) 
	local playerCount = nil
	local i24 = nil
	local temp28 = nil
	local iterator17 = nil
	local cp2 = nil
	local owner8 = nil
	local ownerId = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos559
	wurst_stack_depth = (wurst_stack_depth + 1)
	playerCount = getActivePlayers("when calling getActivePlayers in Scoreboard, line 50")
	i24 = 0
	temp28 = (playerCount - 1)
	while true do
		if (i24 > temp28) then
			break
		end
		ControlPoint_playerIncome[i24] = 0
		ControlPoint_playerCpCount[i24] = 0
		i24 = (i24 + 1)
	end
	iterator17 = group_iterator(ControlPoint_controlPoints, "when calling iterator in Scoreboard, line 57")
	while true do
		if not(GroupIterator_GroupIterator_hasNext(iterator17, "when calling hasNext in Scoreboard, line 57")) then
			break
		end
		cp2 = GroupIterator_GroupIterator_next(iterator17, "when calling next in Scoreboard, line 57")
		owner8 = playerFromIndex(intEnsure(HashMap_HashMap_get(ControlPoint_cpOwners, __wurst_objectToIndex(cp2), "when calling get in Scoreboard, line 58")), "when calling playerFromIndex in Scoreboard, line 58")
		ownerId = player_getId(owner8, "when calling getId in Scoreboard, line 59")
		ControlPoint_playerIncome[ownerId] = (intEnsure(ControlPoint_playerIncome[ownerId]) + intEnsure(HashMap_HashMap_get(ControlPoint_cpValues, __wurst_objectToIndex(cp2), "when calling get in Scoreboard, line 60")))
		ControlPoint_playerCpCount[ownerId] = (intEnsure(ControlPoint_playerCpCount[ownerId]) + 1)
	end
	GroupIterator_GroupIterator_close(iterator17, "when calling close in Scoreboard, line 57")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupMultiboard(__wurst_stackPos69) 
	local h0 = nil
	local h1 = nil
	local h2 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos69
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

function updateMultiboard(__wurst_stackPos70) 
	local row4 = nil
	local playerCount1 = nil
	local i25 = nil
	local temp37 = nil
	local item1 = nil
	local item2 = nil
	local item3 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos70
	wurst_stack_depth = (wurst_stack_depth + 1)
	updatePlayerIncome("when calling updatePlayerIncome in Scoreboard, line 110")
	row4 = 1
	playerCount1 = getActivePlayers("when calling getActivePlayers in Scoreboard, line 112")
	i25 = 0
	temp37 = (playerCount1 - 1)
	while true do
		if (i25 > temp37) then
			break
		end
		if (__wurst_safe_GetPlayerSlotState(Player_players[i25]) == PLAYER_SLOT_STATE_PLAYING) then
			item1 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, row4, 0)
			item2 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, row4, 1)
			item3 = __wurst_safe_MultiboardGetItem(Scoreboard_incomeBoard, row4, 2)
			__wurst_safe_MultiboardSetItemWidth(item1, 0.08)
			__wurst_safe_MultiboardSetItemWidth(item2, 0.05)
			__wurst_safe_MultiboardSetItemWidth(item3, 0.05)
			__wurst_safe_MultiboardSetItemStyle(item1, true, false)
			__wurst_safe_MultiboardSetItemStyle(item2, true, false)
			__wurst_safe_MultiboardSetItemStyle(item3, true, false)
			__wurst_safe_MultiboardSetItemValue(item1, player_getName(Player_players[i25], "when calling getName in Scoreboard, line 124"))
			multiboard_setItemValueColor1(Scoreboard_incomeBoard, row4, 0, Scoreboard_playerColors[i25], "when calling setItemValueColor in Scoreboard, line 125")
			__wurst_safe_MultiboardSetItemValue(item2, int_toString(intEnsure(ControlPoint_playerCpCount[i25]), "when calling toString in Scoreboard, line 126"))
			__wurst_safe_MultiboardSetItemValue(item3, int_toString(intEnsure(ControlPoint_playerIncome[i25]), "when calling toString in Scoreboard, line 127"))
			__wurst_safe_MultiboardReleaseItem(item1)
			__wurst_safe_MultiboardReleaseItem(item2)
			__wurst_safe_MultiboardReleaseItem(item3)
			row4 = (row4 + 1)
		end
		i25 = (i25 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_SeedBurst(__wurst_stackPos372) 
	local clVar42 = nil
	local temp371 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos372
	wurst_stack_depth = (wurst_stack_depth + 1)
	SeedBurst_SEED_BURST_ID = intEnsure(1095577657)
	SeedBurst_BURST_DAMAGE[0] = 75.
	SeedBurst_BURST_DAMAGE[1] = 100.
	SeedBurst_BURST_DAMAGE[2] = 125.
	SeedBurst_BURST_RADIUS[0] = 256.
	SeedBurst_BURST_RADIUS[1] = 320.
	SeedBurst_BURST_RADIUS[2] = 350.
	SeedBurst_BURST_DELAY = 0.15
	SeedBurst_BURST_SFX = "Abilities\\Spells\\Other\\Entangle\\EntangledTarget.mdl"
	SeedBurst_EXPLOSION_SFX = "Abilities\\Weapons\\GryphonRider\\GryphonRiderMissileArt.mdl"
	SeedBurst_INVIGORATE_BUFF_ID = 1114793322
	temp371 = SeedBurst_SEED_BURST_ID
	clVar42 = OnCastListener_onCast_SeedBurst:create50()
	OnCastListener_construct_OnCastListener(clVar42, "when calling construct_OnCastListener in SeedBurst, line 80")
	EventListener_onCast(temp371, clVar42, "when calling onCast in SeedBurst, line 80")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_SeedlingTracker(__wurst_stackPos374) 
	local clVar43 = nil
	local temp38 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos374
	wurst_stack_depth = (wurst_stack_depth + 1)
	SeedlingTracker_SEEDLING_TRACKER_ITEM_ID = intEnsure(1229795377)
	SeedlingTracker_trackerItem = nil
	temp38 = EVENT_PLAYER_UNIT_TRAIN_FINISH
	clVar43 = EventListener_add_SeedlingTracker:create54()
	EventListener_construct_EventListener(clVar43, "when calling construct_EventListener in SeedlingTracker, line 51")
	EventListener_add(temp38, clVar43, "when calling add in SeedlingTracker, line 51")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initSeedlingTracker(owner3, __wurst_stackPos230) 
	local clVar44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos230
	wurst_stack_depth = (wurst_stack_depth + 1)
	SeedlingTracker_trackerItem = createItem(SeedlingTracker_SEEDLING_TRACKER_ITEM_ID, unit_getPos(owner3, "when calling getPos in SeedlingTracker, line 42"), "when calling createItem in SeedlingTracker, line 42")
	unit_addItemHandle(owner3, SeedlingTracker_trackerItem, "when calling addItemHandle in SeedlingTracker, line 43")
	clVar44 = CallbackPeriodic_doPeriodically_SeedlingTracker:create53()
	CallbackPeriodic_construct_CallbackPeriodic(clVar44, "when calling construct_CallbackPeriodic in SeedlingTracker, line 46")
	doPeriodically(0.1, clVar44, "when calling doPeriodically in SeedlingTracker, line 46")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ShieldBash(__wurst_stackPos397) 
	local clVar45 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos397
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1112354871)
	ShieldBash_MY_ABILITY_ID = intEnsure(1095577701)
	intEnsure(1095577702)
	intEnsure(2016423986)
	ShieldBash_ARMOR_BONUS = 4
	ShieldBash_REFLECT_CHANCE = 0.25
	ShieldBash_REFLECT_DAMAGE = 40.
	ShieldBash_REFLECT_SFX = "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl"
	stringConcat(stringConcat(stringConcat(stringConcat("Increases armor by ", int_toString(ShieldBash_ARMOR_BONUS, "when calling toString in ShieldBash, line 23")), " and has a "), int_toString(real_toInt((ShieldBash_REFLECT_CHANCE * 100.), "when calling toInt in ShieldBash, line 23"), "when calling toString in ShieldBash, line 23")), "% chance to retaliate.")
	clVar45 = DamageListener_addListener_ShieldBash:create55()
	DamageListener_construct_DamageListener(clVar45, "when calling construct_DamageListener in ShieldBash, line 85")
	DamageEvent_addListener(clVar45, "when calling addListener in ShieldBash, line 85")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function onDamageTaken(__wurst_stackPos232) 
	local victim = nil
	local attacker1 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos232
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

function init_SpiritWisps(__wurst_stackPos382) 
	local clVar46 = nil
	local temp39 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos382
	wurst_stack_depth = (wurst_stack_depth + 1)
	SpiritWisps_SPIRIT_WISPS_ID = intEnsure(1095577700)
	SpiritWisps_WISP_BUFF_ID = intEnsure(1112354870)
	SpiritWisps_WISP_UNIT_ID = UnitIds_wisp
	SpiritWisps_WISP_COUNT = 3
	SpiritWisps_WISP_DURATION = 10.
	SpiritWisps_WISP_HEAL = 15.
	SpiritWisps_WISP_RADIUS = 400.
	SpiritWisps_HEAL_INTERVAL = 1.
	SpiritWisps_ORBIT_RADIUS = 150.
	SpiritWisps_UPDATE_INTERVAL = 0.05
	temp39 = SpiritWisps_SPIRIT_WISPS_ID
	clVar46 = OnCastListener_onCast_SpiritWisps:create56()
	OnCastListener_construct_OnCastListener(clVar46, "when calling construct_OnCastListener in SpiritWisps, line 58")
	EventListener_onCast(temp39, clVar46, "when calling onCast in SpiritWisps, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Starfall(__wurst_stackPos398) 
	local clVar47 = nil
	local temp40 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos398
	wurst_stack_depth = (wurst_stack_depth + 1)
	Starfall_STARFALL_ID = intEnsure(1095577708)
	Starfall_STARFALL_RADIUS = 500.
	Starfall_STAR_DAMAGE = 100.
	Starfall_STAR_AOE = 250.
	Starfall_CHANNEL_DURATION = 6.
	Starfall_BASE_INTERVAL = 1.0
	Starfall_MIN_INTERVAL = 0.15
	Starfall_STAR_SFX = "Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl"
	Starfall_IMPACT_SFX = "Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl"
	Starfall_CHANNEL_SFX = "Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl"
	temp40 = Starfall_STARFALL_ID
	clVar47 = OnCastListener_onCast_Starfall:create60()
	OnCastListener_construct_OnCastListener(clVar47, "when calling construct_OnCastListener in Starfall, line 62")
	EventListener_onCast(temp40, clVar47, "when calling onCast in Starfall, line 62")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_String(__wurst_stackPos327) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos327
	wurst_stack_depth = (wurst_stack_depth + 1)
	String_charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	String_numberset = "0123456789"
	string_length(String_numberset, "when calling length in String, line 11")
	string_length(String_charset, "when calling length in String, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_StringUtils(__wurst_stackPos366) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos366
	wurst_stack_depth = (wurst_stack_depth + 1)
	StringUtils_MAX_INDEX = (126 + 1)
	initialize1("when calling initialize in StringUtils, line 186")
	__wurst_stringToIndex("")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initialize1(__wurst_stackPos562) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos562
	wurst_stack_depth = (wurst_stack_depth + 1)
	c2sInit("when calling c2sInit in StringUtils, line 181")
	s2cInit("when calling s2cInit in StringUtils, line 182")
	widthInit("when calling widthInit in StringUtils, line 183")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function c2sInit(__wurst_stackPos563) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos563
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

function s2cInit(__wurst_stackPos564) 
	local i26 = nil
	local temp41 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos564
	wurst_stack_depth = (wurst_stack_depth + 1)
	i26 = 0
	temp41 = StringUtils_MAX_INDEX
	while true do
		if (i26 > temp41) then
			break
		end
		if (string_toUpperCase(stringEnsure(StringUtils_c2s[i26]), "when calling toUpperCase in StringUtils, line 321") == stringEnsure(StringUtils_c2s[i26])) then
		end
		i26 = (i26 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widthInit(__wurst_stackPos565) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos565
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function string_length(this324, __wurst_stackPos561) 
	local stackTrace_tempReturn56 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos561
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn56 = StringLength(this324)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn56
end

function string_substring(this318, start2, stop, __wurst_stackPos550) 
	local stackTrace_tempReturn57 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos550
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn57 = SubString(this318, start2, stop)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn57
end

function string_charAt(this305, index9, __wurst_stackPos529) 
	local stackTrace_tempReturn58 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos529
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn58 = SubString(this305, index9, (index9 + 1))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn58
end

function string_toUpperCase(this325, __wurst_stackPos566) 
	local stackTrace_tempReturn59 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos566
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn59 = StringCase(this325, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn59
end

function string_indexOf(this319, s, __wurst_stackPos551) 
	local len = nil
	local i27 = nil
	local temp42 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos551
	wurst_stack_depth = (wurst_stack_depth + 1)
	len = string_length(s, "when calling length in String, line 143")
	i27 = 0
	temp42 = (string_length(this319, "when calling length in String, line 144") - len)
	while true do
		if (i27 > temp42) then
			break
		end
		if (string_substring(this319, i27, (i27 + len), "when calling substring in String, line 145") == s) then
			wurst_stack_depth = (wurst_stack_depth - 1)
			return i27
		end
		i27 = (i27 + 1)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return -1
end

function string_getHash(this269, __wurst_stackPos454) 
	local stackTrace_tempReturn60 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos454
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn60 = StringHash(this269)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn60
end

function init_SummonTreant(__wurst_stackPos371) 
	local clVar48 = nil
	local temp411 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos371
	wurst_stack_depth = (wurst_stack_depth + 1)
	SummonTreant_SUMMON_TREANT_ID = intEnsure(1095577656)
	SummonTreant_TREANT_UNIT_ID = 1697656882
	SummonTreant_TREANT_DURATION[0] = 15.
	SummonTreant_TREANT_DURATION[1] = 20.
	SummonTreant_TREANT_DURATION[2] = 25.
	SummonTreant_BONUS_TREANTS[0] = 0
	SummonTreant_BONUS_TREANTS[1] = 1
	SummonTreant_BONUS_TREANTS[2] = 2
	temp411 = SummonTreant_SUMMON_TREANT_ID
	clVar48 = OnCastListener_onCast_SummonTreant:create64()
	OnCastListener_construct_OnCastListener(clVar48, "when calling construct_OnCastListener in SummonTreant, line 68")
	EventListener_onCast(temp411, clVar48, "when calling onCast in SummonTreant, line 68")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Table(__wurst_stackPos338) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos338
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_ht = hashtable_compiletime3
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_TargetsAllowed(__wurst_stackPos352) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos352
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Textures(__wurst_stackPos367) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos367
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ThickBark(__wurst_stackPos400) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos400
	wurst_stack_depth = (wurst_stack_depth + 1)
	intEnsure(1095577704)
	intEnsure(1380790321)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_ThrowExplosives(__wurst_stackPos401) 
	local clVar49 = nil
	local temp421 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos401
	wurst_stack_depth = (wurst_stack_depth + 1)
	ThrowExplosives_THROW_EXPLOSIVES_ID = intEnsure(1095577705)
	ThrowExplosives_BARREL_UNIT_ID = 1697656886
	ThrowExplosives_FUSE_DURATION = 3.
	ThrowExplosives_EXPLODE_RADIUS = 350.
	ThrowExplosives_EXPLODE_DAMAGE = 400.
	ThrowExplosives_FUSE_SFX = "Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeEmbers.mdl"
	ThrowExplosives_EXPLODE_SFX = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"
	temp421 = ThrowExplosives_THROW_EXPLOSIVES_ID
	clVar49 = OnCastListener_onCast_ThrowExplosives:create67()
	OnCastListener_construct_OnCastListener(clVar49, "when calling construct_OnCastListener in ThrowExplosives, line 58")
	EventListener_onCast(temp421, clVar49, "when calling onCast in ThrowExplosives, line 58")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_createTimerDialog(this271, __wurst_stackPos459) 
	local stackTrace_tempReturn61 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos459
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn61 = __wurst_safe_CreateTimerDialog(this271)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn61
end

function init_TimerUtils(__wurst_stackPos355) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos355
	wurst_stack_depth = (wurst_stack_depth + 1)
	TimerUtils_freeTimersCount = 0
	TimerUtils_timerData = Table_new_Table("when calling new_Table in TimerUtils, line 13")
	TimerUtils_HELD = 679645218
	HashMap_new_HashMap("when calling new_HashMap in TimerUtils, line 59")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_setData(this46, data, __wurst_stackPos53) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos53
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveInt(TimerUtils_timerData, handle_getTCHandleId(this46, "when calling getTCHandleId in TimerUtils, line 18"), data, "when calling saveInt in TimerUtils, line 18")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_getData(this267, __wurst_stackPos448) 
	local stackTrace_tempReturn62 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos448
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn62 = Table_Table_loadInt(TimerUtils_timerData, handle_getTCHandleId(this267, "when calling getTCHandleId in TimerUtils, line 22"), "when calling loadInt in TimerUtils, line 22")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn62
end

function getTimer(__wurst_stackPos445) 
	local receiver45 = nil
	local stackTrace_tempReturn63 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos445
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (TimerUtils_freeTimersCount > 0) then
		TimerUtils_freeTimersCount = (TimerUtils_freeTimersCount - 1)
		timer_setData(TimerUtils_freeTimers[TimerUtils_freeTimersCount], 0, "when calling setData in TimerUtils, line 30")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return TimerUtils_freeTimers[TimerUtils_freeTimersCount]
	else
		receiver45 = CreateTimer()
		timer_setData(receiver45, 0, "when calling setData in TimerUtils, line 33")
		stackTrace_tempReturn63 = receiver45
		wurst_stack_depth = (wurst_stack_depth - 1)
		return stackTrace_tempReturn63
	end
end

function timer_release(this52, __wurst_stackPos59) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos59
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

function timer_pause(this327, __wurst_stackPos568) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos568
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseTimer(this327)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_start(this54, time3, timerCallBack1, __wurst_stackPos61) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos61
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this54, time3, false, timerCallBack1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function timer_startPeriodic(this47, time1, timerCallBack, __wurst_stackPos54) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos54
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TimerStart(this47, time1, true, timerCallBack)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_addAction(this21, actionFunc, __wurst_stackPos25) 
	local stackTrace_tempReturn64 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos25
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn64 = __wurst_safe_TriggerAddAction(this21, actionFunc)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn64
end

function trigger_addCondition(this307, condition1, __wurst_stackPos535) 
	local stackTrace_tempReturn65 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos535
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn65 = __wurst_safe_TriggerAddCondition(this307, condition1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn65
end

function trigger_evaluate(this238, __wurst_stackPos272) 
	local stackTrace_tempReturn66 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos272
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn66 = __wurst_safe_TriggerEvaluate(this238)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn66
end

function trigger_execute(this309, __wurst_stackPos540) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos540
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_TriggerExecute(this309)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function trigger_registerEnterRegion(this184, whichRegion, filter3, __wurst_stackPos210) 
	local stackTrace_tempReturn67 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos210
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn67 = __wurst_safe_TriggerRegisterEnterRegion(this184, whichRegion, filter3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn67
end

function trigger_registerPlayerChatEvent(this23, whichPlayer1, chatMessageToDetect, exactMatchOnly, __wurst_stackPos28) 
	local stackTrace_tempReturn68 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos28
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn68 = __wurst_safe_TriggerRegisterPlayerChatEvent(this23, whichPlayer1, chatMessageToDetect, exactMatchOnly)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn68
end

function trigger_registerPlayerEvent(this22, whichPlayer, whichPlayerEvent, __wurst_stackPos27) 
	local stackTrace_tempReturn69 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos27
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn69 = __wurst_safe_TriggerRegisterPlayerEvent(this22, whichPlayer, whichPlayerEvent)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn69
end

function trigger_registerPlayerUnitEvent(this322, whichPlayer18, whichPlayerUnitEvent, filter9, __wurst_stackPos555) 
	local stackTrace_tempReturn70 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos555
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn70 = __wurst_safe_TriggerRegisterPlayerUnitEvent(this322, whichPlayer18, whichPlayerUnitEvent, filter9)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn70
end

function trigger_registerUnitEvent(this272, whichUnit7, whichEvent1, __wurst_stackPos461) 
	local stackTrace_tempReturn71 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos461
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn71 = __wurst_safe_TriggerRegisterUnitEvent(this272, whichUnit7, whichEvent1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn71
end

function init_TypeCasting(__wurst_stackPos346) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos346
	wurst_stack_depth = (wurst_stack_depth + 1)
	TypeCasting_typecastdata = Table_new_Table("when calling new_Table in TypeCasting, line 7")
	TypeCasting_R2I_PRECISION = 1000.
	__wurst_InitHashtable()
	initTypecastData("when calling initTypecastData in TypeCasting, line 21")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initTypecastData(__wurst_stackPos569) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos569
	wurst_stack_depth = (wurst_stack_depth + 1)
	Table_Table_saveString(TypeCasting_typecastdata, 0, "", "when calling saveString in TypeCasting, line 12")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function handle_getTCHandleId(this326, __wurst_stackPos567) 
	local stackTrace_tempReturn72 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos567
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn72 = GetHandleId(this326)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn72
end

function realToIndex(r2, __wurst_stackPos470) 
	local stackTrace_tempReturn73 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos470
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn73 = real_toInt((r2 * TypeCasting_R2I_PRECISION), "when calling toInt in TypeCasting, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn73
end

function stringToIndex(s1, __wurst_stackPos570) 
	return __wurst_stringToIndex(s1)
end

function playerFromIndex(index7, __wurst_stackPos457) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos457
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return Player_players[index7]
end

function playerToIndex(object, __wurst_stackPos463) 
	local stackTrace_tempReturn74 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos463
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn74 = player_getId(object, "when calling getId in TypeCasting, line 49")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn74
end

function unitFromIndex(index10, __wurst_stackPos571) 
	return __wurst_objectFromIndex(index10)
end

function unitToIndex(object1, __wurst_stackPos572) 
	return __wurst_objectToIndex(object1)
end

function groupToIndex(object2, __wurst_stackPos573) 
	return __wurst_objectToIndex(object2)
end

function triggerFromIndex(index11, __wurst_stackPos574) 
	return __wurst_objectFromIndex(index11)
end

function booleanToIndex(u8, __wurst_stackPos200) 
	local cond_result7 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos200
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	if u8 then
		cond_result7 = 1
	else
		cond_result7 = 0
	end
	return cond_result7
end

function booleanFromIndex(index2, __wurst_stackPos202) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos202
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return (index2 == 1)
end

function init_UnitIds(__wurst_stackPos357) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos357
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIds_abomination = 1969316463
	UnitIds_shade = 1970497636
	UnitIds_wisp = 1702327152
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UnitIndexer(__wurst_stackPos364) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos364
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

function pushUnit(u18, __wurst_stackPos271) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos271
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnits[UnitIndexer_tempUnitsCount] = u18
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function popUnit(__wurst_stackPos273) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos273
	wurst_stack_depth = (wurst_stack_depth + 1)
	UnitIndexer_tempUnitsCount = (UnitIndexer_tempUnitsCount - 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function shouldIndex(_u1, __wurst_stackPos575) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos575
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return true
end

function unit_getIndex(this33, __wurst_stackPos39) 
	local stackTrace_tempReturn75 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos39
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn75 = unit_getUserData(this33, "when calling getUserData in UnitIndexer, line 128")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn75
end

function unit_toUnitIndex(this329, __wurst_stackPos577) 
	local instance = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos577
	wurst_stack_depth = (wurst_stack_depth + 1)
	instance = __wurst_objectFromIndex(unit_getUserData(this329, "when calling getUserData in UnitIndexer, line 132"))
	if (instance == nil) then
		instance = UnitIndex_new_UnitIndex(this329, "when calling new_UnitIndex in UnitIndexer, line 135")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return instance
end

function getIndexingUnit(__wurst_stackPos430) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos430
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (UnitIndexer_tempUnitsCount <= 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return nil
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
	return UnitIndexer_tempUnits[(UnitIndexer_tempUnitsCount - 1)]
end

function onUnitDeindex(func1, __wurst_stackPos417) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos417
	wurst_stack_depth = (wurst_stack_depth + 1)
	trigger_addCondition(UnitIndexer_onDeindexTrigger, __wurst_safe_Condition(func1), "when calling addCondition in UnitIndexer, line 150")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_deindex(this330, __wurst_stackPos578) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos578
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (unit_getUserData(this330, "when calling getUserData in UnitIndexer, line 160") == 0) then
		wurst_stack_depth = (wurst_stack_depth - 1)
		return false
	else
		UnitIndex_destroyUnitIndex(unit_toUnitIndex(this330, "when calling toUnitIndex in UnitIndexer, line 163"), "when calling destroyUnitIndex in UnitIndexer, line 163")
		wurst_stack_depth = (wurst_stack_depth - 1)
		return true
	end
end

function code__onEnter_UnitIndexer(__wurst_stackPos579) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos579
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling shouldIndex in UnitIndexer, line 190") then
		unit_toUnitIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 190"), "when calling toUnitIndex in UnitIndexer, line 190")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__onLeave_UnitIndexer(__wurst_stackPos580) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos580
	wurst_stack_depth = (wurst_stack_depth + 1)
	if shouldIndex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling shouldIndex in UnitIndexer, line 191") then
		unit_deindex(getEnterLeaveUnit("when calling getEnterLeaveUnit in UnitIndexer, line 191"), "when calling deindex in UnitIndexer, line 191")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getTypeId(this119, __wurst_stackPos140) 
	local stackTrace_tempReturn76 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos140
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn76 = __wurst_safe_GetUnitTypeId(this119)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn76
end

function unit_isType(this175, utype, __wurst_stackPos197) 
	local stackTrace_tempReturn77 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos197
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn77 = __wurst_safe_IsUnitType(this175, utype)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn77
end

function createUnit(p3, unitId, pos3, facing, __wurst_stackPos79) 
	local stackTrace_tempReturn78 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos79
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn78 = __wurst_safe_CreateUnit(p3, unitId, pos3[1], pos3[2], angle_degrees(facing, "when calling degrees in Unit, line 57"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn78
end

function unit_setFlyHeight(this331, height, rate, __wurst_stackPos581) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos581
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFlyHeight(this331, height, rate)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addAbility(this69, abil, __wurst_stackPos82) 
	local stackTrace_tempReturn79 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos82
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn79 = __wurst_safe_UnitAddAbility(this69, abil)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn79
end

function unit_setAbilityLevel(this288, abilId4, lvl2, __wurst_stackPos505) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos505
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAbilityLevel(this288, abilId4, lvl2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_makeAbilityPermanent(this308, abil2, flag1, __wurst_stackPos537) 
	local stackTrace_tempReturn80 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos537
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn80 = __wurst_safe_UnitMakeAbilityPermanent(this308, flag1, abil2)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn80
end

function unit_addHP(this8, val, __wurst_stackPos8) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos8
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_addState(this8, UNIT_STATE_LIFE, val, "when calling addState in Unit, line 81")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addState(this332, state3, value18, __wurst_stackPos582) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos582
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this332, state3, (unit_getState(this332, state3, "when calling getState in Unit, line 96") + value18))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_addItemHandle(this323, whichItem1, __wurst_stackPos560) 
	local stackTrace_tempReturn81 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos560
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn81 = __wurst_safe_UnitAddItem(this323, whichItem1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn81
end

function unit_getState(this333, state4, __wurst_stackPos583) 
	local stackTrace_tempReturn82 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos583
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn82 = __wurst_safe_GetUnitState(this333, state4)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn82
end

function unit_damageTarget(this63, target2, amount, attack, ranged, attackType, damageType, weaponType, __wurst_stackPos74) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos74
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_UnitDamageTarget(this63, target2, amount, attack, ranged, attackType, damageType, weaponType)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_kill(this12, __wurst_stackPos13) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos13
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_KillUnit(this12)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getAbilityLevel(this15, id, __wurst_stackPos16) 
	local stackTrace_tempReturn83 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos16
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn83 = __wurst_safe_GetUnitAbilityLevel(this15, id)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn83
end

function unit_getFacingAngle(this172, __wurst_stackPos194) 
	local stackTrace_tempReturn84 = ({0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos194
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn84 = tupleCopy1(real_asAngleDegrees(__wurst_safe_GetUnitFacing(this172), "when calling asAngleDegrees in Unit, line 202"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn84
end

function unit_getHP(this203, __wurst_stackPos236) 
	local stackTrace_tempReturn85 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos236
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn85 = unit_getState(this203, UNIT_STATE_LIFE, "when calling getState in Unit, line 211")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn85
end

function unit_getMaxHP(this122, __wurst_stackPos143) 
	local stackTrace_tempReturn86 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos143
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn86 = unit_getState(this122, UNIT_STATE_MAX_LIFE, "when calling getState in Unit, line 223")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn86
end

function handle_getHandleId(this260, __wurst_stackPos421) 
	local stackTrace_tempReturn87 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos421
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn87 = GetHandleId(this260)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn87
end

function unit_getName(this68, __wurst_stackPos81) 
	local stackTrace_tempReturn88 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos81
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn88 = __wurst_safe_GetUnitName(this68)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn88
end

function unit_getOwner(this7, __wurst_stackPos7) 
	local stackTrace_tempReturn89 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos7
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn89 = __wurst_safe_GetOwningPlayer(this7)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn89
end

function unit_getPos(this18, __wurst_stackPos20) 
	local stackTrace_tempReturn90 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos20
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn90 = ({unit_getX(this18, "when calling getX in Unit, line 249"), unit_getY(this18, "when calling getY in Unit, line 249"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn90
end

function unit_getX(this131, __wurst_stackPos153) 
	local stackTrace_tempReturn91 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos153
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn91 = __wurst_safe_GetUnitX(this131)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn91
end

function unit_getY(this132, __wurst_stackPos154) 
	local stackTrace_tempReturn92 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos154
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn92 = __wurst_safe_GetUnitY(this132)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn92
end

function unit_getUserData(this328, __wurst_stackPos576) 
	local stackTrace_tempReturn93 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos576
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn93 = __wurst_safe_GetUnitUserData(this328)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn93
end

function unit_hasAbility(this17, id1, __wurst_stackPos18) 
	local stackTrace_tempReturn94 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos18
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn94 = (__wurst_safe_GetUnitAbilityLevel(this17, id1) > 0)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn94
end

function unit_isAlive(this5, __wurst_stackPos5) 
	local stackTrace_tempReturn95 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos5
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn95 = UnitAlive(this5)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn95
end

if UnitAlive then
else
	UnitAlive = function (id13) 
			error("The native 'UnitAlive' is not implemented.")
		end
end

function unit_issueTargetOrderById(this291, id11, target13, __wurst_stackPos510) 
	local stackTrace_tempReturn96 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos510
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn96 = __wurst_safe_IssueTargetOrderById(this291, id11, target13)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn96
end

function unit_pause(this125, __wurst_stackPos146) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos146
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this125, true)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_unpause(this129, __wurst_stackPos151) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos151
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_PauseUnit(this129, false)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_remove(this120, __wurst_stackPos141) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos141
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_RemoveUnit(this120)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_removeAbility(this189, abil1, __wurst_stackPos220) 
	local stackTrace_tempReturn97 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos220
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn97 = __wurst_safe_UnitRemoveAbility(this189, abil1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn97
end

function unit_setAnimation(this258, name2, __wurst_stackPos416) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos416
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitAnimation(this258, name2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setFacing(this275, a1, __wurst_stackPos473) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos473
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitFacing(this275, angle_degrees(a1, "when calling degrees in Unit, line 516"))
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setState(this334, state5, value19, __wurst_stackPos584) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos584
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitState(this334, state5, value19)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setInvulnerable(this70, flag, __wurst_stackPos83) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos83
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitInvulnerable(this70, flag)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setMana(this285, val2, __wurst_stackPos502) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos502
	wurst_stack_depth = (wurst_stack_depth + 1)
	unit_setState(this285, UNIT_STATE_MANA, val2, "when calling setState in Unit, line 528")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setOwner(this178, p4, changeColor, __wurst_stackPos203) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos203
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitOwner(this178, p4, changeColor)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPathing(this126, value2, __wurst_stackPos147) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos147
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPathing(this126, value2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setPos(this289, pos16, __wurst_stackPos507) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos507
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitPosition(this289, pos16[1], pos16[2])
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setScale(this71, scale1, __wurst_stackPos84) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos84
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitScale(this71, scale1, scale1, scale1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setUserData(this237, data1, __wurst_stackPos270) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos270
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitUserData(this237, data1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setVertexColor(this72, r1, g1, b1, a, __wurst_stackPos85) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos85
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitVertexColor(this72, r1, g1, b1, a)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setX(this335, x8, __wurst_stackPos585) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos585
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitX(this335, x8)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setXY(this76, pos5, __wurst_stackPos92) 
	local receiver46 = nil
	local receiver47 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos92
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver46 = this76
	unit_setX(receiver46, pos5[1], "when calling setX in Unit, line 598")
	receiver47 = receiver46
	unit_setY(receiver47, pos5[2], "when calling setY in Unit, line 598")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setY(this336, y7, __wurst_stackPos586) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos586
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_SetUnitY(this336, y7)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_setXYZ(this287, pos15, __wurst_stackPos504) 
	local receiver48 = nil
	local receiver49 = nil
	local receiver50 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos504
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver48 = this287
	unit_setX(receiver48, pos15[1], "when calling setX in Unit, line 608")
	receiver49 = receiver48
	unit_setY(receiver49, pos15[2], "when calling setY in Unit, line 608")
	receiver50 = receiver49
	unit_setFlyHeight(receiver50, pos15[3], 0., "when calling setFlyHeight in Unit, line 609")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getBaseDamage(this170, weaponIndex3, __wurst_stackPos192) 
	local stackTrace_tempReturn98 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos192
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn98 = __wurst_safe_BlzGetUnitBaseDamage(this170, weaponIndex3)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn98
end

function unit_setBaseDamage(this169, baseDamage, weaponIndex2, __wurst_stackPos191) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos191
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetUnitBaseDamage(this169, baseDamage, weaponIndex2)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getAttackCooldown(this167, weaponIndex, __wurst_stackPos189) 
	local stackTrace_tempReturn99 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos189
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn99 = __wurst_safe_BlzGetUnitAttackCooldown(this167, weaponIndex)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn99
end

function unit_setAttackCooldown(this168, cooldown, weaponIndex1, __wurst_stackPos190) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos190
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetUnitAttackCooldown(this168, cooldown, weaponIndex1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function unit_getArmor(this124, __wurst_stackPos145) 
	local stackTrace_tempReturn100 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos145
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn100 = __wurst_safe_BlzGetUnitArmor(this124)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn100
end

function unit_setArmor(this123, armorAmount, __wurst_stackPos144) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos144
	wurst_stack_depth = (wurst_stack_depth + 1)
	__wurst_safe_BlzSetUnitArmor(this123, armorAmount)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Units(__wurst_stackPos394) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos394
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UpgradeObjEditing(__wurst_stackPos399) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos399
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UrsocCharge(__wurst_stackPos402) 
	local clVar50 = nil
	local temp43 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos402
	wurst_stack_depth = (wurst_stack_depth + 1)
	UrsocCharge_URSOC_CHARGE_ID = intEnsure(1095577698)
	UrsocCharge_CHARGE_STUN_ID = intEnsure(1095577699)
	intEnsure(1112354869)
	UrsocCharge_CHARGE_DAMAGE = 100.
	UrsocCharge_CHARGE_SFX = "Abilities\\Spells\\Human\\Charge\\ChargeTarget.mdl"
	UrsocCharge_IMPACT_SFX = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"
	temp43 = UrsocCharge_URSOC_CHARGE_ID
	clVar50 = OnCastListener_onCast_UrsocCharge:create75()
	OnCastListener_construct_OnCastListener(clVar50, "when calling construct_OnCastListener in UrsocCharge, line 93")
	EventListener_onCast(temp43, clVar50, "when calling onCast in UrsocCharge, line 93")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_UrsocMain(__wurst_stackPos403) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos403
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_Vectors(__wurst_stackPos328) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos328
	wurst_stack_depth = (wurst_stack_depth + 1)
	Location(0., 0.)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function vec2_op_plus(this299, v3, __wurst_stackPos522) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos522
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this299[1] + v3[1]), (this299[2] + v3[2]), })
end

function vec2_op_minus(this274, v2, __wurst_stackPos472) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos472
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this274[1] - v2[1]), (this274[2] - v2[2]), })
end

function vec2_op_mult(this298, factor, __wurst_stackPos521) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos521
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({(this298[1] * factor), (this298[2] * factor), })
end

function vec2_toVec3(this292, __wurst_stackPos511) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos511
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return ({this292[1], this292[2], 0., })
end

function vec2_angleTo(this75, v1, __wurst_stackPos91) 
	local stackTrace_tempReturn101 = ({0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos91
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn101 = tupleCopy1(real_asAngleRadians(Atan2((v1[2] - this75[2]), (v1[1] - this75[1])), "when calling asAngleRadians in Vectors, line 127"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn101
end

function vec2_polarOffset(this77, ang, dist1, __wurst_stackPos93) 
	local stackTrace_tempReturn102 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos93
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn102 = tupleCopy(vec2_op_plus(this77, angle_toVec(ang, dist1, "when calling toVec in Vectors, line 131"), "when calling op_plus in Vectors, line 131"))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn102
end

function angle_toVec(this337, len1, __wurst_stackPos587) 
	local stackTrace_tempReturn103 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos587
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn103 = ({(Cos(this337[1]) * len1), (Sin(this337[1]) * len1), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn103
end

function vec2_distanceTo(this74, v, __wurst_stackPos90) 
	local stackTrace_tempReturn104 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos90
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn104 = SquareRoot((real_squared((v[1] - this74[1]), "when calling squared in Vectors, line 157") + real_squared((v[2] - this74[2]), "when calling squared in Vectors, line 157")))
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn104
end

function init_WeatherEffects(__wurst_stackPos345) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos345
	wurst_stack_depth = (wurst_stack_depth + 1)
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function widget_getPos(this290, __wurst_stackPos509) 
	local stackTrace_tempReturn105 = ({0., 0., })
	wurst_stack[wurst_stack_depth] = __wurst_stackPos509
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn105 = ({widget_getX(this290, "when calling getX in Widget, line 12"), widget_getY(this290, "when calling getY in Widget, line 12"), })
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn105
end

function widget_getX(this338, __wurst_stackPos588) 
	local stackTrace_tempReturn106 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos588
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn106 = __wurst_safe_GetWidgetX(this338)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn106
end

function widget_getY(this339, __wurst_stackPos589) 
	local stackTrace_tempReturn107 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos589
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn107 = __wurst_safe_GetWidgetY(this339)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn107
end

function widget_addEffect(this65, modelName, attachment, __wurst_stackPos76) 
	local stackTrace_tempReturn108 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos76
	wurst_stack_depth = (wurst_stack_depth + 1)
	stackTrace_tempReturn108 = __wurst_safe_AddSpecialEffectTarget(modelName, this65, attachment)
	wurst_stack_depth = (wurst_stack_depth - 1)
	return stackTrace_tempReturn108
end

function init_XaviusMain(__wurst_stackPos404) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos404
	wurst_stack_depth = (wurst_stack_depth + 1)
	XaviusMain_XAVIUS_ID = 1311780918
	UnitDefinition_new_UnitDefinition(XaviusMain_XAVIUS_ID, XaviusMain_XAVIUS_ID, "when calling new_UnitDefinition in XaviusMain, line 13")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_test(__wurst_stackPos405) 
	local clVar51 = nil
	local temp44 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos405
	wurst_stack_depth = (wurst_stack_depth + 1)
	test_GPROJECTILE_ID = intEnsure(1095577712)
	temp44 = test_GPROJECTILE_ID
	clVar51 = OnPointCast_onPointCast_test:create77()
	OnPointCast_construct_OnPointCast(clVar51, "when calling construct_OnPointCast in test, line 73")
	EventListener_onPointCast(temp44, clVar51, "when calling onPointCast in test, line 73")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function abc(owner4, unitId1, pos10, facing1, __wurst_stackPos287) 
	local u31 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos287
	wurst_stack_depth = (wurst_stack_depth + 1)
	u31 = createUnit(owner4, unitId1, pos10, facing1, "when calling createUnit in test, line 27")
	unit_addAbility(u31, 1097625443, "when calling addAbility in test, line 28")
	wurst_stack_depth = (wurst_stack_depth - 1)
	return u31
end

function moveUnit(u20, targetPos8, dist5, update, speed, __wurst_stackPos288) 
	local clVar52 = nil
	local temp45 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos288
	wurst_stack_depth = (wurst_stack_depth + 1)
	temp45 = update
	clVar52 = CallbackPeriodic_doPeriodically_test:create76()
	CallbackPeriodic_construct_CallbackPeriodic(clVar52, "when calling construct_CallbackPeriodic in test, line 34")
	clVar52.u = u20
	clVar52.targetPos = tupleCopy(targetPos8)
	clVar52.speed = speed
	clVar52.update = update
	clVar52.dist = dist5
	doPeriodically(temp45, clVar52, "when calling doPeriodically in test, line 34")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function init_winLoss(__wurst_stackPos406) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos406
	wurst_stack_depth = (wurst_stack_depth + 1)
	winLoss_footmen = CreateGroup()
	setupDefeatCondition("when calling setupDefeatCondition in winLoss, line 21")
	setupVictoryCondition("when calling setupVictoryCondition in winLoss, line 22")
	player_setGold(Player_players[0], 1000, "when calling setGold in winLoss, line 23")
	player_setLumber(Player_players[0], 1000, "when calling setLumber in winLoss, line 24")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupVictoryCondition(__wurst_stackPos591) 
	local receiver51 = nil
	local receiver52 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos591
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver51 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver51, Player_players[1], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 7")
	receiver52 = receiver51
	trigger_addAction(receiver52, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 8")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss(__wurst_stackPos592) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos592
	wurst_stack_depth = (wurst_stack_depth + 1)
	group_remove(winLoss_footmen, "when calling remove in winLoss, line 9", GetTriggerUnit())
	if group_isEmpty(winLoss_footmen, "when calling isEmpty in winLoss, line 10") then
		__wurst_safe_CustomVictoryBJ(Player_players[0], true, true)
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function setupDefeatCondition(__wurst_stackPos590) 
	local receiver53 = nil
	local receiver54 = nil
	wurst_stack[wurst_stack_depth] = __wurst_stackPos590
	wurst_stack_depth = (wurst_stack_depth + 1)
	receiver53 = CreateTrigger()
	trigger_registerPlayerUnitEvent(receiver53, Player_players[0], EVENT_PLAYER_UNIT_DEATH, nil, "when calling registerPlayerUnitEvent in winLoss, line 15")
	receiver54 = receiver53
	trigger_addAction(receiver54, function (...) 
			xpcall(function (...) 
					bridge_code__addAction_winLoss1(...)
				end, function(err) if err == "__wurst_abort_thread" then return end BJDebugMsg("lua callback error: " .. tostring(err)) xpcall(function() error1(tostring(err), "<lua error>") end, function(err2) if err2 == "__wurst_abort_thread" then return end BJDebugMsg("error reporting error: " .. tostring(err2)) BJDebugMsg("while reporting: " .. tostring(err))  end) end, ...)
		end, "when calling addAction in winLoss, line 16")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function code__addAction_winLoss1(__wurst_stackPos593) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos593
	wurst_stack_depth = (wurst_stack_depth + 1)
	if (GetTriggerUnit() == udg_townHall) then
		__wurst_safe_CustomDefeatBJ(Player_players[0], "You have been defeated!")
	end
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState(__wurst_stackPos319) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos319
	wurst_stack_depth = (wurst_stack_depth + 1)
	bridge_initCompiletimeState_0()
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function initCompiletimeState_0(__wurst_stackPos594) 
	wurst_stack[wurst_stack_depth] = __wurst_stackPos594
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
	__wurst_SaveStr(hashtable_compiletime3, 2, 1438833476, "AIx5")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1194720164, "AM06")
	__wurst_SaveStr(hashtable_compiletime3, 2, -540326714, "AInv")
	__wurst_SaveStr(hashtable_compiletime3, 2, 1032637, "Ault")
	__wurst_SaveStr(hashtable_compiletime3, 2, 264091612, "AM08")
	__wurst_SaveStr(hashtable_compiletime3, 2, 1141672410, "AM09")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1581872253, "AM07")
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
	__wurst_SaveStr(hashtable_compiletime3, 2, 291965116, "AM0j")
	__wurst_SaveStr(hashtable_compiletime3, 2, 366967716, "Arav")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1484980497, "AM0k")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1552621244, "AM0l")
	__wurst_SaveStr(hashtable_compiletime3, 2, 1804483594, "air")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1221441622, "debris")
	__wurst_SaveStr(hashtable_compiletime3, 2, -681966791, "ground")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1912775212, "invulnerable")
	__wurst_SaveStr(hashtable_compiletime3, 2, 392811314, "item")
	__wurst_SaveStr(hashtable_compiletime3, 2, 124309475, "structure")
	__wurst_SaveStr(hashtable_compiletime3, 2, -543400682, "vulnerable")
	__wurst_SaveStr(hashtable_compiletime3, 2, -85648186, "ward")
	__wurst_SaveStr(hashtable_compiletime3, 2, -612826229, "Avul")
	__wurst_SaveStr(hashtable_compiletime3, 2, -984412248, "AM0o")
	__wurst_SaveStr(hashtable_compiletime3, 2, -1033093372, "AM0p")
	wurst_stack_depth = (wurst_stack_depth - 1)
end

function bridge_Unit000038_DropItems() 
	Unit000038_DropItems("via function reference war3map, line 731")
end

function bridge_Unit000043_DropItems() 
	Unit000043_DropItems("via function reference war3map, line 745")
end

function bridge_Unit000080_DropItems() 
	Unit000080_DropItems("via function reference war3map, line 775")
end

function bridge_Unit000077_DropItems() 
	Unit000077_DropItems("via function reference war3map, line 785")
end

function bridge_Unit000090_DropItems() 
	Unit000090_DropItems("via function reference war3map, line 809")
end

function bridge_Unit000097_DropItems() 
	Unit000097_DropItems("via function reference war3map, line 823")
end

function bridge_Unit000003_DropItems() 
	Unit000003_DropItems("via function reference war3map, line 847")
end

function bridge_Unit000116_DropItems() 
	Unit000116_DropItems("via function reference war3map, line 861")
end

function bridge_Trig_Other_Actions() 
	Trig_Other_Actions("via function reference war3map, line 1189")
end

function bridge_Trig_ControlPointInitialVariables_Actions() 
	Trig_ControlPointInitialVariables_Actions("via function reference war3map, line 1227")
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

function __wurst_safe_GetUnitX(whichUnit25) 
	if (whichUnit25 == nil) then
		return 0.0
	end
	return GetUnitX(whichUnit25)
end

function __wurst_safe_GetUnitY(whichUnit26) 
	if (whichUnit26 == nil) then
		return 0.0
	end
	return GetUnitY(whichUnit26)
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

function __wurst_safe_GetUnitAbilityLevel(whichUnit21, abilcode1) 
	if (whichUnit21 == nil) then
		return 0
	end
	return GetUnitAbilityLevel(whichUnit21, abilcode1)
end

function __wurst_safe_UnitRemoveAbility(whichUnit1, abilityId1) 
	if (whichUnit1 == nil) then
		return false
	end
	return UnitRemoveAbility(whichUnit1, abilityId1)
end

function __wurst_safe_UnitAddItem(whichUnit18, whichItem2) 
	if (whichUnit18 == nil) then
		return false
	end
	if (whichItem2 == nil) then
		return false
	end
	return UnitAddItem(whichUnit18, whichItem2)
end

function __wurst_safe_GetItemTypeId(i28) 
	if (i28 == nil) then
		return 0
	end
	return GetItemTypeId(i28)
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

function __wurst_safe_UnitSuspendDecay(whichUnit47, suspend) 
	if (whichUnit47 == nil) then
		return nil
	end
	UnitSuspendDecay(whichUnit47, suspend)
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

function __wurst_safe_SetUnitTimeScale(whichUnit48, timeScale) 
	if (whichUnit48 == nil) then
		return nil
	end
	SetUnitTimeScale(whichUnit48, timeScale)
end

function __wurst_safe_SetUnitAnimation(whichUnit31, whichAnimation) 
	if (whichUnit31 == nil) then
		return nil
	end
	SetUnitAnimation(whichUnit31, whichAnimation)
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

function __wurst_safe_IsUnitDeadBJ(whichUnit49) 
	if (whichUnit49 == nil) then
		return false
	end
	return IsUnitDeadBJ(whichUnit49)
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

function __wurst_safe_IssueTargetOrderById(whichUnit28, order, targetWidget1) 
	if (whichUnit28 == nil) then
		return false
	end
	if (targetWidget1 == nil) then
		return false
	end
	return IssueTargetOrderById(whichUnit28, order, targetWidget1)
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

function __wurst_safe_SetPlayerState(whichPlayer11, whichPlayerState, value17) 
	if (whichPlayer11 == nil) then
		return nil
	end
	if (whichPlayerState == nil) then
		return nil
	end
	SetPlayerState(whichPlayer11, whichPlayerState, value17)
end

function __wurst_safe_PauseUnit(whichUnit29, flag2) 
	if (whichUnit29 == nil) then
		return nil
	end
	PauseUnit(whichUnit29, flag2)
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

function __wurst_safe_KillUnit(whichUnit20) 
	if (whichUnit20 == nil) then
		return nil
	end
	KillUnit(whichUnit20)
end

function __wurst_safe_GetOwningPlayer(whichUnit24) 
	if (whichUnit24 == nil) then
		return nil
	end
	return GetOwningPlayer(whichUnit24)
end

function __wurst_safe_GetUnitFacing(whichUnit22) 
	if (whichUnit22 == nil) then
		return 0.0
	end
	return GetUnitFacing(whichUnit22)
end

function __wurst_safe_CreateUnit(id12, unitid1, x7, y6, face1) 
	if (id12 == nil) then
		return nil
	end
	return CreateUnit(id12, unitid1, x7, y6, face1)
end

function __wurst_safe_RemoveUnit(whichUnit30) 
	if (whichUnit30 == nil) then
		return nil
	end
	RemoveUnit(whichUnit30)
end

function __wurst_safe_SetUnitFacing(whichUnit32, facingAngle) 
	if (whichUnit32 == nil) then
		return nil
	end
	SetUnitFacing(whichUnit32, facingAngle)
end

function __wurst_safe_AddItemToStock(whichUnit50, itemId2, currentStock, stockMax) 
	if (whichUnit50 == nil) then
		return nil
	end
	AddItemToStock(whichUnit50, itemId2, currentStock, stockMax)
end

function __wurst_safe_RemoveItemFromStock(whichUnit51, itemId3) 
	if (whichUnit51 == nil) then
		return nil
	end
	RemoveItemFromStock(whichUnit51, itemId3)
end

function __wurst_safe_UnitDamageTarget(whichUnit19, target14, amount3, attack1, ranged1, attackType3, damageType4, weaponType2) 
	if (whichUnit19 == nil) then
		return false
	end
	if (target14 == nil) then
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
	return UnitDamageTarget(whichUnit19, target14, amount3, attack1, ranged1, attackType3, damageType4, weaponType2)
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

function __wurst_safe_SetUnitPosition(whichUnit35, newX, newY) 
	if (whichUnit35 == nil) then
		return nil
	end
	SetUnitPosition(whichUnit35, newX, newY)
end

function __wurst_safe_GroupEnumUnitsInRect(whichGroup1, r4, filter6) 
	if (whichGroup1 == nil) then
		return nil
	end
	if (r4 == nil) then
		return nil
	end
	GroupEnumUnitsInRect(whichGroup1, r4, filter6)
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

function __wurst_safe_IsUnitAliveBJ(whichUnit52) 
	if (whichUnit52 == nil) then
		return false
	end
	return IsUnitAliveBJ(whichUnit52)
end

function __wurst_safe_SetUnitScale(whichUnit36, scaleX, scaleY, scaleZ) 
	if (whichUnit36 == nil) then
		return nil
	end
	SetUnitScale(whichUnit36, scaleX, scaleY, scaleZ)
end

function __wurst_safe_SetUnitVertexColor(whichUnit38, red1, green1, blue1, alpha1) 
	if (whichUnit38 == nil) then
		return nil
	end
	SetUnitVertexColor(whichUnit38, red1, green1, blue1, alpha1)
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

function __wurst_safe_SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value20) 
	if (sourcePlayer == nil) then
		return nil
	end
	if (otherPlayer2 == nil) then
		return nil
	end
	if (whichAllianceSetting == nil) then
		return nil
	end
	SetPlayerAlliance(sourcePlayer, otherPlayer2, whichAllianceSetting, value20)
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

function __wurst_safe_UnitAddIndicator(whichUnit53, red2, green2, blue2, alpha2) 
	if (whichUnit53 == nil) then
		return nil
	end
	UnitAddIndicator(whichUnit53, red2, green2, blue2, alpha2)
end

function __wurst_safe_RescueUnitBJ(whichUnit54, rescuer, changeColor2) 
	if (whichUnit54 == nil) then
		return nil
	end
	if (rescuer == nil) then
		return nil
	end
	RescueUnitBJ(whichUnit54, rescuer, changeColor2)
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

function __wurst_safe_GetItemType(whichItem3) 
	if (whichItem3 == nil) then
		return nil
	end
	return GetItemType(whichItem3)
end

function __wurst_safe_GetItemLevel(whichItem4) 
	if (whichItem4 == nil) then
		return 0
	end
	return GetItemLevel(whichItem4)
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

function __wurst_safe_SetItemDropID(whichItem5, unitId2) 
	if (whichItem5 == nil) then
		return nil
	end
	SetItemDropID(whichItem5, unitId2)
end

function __wurst_safe_UpdateStockAvailability(whichItem6) 
	if (whichItem6 == nil) then
		return nil
	end
	UpdateStockAvailability(whichItem6)
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

function __wurst_safe_BlzSetSpecialEffectColor(whichEffect3, r3, g4, b2) 
	if (whichEffect3 == nil) then
		return nil
	end
	BlzSetSpecialEffectColor(whichEffect3, r3, g4, b2)
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

function __wurst_safe_SetItemCharges(whichItem, charges1) 
	if (whichItem == nil) then
		return nil
	end
	SetItemCharges(whichItem, charges1)
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

function __wurst_safe_GetUnitName(whichUnit23) 
	if (whichUnit23 == nil) then
		return ""
	end
	return GetUnitName(whichUnit23)
end

function __wurst_safe_GetUnitUserData(whichUnit27) 
	if (whichUnit27 == nil) then
		return 0
	end
	return GetUnitUserData(whichUnit27)
end

function __wurst_safe_SetUnitInvulnerable(whichUnit33, flag3) 
	if (whichUnit33 == nil) then
		return nil
	end
	SetUnitInvulnerable(whichUnit33, flag3)
end

function __wurst_safe_SetUnitPathing(whichUnit34, flag4) 
	if (whichUnit34 == nil) then
		return nil
	end
	SetUnitPathing(whichUnit34, flag4)
end

function __wurst_safe_SetUnitUserData(whichUnit37, data2) 
	if (whichUnit37 == nil) then
		return nil
	end
	SetUnitUserData(whichUnit37, data2)
end

function __wurst_safe_SetUnitX(whichUnit39, newX1) 
	if (whichUnit39 == nil) then
		return nil
	end
	SetUnitX(whichUnit39, newX1)
end

function __wurst_safe_SetUnitY(whichUnit40, newY1) 
	if (whichUnit40 == nil) then
		return nil
	end
	SetUnitY(whichUnit40, newY1)
end

function __wurst_safe_BlzGetUnitBaseDamage(whichUnit41, weaponIndex4) 
	if (whichUnit41 == nil) then
		return 0
	end
	return BlzGetUnitBaseDamage(whichUnit41, weaponIndex4)
end

function __wurst_safe_BlzSetUnitBaseDamage(whichUnit42, baseDamage1, weaponIndex5) 
	if (whichUnit42 == nil) then
		return nil
	end
	BlzSetUnitBaseDamage(whichUnit42, baseDamage1, weaponIndex5)
end

function __wurst_safe_BlzGetUnitAttackCooldown(whichUnit43, weaponIndex6) 
	if (whichUnit43 == nil) then
		return 0.0
	end
	return BlzGetUnitAttackCooldown(whichUnit43, weaponIndex6)
end

function __wurst_safe_BlzSetUnitAttackCooldown(whichUnit44, cooldown1, weaponIndex7) 
	if (whichUnit44 == nil) then
		return nil
	end
	BlzSetUnitAttackCooldown(whichUnit44, cooldown1, weaponIndex7)
end

function __wurst_safe_BlzGetUnitArmor(whichUnit45) 
	if (whichUnit45 == nil) then
		return 0.0
	end
	return BlzGetUnitArmor(whichUnit45)
end

function __wurst_safe_BlzSetUnitArmor(whichUnit46, armorAmount1) 
	if (whichUnit46 == nil) then
		return nil
	end
	BlzSetUnitArmor(whichUnit46, armorAmount1)
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

