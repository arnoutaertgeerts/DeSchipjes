within DeSchipjes.Grids;
partial model FullGrid
  extends Interfaces.BaseClasses.Grid(
    final dp_nominal=
      11*haarhakkerHouse1.heatingSystem.dp_nominal+11*dHConnection1.dp_nominal, strobe(
      nOcc=11,
      StROBe_P=true,
      FilNam_P="P.txt"));

  parameter Boolean modulation=true;
  parameter Modelica.SIunits.Length length = 15 "Lengths of the DH connections";

  parameter Real KVs[11] = ones(11) "KV values of the main house valves";

  Dwellings.Building        haarhakkerHouse1(
    modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(
        branch(heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
      heatingSystem(
      QNom=QNom,
      TSupply=TSupplyRad,
      TReturn=TReturnRad,
      KV=KVs[1],
      modulation=false)   constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
        KV=KVs[1],
        QNom=QNom,
        TSupply=TSupplyRad,
        TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(VZones=
          haarhakkerHouse1.building.VZones))
    annotation (Placement(transformation(extent={{-76,80},{-56,100}})));
  Dwellings.Building petersleiHouse6(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(
        branch(heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
      heatingSystem(
        KV=KVs[6],
        QNom=QNom,
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
        QNom=QNom,
        KV=KVs[6],
        TSupply=TSupplyRad,
        TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=6, VZones=
          petersleiHouse6.building.VZones))
    annotation (Placement(transformation(extent={{74,44},{94,64}})));
  DistrictHeating.Interfaces.DHConnection dHConnection1(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-66,62})));

  Dwellings.Building haarhakkerHouse2(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        KV=KVs[2],
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          KV=KVs[2],
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=2, VZones=
          haarhakkerHouse2.building.VZones))
    annotation (Placement(transformation(extent={{-52,80},{-32,100}})));
  Dwellings.Building petersleiHouse7(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        KV=KVs[7],
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          KV=KVs[7],
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=7, VZones=
          petersleiHouse7.building.VZones))
    annotation (Placement(transformation(extent={{74,18},{94,38}})));
  Dwellings.Building haarhakkerHouse3(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        KV=KVs[3],
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          KV=KVs[3],
          TSupply=TSupplyRad,
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=3, VZones=
          haarhakkerHouse3.building.VZones))
    annotation (Placement(transformation(extent={{-28,80},{-8,100}})));
  Dwellings.Building haarhakkerHouse4(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        KV=KVs[4],
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          KV=KVs[4],
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=4, VZones=
          haarhakkerHouse4.building.VZones))
    annotation (Placement(transformation(extent={{-4,80},{16,100}})));
  Dwellings.Building petersleiHouse9(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(
        branch(heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
      heatingSystem(
      QNom=QNom,
      KV=KVs[9],
      TSupply=TSupplyRad,
      TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
      QNom=QNom,
      KV=KVs[9],
      TSupply=TSupplyRad,
      TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=9, VZones=
          petersleiHouse9.building.VZones))
    annotation (Placement(transformation(extent={{74,-30},{94,-10}})));
  Dwellings.Building petersleiHouse8(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        KV=KVs[8],
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          KV=KVs[8],
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=8, VZones=
          petersleiHouse8.building.VZones))
    annotation (Placement(transformation(extent={{74,-6},{94,14}})));
  Dwellings.Building haarhakkerHouse5(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
       heatingSystem(
        QNom=QNom,
        KV=KVs[5],
        TSupply=TSupplyRad,
        TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
          QNom=QNom,
          TSupply=TSupplyRad,
          KV=KVs[5],
          TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=5, VZones=
          haarhakkerHouse5.building.VZones))
    annotation (Placement(transformation(extent={{20,80},{40,100}})));
  Dwellings.Building petersleiHouse10(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(
        branch(heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
      heatingSystem(
      QNom=QNom,
      KV=KVs[10],
      TSupply=TSupplyRad,
      TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
      QNom=QNom,
      TSupply=TSupplyRad,
      KV=KVs[10],
      TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=10, VZones=
          petersleiHouse10.building.VZones))
    annotation (Placement(transformation(extent={{74,-54},{94,-34}})));
  Dwellings.Building petersleiHouse11(
  modulation=modulation,
    each standAlone=true,
    redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(
        branch(heatLosses=false)),
    each isDH=true,
    redeclare each package Medium = Medium,
    redeclare each replaceable
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
      heatingSystem(
      QNom=QNom,
      KV=KVs[11],
      TSupply=TSupplyRad,
      TReturn=TReturnRad) constrainedby
      DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators(
      QNom=QNom,
      TSupply=TSupplyRad,
      KV=KVs[11],
      TReturn=TReturnRad),
    redeclare each replaceable
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=11, VZones=
          petersleiHouse11.building.VZones))
    annotation (Placement(transformation(extent={{74,-78},{94,-58}})));
  DistrictHeating.Interfaces.DHConnection dHConnection2(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-42,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection3(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection4(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={6,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection5(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection6(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,38})));
  DistrictHeating.Interfaces.DHConnection dHConnection7(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,14})));
  DistrictHeating.Interfaces.DHConnection dHConnection8(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-10})));
  DistrictHeating.Interfaces.DHConnection dHConnection9(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-34})));
  DistrictHeating.Interfaces.DHConnection dHConnection10(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-58})));
  DistrictHeating.Interfaces.DHConnection dHConnection11(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-82})));
  Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,90})));
  Modelica.Blocks.Interfaces.RealOutput valveOpenings[11] annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,40}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,60})));
