within DeSchipjes.Controls;
model OnOff
  Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          extent={{-140,-20},{-100,20}}), iconTransformation(extent={{-140,-20},
            {-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-10,-18},{10,2}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-82,-26},{-62,-6}})));
equation
  connect(switch1.y, y) annotation (Line(
      points={{11,-8},{60,-8},{60,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u, switch1.u2) annotation (Line(
      points={{0,-120},{0,-38},{-40,-38},{-40,-8},{-12,-8}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(u1, switch1.u1) annotation (Line(
      points={{-120,0},{-70,0},{-70,0},{-12,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, switch1.u3) annotation (Line(
      points={{-61,-16},{-12,-16}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                                         Rectangle(
          extent={{-100,100},{100,-100}},
          fillColor={210,210,210},
          lineThickness=5.0,
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised), Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255}),
        Ellipse(extent={{-60,58},{60,-60}}, lineColor={255,85,170}),
        Line(
          points={{0,86},{0,28}},
          color={255,85,170},
          smooth=Smooth.None)}));
end OnOff;
