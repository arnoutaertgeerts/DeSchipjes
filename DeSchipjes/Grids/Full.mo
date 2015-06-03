within DeSchipjes.Grids;
package Full
  model HTFullGrid
    extends DeSchipjes.Grids.FullGrid;

  end HTFullGrid;

  model ITFullGrid
    extends DeSchipjes.Grids.FullGrid(
      haarhakkerHouse1(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      haarhakkerHouse2(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      haarhakkerHouse3(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      haarhakkerHouse4(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      haarhakkerHouse5(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      petersleiHouse6(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      petersleiHouse7(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      petersleiHouse8(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      petersleiHouse9(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      petersleiHouse10(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem),
      petersleiHouse11(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
          heatingSystem));

  end ITFullGrid;

  model ITFullGridReverse
    extends DeSchipjes.Grids.FullGrid(
      haarhakkerHouse1(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      haarhakkerHouse2(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      haarhakkerHouse3(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      haarhakkerHouse4(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      haarhakkerHouse5(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      petersleiHouse6(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      petersleiHouse7(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      petersleiHouse8(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      petersleiHouse9(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      petersleiHouse10(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem),
      petersleiHouse11(redeclare replaceable
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemReverse
          heatingSystem));

  end ITFullGridReverse;

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

end Full;
