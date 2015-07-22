within DeSchipjes.Grids;
model PartialGridLT
  extends PartialGrid(
    modulating=false,
    haarHakker1(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker2(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker3(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker4(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    haarHakker5(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=haarHakker1.building.Q_design)),
    peterslei1(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei2(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei3(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei4(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei5(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)),
    peterslei6(redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
        heatingSystem(
        TSupply=TSupRad,
        TReturn=TRetRad,
        TStorage=TStorage,
        QNom=peterslei1.building.Q_design)));

  annotation (Icon(graphics={Text(
          extent={{-82,32},{-22,-26}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="L")}));
end PartialGridLT;
