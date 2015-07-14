within DeSchipjes.Grids;
model PartialGridIT
  extends PartialGrid(
    final modulating=true,
    haarHakker1(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    haarHakker2(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    haarHakker3(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    haarHakker4(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    haarHakker5(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    peterslei1(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    peterslei2(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    peterslei3(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    peterslei4(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    peterslei5(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)),
    peterslei6(redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage)));

end PartialGridIT;
