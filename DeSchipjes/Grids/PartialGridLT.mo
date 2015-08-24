within DeSchipjes.Grids;
partial model PartialGridLT
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
        QNom=peterslei1.building.Q_design)),
    Pipe1(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR50S
        dim),
    Pipe2(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR50S
        dim),
    Pipe3(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR50S
        dim),
    Pipe4(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR50S
        dim),
    Pipe5(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR50S
        dim),
    Pipe6(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR40S
        dim),
    Pipe7(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR40S
        dim),
    Pipe8(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR32S
        dim),
    Pipe9(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR32S
        dim),
    Pipe10(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR25S
        dim),
    Pipe11(redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR20S
        dim));

  annotation (Icon(graphics={Text(
          extent={{-82,32},{-22,-26}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="L")}));
end PartialGridLT;
