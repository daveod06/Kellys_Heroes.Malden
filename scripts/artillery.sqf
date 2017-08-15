// test_mortar_crew commandArtilleryFire [getposatl (thislist select 0), "LIB_1rnd_60mmHE_M2", 90]; 
//test_mortar_crew reveal test_vicitm_carD; test_mortar_weapon doTarget test_vicitm_carD; test_mortar_crew doTarget test_vicitm_carD; temp = test_mortar_weapon fireAtTarget [test_vicitm_carD];

// random mortar fire function
if (isnil "DZ_fnc_MortarFire") then { DZ_fnc_MortarFire = { private ["_ammo", "_marker", "_xcoord", "_ycoord", "_timer", "_fire"]; _ammo = _this select 0; _marker = _this select 1; _xcoord = _this select 2; _ycoord = _this select 3; _timer = _this select 4; _fire = true; while {_fire} do { _firerun = _ammo createvehicle [(getmarkerpos _marker select 0) + random _xcoord, (getmarkerpos _marker select 1) + random _ycoord, getmarkerpos _marker select 2]; sleep (random _timer); }; };
};