within DeSchipjes.Scenarios;
model S2ITIdeal "IT grid with ideal production"
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    TRadSupply=273.15+50,
    TRadReturn=273.15+40,
    TGrid=273.15+55,
    redeclare DeSchipjes.Grids.Full.ITFullGrid
                                       grid, redeclare
      DeSchipjes.ProductionSites.IdealModulatingProduction productionSite(
        TSupplyGridHigh=273.15+75,
        modulating=true));

equation
  connect(productionSite.y, grid.u) annotation (Line(
      points={{0,3},{0,10},{-28,10},{-28,48},{0,48},{0,37}},
      color={255,0,255},
      smooth=Smooth.None));
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
