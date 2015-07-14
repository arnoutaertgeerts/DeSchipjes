within DeSchipjes.Dwellings.Structures.Renovated;
package ROM
  model RowHouse
    extends DeSchipjes.Dwellings.Structures.PartialSingleZone(
      floor(redeclare
          DeSchipjes.Dwellings.Structures.Data.Constructions.Renovated.Vloer1
          constructionType, insulationThickness=0),
      backWall(insulationThickness=0, redeclare
          DeSchipjes.Dwellings.Structures.Data.Constructions.Renovated.GevelType1
          constructionType),
      frontWall(insulationThickness=0, redeclare
          DeSchipjes.Dwellings.Structures.Data.Constructions.Renovated.GevelType1
          constructionType),
      zone(n50=5));

  end RowHouse;

  model PetersLeiROM "ROM House in the direction of the Petersleistraat"

    extends RowHouse(
      right=-27,
      left=153,
      front=243,
      back=63);

  end PetersLeiROM;

  model HaarhakkerROM "ROM House in the direction of the HaarHakkerstraat"

    extends RowHouse(
      right=243,
      left=63,
      front=153,
      back=-27);

  end HaarhakkerROM;
end ROM;
