within DeSchipjes.ProductionSites;
model BeoGas
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite;

  IDEAS.Fluid.Production.NewBoiler newBoiler
    annotation (Placement(transformation(extent={{-28,50},{-8,70}})));
  IDEAS.Fluid.Production.NewHeatPumpWaterWater newHeatPumpWaterWater
    annotation (Placement(transformation(extent={{-10,-28},{10,-48}})));
  IDEAS.Fluid.HeatExchangers.GroundHeatExchangers.Borefield.MultipleBoreHoles
    multipleBoreHoles
    annotation (Placement(transformation(extent={{10,-78},{-10,-58}})));
equation
  connect(multipleBoreHoles.port_a, newHeatPumpWaterWater.port_b1) annotation (
      Line(
      points={{10,-68},{20,-68},{20,-44},{10,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(multipleBoreHoles.port_b, newHeatPumpWaterWater.port_a1) annotation (
      Line(
      points={{-10,-68},{-20,-68},{-20,-44},{-10,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end BeoGas;
