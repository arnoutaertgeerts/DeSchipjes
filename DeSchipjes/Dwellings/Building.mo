within DeSchipjes.Dwellings;
model Building
  extends IDEAS.Interfaces.Building(redeclare replaceable
      HeatingSystems.BaseClasses.HeatingSystem             heatingSystem(
        modulation=modulation));

  parameter Boolean modulation=false;

  Modelica.Blocks.Interfaces.BooleanInput u if modulation annotation (Placement(
        transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-80,-10},
            {-60,10}})));
equation
  connect(u, heatingSystem.HT) annotation (Line(
      points={{-100,0},{-76,0},{-76,-20},{3,-20},{3,-10.2}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Building;
