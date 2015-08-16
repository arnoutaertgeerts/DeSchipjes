within DeSchipjes.Controls;
model Input

  parameter Real u;
  parameter String unit;

  parameter Real a=1;
  parameter Real b=0;

  final parameter Real y = a*u+b;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,40},{80,-120}},
          lineColor={28,108,200},
          textString="%u %unit"),
        Text(
          extent={{-100,80},{100,40}},
          lineColor={28,108,200},
          textString="%name")}));
end Input;
