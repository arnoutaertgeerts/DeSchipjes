within DeSchipjes.Controls;
model MaxQ

  parameter Real reset = 86400;
  parameter Real max = 21e6;
  parameter Real yMin = 0;

  Real x(start=0);
  Real hour;

  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,108})));

  Modelica.Blocks.Interfaces.RealInput u1
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-108,0})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
equation
  der(x) = u;

  hour = mod(time, 86400) / 3600;

  when hour >= 2 then
    reinit(x, 0);
  end when;

  if x < max then
    y = u1;
  else
    y = yMin;
  end if;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end MaxQ;
