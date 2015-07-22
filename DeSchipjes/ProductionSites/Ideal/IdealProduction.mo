within DeSchipjes.ProductionSites.Ideal;
model IdealProduction

  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(modulating=false);

  Modelica.Blocks.Sources.RealExpression realExpression(y=TSupRad)
    annotation (Placement(transformation(extent={{-84,50},{-64,70}})));
  Annex60.Fluid.HeatExchangers.HeaterCooler_T
                      idealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(port_a, idealHeater.port_a) annotation (Line(
      points={{100,-60},{-20,-60},{-20,0},{-10,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, port_b) annotation (Line(
      points={{10,0},{56,0},{56,60},{100,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression.y, idealHeater.TSet) annotation (Line(points={{-63,60},
          {-30,60},{-30,6},{-12,6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})));
end IdealProduction;
