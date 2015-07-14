within DeSchipjes.Grids;
package ROM
  model ROMFull
    extends DeSchipjes.Grids.FullGrid(
      haarhakkerHouse1(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM building),

      haarhakkerHouse2(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM building),

      haarhakkerHouse3(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM building),

      haarhakkerHouse4(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM building),

      haarhakkerHouse5(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM building),

      petersleiHouse6(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM building),

      petersleiHouse7(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM building),

      petersleiHouse9(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM building),

      petersleiHouse8(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM building),

      petersleiHouse10(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM building),

      petersleiHouse11(redeclare
          DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM building),

      dHConnection1(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection2(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection3(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection4(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection5(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection6(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection7(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection8(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection9(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection10(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe),
      dHConnection11(redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
          districtHeatingPipe));

  end ROMFull;

  model ROMHT
    extends ROMFull(
      modulating=false,
      haarhakkerHouse1(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      haarhakkerHouse2(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      haarhakkerHouse3(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      haarhakkerHouse4(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      haarhakkerHouse5(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      petersleiHouse6(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      petersleiHouse7(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      petersleiHouse8(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      petersleiHouse9(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      petersleiHouse10(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem),
      petersleiHouse11(redeclare
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem));

  end ROMHT;

  model ROMIT
    extends ROMFull;

  end ROMIT;

  model ROMLT
    extends ROMFull;

  end ROMLT;
end ROM;
