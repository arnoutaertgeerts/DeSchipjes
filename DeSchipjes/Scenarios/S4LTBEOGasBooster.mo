within DeSchipjes.Scenarios;
model S4LTBEOGasBooster
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMLT
      grid(ids={1,3,4,5,6,8,10,11,13,14,19}),
            redeclare DeSchipjes.ProductionSites.GasBeo productionSite(
        modulating=false),
    Qpeak(u=72),
    Qbase(u=42.8),
    TSupRad(u=45),
    TRetRad(u=35),
    TStorage(u=60));

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="4")}),
    experiment(StopTime=3.15569e+007, __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput);
end S4LTBEOGasBooster;
