within DeSchipjes.Tests;
model ScenarioTest
  extends Interfaces.Scenario(redeclare Grids.HTGrid grid(
      TSupplyRad=343.15,
      TReturnRad=328.15,
      TSupplyGrid=353.15,
      nBuildings=2),
      redeclare ProductionSites.IdealProduction productionSite);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end ScenarioTest;
