within DeSchipjes.Interfaces;
model Scenario

  replaceable BaseClasses.ProductionSite productionSite(
    final m_flow_nominal=grid.m_flow_nominal,
    final modulating=grid.modulating)
    annotation (Placement(transformation(extent={{40,0},{20,20}})),  choicesAllMatching=true);
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    redeclare package Medium = IDEAS.Media.Water,
    nPorts=1)    annotation (Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=90,
        origin={0,10})));
  replaceable BaseClasses.Grid grid
    annotation (Placement(transformation(extent={{-16,0},{-50,20}})), choicesAllMatching=true);
equation
  connect(productionSite.y, grid.supplyT) annotation (Line(
      points={{30,20.6},{30,46},{-34,46},{-34,20.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(grid.port_a, productionSite.port_b) annotation (Line(
      points={{-16,16},{20,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(productionSite.port_a, grid.port_b) annotation (Line(
      points={{20,4},{-16,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], grid.port_b) annotation (Line(
      points={{0,6},{0,4},{-16,4}},
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
