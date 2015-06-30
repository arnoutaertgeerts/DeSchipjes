within DeSchipjes.Controls;
model add

  parameter Real minus;

  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

initial equation
  y=initialValue;
equation
  hour = time/3600;

  when
      (hour > start) then
    y=u;
  end when;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={      Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={210,210,210},
          lineThickness=5.0,
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised),
        Text(
          extent={{-48,-74},{48,-88}},
          lineColor={0,0,255},
          textString="%start"),
        Line(
          points={{-60,80},{-60,-60},{80,-60}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-60,80},{-80,60}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-60,80},{-40,60}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{80,-60},{60,-40}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{80,-60},{60,-80}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{0,-60},{0,-64}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-60,-40},{0,-40},{0,0},{102,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{-144,-32},{-64,-46}},
          lineColor={0,0,255},
          textString="%initialValue")}));
end add;
