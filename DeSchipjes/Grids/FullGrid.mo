within DeSchipjes.Grids;
partial model FullGrid
  extends Interfaces.BaseClasses.Grid(
    final dp_nominal=
      11*haarhakkerHouse.heatingSystem.dp_nominal+11*dHConnection.dp_nominal, strobe(
      nOcc=11,
      StROBe_P=true,
      FilNam_P="P.txt"));

  parameter Modelica.SIunits.Length length = 15 "Lengths of the DH connections";

  IDEAS.Interfaces.Building haarhakkerHouse(
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
          haarhakkerHouse.building.VZones))
    annotation (Placement(transformation(extent={{-56,80},{-76,100}})));
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
          haarhakkerHouse.building.VZones, id=6))
    annotation (Placement(transformation(extent={{90,46},{70,66}})));
  DistrictHeating.Interfaces.DHConnection dHConnection(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-66,62})));
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
    annotation (Placement(transformation(extent={{-32,80},{-52,100}})));
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
          haarhakkerHouse.building.VZones, id=7))
    annotation (Placement(transformation(extent={{90,20},{70,40}})));
  DistrictHeating.Interfaces.DHConnection dHConnection1(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-42,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection2(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,42})));
  DistrictHeating.Interfaces.DHConnection dHConnection3(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,18})));
  IDEAS.Interfaces.Building haarhakkerHouse2(
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
          haarhakkerHouse.building.VZones, id=3))
    annotation (Placement(transformation(extent={{-8,80},{-28,100}})));
  DistrictHeating.Interfaces.DHConnection dHConnection4(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-18,62})));
  IDEAS.Interfaces.Building haarhakkerHouse3(
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
          haarhakkerHouse.building.VZones, id=4))
    annotation (Placement(transformation(extent={{16,80},{-4,100}})));
  DistrictHeating.Interfaces.DHConnection dHConnection5(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={6,62})));
  IDEAS.Interfaces.Building petersleiHouse2(
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
          haarhakkerHouse.building.VZones, id=9))
    annotation (Placement(transformation(extent={{90,-28},{70,-8}})));
  DistrictHeating.Interfaces.DHConnection dHConnection6(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,-6})));
  DistrictHeating.Interfaces.DHConnection dHConnection7(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,-30})));
  IDEAS.Interfaces.Building petersleiHouse3(
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
          haarhakkerHouse.building.VZones, id=8))
    annotation (Placement(transformation(extent={{90,-4},{70,16}})));
  IDEAS.Interfaces.Building haarhakkerHouse4(
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
          haarhakkerHouse.building.VZones, id=5))
    annotation (Placement(transformation(extent={{40,80},{20,100}})));
  DistrictHeating.Interfaces.DHConnection dHConnection8(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={30,62})));
  IDEAS.Interfaces.Building petersleiHouse4(
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
          haarhakkerHouse.building.VZones, id=10))
    annotation (Placement(transformation(extent={{90,-52},{70,-32}})));
  DistrictHeating.Interfaces.DHConnection dHConnection9(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,-54})));
  IDEAS.Interfaces.Building petersleiHouse5(
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
          haarhakkerHouse.building.VZones, id=11))
    annotation (Placement(transformation(extent={{90,-76},{70,-56}})));
  DistrictHeating.Interfaces.DHConnection dHConnection10(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,-78})));
