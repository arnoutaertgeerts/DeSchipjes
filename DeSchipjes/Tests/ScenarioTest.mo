within DeSchipjes.Tests;
model ScenarioTest
  extends Interfaces.Scenario(
    TGrid=273.15+55,
    redeclare Grids.Small.LTSmallGrid  grid(
      TSupplyRad=273.15 + 50,
      TReturnRad=273.15 + 40),
    redeclare ProductionSites.IdealProduction productionSite);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end ScenarioTest;
