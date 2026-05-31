// this script was compiled with wurst 1.9.0.0-nightly-1-g7aeb94f2
globals
// integer JASS_MAX_ARRAY_SIZE=0
// integer bj_MAX_PLAYER_SLOTS=0
real Basics_ANIMATION_PERIOD=0.
string array Colors_hexs
integer Colors_decs=0
integer ErrorHandling_MUTE_ERROR_DURATION=0
integer ErrorHandling_PRIMARY_ERROR_KEY=0
hashtable ErrorHandling_HT=null
boolean ErrorHandling_suppressErrorMessages=false
real GameTimer_currentTime=0.
boolean MagicFunctions_compiletime=false
boolean MagicFunctions_isLua=false
player Player_localPlayer=null
integer Printing_DEBUG_LEVEL=0
real Printing_DEBUG_MSG_DURATION=0.
hashtable Table_ht=null
integer TypeCasting_typecastdata=0
hashtable hashtable_compiletime=null
hashtable hashtable_compiletime_1=null
integer array Table_nextFree
integer Table_firstFree=0
integer Table_maxIndex=0
integer array Table_typeId
code ref_function_code__startPeriodic_GameTimer=null
endglobals
function initCompiletimeState_0 takes nothing returns nothing
	call InitHashtable()
	call InitHashtable()
	set hashtable_compiletime_1 = InitHashtable()
	set hashtable_compiletime = InitHashtable()
	call SaveInteger(hashtable_compiletime_1, 1, -242600650, 0)
	call SaveInteger(hashtable_compiletime_1, 1, 1132341824, 1)
	call SaveInteger(hashtable_compiletime_1, 1, -647782241, 2)
	call SaveInteger(hashtable_compiletime_1, 1, -854572045, 3)
	call SaveInteger(hashtable_compiletime_1, 1, -680649701, 4)
	call SaveInteger(hashtable_compiletime_1, 1, -943650483, 5)
	call SaveInteger(hashtable_compiletime_1, 1, -671760605, 6)
	call SaveInteger(hashtable_compiletime_1, 1, 349230650, 7)
	call SaveInteger(hashtable_compiletime_1, 1, -1894922563, 8)
	call SaveInteger(hashtable_compiletime_1, 1, -1474492777, 9)
	call SaveInteger(hashtable_compiletime_1, 1, -1587459251, 10)
	call SaveInteger(hashtable_compiletime_1, 1, -1676716706, 11)
	call SaveInteger(hashtable_compiletime_1, 1, -1559655710, 12)
	call SaveInteger(hashtable_compiletime_1, 1, -1663695754, 13)
	call SaveInteger(hashtable_compiletime_1, 1, 597637742, 14)
	call SaveInteger(hashtable_compiletime_1, 1, 789744696, 15)
	call SaveStr(hashtable_compiletime_1, 2, 0, "")
endfunction

function initCompiletimeState takes nothing returns nothing
	call ExecuteFunc("initCompiletimeState_0")
endfunction

function code__startPeriodic_GameTimer takes nothing returns nothing
	set GameTimer_currentTime = GameTimer_currentTime + Basics_ANIMATION_PERIOD
endfunction

function initGlobals takes nothing returns nothing
	set Table_firstFree = 0
	set Table_maxIndex = 0
	set ref_function_code__startPeriodic_GameTimer = function code__startPeriodic_GameTimer
endfunction

function init_Basics takes nothing returns nothing
	set Basics_ANIMATION_PERIOD = 0.030
endfunction

function hashtable_saveInt takes hashtable this, integer parentKey, integer childKey, integer value returns nothing
	call SaveInteger(this, parentKey, childKey, value)
endfunction

function Table_saveInt takes integer this, integer parentKey, integer value returns nothing
	call hashtable_saveInt(Table_ht, this, parentKey, value)
endfunction

function Loglevel_getTag takes integer this returns string
	local integer temp = this
	if temp == 0 then
		return "|cffADADADtrace|r"
	elseif temp == 1 then
		return "|cff2685DCdebug|r"
	elseif temp == 2 then
		return "|cffFFCC00info|r"
	elseif temp == 3 then
		return "|cffF47E3Ewarning|r"
	else
		return "|cffFB2700error|r"
	endif
endfunction

function printLog takes player showTo, integer loglvl, string msg returns nothing
	local string compositeMsg
	if Printing_DEBUG_LEVEL <= loglvl then
		set compositeMsg = Loglevel_getTag(loglvl) + " - " + msg
		call DisplayTimedTextToPlayer(showTo, 0., 0., Printing_DEBUG_MSG_DURATION, compositeMsg)
	endif
endfunction

