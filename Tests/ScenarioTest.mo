within DeSchipjes.Tests;
model ScenarioTest
  extends Interfaces.Scenario(redeclare Grids.TestGridWithTwoHouses grid,
      redeclare ProductionSites.IdealProduction productionSite);

end ScenarioTest;
