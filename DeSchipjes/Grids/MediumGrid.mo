within DeSchipjes.Grids;
partial model MediumGrid
  extends Interfaces.BaseClasses.Grid;

  parameter Modelica.SIunits.Length length = 15 "Lengths of the DH connections";

  IDEAS.Interfaces.Building haarhakkerHouse(
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
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{-56,74},{-76,94}})));
  IDEAS.Interfaces.Building petersleiHouse(
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
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{90,38},{70,58}})));
  DistrictHeating.Interfaces.DHConnection dHConnection(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-66,50})));
  IDEAS.Interfaces.Building haarhakkerHouse1(
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
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{-26,74},{-46,94}})));
  IDEAS.Interfaces.Building petersleiHouse1(
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
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{90,8},{70,28}})));
  DistrictHeating.Interfaces.DHConnection dHConnection1(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-36,50})));
  DistrictHeating.Interfaces.DHConnection dHConnection2(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,30})));
  DistrictHeating.Interfaces.DHConnection dHConnection3(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,2})));
  IDEAS.Interfaces.Building haarhakkerHouse2(
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
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{4,74},{-16,94}})));
  DistrictHeating.Interfaces.DHConnection dHConnection4(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-6,50})));
  IDEAS.Interfaces.Building haarhakkerHouse3(
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
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{34,74},{14,94}})));
  DistrictHeating.Interfaces.DHConnection dHConnection5(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={24,50})));
  IDEAS.Interfaces.Building petersleiHouse2(
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
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{90,-48},{70,-28}})));
  DistrictHeating.Interfaces.DHConnection dHConnection6(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,-26})));
  DistrictHeating.Interfaces.DHConnection dHConnection7(
    length=length,
    m_flow_nominal=m_flow_nominal,
    redeclare each package Medium = Medium,
    redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe(dp_nominal=100))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={54,-54})));
  IDEAS.Interfaces.Building petersleiHouse3(
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
      DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
      constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem)
    annotation (Placement(transformation(extent={{88,-20},{68,0}})));
equation
  connect(dHConnection.flowPortOut, haarhakkerHouse.flowPort_supply)
    annotation (Line(
      points={{-68,60},{-68,74}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.flowPortIn, haarhakkerHouse.flowPort_return) annotation (
     Line(
      points={{-64,60},{-64,74}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(port_a, dHConnection.port_b1) annotation (Line(
      points={{-100,0},{-92,0},{-92,56},{-76,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection.port_a1, dHConnection1.port_b1) annotation (Line(
      points={{-56,56},{-46,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortOut, haarhakkerHouse1.flowPort_supply)
    annotation (Line(
      points={{-38,60},{-38,74}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse1.flowPort_return, dHConnection1.flowPortIn)
    annotation (Line(
      points={{-34,74},{-34,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.port_a2, dHConnection.port_b2) annotation (Line(
      points={{-46,44},{-56,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortOut, petersleiHouse.flowPort_supply)
    annotation (Line(
      points={{64,32},{78,32},{78,38}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.flowPortIn, petersleiHouse.flowPort_return) annotation (
     Line(
      points={{64,28},{82,28},{82,38}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.port_a1, dHConnection3.port_b1) annotation (Line(
      points={{60,20},{60,12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortOut, petersleiHouse1.flowPort_supply)
    annotation (Line(
      points={{64,4},{78,4},{78,8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection3.flowPortIn, petersleiHouse1.flowPort_return)
    annotation (Line(
      points={{64,0},{82,0},{82,8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.flowPortIn, haarhakkerHouse2.flowPort_return)
    annotation (Line(
      points={{-4,60},{-4,74}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection4.port_a1, dHConnection5.port_b1) annotation (Line(
      points={{4,56},{14,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_a2, dHConnection4.port_b2) annotation (Line(
      points={{14,44},{4,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_a1, dHConnection4.port_b1) annotation (Line(
      points={{-26,56},{-16,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_b2, dHConnection4.port_a2) annotation (Line(
      points={{-26,44},{-16,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(haarhakkerHouse2.flowPort_supply, dHConnection4.flowPortOut)
    annotation (Line(
      points={{-8,74},{-8,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.flowPort_supply, dHConnection5.flowPortOut)
    annotation (Line(
      points={{22,74},{22,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarhakkerHouse3.flowPort_return, dHConnection5.flowPortIn)
    annotation (Line(
      points={{26,74},{26,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection2.port_b2, dHConnection3.port_a2) annotation (Line(
      points={{48,20},{48,12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_b2, dHConnection2.port_a2) annotation (Line(
      points={{34,44},{48,44},{48,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection5.port_a1, dHConnection2.port_b1) annotation (Line(
      points={{34,56},{60,56},{60,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.port_a1,dHConnection7. port_b1) annotation (Line(
      points={{60,-36},{60,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortOut,petersleiHouse2. flowPort_supply)
    annotation (Line(
      points={{64,-52},{78,-52},{78,-48}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection7.flowPortIn,petersleiHouse2. flowPort_return)
    annotation (Line(
      points={{64,-56},{82,-56},{82,-48}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.port_b2, dHConnection7.port_a2) annotation (Line(
      points={{48,-36},{48,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.port_a2, dHConnection3.port_b2) annotation (Line(
      points={{48,-16},{48,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection3.port_a1, dHConnection6.port_b1) annotation (Line(
      points={{60,-8},{60,-16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortOut, petersleiHouse3.flowPort_supply)
    annotation (Line(
      points={{64,-24},{76,-24},{76,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection6.flowPortIn, petersleiHouse3.flowPort_return)
    annotation (Line(
      points={{64,-28},{80,-28},{80,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.port_a2, port_b) annotation (Line(
      points={{-76,44},{-80,44},{-80,-80},{90,-80},{90,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end MediumGrid;
