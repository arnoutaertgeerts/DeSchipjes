within DeSchipjes.Grids;
model PartialGridHT
  extends PartialGrid(
    modulating=false,
    haarHakker1(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker2(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker3(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker4(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker5(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    peterslei1(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei2(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei3(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei4(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei5(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei6(redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(
        TSupply=TSupplyRad,
        TReturn=TReturnRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)));

end PartialGridHT;
