within DeSchipjes.Tests;
model ScenarioTest
  extends Interfaces.Scenario(redeclare Grids.TestGridWithTwoHouses grid(
      TSupplyRad=343.15,
      TReturnRad=328.15,
      TSupplyGrid=353.15),
      redeclare ProductionSites.IdealProduction productionSite);

end ScenarioTest;
