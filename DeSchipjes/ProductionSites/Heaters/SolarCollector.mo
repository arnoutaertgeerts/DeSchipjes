within DeSchipjes.ProductionSites.Heaters;
model SolarCollector

  extends Modelica.Icons.Example;
  replaceable package Medium = Modelica.Media.Incompressible.Examples.Glycol47
    "Medium in the system";

  Buildings.Fluid.SolarCollectors.ASHRAE93          solCol(
    redeclare package Medium = Medium,
    shaCoe=0,
    from_dp=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    rho=0.2,
    nColType=Buildings.Fluid.SolarCollectors.Types.NumberSelection.Number,
    sysConfig=Buildings.Fluid.SolarCollectors.Types.SystemConfiguration.Series,
    per=Buildings.Fluid.SolarCollectors.Data.GlazedFlatPlate.FP_GuangdongFSPTY95(),
    nPanels=1,
    nSeg=9,
    lat=0.73097781993588,
    azi=0.3,
    til=0.5) "Flat plate solar collector model"
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
    "modelica://Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    "Weather data input file"
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Buildings.Fluid.Sources.Boundary_pT sin(
    redeclare package Medium = Medium,
    nPorts=1,
    p(displayUnit="bar") = 100000) "Outlet for water flow"
    annotation (Placement(transformation(extent={{80,-20},{60,0}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TOut(
    redeclare package Medium = Medium,
    T_start(displayUnit="K"),
    m_flow_nominal=solCol.m_flow_nominal) "Temperature sensor"
    annotation (Placement(transformation(extent={{32,-20},{52,0}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TIn(redeclare package Medium =
    Medium, m_flow_nominal=solCol.m_flow_nominal) "Temperature sensor"
    annotation (Placement(transformation(extent={{-32,-20},{-12,0}})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary(
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1,
    redeclare package Medium = Medium)
              annotation (Placement(transformation(extent={{-56,-20},{-36,0}})));

  parameter Integer n=10 "Number of steps";
  parameter Integer t=30 "Number of minutes to keep the conditions constant";
  parameter Real h=n*n*t/60 "Number of hours of one full space span";

  parameter Modelica.SIunits.Temperature beginT=10 "start temperature";
  parameter Modelica.SIunits.Temperature endT=50 "end temperature";

  parameter Modelica.SIunits.MassFlowRate beginM=0.1 "start massflow";
  parameter Modelica.SIunits.MassFlowRate endM=0.5 "end massflow";

  parameter Modelica.SIunits.Temperature[n] spaceT = linspace(beginT, endT, n)
    "Temperature space to span";
  parameter Modelica.SIunits.MassFlowRate[n] spaceM = linspace(beginM, endM, n)
    "Massflowrate space to span";

  Modelica.SIunits.Temperature temperature;
  Modelica.SIunits.MassFlowRate massflow;

  Modelica.Blocks.Sources.RealExpression realExpression(y=massflow)
                                                        annotation (Placement(transformation(extent={{-96,4},{-76,24}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=temperature)
                                                        annotation (Placement(transformation(extent={{-96,-28},{-76,-8}})));
equation
  temperature = spaceT[integer(mod(floor(n*time/3600/h), n))+1] + 273.15;
  massflow = spaceM[integer(mod(floor(n*n*time/3600/h), n))+1];

  connect(solCol.port_b, TOut.port_a) annotation (Line(
      points={{20,-10},{32,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TOut.port_b, sin.ports[1]) annotation (Line(
      points={{52,-10},{60,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TIn.port_b, solCol.port_a) annotation (Line(
      points={{-12,-10},{0,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(weaDat.weaBus, solCol.weaBus) annotation (Line(
      points={{-20,30},{-6,30},{-6,-0.4},{0,-0.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(boundary.ports[1], TIn.port_a) annotation (Line(
      points={{-36,-10},{-32,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression.y, boundary.m_flow_in)
    annotation (Line(
      points={{-75,14},{-66,14},{-66,-2},{-56,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression1.y, boundary.T_in)
    annotation (Line(
      points={{-75,-18},{-64,-18},{-64,-6},{-58,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Documentation(info="<html>
<p>
This example demonstrates the implementation of
<a href=\"modelica://Buildings.Fluid.SolarCollectors.ASHRAE93\">
Buildings.Fluid.SolarCollectors.ASHRAE93</a>.
In it water is passed through a flat plate solar thermal collector while
being heated by the sun in the San Francisco, CA, USA climate.
</p>
</html>",
revisions="<html>
<ul>
<li>
December 22, 2014 by Michael Wetter:<br/>
Removed <code>Modelica.Fluid.System</code>
to address issue
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/311\">#311</a>.
</li>
<li>
September 18, 2014, by Michael Wetter:<br/>
Changed medium from water to glycol.
</li>
<li>
Mar 27, 2013, by Peter Grant:<br/>
First implementation.
</li>
</ul>
</html>"),
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Fluid/SolarCollectors/Examples/FlatPlate.mos"
        "Simulate and Plot"),
 experiment(StopTime=86400.0),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                    graphics));
end SolarCollector;
