within DeSchipjes.Data;
package Materials
  record Pleister = IDEAS.Buildings.Data.Interfaces.Material (
      k=0.52,
      c=840,
      rho=1300,
      epsLw=0.85,
      epsSw=0.65) "Pleister";
  record Metselwerk=IDEAS.Buildings.Data.Interfaces.Material (
      k=1.32,
      c=840,
      rho=2200,
      epsLw=0.88,
      epsSw=0.55) "Metselwerk";
  record SnelBouwSteen = IDEAS.Buildings.Data.Interfaces.Material (
      k=0.125,
      c=840,
      rho=450,
      epsLw=0.8,
      epsSw=0.8) "Isolerende snelbouwsteen";
  record GipsKartonPlaat =
                    IDEAS.Buildings.Data.Interfaces.Material (
      k=0.29,
      c=840,
      rho=1100,
      epsLw=0.85,
      epsSw=0.65) "Gips karton plaat";
  record VezelCement = IDEAS.Buildings.Data.Interfaces.Material (
      k=0.18,
      c=840,
      rho=1200,
      epsLw=0.86,
      epsSw=0.44) "Vezel Cement Plaatt";
  record HoutVezel =   IDEAS.Buildings.Data.Interfaces.Material (
      k=0.23,
      c=840,
      rho=1200,
      epsLw=0.86,
      epsSw=0.44) "Houtvezel plaat";
  record OSB =         IDEAS.Buildings.Data.Interfaces.Material (
      k=0.13,
      c=840,
      rho=650,
      epsLw=0.86,
      epsSw=0.44) "OSB-plaat";
  record GewapendBeton =IDEAS.Buildings.Data.Interfaces.Material (
      k=1.7,
      c=920,
      rho=2400,
      epsLw=0.88,
      epsSw=0.55) "Gewapend Beton";
  record GrestTegels =
                IDEAS.Buildings.Data.Interfaces.Material (
      k=1.2,
      c=840,
      rho=2300,
      epsLw=0.88,
      epsSw=0.55) "GrestTegels";
  record Chape = IDEAS.Buildings.Data.Interfaces.Material (
      k=0.93,
      c=840,
      rho=1100,
      epsLw=0.88,
      epsSw=0.55) "Chape";
  record Uitvulling = IDEAS.Buildings.Data.Interfaces.Material (
      final k=1.3,
      final c=1250,
      final rho=1200,
      final epsLw=0.88,
      final epsSw=0.68) "Uitvulling";
end Materials;
