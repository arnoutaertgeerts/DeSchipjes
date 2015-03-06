within DeSchipjes.Grids;
model HTGrid
  //Extensions
  extends PartialArrayGrid(buildings(redeclare each
        DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem));

end HTGrid;
