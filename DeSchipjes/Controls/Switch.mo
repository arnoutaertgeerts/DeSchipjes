within DeSchipjes.Controls;
block Switch "Switch between two Real signals"
  extends Modelica.Blocks.Icons.PartialBooleanBlock;

  parameter Real on "Output value if the input is true";
  parameter Real off "Output value if the input is false";

  Modelica.Blocks.Interfaces.BooleanInput u "Connector of Boolean input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput
                               y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}},
          rotation=0)));

equation
  y = if u then on else off;
  annotation (
    defaultComponentName="switch1",
    Documentation(info="<html>
<p>The Logical.Switch switches, depending on the
logical connector u2 (the middle connector)
between the two possible input signals
u1 (upper connector) and u3 (lower connector).</p>
<p>If u2 is <b>true</b>, the output signal y is set equal to
u1, else it is set equal to u3.</p>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={
        Line(points={{12.0,0.0},{100.0,0.0}},
          color={0,0,127}),
        Line(points={{-100.0,0.0},{-40.0,0.0}},
          color={255,0,255}),
        Line(points={{-40.0,12.0},{-40.0,-12.0}},
          color={255,0,255}),
        Line(points={{-38,58},{6,2}},
          color={0,0,127},
          thickness=1.0),
        Ellipse(lineColor={0,0,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{2.0,-8.0},{18.0,8.0}}),
        Text(
          extent={{-80,100},{100,60}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%on",
          horizontalAlignment=TextAlignment.Left),
        Text(
          extent={{-80,-58},{100,-98}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          horizontalAlignment=TextAlignment.Left,
          textString="%off")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})));
end Switch;
