within DeSchipjes.Interfaces;
partial model Scenario

  //Parameters
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=1
    "Nominal massflow rate at the production site";
  parameter Modelica.SIunits.Power QNom[:] = {2113,1409,804,1025,10,10}
    "Average heat losses for each zone";

  parameter Modelica.SIunits.Temperature TRadSupply(displayUnit="Celsius")
    "Supply radiator temperature";
  parameter Modelica.SIunits.Temperature TRadReturn(displayUnit="Celsius")
    "Return radiator temperature";
  parameter Modelica.SIunits.Temperature TGrid(displayUnit="Celsius")
    "Grid supply temperature";

  replaceable BaseClasses.ProductionSite productionSite(
    m_flow_nominal=m_flow_nominal,
    grid_dp=grid.dp_nominal,
    TSupplyGrid=TGrid,
    redeclare package Medium = IDEAS.Media.Water)
    annotation (Placement(transformation(extent={{10,-18},{-10,2}})));
  replaceable DeSchipjes.Interfaces.BaseClasses.Grid grid(
    m_flow_nominal=m_flow_nominal,
    TSupplyRad=TRadSupply,
    TReturnRad=TRadReturn,
    TGrid=TGrid,
    redeclare package Medium = IDEAS.Media.Water)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    nPorts=1,
    use_T=false,
    redeclare package Medium = IDEAS.Media.Water)
                 annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={36,26})));
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
      points={{36,16},{36,10},{20,10},{20,-8},{10,-8}},
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
