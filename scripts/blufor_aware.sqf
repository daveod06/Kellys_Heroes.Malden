{ 
  if ((side _x) == west) then 
  {
     _x setSkill ["spotTime",0.4];
     _x setSkill ["spotDistance",0.4];
  }; 
} forEach allUnits;