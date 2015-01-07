within DeSchipjes;
model PrototypeBuilding "A complete building model for testing"

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  IDEAS.Interfaces.Building building(
    redeclare IDEAS.Buildings.Validation.BaseClasses.Occupant.None occupant,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare DeSchipjes.HeatingSystems.RadiatorsBoiler heatingSystem(
      floorHeating=false,
      radiators=true,
      QNom={2113,1409,1,1025,804,1}),
    standAlone=true,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare DeSchipjes.Structures.Woning140 building(isolatieTest=0.02))
    annotation (Placement(transformation(extent={{-10,-6},{10,14}})));
end PrototypeBuilding;
