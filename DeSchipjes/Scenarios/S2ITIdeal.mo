within DeSchipjes.Scenarios;
model S2ITIdeal "IT grid with ideal production"
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    redeclare DeSchipjes.Grids.ROM.ROMIT     grid(TSupplyRad=273.15 + 50, TReturnRad=273.15 +
          35),                               redeclare
      DeSchipjes.ProductionSites.IdealModulatingProduction productionSite(
        TSupplyGridHigh=273.15+75));

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="2")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics),
    experiment(
      StopTime=604800,
      __Dymola_fixedstepsize=10,
      __Dymola_Algorithm="Rkfix4"),
    __Dymola_experimentSetupOutput);
end S2ITIdeal;
