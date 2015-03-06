within DeSchipjes.Grids;
model HTGrid
  //Extensions
  extends PartialArrayGrid(buildings(redeclare
        DeSchipjes.Dwellings.Structures.Renovated.RowHouse building));

end HTGrid;
