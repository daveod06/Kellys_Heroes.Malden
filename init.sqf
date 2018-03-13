// ====================================================================================

// F2 - Process ParamsArray
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

//f_processParamsArray = [] execVM "scripts/f_processparamsarray.sqf";

// ====================================================================================

// F2 - F2 Common Local Variables
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

//f_script_setLocalVars = [] execVM "scripts/f_setlocalvars.sqf";

//f_var_debugMode = 0;

//DZ_fnc_MortarFire = execVM "scripts/dz_fnc_mortarfire.sqf"

//if (isnil "DZ_fnc_MortarFire") then 
//{ DZ_fnc_MortarFire = { private ["_ammo", "_marker", "_xcoord", "_ycoord", "_timer", "_rounds", "_fire"]; 
//_ammo = _this select 0; _marker = _this select 1; _xcoord = _this select 2; _ycoord = _this select 3; _timer = _this select 4; _rounds = _this select 5; _fire = true; 

//for "_i" from 1 to _rounds do { _firerun = _ammo createvehicle [(getmarkerpos _marker select 0) + random _xcoord, (getmarkerpos _marker select 1) + random _ycoord, getmarkerpos _marker select 2]; sleep (random 3);}; };


attack_started = false;
bells_ringing = false;
tank_engines_on = false;

if (isnil "DZ_fnc_MortarFire") then { 
	DZ_fnc_MortarFire = { 
		private ["_ammo", "_marker", "_xcoord", "_ycoord", "_timer", "_rounds", "_fire"]; 
		_ammo = _this select 0; 
		_marker = _this select 1; 
		_xcoord = _this select 2; 
		_ycoord = _this select 3; 
		_timer = _this select 4; 
		_rounds = _this select 5; 
		_fire = true; 

		for "_i" from 1 to _rounds do { 
			_firerun = _ammo createvehicle [(getmarkerpos _marker select 0) + random _xcoord, (getmarkerpos _marker select 1) + random _ycoord, getmarkerpos _marker select 2]; sleep (random _timer);
		};
	};
};


/*
	CAS script - by sabersnack
*/
//[pos,run_type,dir] execVM "scripts/cas.sqf"; // [position of object to be targeted, runType (0=guns 1=missiles 2=guns and missiles), attack direction]
