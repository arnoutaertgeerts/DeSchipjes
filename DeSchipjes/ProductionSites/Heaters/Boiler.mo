within DeSchipjes.ProductionSites.Heaters;
model Boiler
  import DeSchipjes;
  //Extensions
  extends IDEAS.Fluid.Production.Interfaces.PartialHeaterTwoPort(
    m2 = 10,
    QNom = heatSource.data.QNomRef,
    m_flow_nominal = heatSource.data.m2_flow_nominal,
    dp_nominal = heatSource.data.dp2_nominal,
    final modulating=true,
    redeclare DeSchipjes.ProductionSites.Heaters.BaseClasses.BoilerHeatSource
      heatSource(useTin1=false));

  Annex60.Fluid.Sensors.Temperature senTem(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-88,8},{-74,20}})));
equation
  connect(senTem.port, preDro.port_a)
    annotation (Line(points={{-81,8},{-81,0},{-60,0}}, color={0,127,255}));
  connect(senTem.T, heatSource.Tin2) annotation (Line(points={{-76.1,14},{-40,
          14},{-6,14},{-6,21.8}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Boiler;