function Log_error takes string msg returns nothing
	call printLog(Player_localPlayer, 4, msg)
endfunction

function compileError takes string msg returns nothing
endfunction

function hashtable_hasBoolean takes hashtable this, integer parentKey, integer childKey returns boolean
	return HaveSavedBoolean(this, parentKey, childKey)
endfunction

function hashtable_hasInt takes hashtable this, integer parentKey, integer childKey returns boolean
	return HaveSavedInteger(this, parentKey, childKey)
endfunction

function hashtable_loadBoolean takes hashtable this, integer parentKey, integer childKey returns boolean
	return LoadBoolean(this, parentKey, childKey)
endfunction

function hashtable_loadInt takes hashtable this, integer parentKey, integer childKey returns integer
	return LoadInteger(this, parentKey, childKey)
endfunction

function hashtable_saveBoolean takes hashtable this, integer parentKey, integer childKey, boolean value returns nothing
	call SaveBoolean(this, parentKey, childKey, value)
endfunction

function real_toInt takes real this returns integer
	return R2I(this)
endfunction

function string_getHash takes string this returns integer
	return StringHash(this)
endfunction

function error takes string msg returns nothing
	local integer hash
	if MagicFunctions_compiletime then
		call compileError("ERROR: " + msg)
	elseif MagicFunctions_isLua then
	else
		if  not ErrorHandling_suppressErrorMessages then
			set hash = string_getHash(msg)
			if hashtable_hasInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash) then
				if hashtable_loadInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash) + ErrorHandling_MUTE_ERROR_DURATION < GameTimer_currentTime then
					call Log_error(msg + "")
					call hashtable_saveInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, real_toInt(GameTimer_currentTime))
					call hashtable_saveBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, false)
				elseif hashtable_hasBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash) then
					if  not hashtable_loadBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash) then
						call Log_error("|cffFF3A29Excessive repeating errors are being omitted")
						call hashtable_saveBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, true)
					endif
				else
					call Log_error("|cffFF3A29Excessive repeating errors are being omitted")
					call hashtable_saveBoolean(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, true)
				endif
			else
				call hashtable_saveInt(ErrorHandling_HT, ErrorHandling_PRIMARY_ERROR_KEY, hash, real_toInt(GameTimer_currentTime))
				call Log_error("Message: " + msg + "")
			endif
		endif
		call I2S(1 / 0)
	endif
endfunction

function dispatch_Table_Table_saveInt takes integer this, integer parentKey, integer value returns nothing
	if Table_typeId[this] == 0 then
		if this == 0 then
			call error("Nullpointer exception when calling Table.saveInt")
		else
			call error("Called Table.saveInt on invalid object.")
		endif
	endif
	call Table_saveInt(this, parentKey, value)
endfunction

function initializeTable takes nothing returns nothing
	local integer i = 0
	loop
		exitwhen i > 15
		call dispatch_Table_Table_saveInt(Colors_decs, string_getHash(Colors_hexs[i]), i)
		set i = i + 1
	endloop
endfunction

function alloc_Table takes nothing returns integer
	local integer this
	if Table_firstFree == 0 then
		if Table_maxIndex < JASS_MAX_ARRAY_SIZE then
			set Table_maxIndex = Table_maxIndex + 1
			set this = Table_maxIndex
			set Table_typeId[this] = 14
		else
			call error("Out of memory: Could not create Table.")
			set this = 0
		endif
	else
		set Table_firstFree = Table_firstFree - 1
		set this = Table_nextFree[Table_firstFree]
		set Table_typeId[this] = 14
	endif
	return this
endfunction

function Table_init takes integer this returns nothing
endfunction

function construct_Table takes integer this returns nothing
	call Table_init(this)
endfunction

function new_Table takes nothing returns integer
	local integer this = alloc_Table()
	call construct_Table(this)
	return this
endfunction

function init_Colors takes nothing returns nothing
	set Colors_hexs[0] = "0"
	set Colors_hexs[1] = "1"
	set Colors_hexs[2] = "2"
	set Colors_hexs[3] = "3"
	set Colors_hexs[4] = "4"
	set Colors_hexs[5] = "5"
	set Colors_hexs[6] = "6"
	set Colors_hexs[7] = "7"
	set Colors_hexs[8] = "8"
	set Colors_hexs[9] = "9"
	set Colors_hexs[10] = "A"
	set Colors_hexs[11] = "B"
	set Colors_hexs[12] = "C"
	set Colors_hexs[13] = "D"
	set Colors_hexs[14] = "E"
	set Colors_hexs[15] = "F"
	set Colors_decs = new_Table()
	call initializeTable()
