within DeSchipjes.Grids;
partial model FullGrid
  extends Interfaces.BaseClasses.Grid(
    final dp_nominal=
      11*haarhakkerHouse1.heatingSystem.dp_nominal+11*dHConnection1.dp_nominal, strobe(
      nOcc=11,
      StROBe_P=true,
      FilNam_P="P.txt"));

  parameter Modelica.SIunits.Length length = 15 "Lengths of the DH connections";

  IDEAS.Interfaces.Building haarhakkerHouse1(
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
          haarhakkerHouse1.building.VZones))
    annotation (Placement(transformation(extent={{-76,80},{-56,100}})));
  IDEAS.Interfaces.Building petersleiHouse6(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=6, VZones=
          petersleiHouse6.building.VZones))
    annotation (Placement(transformation(extent={{70,46},{90,66}})));
  DistrictHeating.Interfaces.DHConnection dHConnection1(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-66,62})));
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=2, VZones=
          haarhakkerHouse2.building.VZones))
    annotation (Placement(transformation(extent={{-52,80},{-32,100}})));
  IDEAS.Interfaces.Building petersleiHouse7(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=7, VZones=
          petersleiHouse7.building.VZones))
    annotation (Placement(transformation(extent={{70,20},{90,40}})));
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=3, VZones=
          haarhakkerHouse3.building.VZones))
    annotation (Placement(transformation(extent={{-28,80},{-8,100}})));
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=4, VZones=
          haarhakkerHouse4.building.VZones))
    annotation (Placement(transformation(extent={{-4,80},{16,100}})));
  IDEAS.Interfaces.Building petersleiHouse9(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=9, VZones=
          petersleiHouse9.building.VZones))
    annotation (Placement(transformation(extent={{70,-28},{90,-8}})));
  IDEAS.Interfaces.Building petersleiHouse8(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=8, VZones=
          petersleiHouse8.building.VZones))
    annotation (Placement(transformation(extent={{70,-4},{90,16}})));
  IDEAS.Interfaces.Building haarhakkerHouse5(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=5, VZones=
          haarhakkerHouse5.building.VZones))
    annotation (Placement(transformation(extent={{20,80},{40,100}})));
  IDEAS.Interfaces.Building petersleiHouse10(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=10, VZones=
          petersleiHouse10.building.VZones))
    annotation (Placement(transformation(extent={{70,-52},{90,-32}})));
  IDEAS.Interfaces.Building petersleiHouse11(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=11, VZones=
          petersleiHouse11.building.VZones))
    annotation (Placement(transformation(extent={{68,-76},{88,-56}})));
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
        origin={54,40})));
  DistrictHeating.Interfaces.DHConnection dHConnection7(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,16})));
  DistrictHeating.Interfaces.DHConnection dHConnection8(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-8})));
  DistrictHeating.Interfaces.DHConnection dHConnection9(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-32})));
  DistrictHeating.Interfaces.DHConnection dHConnection10(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-56})));
  DistrictHeating.Interfaces.DHConnection dHConnection11(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-80})));
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
      points={{-32,56},{-32,58},{-30,58},{-30,56},{-28,56}},
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
      points={{40,56},{48,56},{48,50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_b1, dHConnection6.port_a1) annotation (Line(
      points={{40,68},{60,68},{60,50}},
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
      points={{48,30},{48,26}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.port_b1, dHConnection7.port_a1) annotation (Line(
      points={{60,30},{60,26}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.port_a2, dHConnection8.port_b2) annotation (Line(
      points={{48,6},{48,2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.port_b1, dHConnection8.port_a1) annotation (Line(
      points={{60,6},{60,2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortIn, petersleiHouse7.flowPort_return)
    annotation (Line(
      points={{64,18},{78,18},{78,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortIn, petersleiHouse6.flowPort_return)
    annotation (Line(
      points={{64,42},{78,42},{78,46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortOut, petersleiHouse6.flowPort_supply)
    annotation (Line(
      points={{64,38},{82,38},{82,46}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortOut, petersleiHouse7.flowPort_supply)
    annotation (Line(
      points={{64,14},{82,14},{82,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.flowPortIn, petersleiHouse8.flowPort_return)
    annotation (Line(
      points={{64,-6},{78,-6},{78,-4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.flowPortOut, petersleiHouse8.flowPort_supply)
    annotation (Line(
      points={{64,-10},{82,-10},{82,-4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection9.flowPortIn, petersleiHouse9.flowPort_return)
    annotation (Line(
      points={{64,-30},{78,-30},{78,-28}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection8.port_a2, dHConnection9.port_b2) annotation (Line(
      points={{48,-18},{48,-22}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection8.port_b1, dHConnection9.port_a1) annotation (Line(
      points={{60,-18},{60,-22}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection9.flowPortOut, petersleiHouse9.flowPort_supply)
    annotation (Line(
      points={{64,-34},{82,-34},{82,-28}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection9.port_a2, dHConnection10.port_b2) annotation (Line(
      points={{48,-42},{48,-46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection9.port_b1, dHConnection10.port_a1) annotation (Line(
      points={{60,-42},{60,-46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection10.flowPortIn, petersleiHouse10.flowPort_return)
    annotation (Line(
      points={{64,-54},{78,-54},{78,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection10.flowPortOut, petersleiHouse10.flowPort_supply)
    annotation (Line(
      points={{64,-58},{82,-58},{82,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection11.port_b2, dHConnection10.port_a2) annotation (Line(
      points={{48,-70},{48,-66}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection11.port_a1, dHConnection10.port_b1) annotation (Line(
      points={{60,-70},{60,-66}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection11.flowPortIn, petersleiHouse11.flowPort_return)
    annotation (Line(
      points={{64,-78},{76,-78},{76,-76}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection11.flowPortOut, petersleiHouse11.flowPort_supply)
    annotation (Line(
      points={{64,-82},{80,-82},{80,-76}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(port_b, dHConnection1.port_b2) annotation (Line(
      points={{100,0},{100,-100},{-32,-100},{-32,0},{-80,0},{-80,56},{-76,56}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end FullGrid;
