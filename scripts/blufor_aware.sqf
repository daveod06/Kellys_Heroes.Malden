{ 
  if ((side _x) == west) then 
  {
     _x setSkill ["spotTime",0.6];
     _x setSkill ["spotDistance",0.5];
  }; 
} forEach allUnits;