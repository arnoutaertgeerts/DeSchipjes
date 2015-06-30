within DeSchipjes.Dwellings;
model Building
  extends IDEAS.Interfaces.Building(redeclare replaceable
      HeatingSystems.BaseClasses.HeatingSystem             heatingSystem(
        modulation=modulation));

  parameter Boolean modulation=false;

  Modelica.Blocks.Interfaces.BooleanInput u if modulation annotation (Placement(
        transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-80,-10},
            {-60,10}})));
  Modelica.Blocks.Interfaces.RealOutput valveOpening annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-20})));
equation
  connect(u, heatingSystem.HT) annotation (Line(
      points={{-100,0},{-76,0},{-76,-16},{3.8,-16},{3.8,-10.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(heatingSystem.valveOpening, valveOpening) annotation (Line(
      points={{2.2,-10.2},{2.2,-20},{-100,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Building;
