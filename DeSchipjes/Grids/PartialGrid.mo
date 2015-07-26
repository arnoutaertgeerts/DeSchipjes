within DeSchipjes.Grids;
model PartialGrid
  extends Interfaces.BaseClasses.Grid;

  //Parameters
  parameter Integer[11] ids= {1,2,3,4,5,6,7,8,9,10,11} "Occupancy profile ids";

  DistrictHeating.Interfaces.DHConnection Pipe1(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*11,
    L=11.8)
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe2(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*10,
    L=6)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe3(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*9,
    L=2.4)
    annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe4(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*8,
    L=8.5)
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe5(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*7,
    L=2.3)
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe6(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*6,
    L=9.1)
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe7(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*5,
    L=2)
    annotation (Placement(transformation(extent={{90,0},{110,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe8(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*4,
    L=3.5)
    annotation (Placement(transformation(extent={{120,0},{140,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe9(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*3,
    L=3.5)
    annotation (Placement(transformation(extent={{150,0},{170,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe10(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*2,
    L=7.7)
    annotation (Placement(transformation(extent={{180,0},{200,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe11(
    redeclare package Medium = Medium,
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
    m_flow_nominal=m_flow_nominal*1,
    L=4.2)
    annotation (Placement(transformation(extent={{210,0},{230,20}})));
  Dwellings.Building haarHakker1(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[1]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{90,32},{110,52}})));
  Dwellings.Building haarHakker2(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[2]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{120,32},{140,52}})));
  Dwellings.Building haarHakker3(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[3]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{150,32},{170,52}})));
  Dwellings.Building haarHakker4(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[4]),
    redeclare package Medium = Medium,
    modulating=modulating)
               annotation (Placement(transformation(extent={{180,32},{200,52}})));
  Dwellings.Building haarHakker5(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[5]),
    redeclare package Medium = Medium,
    modulating=modulating)
               annotation (Placement(transformation(extent={{210,32},{230,52}})));
  Dwellings.Building peterslei1(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[6]),
    redeclare package Medium = Medium,
    modulating=modulating)
                annotation (Placement(transformation(extent={{-90,32},{-70,52}})));
  Dwellings.Building peterslei2(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[7]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{-60,32},{-40,52}})));
  Dwellings.Building peterslei3(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[8]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{-30,32},{-10,52}})));
  Dwellings.Building peterslei4(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[9]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{0,32},{20,52}})));
  Dwellings.Building peterslei5(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[10]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{30,32},{50,52}})));
  Dwellings.Building peterslei6(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[11]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{60,32},{80,52}})));
