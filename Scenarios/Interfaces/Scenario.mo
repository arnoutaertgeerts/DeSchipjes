within DeSchipjes.Scenarios.Interfaces;
model Scenario
  //Parameters
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal;

  BaseClasses.Network network(redeclare package Medium =
        IDEAS.Media.Water.Simple, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  replaceable BaseClasses.ProductionSite productionSite(redeclare package
      Medium = IDEAS.Media.Water.Simple, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{10,-18},{-10,2}})));
equation
  connect(productionSite.port_b, network.port_a) annotation (Line(
      points={{-10,-8},{-20,-8},{-20,30},{-10,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(network.port_b, productionSite.port_a) annotation (Line(
      points={{10,30},{20,30},{20,-8},{10,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-60,-60},{60,60}},
          preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{
            -60,-60},{60,60}})));
end Scenario;
