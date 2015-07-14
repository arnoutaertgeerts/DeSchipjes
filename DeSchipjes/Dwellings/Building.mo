within DeSchipjes.Dwellings;
model Building
  extends IDEAS.Interfaces.Building(redeclare replaceable
      HeatingSystems.BaseClasses.HeatingSystem heatingSystem(
        modulating=modulating, QNom=building.Q_design));

  parameter Boolean modulating=true;

  Modelica.Blocks.Interfaces.RealInput supplyT if modulating annotation (Placement(
        transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-80,-10},
            {-60,10}})));
equation
  connect(supplyT, heatingSystem.supplyT) annotation (Line(
      points={{-100,0},{-74,0},{-74,-20},{3.8,-20},{3.8,-10.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Building;
