within DeSchipjes.Dwellings;
model Building
  extends IDEAS.Interfaces.Building(redeclare replaceable
      HeatingSystems.BaseClasses.HeatingSystem heatingSystem(QNom=building.Q_design,
        modulating=modulating));

  parameter Boolean modulating=true;

  Modelica.Blocks.Interfaces.BooleanInput u if modulating annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,108})));
equation
  connect(u, heatingSystem.u) annotation (Line(points={{0,108},{0,108},{0,60},{
          -80,60},{-80,-20},{-4,-20},{-4,-10.4}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Building;
