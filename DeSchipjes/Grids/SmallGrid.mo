within DeSchipjes.Grids;
partial model SmallGrid
  extends Interfaces.BaseClasses.Grid(
    final dp_nominal=
      4*haarhakkerHouse1.heatingSystem.dp_nominal+4*dHConnection1.dp_nominal);

  parameter Modelica.SIunits.Length length = 15 "Lengths of the DH connections";

  IDEAS.Interfaces.Building haarhakkerHouse2(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=2, VZones=
          haarhakkerHouse2.building.VZones))
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  IDEAS.Interfaces.Building petersleiHouse3(
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=3, VZones=
          petersleiHouse3.building.VZones))
    annotation (Placement(transformation(extent={{50,10},{70,30}})));
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
          haarhakkerHouse1.building.VZones, id=1))
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
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
    redeclare each IDEAS.Occupants.Extern.StROBe occupant(id=4, VZones=
          petersleiHouse4.building.VZones))
    annotation (Placement(transformation(extent={{50,-24},{70,-4}})));
  DistrictHeating.Interfaces.DHConnection dHConnection1(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100),
    T_start=TGrid)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,24})));
  IDEAS.Interfaces.Building petersleiHouse5(
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
          petersleiHouse5.building.VZones))
    annotation (Placement(transformation(extent={{50,-54},{70,-34}})));
  DistrictHeating.Interfaces.DHConnection dHConnection2(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100),
    T_start=TGrid)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,24})));
  DistrictHeating.Interfaces.DHConnection dHConnection3(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100),
    T_start=TGrid)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,0})));
  DistrictHeating.Interfaces.DHConnection dHConnection4(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100),
    T_start=TGrid)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-30})));
  DistrictHeating.Interfaces.DHConnection dHConnection5(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100),
    T_start=TGrid)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-60})));
equation
  connect(port_a, dHConnection1.port_a1) annotation (Line(
      points={{-100,0},{-80,0},{-80,30},{-60,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortIn, haarhakkerHouse1.flowPort_return)
    annotation (Line(
      points={{-52,34},{-52,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortOut, haarhakkerHouse1.flowPort_supply)
    annotation (Line(
      points={{-48,34},{-48,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortIn, haarhakkerHouse2.flowPort_return)
    annotation (Line(
      points={{-12,34},{-12,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortOut, haarhakkerHouse2.flowPort_supply)
    annotation (Line(
      points={{-8,34},{-8,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.port_b1, dHConnection2.port_a1) annotation (Line(
      points={{-40,30},{-20,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_a2, dHConnection2.port_b2) annotation (Line(
      points={{-40,18},{-20,18}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.port_b2, dHConnection2.port_a2) annotation (Line(
      points={{24,10},{24,18},{0,18}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.port_b1, dHConnection3.port_a1) annotation (Line(
      points={{0,30},{36,30},{36,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.port_a2, dHConnection4.port_b2) annotation (Line(
      points={{24,-10},{24,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.port_b1, dHConnection4.port_a1) annotation (Line(
      points={{36,-10},{36,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection4.port_a2, dHConnection5.port_b2) annotation (Line(
      points={{24,-40},{24,-50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection4.port_b1, dHConnection5.port_a1) annotation (Line(
      points={{36,-40},{36,-50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortIn, petersleiHouse3.flowPort_return)
    annotation (Line(
      points={{40,2},{58,2},{58,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortOut, petersleiHouse3.flowPort_supply)
    annotation (Line(
      points={{40,-2},{62,-2},{62,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.flowPortIn, petersleiHouse4.flowPort_return)
    annotation (Line(
      points={{40,-28},{58,-28},{58,-24}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.flowPortOut, petersleiHouse4.flowPort_supply)
    annotation (Line(
      points={{40,-32},{62,-32},{62,-24}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection5.flowPortIn,petersleiHouse5. flowPort_return)
    annotation (Line(
      points={{40,-58},{58,-58},{58,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection5.flowPortOut,petersleiHouse5. flowPort_supply)
    annotation (Line(
      points={{40,-62},{62,-62},{62,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.port_b2, port_b) annotation (Line(
      points={{-60,18},{-68,18},{-68,-80},{80,-80},{80,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SmallGrid;