equation
  DisPow = Pipe1.QLosses + Pipe2.QLosses + Pipe3.QLosses + Pipe4.QLosses
    + Pipe5.QLosses + Pipe6.QLosses + Pipe7.QLosses + Pipe8.QLosses
    + Pipe9.QLosses + Pipe10.QLosses + Pipe11.QLosses;

  connect(Pipe1.port_b2, port_b) annotation (Line(
      points={{-90,4},{-94,4},{-94,-60},{-100,-60}},
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
  connect(haarHakker2.u, haarHakker1.u) annotation (Line(points={{130,52.8},{
          130,60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(haarHakker4.u, haarHakker1.u) annotation (Line(points={{190,52.8},{
          190,60},{100,60},{100,52.8}},
                                    color={255,0,255}));
  connect(haarHakker5.u, haarHakker1.u) annotation (Line(points={{220,52.8},{
          220,60},{100,60},{100,52.8}},
                                    color={255,0,255}));
  connect(peterslei6.u, haarHakker1.u) annotation (Line(points={{70,52.8},{70,
          60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(peterslei2.u, haarHakker1.u) annotation (Line(points={{-50,52.8},{-50,
          60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(peterslei3.u, haarHakker1.u) annotation (Line(points={{-20,52.8},{-20,
          60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(peterslei4.u, haarHakker1.u) annotation (Line(points={{10,52.8},{10,
          60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(peterslei5.u, haarHakker1.u) annotation (Line(points={{40,52.8},{40,
          60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(peterslei1.u, haarHakker1.u) annotation (Line(points={{-80,52.8},{-80,
          60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(haarHakker3.u, haarHakker1.u) annotation (Line(points={{160,52.8},{
          160,60},{100,60},{100,52.8}}, color={255,0,255}));
  connect(u, haarHakker1.u) annotation (Line(points={{80,110},{80,60},{100,60},
          {100,52.8}}, color={255,0,255}));
  connect(Pipe11.port_b3, haarHakker5.flowPort_supply)
    annotation (Line(points={{222,20},{222,26},{222,32}}, color={0,127,255}));
  connect(Pipe11.port_a3, haarHakker5.flowPort_return)
    annotation (Line(points={{218,20},{218,26},{218,32}}, color={0,127,255}));
  connect(Pipe10.port_b3, haarHakker4.flowPort_supply)
    annotation (Line(points={{192,20},{192,26},{192,32}}, color={0,127,255}));
  connect(Pipe10.port_a3, haarHakker4.flowPort_return)
    annotation (Line(points={{188,20},{188,20},{188,32}}, color={0,127,255}));
  connect(Pipe9.port_b3, haarHakker3.flowPort_supply)
    annotation (Line(points={{162,20},{162,26},{162,32}}, color={0,127,255}));
  connect(Pipe9.port_a3, haarHakker3.flowPort_return)
    annotation (Line(points={{158,20},{158,26},{158,32}}, color={0,127,255}));
  connect(Pipe8.port_b3, haarHakker2.flowPort_supply)
    annotation (Line(points={{132,20},{132,32},{132,32}}, color={0,127,255}));
  connect(Pipe8.port_a3, haarHakker2.flowPort_return)
    annotation (Line(points={{128,20},{128,32},{128,32}}, color={0,127,255}));
  connect(Pipe6.port_b3, peterslei6.flowPort_supply)
    annotation (Line(points={{72,20},{72,20},{72,32}}, color={0,127,255}));
  connect(Pipe6.port_a3, peterslei6.flowPort_return)
    annotation (Line(points={{68,20},{68,20},{68,32}}, color={0,127,255}));
  connect(Pipe5.port_b3, peterslei5.flowPort_supply)
    annotation (Line(points={{42,20},{42,26},{42,32}}, color={0,127,255}));
  connect(Pipe5.port_a3, peterslei5.flowPort_return)
    annotation (Line(points={{38,20},{38,20},{38,32}}, color={0,127,255}));
  connect(Pipe4.port_b3, peterslei4.flowPort_supply)
    annotation (Line(points={{12,20},{12,20},{12,32}}, color={0,127,255}));
  connect(Pipe4.port_a3, peterslei4.flowPort_return)
    annotation (Line(points={{8,20},{8,26},{8,32}}, color={0,127,255}));
  connect(Pipe3.port_b3, peterslei3.flowPort_supply)
    annotation (Line(points={{-18,20},{-18,20},{-18,32}}, color={0,127,255}));
  connect(Pipe3.port_a3, peterslei3.flowPort_return)
    annotation (Line(points={{-22,20},{-22,26},{-22,32}}, color={0,127,255}));
  connect(Pipe2.port_b3, peterslei2.flowPort_supply)
    annotation (Line(points={{-48,20},{-48,26},{-48,32}}, color={0,127,255}));
  connect(Pipe2.port_a3, peterslei2.flowPort_return)
    annotation (Line(points={{-52,20},{-52,26},{-52,32}}, color={0,127,255}));
  connect(Pipe1.port_b3, peterslei1.flowPort_supply) annotation (Line(points={{
          -78,20},{-78,20},{-78,32},{-78,32}}, color={0,127,255}));
  connect(Pipe1.port_a3, peterslei1.flowPort_return)
    annotation (Line(points={{-82,20},{-82,26},{-82,32}}, color={0,127,255}));
  connect(port_a, Pipe1.port_a1) annotation (Line(points={{-100,60},{-94,60},{
          -94,16},{-90,16}}, color={0,127,255}));
  connect(Pipe7.port_a3, haarHakker1.flowPort_return)
    annotation (Line(points={{98,20},{98,26},{98,32}}, color={0,127,255}));
  connect(Pipe7.port_b3, haarHakker1.flowPort_supply)
    annotation (Line(points={{102,20},{102,20},{102,32}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{240,100}})));
end PartialGrid;
