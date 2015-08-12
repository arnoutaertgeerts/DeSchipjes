within DeSchipjes.Scenarios;
model S2ITHPAWGas
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMIT
      grid, redeclare DeSchipjes.ProductionSites.GasHPAW productionSite,
    Qbase(u=50),
    Qpeak(u=154),
    TSupGrid(u=50),
    TRetGrid(u=40),
    TSupRad(u=45),
    TRetRad(u=35));

public
  DeSchipjes.Controls.Modulator
                     modulator(start=2)
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{0,46},{12,34}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=TSupDhw.y)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
equation
  connect(modulator.on, grid.u)
    annotation (Line(points={{-69,40},{-62,40},{-62,11}}, color={255,0,255}));
  connect(switch1.u2, grid.u)
    annotation (Line(points={{-1.2,40},{-62,40},{-62,11}}, color={255,0,255}));
  connect(heatingCurve.TSup, productionSite.TBase)
    annotation (Line(points={{-19,76},{32,76},{32,11}}, color={0,0,127}));
  connect(switch1.u3, productionSite.TBase) annotation (Line(points={{-1.2,44.8},
          {-6,44.8},{-6,76},{32,76},{32,11}}, color={0,0,127}));
  connect(switch1.y, productionSite.THigh)
    annotation (Line(points={{12.6,40},{24,40},{24,11}}, color={0,0,127}));
  connect(realExpression1.y, switch1.u1) annotation (Line(points={{-19,30},{-6,
          30},{-6,35.2},{-1.2,35.2}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="2")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})),
    experiment(StopTime=604800, __Dymola_Algorithm="Cvode"),
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
