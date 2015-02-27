within DeSchipjes.Data;
package Constructions
  record BuitenMuurDik "Dikke buiten muur"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=3,
      final mats={
        Materials.Metselwerk(d=0.268),
        insulationType,
        Materials.Pleister(d=0.01)});

  end BuitenMuurDik;

  record BuitenMuurDun "Dunne buiten muur"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=4,
      final mats={
        Materials.Metselwerk(d=0.168),
        Materials.SnelBouwSteen(d=0.1),
        insulationType,
        Materials.Pleister(d=0.01)});

  end BuitenMuurDun;

  record BinnenMuur "binnen muur"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=4,
      final mats={
        Materials.Pleister(d=0.01),
        Materials.Metselwerk(d=0.286),
        insulationType,
        Materials.Pleister(d=0.01)});

  end BinnenMuur;

  record GemeneMuur "gemeenschappelijke muur"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=4,
      final mats={
        Materials.Pleister(d=0.01),
        Materials.Metselwerk(d=0.286),
        insulationType,
        Materials.Pleister(d=0.01)});

  end GemeneMuur;

  record DakHoofdGebouw "Dak in het hoofdgebouw"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=3,
      final mats={
        Materials.VezelCement(d=0.18),
        insulationType,
        Materials.GipsKartonPlaat(d=0.0095)});

  end DakHoofdGebouw;

  record DakBijBouw "Dak in de bijbouw"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=2,
      final mats={
        insulationType,
        Materials.GipsKartonPlaat(d=0.0095)});

  end DakBijBouw;

  record Vloer "Vloer"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=5,
      final mats={
        Materials.GewapendBeton(d=0.12),
        Materials.Chape(d=0.04),
        insulationType,
        Materials.Uitvulling(d=0.06),
        Materials.GrestTegels(d=0.03)});

  end Vloer;

  record Plafond "Tussenverdiep plafonds"

    extends IDEAS.Buildings.Data.Interfaces.Construction(
      nLay=3,
      final mats={
        Materials.GewapendBeton(d=0.2),
        insulationType,
        Materials.GrestTegels(d=0.015)});

  end Plafond;
end Constructions;