equation
  connect(dHConnection.flowPortOut, haarhakkerHouse.flowPort_supply)
    annotation (Line(
      points={{-68,72},{-68,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.flowPortIn, haarhakkerHouse.flowPort_return) annotation (
     Line(
      points={{-64,72},{-64,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(port_a, dHConnection.port_b1) annotation (Line(
      points={{-100,0},{-90,0},{-90,68},{-76,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection.port_a1, dHConnection1.port_b1) annotation (Line(
      points={{-56,68},{-52,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortOut, haarhakkerHouse1.flowPort_supply)
    annotation (Line(
      points={{-44,72},{-44,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse1.flowPort_return, dHConnection1.flowPortIn)
    annotation (Line(
      points={{-40,80},{-40,72}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.port_a2, dHConnection.port_b2) annotation (Line(
      points={{-52,56},{-56,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortOut, petersleiHouse.flowPort_supply)
    annotation (Line(
      points={{64,44},{78,44},{78,46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortIn, petersleiHouse.flowPort_return) annotation (
     Line(
      points={{64,40},{82,40},{82,46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.port_a1, dHConnection3.port_b1) annotation (Line(
      points={{60,32},{60,28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortOut, petersleiHouse1.flowPort_supply)
    annotation (Line(
      points={{64,20},{78,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortIn, petersleiHouse1.flowPort_return)
    annotation (Line(
      points={{64,16},{82,16},{82,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.flowPortIn, haarhakkerHouse2.flowPort_return)
    annotation (Line(
      points={{-16,72},{-16,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.port_a1, dHConnection5.port_b1) annotation (Line(
      points={{-8,68},{-4,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_a2, dHConnection4.port_b2) annotation (Line(
      points={{-4,56},{-8,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_a1, dHConnection4.port_b1) annotation (Line(
      points={{-32,68},{-28,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_b2, dHConnection4.port_a2) annotation (Line(
      points={{-32,56},{-28,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(haarhakkerHouse2.flowPort_supply, dHConnection4.flowPortOut)
    annotation (Line(
      points={{-20,80},{-20,72}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.flowPort_supply, dHConnection5.flowPortOut)
    annotation (Line(
      points={{4,80},{4,72}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.flowPort_return, dHConnection5.flowPortIn)
    annotation (Line(
      points={{8,80},{8,72}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.port_b2, dHConnection3.port_a2) annotation (Line(
      points={{48,32},{48,28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.port_a1,dHConnection7. port_b1) annotation (Line(
      points={{60,-16},{60,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortOut,petersleiHouse2. flowPort_supply)
    annotation (Line(
      points={{64,-28},{78,-28}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortIn,petersleiHouse2. flowPort_return)
    annotation (Line(
      points={{64,-32},{82,-32},{82,-28}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.port_b2, dHConnection7.port_a2) annotation (Line(
      points={{48,-16},{48,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.port_a2, dHConnection3.port_b2) annotation (Line(
      points={{48,4},{48,8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.port_a1, dHConnection6.port_b1) annotation (Line(
      points={{60,8},{60,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortOut, petersleiHouse3.flowPort_supply)
    annotation (Line(
      points={{64,-4},{78,-4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortIn, petersleiHouse3.flowPort_return)
    annotation (Line(
      points={{64,-8},{82,-8},{82,-4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.port_a2, port_b) annotation (Line(
      points={{-76,56},{-80,56},{-80,-60},{-40,-60},{-40,-98},{100,-98},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(haarhakkerHouse4.flowPort_supply, dHConnection8.flowPortOut)
    annotation (Line(
      points={{28,80},{28,72}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse4.flowPort_return, dHConnection8.flowPortIn)
    annotation (Line(
      points={{32,80},{32,72}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.port_b1, dHConnection5.port_a1) annotation (Line(
      points={{20,68},{16,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_b2, dHConnection8.port_a2) annotation (Line(
      points={{16,56},{20,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection8.port_b2, dHConnection2.port_a2) annotation (Line(
      points={{40,56},{48,56},{48,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection8.port_a1, dHConnection2.port_b1) annotation (Line(
      points={{40,68},{60,68},{60,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection9.flowPortOut,petersleiHouse4. flowPort_supply)
    annotation (Line(
      points={{64,-52},{78,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection9.flowPortIn,petersleiHouse4. flowPort_return)
    annotation (Line(
      points={{64,-56},{82,-56},{82,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection7.port_b2, dHConnection9.port_a2) annotation (Line(
      points={{48,-40},{48,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.port_a1, dHConnection9.port_b1) annotation (Line(
      points={{60,-40},{60,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection10.flowPortOut, petersleiHouse5.flowPort_supply)
    annotation (Line(
      points={{64,-76},{78,-76}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection10.flowPortIn, petersleiHouse5.flowPort_return)
    annotation (Line(
      points={{64,-80},{82,-80},{82,-76}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection9.port_b2, dHConnection10.port_a2) annotation (Line(
      points={{48,-64},{48,-68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection9.port_a1, dHConnection10.port_b1) annotation (Line(
      points={{60,-64},{60,-68}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end FullGrid;
