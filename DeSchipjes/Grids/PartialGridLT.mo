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

equation
  Qhea = haarHakker1.heatingSystem.Qhea
    + haarHakker2.heatingSystem.Qhea + haarHakker3.heatingSystem.Qhea
    + haarHakker4.heatingSystem.Qhea + haarHakker5.heatingSystem.Qhea
    + peterslei1.heatingSystem.Qhea + peterslei2.heatingSystem.Qhea
    + peterslei3.heatingSystem.Qhea + peterslei4.heatingSystem.Qhea
    + peterslei5.heatingSystem.Qhea + peterslei6.heatingSystem.Qhea;
  Qsh = haarHakker1.heatingSystem.Qsh
    + haarHakker2.heatingSystem.Qsh + haarHakker3.heatingSystem.Qsh
    + haarHakker4.heatingSystem.Qsh + haarHakker5.heatingSystem.Qsh
    + peterslei1.heatingSystem.Qsh + peterslei2.heatingSystem.Qsh
    + peterslei3.heatingSystem.Qsh + peterslei4.heatingSystem.Qsh
    + peterslei5.heatingSystem.Qsh + peterslei6.heatingSystem.Qsh;
  Qdhw = haarHakker1.heatingSystem.Qdhw
    + haarHakker2.heatingSystem.Qdhw + haarHakker3.heatingSystem.Qdhw
    + haarHakker4.heatingSystem.Qdhw + haarHakker5.heatingSystem.Qdhw
    + peterslei1.heatingSystem.Qdhw + peterslei2.heatingSystem.Qdhw
    + peterslei3.heatingSystem.Qdhw + peterslei4.heatingSystem.Qdhw
    + peterslei5.heatingSystem.Qdhw + peterslei6.heatingSystem.Qdhw;

  Qsto = haarHakker1.heatingSystem.Qsto
    + haarHakker2.heatingSystem.Qsto + haarHakker3.heatingSystem.Qsto
    + haarHakker4.heatingSystem.Qsto + haarHakker5.heatingSystem.Qsto
    + peterslei1.heatingSystem.Qsto + peterslei2.heatingSystem.Qsto
    + peterslei3.heatingSystem.Qsto + peterslei4.heatingSystem.Qsto
    + peterslei5.heatingSystem.Qsto + peterslei6.heatingSystem.Qsto;

  Qhp = haarHakker1.heatingSystem.Qhp
    + haarHakker2.heatingSystem.Qhp + haarHakker3.heatingSystem.Qhp
    + haarHakker4.heatingSystem.Qhp + haarHakker5.heatingSystem.Qhp
    + peterslei1.heatingSystem.Qhp + peterslei2.heatingSystem.Qhp
    + peterslei3.heatingSystem.Qhp + peterslei4.heatingSystem.Qhp
    + peterslei5.heatingSystem.Qhp + peterslei6.heatingSystem.Qhp;
  PboosEl = haarHakker1.heatingSystem.PboosEl
    + haarHakker2.heatingSystem.PboosEl + haarHakker3.heatingSystem.PboosEl
    + haarHakker4.heatingSystem.PboosEl + haarHakker5.heatingSystem.PboosEl
    + peterslei1.heatingSystem.PboosEl + peterslei2.heatingSystem.PboosEl
    + peterslei3.heatingSystem.PboosEl + peterslei4.heatingSystem.PboosEl
    + peterslei5.heatingSystem.PboosEl + peterslei6.heatingSystem.PboosEl;

  annotation (Icon(graphics={Text(
          extent={{-82,32},{-22,-26}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="L")}));
end PartialGridLT;
