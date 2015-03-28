within DeSchipjes.Tests;
model ScenarioTest
  extends Interfaces.Scenario(redeclare Grids.BaseClasses.HTGrid grid(
      nBuildings=2,
      TSupplyRad=343.15,
      TReturnRad=328.15,
      TSupplyGrid=353.15,
      buildings(redeclare
          IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
          ventilationSystem)),
      redeclare ProductionSites.IdealProduction productionSite);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end ScenarioTest;
