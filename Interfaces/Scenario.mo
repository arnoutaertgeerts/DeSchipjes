within DeSchipjes.Interfaces;
model Scenario

  //Parameters
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=1;

  replaceable BaseClasses.ProductionSite productionSite(redeclare package
      Medium = IDEAS.Media.Water.Simple, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{10,-18},{-10,2}})));
  replaceable BaseClasses.Grid grid(
                                  m_flow_nominal=m_flow_nominal, redeclare
      package Medium = Buildings.Media.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    nPorts=1,
    redeclare package Medium = IDEAS.Media.Water.Simple,
    use_T=false) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={36,14})));
equation
  connect(grid.port_a, productionSite.port_b) annotation (Line(
      points={{-10,30},{-22,30},{-22,-8},{-10,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(grid.port_b, productionSite.port_a) annotation (Line(
      points={{10,30},{20,30},{20,-8},{10,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], productionSite.port_a) annotation (Line(
      points={{36,4},{36,0},{20,0},{20,-8},{10,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-100,
            -100},{100,100}}, preserveAspectRatio=false), graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end Scenario;
