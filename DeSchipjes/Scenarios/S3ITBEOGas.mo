within DeSchipjes.Scenarios;
model S3ITBEOGas
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMIT
      grid(ids={1,3,4,5,6,8,10,11,13,14,19}),
            redeclare DeSchipjes.ProductionSites.GasBeoModulating
      productionSite,
    Qbase(u=28.8),
    Qpeak(u=72),
    TSupRad(u=45),
    TRetRad(u=35),
    TStorage(u=60));

public
  DeSchipjes.Controls.Modulator
                     modulator(start=2)
    annotation (Placement(transformation(extent={{-92,40},{-72,60}})));
public
  DeSchipjes.Controls.Modulator
                     modulator1(start=2, duration=1 + 5/60)
    annotation (Placement(transformation(extent={{-2,40},{18,60}})));
equation
  connect(modulator.on, grid.u)
    annotation (Line(points={{-71,50},{-62,50},{-62,11}}, color={255,0,255}));
  connect(modulator1.on, productionSite.modulation)
    annotation (Line(points={{19,50},{28,50},{28,11}}, color={255,0,255}));
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="3")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=2.62974e+006,
      __Dymola_fixedstepsize=5,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">Modulating production site</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Space heating is done by low temperature radiatoros. DHW is done by charging a storage tank once a day.</span></p>
<ul>
<li><b><span style=\"font-family: MS Shell Dlg 2;\">Base: </span></b>Heatpump water-water of 28.8 kW. Used to heat the water from 45&deg;C to 55&deg;C (stored in the storage tank)</li>
<li><b><span style=\"font-family: MS Shell Dlg 2;\">Peak: </span></b>Boiler used for peak moments in heating and increasing the supply temperature to 70&deg;C during the heating of the storage tank<br></li>
</ul>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">Dimensioning of the power units</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Qpeak = m c<sub>p </sub></span><span style=\"font-family: GreekC;\">D</span><span style=\"font-family: MS Shell Dlg 2;\">T n = 0.167 (kg/s) * 4180 (J/kgK) * (70&deg;C-50&deg;C) * 11= 154 kW</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">This value is higher than dimensioned by Boydens (72 kW)</span></li>
<li><i><span style=\"font-family: MS Shell Dlg 2;\">The high value of the boiler is due to heating all the boilers at the same time, essentially creating a peak moment.</span></i></li>
</ul>
<p>Qbase = Based on the maximum size of the beo-field</p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">The HPWW will only be able to supply the heat of the SH if the demand is low enough</span></li>
</ul>
</html>"));
end S3ITBEOGas;
