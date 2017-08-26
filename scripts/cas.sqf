//CAS attack

//_target = _this select 0; // position of object to be targeted
//_runType = _this select 1; // 0=guns 1=missiles 2=guns and missiles
//_dir = _this select 2; // attack direction
_target = kellys_car_1; // position of object to be targeted
_runType = 0; // 0=guns 1=missiles 2=guns and missiles
_dir = 15; // attack direction

_pos = getPosATL _target;
_center = createCenter sideLogic;
_group = createGroup _center;     
_cas = _group createUnit ["ModuleCAS_F",_pos , [], 0, ""]; 
_cas setVariable ["type", _runType ,true]; 
_cas setDir _dir;