equation
  connect(port_a, dHConnection1.port_a1) annotation (Line(
      points={{-100,0},{-86,0},{-86,68},{-76,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_b1, dHConnection2.port_a1) annotation (Line(
      points={{-56,68},{-52,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_a2, dHConnection2.port_b2) annotation (Line(
      points={{-56,56},{-52,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.port_b1, dHConnection3.port_a1) annotation (Line(
      points={{-32,68},{-28,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.port_a2, dHConnection3.port_b2) annotation (Line(
      points={{-32,56},{-32,56},{-30,56},{-30,56},{-28,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.port_b1, dHConnection4.port_a1) annotation (Line(
      points={{-8,68},{-4,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.port_a2, dHConnection4.port_b2) annotation (Line(
      points={{-8,56},{-4,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection4.port_b1, dHConnection5.port_a1) annotation (Line(
      points={{16,68},{20,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection4.port_a2, dHConnection5.port_b2) annotation (Line(
      points={{16,56},{20,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_a2, dHConnection6.port_b2) annotation (Line(
      points={{40,56},{48,56},{48,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_b1, dHConnection6.port_a1) annotation (Line(
      points={{40,68},{60,68},{60,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortIn, haarhakkerHouse1.flowPort_return)
    annotation (Line(
      points={{-68,72},{-68,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortOut, haarhakkerHouse1.flowPort_supply)
    annotation (Line(
      points={{-64,72},{-64,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortIn, haarhakkerHouse2.flowPort_return)
    annotation (Line(
      points={{-44,72},{-44,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortOut, haarhakkerHouse2.flowPort_supply)
    annotation (Line(
      points={{-40,72},{-40,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortIn, haarhakkerHouse3.flowPort_return)
    annotation (Line(
      points={{-20,72},{-20,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortOut, haarhakkerHouse3.flowPort_supply)
    annotation (Line(
      points={{-16,72},{-16,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.flowPortIn, haarhakkerHouse4.flowPort_return)
    annotation (Line(
      points={{4,72},{4,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.flowPortOut, haarhakkerHouse4.flowPort_supply)
    annotation (Line(
      points={{8,72},{8,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection5.flowPortIn, haarhakkerHouse5.flowPort_return)
    annotation (Line(
      points={{28,72},{28,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection5.flowPortOut, haarhakkerHouse5.flowPort_supply)
    annotation (Line(
      points={{32,72},{32,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.port_a2, dHConnection7.port_b2) annotation (Line(
      points={{48,28},{48,24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.port_b1, dHConnection7.port_a1) annotation (Line(
      points={{60,28},{60,24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.port_a2, dHConnection8.port_b2) annotation (Line(
      points={{48,4},{48,1.77636e-15}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.port_b1, dHConnection8.port_a1) annotation (Line(
      points={{60,4},{60,-1.77636e-15}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortIn, petersleiHouse7.flowPort_return)
    annotation (Line(
      points={{64,16},{82,16},{82,18},{82,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortIn, petersleiHouse6.flowPort_return)
    annotation (Line(
      points={{64,40},{82,40},{82,44}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortOut, petersleiHouse6.flowPort_supply)
    annotation (Line(
      points={{64,36},{86,36},{86,44}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortOut, petersleiHouse7.flowPort_supply)
    annotation (Line(
      points={{64,12},{86,12},{86,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.flowPortIn, petersleiHouse8.flowPort_return)
    annotation (Line(
      points={{64,-8},{82,-8},{82,-6},{82,-6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.flowPortOut, petersleiHouse8.flowPort_supply)
    annotation (Line(
      points={{64,-12},{86,-12},{86,-6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection9.flowPortIn, petersleiHouse9.flowPort_return)
    annotation (Line(
      points={{64,-32},{82,-32},{82,-30},{82,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.port_a2, dHConnection9.port_b2) annotation (Line(
      points={{48,-20},{48,-24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection8.port_b1, dHConnection9.port_a1) annotation (Line(
      points={{60,-20},{60,-24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection9.flowPortOut, petersleiHouse9.flowPort_supply)
    annotation (Line(
      points={{64,-36},{86,-36},{86,-30}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection9.port_a2, dHConnection10.port_b2) annotation (Line(
      points={{48,-44},{48,-48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection9.port_b1, dHConnection10.port_a1) annotation (Line(
      points={{60,-44},{60,-48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection10.flowPortIn, petersleiHouse10.flowPort_return)
    annotation (Line(
      points={{64,-56},{82,-56},{82,-54},{82,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection10.flowPortOut, petersleiHouse10.flowPort_supply)
    annotation (Line(
      points={{64,-60},{86,-60},{86,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection11.port_b2, dHConnection10.port_a2) annotation (Line(
      points={{48,-72},{48,-68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection11.port_a1, dHConnection10.port_b1) annotation (Line(
      points={{60,-72},{60,-68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection11.flowPortIn, petersleiHouse11.flowPort_return)
    annotation (Line(
      points={{64,-80},{82,-80},{82,-78},{82,-78}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection11.flowPortOut, petersleiHouse11.flowPort_supply)
    annotation (Line(
      points={{64,-84},{86,-84},{86,-78}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(port_b, dHConnection1.port_b2) annotation (Line(
      points={{100,0},{100,-100},{-32,-100},{-32,0},{-80,0},{-80,56},{-76,56}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(haarhakkerHouse2.u, haarhakkerHouse1.u) annotation (Line(
      points={{-49,90},{-54,90},{-54,98},{-80,98},{-80,90},{-73,90}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.u, haarhakkerHouse5.u) annotation (Line(
      points={{-25,90},{-30,90},{-30,98},{18,98},{18,90},{23,90}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(haarhakkerHouse4.u, haarhakkerHouse5.u) annotation (Line(
      points={{-1,90},{-6,90},{-6,98},{18,98},{18,90},{23,90}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(petersleiHouse6.u, petersleiHouse7.u) annotation (Line(
      points={{77,54},{72,54},{72,28},{77,28}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(petersleiHouse8.u, petersleiHouse7.u) annotation (Line(
      points={{77,4},{72,4},{72,28},{77,28}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(petersleiHouse9.u, petersleiHouse7.u) annotation (Line(
      points={{77,-20},{72,-20},{72,4},{72,4},{72,28},{77,28}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(petersleiHouse10.u, petersleiHouse7.u) annotation (Line(
      points={{77,-44},{72,-44},{72,28},{77,28}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(petersleiHouse11.u, petersleiHouse7.u) annotation (Line(
      points={{77,-68},{72,-68},{72,28},{77,28}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.u, haarhakkerHouse1.u) annotation (Line(
      points={{-25,90},{-30,90},{-30,98},{-80,98},{-80,90},{-73,90}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(petersleiHouse6.u, haarhakkerHouse5.u) annotation (Line(
      points={{77,54},{72,54},{72,98},{18,98},{18,90},{23,90}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(u, haarhakkerHouse1.u) annotation (Line(
      points={{-120,60},{-92,60},{-92,98},{-80,98},{-80,90},{-73,90}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(haarhakkerHouse1.valveOpening, valveOpenings[1]) annotation (Line(
      points={{-73,88},{-90,88},{-90,49.0909},{-110,49.0909}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse2.valveOpening, valveOpenings[2]) annotation (Line(
      points={{-49,88},{-54,88},{-54,47.2727},{-110,47.2727}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.valveOpening, valveOpenings[3]) annotation (Line(
      points={{-25,88},{-30,88},{-30,45.4545},{-110,45.4545}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse4.valveOpening, valveOpenings[4]) annotation (Line(
      points={{-1,88},{-6,88},{-6,43.6364},{-110,43.6364}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse5.valveOpening, valveOpenings[5]) annotation (Line(
      points={{23,88},{18,88},{18,41.8182},{-110,41.8182}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse6.valveOpening, valveOpenings[6]) annotation (Line(
      points={{77,52},{42,52},{42,40},{-110,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse7.valveOpening, valveOpenings[7]) annotation (Line(
      points={{77,26},{42,26},{42,38.1818},{-110,38.1818}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse8.valveOpening, valveOpenings[8]) annotation (Line(
      points={{77,2},{40,2},{40,36.3636},{-110,36.3636}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse9.valveOpening, valveOpenings[9]) annotation (Line(
      points={{77,-22},{38,-22},{38,34.5455},{-110,34.5455}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse10.valveOpening, valveOpenings[10]) annotation (Line(
      points={{77,-46},{36,-46},{36,32.7273},{-110,32.7273}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse11.valveOpening, valveOpenings[11]) annotation (Line(
      points={{77,-70},{34,-70},{34,30.9091},{-110,30.9091}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Line(
          points={{-100,60},{-40,60},{-40,40}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-40,60},{0,60},{0,40}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{0,60},{40,60},{40,40}},
          color={0,0,255},
          smooth=Smooth.None)}));
end FullGrid;
