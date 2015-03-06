within DeSchipjes.Grids;
model LTGrid
  //Extensions
  extends PartialArrayGrid(buildings(redeclare each
        DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem));

end LTGrid;
