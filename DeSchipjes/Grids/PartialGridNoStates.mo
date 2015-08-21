within DeSchipjes.Grids;
partial model PartialGridNoStates
  extends Interfaces.BaseClasses.Grid;

  //Parameters
  parameter Integer[11] ids= {1,2,3,4,5,6,7,8,9,10,11} "Occupancy profile ids";

  DistrictHeating.Interfaces.DHConnection Pipe1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*11,
    L=11.8 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*10,
    L=6 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{-62,0},{-42,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe3(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*9,
    L=2.4 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{-34,0},{-14,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe4(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*8,
    L=8.5 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{-6,0},{14,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe5(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*7,
    L=2.3 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{22,0},{42,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe6(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*6,
    L=9.1 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{54,0},{74,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe7(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*5,
    L=2 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{86,0},{106,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe8(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*4,
    L=3.5 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{118,0},{138,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe9(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*3,
    L=3.5 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{148,0},{168,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe10(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*2,
    L=7.7 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{178,0},{198,20}})));
  DistrictHeating.Interfaces.DHConnection Pipe11(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal*1,
    L=4.2 + 2,
    H=0.6,
    lambdaG=1.2,
    dim(lambdaI=0.04),
    redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe(
        redeclare
        DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
        baseConfiguration))
    annotation (Placement(transformation(extent={{210,0},{230,20}})));
  Dwellings.Building haarHakker1(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[1]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{86,32},{106,52}})));
  Dwellings.Building haarHakker2(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[2]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{118,32},{138,52}})));
  Dwellings.Building haarHakker3(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[3]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{148,32},{168,52}})));
  Dwellings.Building haarHakker4(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[4]),
    redeclare package Medium = Medium,
    modulating=modulating)
               annotation (Placement(transformation(extent={{178,32},{198,52}})));
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
    annotation (Placement(transformation(extent={{-62,32},{-42,52}})));
  Dwellings.Building peterslei3(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[8]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{-34,32},{-14,52}})));
  Dwellings.Building peterslei4(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[9]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{-6,32},{14,52}})));
  Dwellings.Building peterslei5(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[10]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{22,32},{42,52}})));
  Dwellings.Building peterslei6(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones, id=
         ids[11]),
    redeclare package Medium = Medium,
    modulating=modulating)
    annotation (Placement(transformation(extent={{54,32},{74,52}})));
