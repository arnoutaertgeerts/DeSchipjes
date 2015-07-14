within DeSchipjes.Grids;
model PartialGrid
  extends Interfaces.BaseClasses.Grid;

  //Parameters
  parameter Integer[11] ids= {1,2,3,4,5,6,7,8,9,10,11};

  DistrictHeating.Interfaces.DHConnection Pipe1(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe2(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe3(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe4(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe5(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe6(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe7(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,0},{110,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe8(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{120,0},{140,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe9(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{150,0},{170,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe10(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{180,0},{200,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe11(
    m_flow_nominal=0.1,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{210,0},{230,20}})));
  Dwellings.Building haarHakker1(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[1]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-90,34},{-70,54}})));
  Dwellings.Building haarHakker2(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[2]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-60,34},{-40,54}})));
  Dwellings.Building haarHakker3(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[3]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-30,34},{-10,54}})));
  Dwellings.Building haarHakker4(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[4]),
    redeclare package Medium = Medium)
               annotation (Placement(transformation(extent={{0,34},{20,54}})));
  Dwellings.Building haarHakker5(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[5]),
    redeclare package Medium = Medium)
               annotation (Placement(transformation(extent={{30,34},{50,54}})));
  Dwellings.Building peterslei1(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[6]),
    redeclare package Medium = Medium)
                annotation (Placement(transformation(extent={{60,34},{80,54}})));
  Dwellings.Building peterslei2(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[7]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,34},{110,54}})));
  Dwellings.Building peterslei3(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[8]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{120,34},{140,54}})));
  Dwellings.Building peterslei4(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[9]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{150,34},{170,54}})));
  Dwellings.Building peterslei5(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[10]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{180,34},{200,54}})));
  Dwellings.Building peterslei6(
    final isDH=true,
    final modulating=modulating,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[11]),
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{210,34},{230,54}})));
equation
  connect(Pipe1.port_b2, port_b) annotation (Line(
      points={{-90,4},{-94,4},{-94,-60},{-100,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_a, Pipe1.port_a1) annotation (Line(
      points={{-100,60},{-94,60},{-94,16},{-90,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe1.port_b1, Pipe2.port_a1) annotation (Line(
      points={{-70,16},{-60,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe2.port_b1, Pipe3.port_a1) annotation (Line(
      points={{-40,16},{-30,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe3.port_b1, Pipe4.port_a1) annotation (Line(
      points={{-10,16},{0,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe4.port_b1, Pipe5.port_a1) annotation (Line(
      points={{20,16},{30,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe5.port_b1, Pipe6.port_a1) annotation (Line(
      points={{50,16},{60,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe6.port_b1, Pipe7.port_a1) annotation (Line(
      points={{80,16},{90,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe7.port_b1, Pipe8.port_a1) annotation (Line(
      points={{110,16},{120,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe8.port_b1, Pipe9.port_a1) annotation (Line(
      points={{140,16},{150,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe9.port_b1, Pipe10.port_a1) annotation (Line(
      points={{170,16},{180,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe10.port_b1, Pipe11.port_a1) annotation (Line(
      points={{200,16},{210,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe11.port_b2, Pipe10.port_a2) annotation (Line(
      points={{210,4},{200,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe10.port_b2, Pipe9.port_a2) annotation (Line(
      points={{180,4},{170,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe9.port_b2, Pipe8.port_a2) annotation (Line(
      points={{150,4},{140,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe8.port_b2, Pipe7.port_a2) annotation (Line(
      points={{120,4},{110,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe7.port_b2, Pipe6.port_a2) annotation (Line(
      points={{90,4},{80,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe6.port_b2, Pipe5.port_a2) annotation (Line(
      points={{60,4},{50,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe5.port_b2, Pipe4.port_a2) annotation (Line(
      points={{30,4},{20,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe4.port_b2, Pipe3.port_a2) annotation (Line(
      points={{0,4},{-10,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe3.port_b2, Pipe2.port_a2) annotation (Line(
      points={{-30,4},{-40,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Pipe2.port_b2, Pipe1.port_a2) annotation (Line(
      points={{-60,4},{-70,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(haarHakker1.flowPort_return, Pipe1.port_a3) annotation (Line(
      points={{-82,34},{-82,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker1.flowPort_supply, Pipe1.port_b3) annotation (Line(
      points={{-78,34},{-78,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker2.flowPort_return, Pipe2.port_a3) annotation (Line(
      points={{-52,34},{-52,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker2.flowPort_supply, Pipe2.port_b3) annotation (Line(
      points={{-48,34},{-48,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker3.flowPort_return, Pipe3.port_a3) annotation (Line(
      points={{-22,34},{-22,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker3.flowPort_supply, Pipe3.port_b3) annotation (Line(
      points={{-18,34},{-18,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker4.flowPort_return, Pipe4.port_a3) annotation (Line(
      points={{8,34},{8,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker4.flowPort_supply, Pipe4.port_b3) annotation (Line(
      points={{12,34},{12,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker5.flowPort_return, Pipe5.port_a3) annotation (Line(
      points={{38,34},{38,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(haarHakker5.flowPort_supply, Pipe5.port_b3) annotation (Line(
      points={{42,34},{42,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei1.flowPort_return, Pipe6.port_a3) annotation (Line(
      points={{68,34},{68,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei1.flowPort_supply, Pipe6.port_b3) annotation (Line(
      points={{72,34},{72,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei2.flowPort_return, Pipe7.port_a3) annotation (Line(
      points={{98,34},{98,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei2.flowPort_supply, Pipe7.port_b3) annotation (Line(
      points={{102,34},{102,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei3.flowPort_return, Pipe8.port_a3) annotation (Line(
      points={{128,34},{128,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei3.flowPort_supply, Pipe8.port_b3) annotation (Line(
      points={{132,34},{132,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei4.flowPort_return, Pipe9.port_a3) annotation (Line(
      points={{158,34},{158,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei4.flowPort_supply, Pipe9.port_b3) annotation (Line(
      points={{162,34},{162,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei5.flowPort_return, Pipe10.port_a3) annotation (Line(
      points={{188,34},{188,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei5.flowPort_supply, Pipe10.port_b3) annotation (Line(
      points={{192,34},{192,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei6.flowPort_return, Pipe11.port_a3) annotation (Line(
      points={{218,34},{218,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(peterslei6.flowPort_supply, Pipe11.port_b3) annotation (Line(
      points={{222,34},{222,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(supplyT, haarHakker1.supplyT) annotation (Line(
      points={{80,108},{80,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(peterslei6.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{213,44},{210,44},{210,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(haarHakker2.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{-57,44},{-60,44},{-60,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(haarHakker3.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{-27,44},{-30,44},{-30,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(haarHakker4.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{3,44},{0,44},{0,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(haarHakker5.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{33,44},{30,44},{30,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(peterslei1.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{63,44},{60,44},{60,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(peterslei2.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{93,44},{90,44},{90,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(peterslei3.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{123,44},{120,44},{120,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(peterslei4.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{153,44},{150,44},{150,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(peterslei5.supplyT, haarHakker1.supplyT) annotation (Line(
      points={{183,44},{180,44},{180,60},{-90,60},{-90,44},{-87,44}},
      color={175,175,175},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{240,100}}), graphics));
end PartialGrid;
