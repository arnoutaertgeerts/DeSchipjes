within DeSchipjes.Dwellings.Structures.Renovated.Examples.BaseClasses;
model HaarhakkerStraatHouse_lin
  package Medium = Buildings.Media.GasesConstantDensity.SimpleAir;

  HaarhakkerStraatHouse haarhakkerStraatHouse(redeclare package Medium = Medium,
    slaapkamerDakLinks(inc=if sim.linearize then 0 else 300/180*Modelica.Constants.pi),
    slaapkamerDakRechts(inc=if sim.linearize then 0 else 120/180*Modelica.Constants.pi),
    badkamerDak(inc=if sim.linearize then 0 else 306/180*Modelica.Constants.pi),
    halDak(inc=if sim.linearize then 0 else 306/180*Modelica.Constants.pi),
    T_start=293.15*ones(haarhakkerStraatHouse.nZones))
    annotation (Placement(transformation(extent={{-16,-10},{14,10}})));

  Modelica.Fluid.Sources.FixedBoundary boundary(nPorts=6, redeclare package
      Medium = Medium)
    annotation (Placement(transformation(extent={{32,30},{12,50}})));
  inner Modelica.Fluid.System system
  annotation (Placement(transformation(extent={{-82,-90},{-62,-70}})));
  inner IDEAS.SimInfoManager sim(linearize=true, offsetAzi=2.5307274153918)
    "Simulation information manager for climate data"
    annotation (Placement(transformation(extent={{-52,-90},{-32,-70}})));
  input IDEAS.BoundaryConditions.WeatherData.Bus weaBus1(numSolBus=sim.numAzi +
        1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={78,10}), iconTransformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-100,40})));
  input IDEAS.Buildings.Components.Interfaces.WinBus winBus1[5](nLay=3) annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={78,-16}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=270,
        origin={-100,-40})));
  Modelica.Blocks.Interfaces.RealOutput TSensor[6]
    "Sensor temperature of the zones" annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(boundary.ports[1:6], haarhakkerStraatHouse.flowPort_In) annotation (
      Line(
      points={{12,36.6667},{1,36.6667},{1,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(haarhakkerStraatHouse.weaBus, weaBus1) annotation (Line(
      points={{21,10},{78,10}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(haarhakkerStraatHouse.winBus, winBus1) annotation (Line(
      points={{21,2},{50,2},{50,-16},{78,-16}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(haarhakkerStraatHouse.TSensor, TSensor) annotation (Line(
      points={{14.6,-6},{34,-6},{34,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=10000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics));
end HaarhakkerStraatHouse_lin;
