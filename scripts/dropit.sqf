_activatingPlayer = _this select 1;
money = "Land_Money_F" createVehicle (getPos _activatingPlayer);
_activatingPlayer removeAction NewAct;
money addaction ["Pick Up Money","scripts\NewAddaction.sqf"];