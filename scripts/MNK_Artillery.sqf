/*

Ambient Artillery Battery v1.0

Author: 	Mynock

Contact:	mynock.steam@gmail.com

Credits:	BIS
			kydoimos
			Radioman
			kylania
			meaty
			
WARNING:	If you obtained this script from de-.pbo'ing a mission, and it has been modified from the original in any way for that user's personal use, please contact the author of the mission you obtained this script from
			in order to get their permission to use their modified version of the original.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

What it Does:	Allows for ambient artillery piece firing at a target. The suggested object for a target is an Invisible Helipad or other invidible object.
				***This script is not to be used for accurate artillery fire.*** There are many other scripts out there that can handle that job.
				If you are trying to use this script with a mortar and you want the mortar to stop firing when the gunner is killed, you need to name the gunner that is using the mortar, and then use a trigger to fire when
				the gunner is dead and delete the target. I'm not sure why mortars function differently than an artillary unit, sorry, but this is an easy 1 step work around.

Design:			This script is designed to work on artillery units, including missle launcher units, but may work on other armor, like tanks, that utilize a single shot cannon as the primary weapon of the vehicle.
	
Modification:	You may modify this script for personal use within your own mission as required to acheive your desired effect.
				Please do not redistribute a modified version without contacting me first.
				
Limitations:	You may NOT use or distribute this script on any sort of monitized platform. No exceptions without written consent from Mynock.

License:		All stardard Bohemia Interactive and Arma licenses apply.
				Distributed under the Creative Commons License	BY + NC + SA.
				
Crediting:		Crediting is not required, but is appreciated if you use this in your mission, as is or modified for your own personal use.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Argument  0:  Unit [Required] (If used in the unit's init field, "this" can be used, otherwise the variable name is required)

Argument  1:  Target [Required] (Variable name assigned to target; must be an object, do not use a marker. The reason for this is the ability to cancel the loop at any time by deleting the object or destroying it.)

Argument  2:  Gun Elevation | Number [Optional, default is 5000] (Set's how high the gunner will aim above the target, requires testing if looking for a specific angle, this script is not designed for accurate bombardments)

Argument  3:  Delete Shell | Boolean [Optional, default is true] (True to delete the shell after it is fired, false to allow shell to travel and impact ground)

Argument  4:  Resupply | Boolean [Optional, default is true] (True to resupply the unit with ammunition after it runs out, false to allow unit to run out of ammunition)

Argument  5:  Captivity State | Boolean [Optional, default is false] (True to set unit state to captive, false to set unit state to not captive)

Argument  6:  Random Firing Delay | Boolean [Optional, default is false] (True to allow for a random delay between shots, false to allow unit to fire as soon as next round is available)

Argument  7:  Minimum Delay | Number [Optional, requires Argument 6 to be true] (The minimum delay time between shots)

Argument  8:  Random Delay | Number [Optional, requires Argument 6 to be true] (How many possible random seconds beyond the minimum delay in Argument 7 to delay the next shot)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Usage example: null = [this, myTarget, 4000, true, true, true, true, 5, 10] execVM "MNK_Artillery.sqf";

*/

params[["_unit", objNull], ["_target", objNull], ["_barrel", 5000], ["_projectile", true], ["_reload", true], ["_captive", false], ["_delayrandom", false], ["_delaymin", 0], ["_drn", 0]];

if (isNull _unit || isNull _target) exitWith {};

if (_captive) then {
	_unit setCaptive true;
};

while {alive _unit && alive _target} do {	
	
	if (_projectile) then {
	_unit addEventHandler ["Fired",{(_this select 6);
	deleteVehicle (_this select 6)}];
	};
	
	_unit doWatch [getPos _target select 0, getPos _target select 1, _barrel];
	sleep 2;
	_unit fire ((weapons _unit) select 0); //if the unit isn't firing the main gun, try select 1 or select 2 until you find the correct weapon, this may be required when running on non-vanilla units
	//_unit fire (currentWeapon _unit); //uncomment and use this as a backup if the previous firing command fails but DO NOT USE BOTH AT THE SAME TIME
	
	if (_reload) then {
	_count = _unit ammo ((weapons _unit) select 0); //use the same select number from the previous section under the fire command if you had to change it, otherwise you will be reloading the wrong weapon
	//_count = _unit ammo (currentWeapon _unit); //uncomment and use this as a backup if the previous resupply command fails but DO NOT USE BOTH AT THE SAME TIME
		if (_count == 0) then {
		_unit setVehicleAmmoDef 1;
		};
	};
	
	if (_delayrandom) then {
	_num = _delaymin + (random _drn);
	sleep _num;
	};
};