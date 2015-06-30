within DeSchipjes.Grids;
partial model FullGrid
  extends Interfaces.BaseClasses.Grid(
    final dp_nominal=
      11*haarhakkerHouse1.heatingSystem.dp_nominal+11*dHConnection1.dp_nominal, strobe(
      nOcc=11,
      StROBe_P=true,
      FilNam_P="P.txt"));

  parameter Boolean modulating=true;
  parameter Modelica.SIunits.Length length = 15 "Lengths of the DH connections";

  parameter Real KVs[11] = ones(11) "KV values of the main house valves";

  Dwellings.Building        haarhakkerHouse1(
    modulating=modulating,
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
      modulating=false)   constrainedby
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
  modulating=modulating,
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-66,62})));

  Dwellings.Building haarhakkerHouse2(
  modulating=modulating,
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
  modulating=modulating,
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
  modulating=modulating,
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
  modulating=modulating,
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
  modulating=modulating,
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
  modulating=modulating,
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
  modulating=modulating,
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
  modulating=modulating,
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
  modulating=modulating,
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
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-42,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection3(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection4(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={6,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection5(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,62})));
  DistrictHeating.Interfaces.DHConnection dHConnection6(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,38})));
  DistrictHeating.Interfaces.DHConnection dHConnection7(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,14})));
  DistrictHeating.Interfaces.DHConnection dHConnection8(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-10})));
  DistrictHeating.Interfaces.DHConnection dHConnection9(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-34})));
  DistrictHeating.Interfaces.DHConnection dHConnection10(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
                                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-58})));
  DistrictHeating.Interfaces.DHConnection dHConnection11(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-82})));
  Modelica.Blocks.Interfaces.RealInput u if modulating annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,90})));
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
      points={{-32,56},{-28,56}},
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
      points={{64,16},{82,16},{82,18}},
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
      points={{64,-8},{82,-8},{82,-6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.flowPortOut, petersleiHouse8.flowPort_supply)
    annotation (Line(
      points={{64,-12},{86,-12},{86,-6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection9.flowPortIn, petersleiHouse9.flowPort_return)
    annotation (Line(
      points={{64,-32},{82,-32},{82,-30}},
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
      points={{64,-56},{82,-56},{82,-54}},
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
      points={{64,-80},{82,-80},{82,-78}},
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

  connect(petersleiHouse6.supplyT, petersleiHouse7.supplyT) annotation (Line(
      points={{77,54},{74,54},{74,28},{77,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse11.supplyT, petersleiHouse7.supplyT) annotation (Line(
      points={{77,-68},{74,-68},{74,28},{77,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse8.supplyT, petersleiHouse7.supplyT) annotation (Line(
      points={{77,4},{74,4},{74,28},{77,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse9.supplyT, petersleiHouse7.supplyT) annotation (Line(
      points={{77,-20},{74,-20},{74,28},{77,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse10.supplyT, petersleiHouse7.supplyT) annotation (Line(
      points={{77,-44},{74,-44},{74,28},{77,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse5.supplyT, haarhakkerHouse1.supplyT) annotation (Line(
      points={{23,90},{20,90},{20,98},{-78,98},{-78,90},{-73,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse2.supplyT, haarhakkerHouse1.supplyT) annotation (Line(
      points={{-49,90},{-54,90},{-54,98},{-78,98},{-78,90},{-73,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.supplyT, haarhakkerHouse1.supplyT) annotation (Line(
      points={{-25,90},{-30,90},{-30,98},{-78,98},{-78,90},{-73,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(haarhakkerHouse4.supplyT, haarhakkerHouse1.supplyT) annotation (Line(
      points={{-1,90},{-4,90},{-4,98},{-78,98},{-78,90},{-73,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(petersleiHouse6.supplyT, haarhakkerHouse1.supplyT) annotation (Line(
      points={{77,54},{74,54},{74,98},{-78,98},{-78,90},{-73,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u, haarhakkerHouse1.supplyT) annotation (Line(
      points={{-120,60},{-92,60},{-92,98},{-78,98},{-78,90},{-73,90}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end FullGrid;
