within DeSchipjes.Grids.BaseClasses;
partial model PartialArrayGrid
  //Extensions
  extends DeSchipjes.Interfaces.BaseClasses.Grid(final dp_nominal=
    sum(buildings.heatingSystem.dp_nominal) + sum(dHConnections.dp_nominal));

  //Parameters
  parameter Integer nBuildings(min=2)=2;
  parameter Real lengths[nBuildings]=fill(15, nBuildings);
  parameter Boolean reducedOrder = false;

  //Variables

  //Components
  replaceable IDEAS.Interfaces.Building[nBuildings] buildings(
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each IDEAS.Occupants.Standards.None occupant(TSet_val=fill(273.15 + 21,
          6)),
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        TSupply=TSupplyRad,
        TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure)
    annotation (Placement(transformation(extent={{-62,48},{-82,68}})));

  DistrictHeating.Interfaces.DHConnection[nBuildings] dHConnections(
    length=lengths,
    m_flow_nominal=1,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-11},{-10,11}},
        rotation=90,
        origin={-48,37})));

equation
  connect(port_a, dHConnections[1].flowPort_supply_in) annotation (Line(
      points={{-100,0},{-50,0},{-50,29.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnections[1].flowPort_return_out, port_b) annotation (Line(
      points={{-38.2,30},{-38,30},{-38,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));

  for i in 1:nBuildings loop
    connect(dHConnections[i].flowPortOut,buildings[i].flowPort_supply) annotation (
      Line(
      points={{-56,38},{-74,38},{-74,48}},
      color={0,0,0},
      smooth=Smooth.None));
    connect(dHConnections[i].flowPortIn,buildings[i].flowPort_return) annotation (Line(
      points={{-56,42},{-70,42},{-70,48}},
      color={0,0,0},
      smooth=Smooth.None));
  end for;

  for i in 1:nBuildings-1 loop
    connect(dHConnections[i].flowPort_supply_out, dHConnections[i+1].flowPort_supply_in);
    connect(dHConnections[i].flowPort_return_in, dHConnections[i+1].flowPort_return_out);
  end for;
end PartialArrayGrid;
