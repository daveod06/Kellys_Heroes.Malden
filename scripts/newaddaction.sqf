_money = _this select 0;
deleteVehicle money1;
deleteVehicle _money;
private ["_activatingPlayer","_money"];
_activatingPlayer = _this select 1;
NewAct = _activatingPlayer addAction [("<t color=""#CC2900"">" + ("Deposit Money Here") + "</t>"), "scripts\Dropit.sqf", "radio", -1, false, true,"", "_this == _target"];