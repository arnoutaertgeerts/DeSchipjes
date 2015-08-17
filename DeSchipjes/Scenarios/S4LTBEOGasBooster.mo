within DeSchipjes.Scenarios;
model S4LTBEOGasBooster
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMLT
      grid, redeclare DeSchipjes.ProductionSites.GasBeo productionSite(
        modulating=false),
    Qpeak(u=72),
    Qbase(u=43));

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="4")}),
    experiment(StopTime=2.62974e+006, __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput);
end S4LTBEOGasBooster;
