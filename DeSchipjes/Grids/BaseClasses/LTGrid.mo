within DeSchipjes.Grids.BaseClasses;
model LTGrid
  //Extensions
  extends BaseClasses.PartialArrayGrid(
    haarhakkerBuildings(
      redeclare each DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
    petersleiBuildings(
      redeclare each DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem));

end LTGrid;
