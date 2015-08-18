within DeSchipjes.Scenarios;
model S1HTGasSun
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    redeclare DeSchipjes.ProductionSites.GasSun                productionSite,
    redeclare DeSchipjes.Grids.ROM.ROMHT          grid(ids={1,3,4,5,6,8,10,11,
          13,14,19}),
    TSupRad(u=70),
    TRetRad(u=50),
    TSupGrid(u=80),
    TRetGrid(u=63),
    Qbase(u=0.0),
    Qpeak(u=215.4));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="1")}),
    experiment(StopTime=3.15569e+007, __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">High temperature production site</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">A production site which provides a high supply temperature where DHW is provided using a flow-through heat exchanger.</span></p>
<ul>
<li><b><span style=\"font-family: MS Shell Dlg 2;\">Base: </span></b>A solar collector</li>
<li><b><span style=\"font-family: MS Shell Dlg 2;\">Peak: </span></b>Boiler used for space and dhw heating<br></li>
</ul>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">Dimensioning of the power units</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Qdhw = m c<sub>p </sub></span><span style=\"font-family: GreekC;\">D</span><span style=\"font-family: MS Shell Dlg 2;\">T n = max (kg/s) * 4180 (J/kgK) * (70&deg;C-50&deg;C) * 11= 154 kW</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Qbase = Q<sub>nom, heating</sub> * n = 5 kW * 11 = 55 kW</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Qpeak = Qdhw + Qbase = 215 kW</span></p>
<ul>
<li>Dimensionering navragen! (Arnold)</li>
</ul>
</html>"));
end S1HTGasSun;
