sleep 1.0;
{ 
  if ((side _x) == west) then 
  {
     _x setSkill ["spotTime",1.0];
     _x setSkill ["spotDistance",1.0];
  }; 
} forEach allUnits;
