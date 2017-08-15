{
  if ((side _x) == west) then 
  {
     _x setSkill ["spotTime",0.0];
     _x setSkill ["spotDistance",0.0];
  }; 
} forEach allUnits;