equation

  Qgrid = (port_a.h_outflow-port_b.h_outflow)*port_a.m_flow;

  Qdis = Pipe1.QLosses + Pipe2.QLosses + Pipe3.QLosses + Pipe4.QLosses
    + Pipe5.QLosses + Pipe6.QLosses + Pipe7.QLosses + Pipe8.QLosses
    + Pipe9.QLosses + Pipe10.QLosses + Pipe11.QLosses;

  Qhea = haarHakker1.heatingSystem.Qhea
    + haarHakker2.heatingSystem.Qhea + haarHakker3.heatingSystem.Qhea
    + haarHakker4.heatingSystem.Qhea + haarHakker5.heatingSystem.Qhea
    + peterslei1.heatingSystem.Qhea + peterslei2.heatingSystem.Qhea
    + peterslei3.heatingSystem.Qhea + peterslei4.heatingSystem.Qhea
    + peterslei5.heatingSystem.Qhea + peterslei6.heatingSystem.Qhea;
  Qsh = haarHakker1.heatingSystem.Qsh
    + haarHakker2.heatingSystem.Qsh + haarHakker3.heatingSystem.Qsh
    + haarHakker4.heatingSystem.Qsh + haarHakker5.heatingSystem.Qsh
    + peterslei1.heatingSystem.Qsh + peterslei2.heatingSystem.Qsh
    + peterslei3.heatingSystem.Qsh + peterslei4.heatingSystem.Qsh
    + peterslei5.heatingSystem.Qsh + peterslei6.heatingSystem.Qsh;
  Qdhw = haarHakker1.heatingSystem.Qdhw
    + haarHakker2.heatingSystem.Qdhw + haarHakker3.heatingSystem.Qdhw
    + haarHakker4.heatingSystem.Qdhw + haarHakker5.heatingSystem.Qdhw
    + peterslei1.heatingSystem.Qdhw + peterslei2.heatingSystem.Qdhw
    + peterslei3.heatingSystem.Qdhw + peterslei4.heatingSystem.Qdhw
    + peterslei5.heatingSystem.Qdhw + peterslei6.heatingSystem.Qdhw;

  Qsto = haarHakker1.heatingSystem.Qsto
    + haarHakker2.heatingSystem.Qsto + haarHakker3.heatingSystem.Qsto
    + haarHakker4.heatingSystem.Qsto + haarHakker5.heatingSystem.Qsto
    + peterslei1.heatingSystem.Qsto + peterslei2.heatingSystem.Qsto
    + peterslei3.heatingSystem.Qsto + peterslei4.heatingSystem.Qsto
    + peterslei5.heatingSystem.Qsto + peterslei6.heatingSystem.Qsto;

  Qhp = haarHakker1.heatingSystem.Qhp
    + haarHakker2.heatingSystem.Qhp + haarHakker3.heatingSystem.Qhp
    + haarHakker4.heatingSystem.Qhp + haarHakker5.heatingSystem.Qhp
    + peterslei1.heatingSystem.Qhp + peterslei2.heatingSystem.Qhp
    + peterslei3.heatingSystem.Qhp + peterslei4.heatingSystem.Qhp
    + peterslei5.heatingSystem.Qhp + peterslei6.heatingSystem.Qhp;
  PboosEl = haarHakker1.heatingSystem.PboosEl
    + haarHakker2.heatingSystem.PboosEl + haarHakker3.heatingSystem.PboosEl
    + haarHakker4.heatingSystem.PboosEl + haarHakker5.heatingSystem.PboosEl
    + peterslei1.heatingSystem.PboosEl + peterslei2.heatingSystem.PboosEl
    + peterslei3.heatingSystem.PboosEl + peterslei4.heatingSystem.PboosEl
    + peterslei5.heatingSystem.PboosEl + peterslei6.heatingSystem.PboosEl;

  connect(Pipe1.port_b2, port_b) annotation (Line(
      points={{-90,4},{-94,4},{-94,-60},{-100,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(haarHakker2.u, haarHakker1.u) annotation (Line(points={{128,52.8},{
          128,60},{96,60},{96,52.8}},   color={255,0,255}));
  connect(haarHakker4.u, haarHakker1.u) annotation (Line(points={{188,52.8},{
          188,60},{96,60},{96,52.8}},
                                    color={255,0,255}));
  connect(haarHakker5.u, haarHakker1.u) annotation (Line(points={{220,52.8},{
          220,60},{96,60},{96,52.8}},
                                    color={255,0,255}));
  connect(peterslei6.u, haarHakker1.u) annotation (Line(points={{64,52.8},{64,
          60},{96,60},{96,52.8}},   color={255,0,255}));
  connect(peterslei2.u, haarHakker1.u) annotation (Line(points={{-52,52.8},{-52,
          60},{96,60},{96,52.8}},   color={255,0,255}));
  connect(peterslei3.u, haarHakker1.u) annotation (Line(points={{-24,52.8},{-24,
          60},{96,60},{96,52.8}},   color={255,0,255}));
  connect(peterslei4.u, haarHakker1.u) annotation (Line(points={{4,52.8},{4,60},
          {96,60},{96,52.8}},       color={255,0,255}));
  connect(peterslei5.u, haarHakker1.u) annotation (Line(points={{32,52.8},{32,
          60},{96,60},{96,52.8}},   color={255,0,255}));
  connect(peterslei1.u, haarHakker1.u) annotation (Line(points={{-80,52.8},{-80,
          60},{96,60},{96,52.8}}, color={255,0,255}));
  connect(haarHakker3.u, haarHakker1.u) annotation (Line(points={{158,52.8},{
          158,60},{96,60},{96,52.8}}, color={255,0,255}));
  connect(u, haarHakker1.u) annotation (Line(points={{80,110},{80,60},{96,60},{
          96,52.8}}, color={255,0,255}));
  connect(Pipe11.port_b3, haarHakker5.flowPort_supply)
    annotation (Line(points={{222,20},{222,20},{222,32}}, color={0,127,255}));
  connect(Pipe11.port_a3, haarHakker5.flowPort_return)
    annotation (Line(points={{218,20},{218,20},{218,32}}, color={0,127,255}));
  connect(Pipe10.port_b3, haarHakker4.flowPort_supply)
    annotation (Line(points={{190,20},{190,20},{190,32}}, color={0,127,255}));
  connect(Pipe10.port_a3, haarHakker4.flowPort_return)
    annotation (Line(points={{186,20},{186,20},{186,32}}, color={0,127,255}));
  connect(Pipe9.port_b3, haarHakker3.flowPort_supply)
    annotation (Line(points={{160,20},{160,20},{160,32}}, color={0,127,255}));
  connect(Pipe9.port_a3, haarHakker3.flowPort_return)
    annotation (Line(points={{156,20},{156,20},{156,32}}, color={0,127,255}));
  connect(Pipe8.port_b3, haarHakker2.flowPort_supply)
    annotation (Line(points={{130,20},{130,26},{130,32}}, color={0,127,255}));
  connect(Pipe8.port_a3, haarHakker2.flowPort_return)
    annotation (Line(points={{126,20},{126,26},{126,32}}, color={0,127,255}));
  connect(Pipe6.port_b3, peterslei6.flowPort_supply)
    annotation (Line(points={{66,20},{66,20},{66,32}}, color={0,127,255}));
  connect(Pipe6.port_a3, peterslei6.flowPort_return)
    annotation (Line(points={{62,20},{62,20},{62,32}}, color={0,127,255}));
  connect(Pipe5.port_b3, peterslei5.flowPort_supply)
    annotation (Line(points={{34,20},{34,20},{34,32}}, color={0,127,255}));
  connect(Pipe5.port_a3, peterslei5.flowPort_return)
    annotation (Line(points={{30,20},{30,20},{30,32}}, color={0,127,255}));
  connect(Pipe4.port_b3, peterslei4.flowPort_supply)
    annotation (Line(points={{6,20},{6,20},{6,32}}, color={0,127,255}));
  connect(Pipe4.port_a3, peterslei4.flowPort_return)
    annotation (Line(points={{2,20},{2,20},{2,32}}, color={0,127,255}));
  connect(Pipe3.port_b3, peterslei3.flowPort_supply)
    annotation (Line(points={{-22,20},{-22,20},{-22,32}}, color={0,127,255}));
  connect(Pipe3.port_a3, peterslei3.flowPort_return)
    annotation (Line(points={{-26,20},{-26,20},{-26,32}}, color={0,127,255}));
  connect(Pipe2.port_b3, peterslei2.flowPort_supply)
    annotation (Line(points={{-50,20},{-50,20},{-50,32}}, color={0,127,255}));
  connect(Pipe2.port_a3, peterslei2.flowPort_return)
    annotation (Line(points={{-54,20},{-54,20},{-54,32}}, color={0,127,255}));
  connect(Pipe1.port_b3, peterslei1.flowPort_supply)
    annotation (Line(points={{-78,20},{-78,20},{-78,32}}, color={0,127,255}));
  connect(Pipe1.port_a3, peterslei1.flowPort_return)
    annotation (Line(points={{-82,20},{-82,26},{-82,32}}, color={0,127,255}));
  connect(port_a, Pipe1.port_a1) annotation (Line(points={{-100,60},{-94,60},{
          -94,16},{-90,16}}, color={0,127,255}));
  connect(Pipe7.port_a3, haarHakker1.flowPort_return)
    annotation (Line(points={{94,20},{94,20},{94,32}}, color={0,127,255}));
  connect(Pipe7.port_b3, haarHakker1.flowPort_supply)
    annotation (Line(points={{98,20},{98,20},{98,32}}, color={0,127,255}));
  connect(Pipe1.port_b1, Pipe2.port_a1)
    annotation (Line(points={{-70,16},{-62,16},{-62,16}}, color={0,127,255}));
  connect(Pipe1.port_a2, Pipe2.port_b2)
    annotation (Line(points={{-70,4},{-66,4},{-62,4}}, color={0,127,255}));
  connect(Pipe2.port_b1, Pipe3.port_a1)
    annotation (Line(points={{-42,16},{-38,16},{-34,16}}, color={0,127,255}));
  connect(Pipe2.port_a2, Pipe3.port_b2)
    annotation (Line(points={{-42,4},{-38,4},{-34,4}}, color={0,127,255}));
  connect(Pipe3.port_b1, Pipe4.port_a1)
    annotation (Line(points={{-14,16},{-6,16},{-6,16}}, color={0,127,255}));
  connect(Pipe3.port_a2, Pipe4.port_b2)
    annotation (Line(points={{-14,4},{-10,4},{-6,4}}, color={0,127,255}));
  connect(Pipe4.port_b1, Pipe5.port_a1)
    annotation (Line(points={{14,16},{18,16},{22,16}}, color={0,127,255}));
  connect(Pipe4.port_a2, Pipe5.port_b2)
    annotation (Line(points={{14,4},{18,4},{22,4}}, color={0,127,255}));
  connect(Pipe5.port_b1, Pipe6.port_a1)
    annotation (Line(points={{42,16},{48,16},{54,16}}, color={0,127,255}));
  connect(Pipe5.port_a2, Pipe6.port_b2)
    annotation (Line(points={{42,4},{48,4},{54,4}}, color={0,127,255}));
  connect(Pipe6.port_b1, Pipe7.port_a1)
    annotation (Line(points={{74,16},{86,16},{86,16}}, color={0,127,255}));
  connect(Pipe6.port_a2, Pipe7.port_b2)
    annotation (Line(points={{74,4},{80,4},{86,4}}, color={0,127,255}));
  connect(Pipe7.port_b1, Pipe8.port_a1)
    annotation (Line(points={{106,16},{112,16},{118,16}}, color={0,127,255}));
  connect(Pipe7.port_a2, Pipe8.port_b2)
    annotation (Line(points={{106,4},{112,4},{118,4}}, color={0,127,255}));
  connect(Pipe8.port_b1, Pipe9.port_a1)
    annotation (Line(points={{138,16},{148,16},{148,16}}, color={0,127,255}));
  connect(Pipe8.port_a2, Pipe9.port_b2)
    annotation (Line(points={{138,4},{143,4},{148,4}}, color={0,127,255}));
  connect(Pipe9.port_b1, Pipe10.port_a1)
    annotation (Line(points={{168,16},{173,16},{178,16}}, color={0,127,255}));
  connect(Pipe9.port_a2, Pipe10.port_b2)
    annotation (Line(points={{168,4},{173,4},{178,4}}, color={0,127,255}));
  connect(Pipe10.port_b1, Pipe11.port_a1)
    annotation (Line(points={{198,16},{204,16},{210,16}}, color={0,127,255}));
  connect(Pipe10.port_a2, Pipe11.port_b2)
    annotation (Line(points={{198,4},{204,4},{210,4}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{240,100}})));
end PartialGridNoStates;