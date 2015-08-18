within DeSchipjes.Scenarios;
model S2ITHPAWGas
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMIT
      grid(ids={1,3,4,5,6,8,10,11,13,14,19}),
            redeclare DeSchipjes.ProductionSites.GasHPAW productionSite,
    Qbase(u=50),
    Qpeak(u=72),
    TSupRad(u=45),
    TRetRad(u=35),
    TStorage(u=60));

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
public
  DeSchipjes.Controls.Modulator
                     modulator(start=3)
    annotation (Placement(transformation(extent={{-92,40},{-72,60}})));
public
  DeSchipjes.Controls.Modulator
                     modulator1(duration=1 + 3/60, start=3)
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
          textString="2")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})),
    experiment(StopTime=2.62974e+006, __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4>Modulating production site</h4>
<p>Space heating is done by low temperature radiatoros. DHW is done by charging a storage tank once a day.</p>
<ul>
<li><b>Base: </b>Heatpump air-water of 55 kW. Used to heat the water from 45&deg;C to 55&deg;C (stored in the storage tank)</li>
<li><b>Peak: </b>Boiler used for peak moments in heating and increasing the supply temperature to 70&deg;C during the heating of the storage tank<br></li>
</ul>
<h4>Dimensioning of the power units</h4>
<p>Qpeak = m c<sub>p </sub><span style=\"font-family: GreekC;\">D</span>T n = 0.167 (kg/s) * 4180 (J/kgK) * (70&deg;C-50&deg;C) * 11= 154 kW</p>
<ul>
<li>This value is higher than dimensioned by Boydens (72 kW)</li>
<li>Should be even higher if the HPAW is unable to work (low outside temperature) and the boiler needs to heat the water from 45&deg;C to 70&deg;C</li>
<li><i>The high value of the boiler is due to heating all the boilers at the same time, essentially creating a top peak moment.</i></li>
</ul>
<p><br>Qbase = Q<sub>nom, heating</sub> * n = 5 kW * 11 = 55 kW</p>
<ul>
<li>If the HPAW is working (outside temperature high enough), it should be able to provide for the entire space heating needs without the help of the boiler</li>
</ul>
</html>"));
end S2ITHPAWGas;