endfunction

function init_ErrorHandling takes nothing returns nothing
	set ErrorHandling_MUTE_ERROR_DURATION = 60
	set ErrorHandling_PRIMARY_ERROR_KEY = -1
	set ErrorHandling_HT = hashtable_compiletime
	set ErrorHandling_suppressErrorMessages = false
endfunction

function alloc_HashMap takes nothing returns integer
	local integer this
	if Table_firstFree == 0 then
		if Table_maxIndex < JASS_MAX_ARRAY_SIZE then
			set Table_maxIndex = Table_maxIndex + 1
			set this = Table_maxIndex
			set Table_typeId[this] = 15
		else
			call error("Out of memory: Could not create HashMap.")
			set this = 0
		endif
	else
		set Table_firstFree = Table_firstFree - 1
		set this = Table_nextFree[Table_firstFree]
		set Table_typeId[this] = 15
	endif
	return this
endfunction

function HashMap_init takes integer this returns nothing
endfunction

function construct_HashMap takes integer this returns nothing
	call construct_Table(this)
	call HashMap_init(this)
endfunction

function new_HashMap takes nothing returns integer
	local integer this = alloc_HashMap()
	call construct_HashMap(this)
	return this
endfunction

function init_EventHelper takes nothing returns nothing
	call new_HashMap()
	call new_HashMap()
	call new_Table()
endfunction

function timer_start takes timer this, real time, code timerCallBack returns nothing
	call TimerStart(this, time, false, timerCallBack)
endfunction

function timer_startPeriodic takes timer this, real time, code timerCallBack returns nothing
	call TimerStart(this, time, true, timerCallBack)
endfunction

function init_GameTimer takes nothing returns nothing
	local timer receiver = CreateTimer()
	call timer_start(receiver, 100000., null)
	call timer_startPeriodic(CreateTimer(), Basics_ANIMATION_PERIOD, ref_function_code__startPeriodic_GameTimer)
endfunction

function init_Group takes nothing returns nothing
	call CreateGroup()
endfunction

function print takes string msg returns nothing
	call DisplayTimedTextToPlayer(Player_localPlayer, 0., 0., Printing_DEBUG_MSG_DURATION, msg)
endfunction

function init_Hello takes nothing returns nothing
	call print("Hello World")
endfunction

function init_MagicFunctions takes nothing returns nothing
	set MagicFunctions_compiletime = false
	set MagicFunctions_isLua = false
endfunction

function initPlayerArray takes nothing returns nothing
	local integer i = 0
	local integer temp = bj_MAX_PLAYER_SLOTS - 1
	loop
		exitwhen i > temp
		set i = i + 1
	endloop
endfunction

function init_Player takes nothing returns nothing
	set Player_localPlayer = GetLocalPlayer()
	call initPlayerArray()
endfunction

function init_Printing takes nothing returns nothing
	set Printing_DEBUG_LEVEL = 2
	set Printing_DEBUG_MSG_DURATION = 45.
endfunction

function init_Table takes nothing returns nothing
	set Table_ht = hashtable_compiletime_1
endfunction

function hashtable_saveString takes hashtable this, integer parentKey, integer childKey, string value returns nothing
	call SaveStr(this, parentKey, childKey, value)
endfunction

function Table_saveString takes integer this, integer parentKey, string value returns nothing
	call hashtable_saveString(Table_ht, this, parentKey, value)
endfunction

function dispatch_Table_Table_saveString takes integer this, integer parentKey, string value returns nothing
	if Table_typeId[this] == 0 then
		if this == 0 then
			call error("Nullpointer exception when calling Table.saveString")
		else
			call error("Called Table.saveString on invalid object.")
		endif
	endif
	call Table_saveString(this, parentKey, value)
endfunction

function initTypecastData takes nothing returns nothing
	call dispatch_Table_Table_saveString(TypeCasting_typecastdata, 0, "")
endfunction

function init_TypeCasting takes nothing returns nothing
	set TypeCasting_typecastdata = new_Table()
	call InitHashtable()
	call initTypecastData()
endfunction

function init_Vectors takes nothing returns nothing
	call Location(0., 0.)
endfunction

function main takes nothing returns nothing
	call initGlobals()
	call initCompiletimeState()
	call init_Vectors()
	call init_Player()
	call init_Basics()
	call init_MagicFunctions()
	call init_Table()
	call init_Colors()
	call init_Printing()
	call init_GameTimer()
	call init_ErrorHandling()
	call init_Group()
	call init_TypeCasting()
	call init_EventHelper()
	call init_Hello()
endfunction

function config takes nothing returns nothing
endfunction

