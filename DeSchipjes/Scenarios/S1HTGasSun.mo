within DeSchipjes.Scenarios;
model S1HTGasSun
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    redeclare DeSchipjes.ProductionSites.GasSun                productionSite,
    redeclare DeSchipjes.Grids.ROM.ROMHT          grid,
    TSupRad(u=70),
    TRetRad(u=50),
    TSupGrid(u=80),
    TRetGrid(u=63),
    Qbase(u=0),
    Qpeak(u=215.4));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="1")}),
    experiment(StopTime=604800, __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end S1HTGasSun;
