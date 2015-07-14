within DeSchipjes.ProductionSites;
model IdealProductionMFlow

  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(modulating=false);

  Modelica.Blocks.Sources.RealExpression realExpression(y=TSupplyGrid)
    annotation (Placement(transformation(extent={{-84,50},{-64,70}})));
  Heaters.IdealHeater idealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(realExpression.y, idealHeater.TSet) annotation (Line(
      points={{-63,60},{-26,60},{-26,6},{-12,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(port_a, idealHeater.port_a) annotation (Line(
      points={{-100,0},{-10,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, port_b) annotation (Line(
      points={{10,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end IdealProductionMFlow;
