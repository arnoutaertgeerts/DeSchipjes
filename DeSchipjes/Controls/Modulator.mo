within DeSchipjes.Controls;
model Modulator
  parameter Integer start=12;
  parameter Integer duration=1;

  Real hour;

  Modelica.Blocks.Interfaces.BooleanOutput on
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
 hour = mod(time, 86400) / 3600;

 if hour > start and hour < start+duration then
   on = true;
 else
   on = false;
 end if;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={95,95,95}),
        Ellipse(
          extent={{9,-10},{-11,10}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-1,0},{52,50}},  color={95,95,95}),
        Text(
        extent={{-300,175},{300,110}},
        textString="%name",
        lineColor={0,0,255},
        fontSize=0),
        Rectangle(
          extent={{80,6},{100,-6}},
          fillPattern=FillPattern.Solid,
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{-100,6},{-80,-6}},
          fillPattern=FillPattern.Solid,
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=90,
          origin={52,-120},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=45,
          origin={80,6},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=135,
          origin={-6,80},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=135,
          origin={122,-48},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Text(
          extent={{-166,-144},{164,-188}},
          lineColor={0,0,0},
          textString="%start h / %duration h
"),     Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=45,
          origin={-50,-120},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=90,
          origin={52,60},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor={95,95,95})}));
end Modulator;
