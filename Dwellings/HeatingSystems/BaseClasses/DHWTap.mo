within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
model DHWTap
  extends IDEAS.Fluid.Domestic_Hot_Water.DHW_RealInput;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-40},{140,100}}), graphics={
        Rectangle(
          extent={{-100,100},{140,-40}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{8,-12},{28,-12},{28,54},{8,54},{8,-12}},
          lineColor={135,135,135},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{8,42},{28,42},{28,62},{8,82},{-30,82},{-50,62},{-50,42},
              {-32,42},{-32,56},{-22,64},{0,64},{8,56},{8,42}},
          lineColor={135,135,135},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-32,28},{8,28},{-2,-12},{-22,-12},{-32,28}},
          lineColor={135,135,135},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-26,34},{2,26}},
          lineColor={255,85,85},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{28,28},{68,28},{58,-12},{38,-12},{28,28}},
          lineColor={135,135,135},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{34,34},{62,26}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}));
end DHWTap;
