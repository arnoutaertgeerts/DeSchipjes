within DeSchipjes.Scenarios;
model S4LTHeatingCurve
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    TRadSupply=273.15+50,
    TRadReturn=273.15+40,
    TGrid=273.15+55,
    redeclare DeSchipjes.ProductionSites.IdealProduction productionSite,
    redeclare DeSchipjes.Grids.Full.LTFullGrid    grid);

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="4")}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=86000),
    __Dymola_experimentSetupOutput);
end S4LTHeatingCurve;
