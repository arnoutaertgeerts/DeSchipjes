within DeSchipjes.Grids;
partial model SmallGrid
  extends Interfaces.BaseClasses.Grid(
    final dp_nominal=
      4*haarhakkerHouse.heatingSystem.dp_nominal+4*dHConnection.dp_nominal);

  parameter Modelica.SIunits.Length length = 15 "Lengths of the DH connections";

  IDEAS.Interfaces.Building haarhakkerHouse(
    each standAlone=true,
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(VZones=
          haarhakkerHouse.building.VZones))
    annotation (Placement(transformation(extent={{-40,18},{-60,38}})));
  IDEAS.Interfaces.Building petersleiHouse(
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(VZones=
          haarhakkerHouse.building.VZones, id=3))
    annotation (Placement(transformation(extent={{46,-22},{26,-2}})));
  DistrictHeating.Interfaces.DHConnection dHConnection(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-50,-6})));
  IDEAS.Interfaces.Building haarhakkerHouse1(
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(VZones=
          haarhakkerHouse.building.VZones, id=2))
    annotation (Placement(transformation(extent={{-10,18},{-30,38}})));
  IDEAS.Interfaces.Building petersleiHouse1(
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(VZones=
          haarhakkerHouse.building.VZones, id=4))
    annotation (Placement(transformation(extent={{46,-52},{26,-32}})));
  DistrictHeating.Interfaces.DHConnection dHConnection1(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-20,-6})));
  DistrictHeating.Interfaces.DHConnection dHConnection2(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={10,-30})));
  DistrictHeating.Interfaces.DHConnection dHConnection3(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={10,-58})));
equation
  connect(dHConnection.flowPortOut, haarhakkerHouse.flowPort_supply)
    annotation (Line(
      points={{-52,4},{-52,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.flowPortIn, haarhakkerHouse.flowPort_return) annotation (
     Line(
      points={{-48,4},{-48,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(port_a, dHConnection.port_b1) annotation (Line(
      points={{-100,0},{-60,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection.port_a1, dHConnection1.port_b1) annotation (Line(
      points={{-40,0},{-30,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortOut, haarhakkerHouse1.flowPort_supply)
    annotation (Line(
      points={{-22,4},{-22,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse1.flowPort_return, dHConnection1.flowPortIn)
    annotation (Line(
      points={{-18,18},{-18,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.port_a2, dHConnection.port_b2) annotation (Line(
      points={{-30,-12},{-40,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.port_a2, dHConnection1.port_b2) annotation (Line(
      points={{4,-20},{4,-12},{-10,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_a1, dHConnection2.port_b1) annotation (Line(
      points={{-10,0},{16,0},{16,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortOut, petersleiHouse.flowPort_supply)
    annotation (Line(
      points={{20,-28},{34,-28},{34,-22}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortIn, petersleiHouse.flowPort_return) annotation (
     Line(
      points={{20,-32},{38,-32},{38,-22}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.port_b2, dHConnection3.port_a2) annotation (Line(
      points={{4,-40},{4,-48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.port_a1, dHConnection3.port_b1) annotation (Line(
      points={{16,-40},{16,-48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortOut, petersleiHouse1.flowPort_supply)
    annotation (Line(
      points={{20,-56},{34,-56},{34,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortIn, petersleiHouse1.flowPort_return)
    annotation (Line(
      points={{20,-60},{38,-60},{38,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.port_a2, port_b) annotation (Line(
      points={{-60,-12},{-80,-12},{-80,-80},{80,-80},{80,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SmallGrid;
