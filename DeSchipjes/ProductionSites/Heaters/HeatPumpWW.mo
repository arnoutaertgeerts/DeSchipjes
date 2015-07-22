within DeSchipjes.ProductionSites.Heaters;
model HeatPumpWW

  extends IDEAS.Fluid.Production.HeatPumpWaterWater(
    heatSource(redeclare
        IDEAS.Fluid.Production.Data.PerformanceMaps.HeatPumps.VitoCal300GBWS301dotA45
        data));

end HeatPumpWW;
