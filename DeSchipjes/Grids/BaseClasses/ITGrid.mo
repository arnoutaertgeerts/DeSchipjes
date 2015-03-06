within DeSchipjes.Grids.BaseClasses;
model ITGrid
  //Extensions
  extends BaseClasses.PartialArrayGrid(
                           buildings(redeclare each
        DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem));

end ITGrid;
