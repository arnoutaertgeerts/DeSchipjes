within DeSchipjes.Dwellings.Structures.Renovated.Examples.BaseClasses;
model HaarhakkerStraatHouse_lin
  package Medium = Buildings.Media.GasesConstantDensity.SimpleAir;
  parameter Integer nZones = 6;
  HaarhakkerStraatHouse haarhakkerStraatHouse(redeclare package Medium = Medium,
    slaapkamerDakLinks(inc=if sim.linearize then 0 else 300/180*Modelica.Constants.pi),
    slaapkamerDakRechts(inc=if sim.linearize then 0 else 120/180*Modelica.Constants.pi),
    badkamerDak(inc=if sim.linearize then 0 else 306/180*Modelica.Constants.pi),
    halDak(inc=if sim.linearize then 0 else 306/180*Modelica.Constants.pi),
    T_start=293.15*ones(nZones))
    annotation (Placement(transformation(extent={{-16,-10},{14,10}})));

  Modelica.Fluid.Sources.FixedBoundary boundary(nPorts=6, redeclare package
      Medium = Medium)
    annotation (Placement(transformation(extent={{-40,20},{-20,0}})));
  inner Modelica.Fluid.System system
  annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  inner IDEAS.SimInfoManager sim(linearize=true, offsetAzi=2.5307274153918)
    "Simulation information manager for climate data"
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));

  Modelica.Blocks.Interfaces.RealInput Q_flowConv[nZones](each start=100) annotation (Placement(
        transformation(extent={{-130,16},{-90,56}}),   iconTransformation(
          extent={{-130,16},{-90,56}})));
  Modelica.Blocks.Interfaces.RealInput Q_flowRad[nZones](each start=100)
    annotation (Placement(transformation(extent={{-130,-58},{-90,-18}})));

  input IDEAS.BoundaryConditions.WeatherData.Bus weaBus1(numSolBus=sim.numAzi +
        1)
    annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={100,60}),iconTransformation(
        extent={{-14,14},{14,-14}},
        rotation=270,
        origin={-100,80})));
  input IDEAS.Buildings.Components.Interfaces.WinBus winBus1[5](nLay=3) annotation (
      Placement(transformation(
        extent={{-18,-17},{18,17}},
        rotation=270,
        origin={99,30}),  iconTransformation(
        extent={{-14,12},{14,-12}},
        rotation=270,
        origin={-100,-80})));
  Modelica.Blocks.Interfaces.RealOutput TSensor[6]
    "Sensor temperature of the zones" annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
  IDEAS.Utilities.IO.heatPortPrescribedHeatFlow convHeat[nZones]
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  IDEAS.Utilities.IO.heatPortPrescribedHeatFlow radHeat[nZones]
    annotation (Placement(transformation(extent={{-80,-20},{-60,-40}})));

equation
  connect(boundary.ports[1:6], haarhakkerStraatHouse.flowPort_In) annotation (
      Line(
      points={{-20,13.3333},{1,13.3333},{1,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(haarhakkerStraatHouse.weaBus, weaBus1) annotation (Line(
      points={{21,10},{50,10},{50,60},{100,60}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(haarhakkerStraatHouse.winBus, winBus1) annotation (Line(
      points={{21,2},{60,2},{60,30},{99,30}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(haarhakkerStraatHouse.TSensor, TSensor) annotation (Line(
      points={{14.6,-6},{80,-6},{80,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(convHeat.port1, haarhakkerStraatHouse.heatPortCon) annotation (Line(
      points={{-60,30},{16,30},{16,2},{14,2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(radHeat.port1, haarhakkerStraatHouse.heatPortRad) annotation (Line(
      points={{-60,-30},{16,-30},{16,-2},{14,-2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(radHeat.Q_flow, Q_flowRad) annotation (Line(
      points={{-80.8,-37},{-102,-37},{-102,-38},{-110,-38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(convHeat.Q_flow, Q_flowConv) annotation (Line(
      points={{-80.8,37},{-93.4,37},{-93.4,36},{-110,36}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=10000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                    graphics));
end HaarhakkerStraatHouse_lin;
