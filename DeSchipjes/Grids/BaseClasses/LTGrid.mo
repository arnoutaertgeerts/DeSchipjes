within DeSchipjes.Grids.BaseClasses;
model LTGrid
  //Extensions
  extends BaseClasses.PartialArrayGrid(
                           buildings(redeclare each
        DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem));

end LTGrid;
