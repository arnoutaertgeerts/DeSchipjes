within DeSchipjes.Grids.BaseClasses;
model HTGrid
  //Extensions
  extends BaseClasses.PartialArrayGrid(buildings(
    redeclare each DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
                                                            heatingSystem));

end HTGrid;
