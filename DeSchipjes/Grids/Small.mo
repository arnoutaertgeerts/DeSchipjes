within DeSchipjes.Grids;
package Small
  model LTSmallGrid
    extends DeSchipjes.Grids.SmallGrid(
      haarhakkerHouse1(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      haarhakkerHouse2(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      petersleiHouse3(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      petersleiHouse4(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
      petersleiHouse5(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem));

  end LTSmallGrid;
end Small;
