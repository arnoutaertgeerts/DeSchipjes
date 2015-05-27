within DeSchipjes.Grids;
package Full
  model HTFullGrid
    extends DeSchipjes.Grids.FullGrid;

  end HTFullGrid;

  model ITFullGrid
    extends DeSchipjes.Grids.FullGrid;

  end ITFullGrid;

  model LTFullGrid
    extends DeSchipjes.Grids.FullGrid(
      haarhakkerHouse1(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      haarhakkerHouse2(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      haarhakkerHouse3(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      haarhakkerHouse4(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      haarhakkerHouse5(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      petersleiHouse6(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      petersleiHouse7(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      petersleiHouse8(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      petersleiHouse9(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      petersleiHouse10(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      petersleiHouse11(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem             heatingSystem),
      dHConnection11(T_start=TGrid),
      dHConnection1(T_start=TGrid),
      dHConnection4(T_start=TGrid),
      dHConnection5(T_start=TGrid),
      dHConnection8(T_start=TGrid),
      dHConnection2(T_start=TGrid),
      dHConnection3(T_start=TGrid),
      dHConnection6(T_start=TGrid),
      dHConnection7(T_start=TGrid),
      dHConnection9(T_start=TGrid),
      dHConnection10(T_start=TGrid));

  end LTFullGrid;

  model LTFullGridMFlow
    extends LTFullGrid(
      haarhakkerHouse(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      haarhakkerHouse1(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      haarhakkerHouse2(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      haarhakkerHouse3(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      haarhakkerHouse4(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      petersleiHouse(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      petersleiHouse1(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      petersleiHouse2(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      petersleiHouse3(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      petersleiHouse4(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem),
      petersleiHouse5(redeclare
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemMFlow
          heatingSystem));

  end LTFullGridMFlow;
end Full;
