{
  if ((side _x) == west) then 
  {
     _x setSkill ["spotTime",0.2];
     _x setSkill ["spotDistance",0.1];
  }; 
} forEach allUnits;