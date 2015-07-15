within DeSchipjes.Scenarios;
model S1HTIdeal
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    redeclare DeSchipjes.ProductionSites.IdealProductionMFlow
                                              productionSite(TSupplyGrid=273.15 + 75),
    redeclare DeSchipjes.Grids.ROM.ROMHT          grid);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="1i")}));
end S1HTIdeal;
