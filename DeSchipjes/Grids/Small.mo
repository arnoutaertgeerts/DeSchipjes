within DeSchipjes.Grids;
package Small
  model LTSmallGrid
    extends DeSchipjes.Grids.SmallGrid(
      haarhakkerHouse(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      haarhakkerHouse1(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      petersleiHouse(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      petersleiHouse1(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      dHConnection(T_start=TGrid),
      dHConnection1(T_start=TGrid),
      dHConnection2(T_start=TGrid),
      dHConnection3(T_start=TGrid));

  end LTSmallGrid;
end Small;
