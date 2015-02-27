within DeSchipjes.Data;
package Insulation
  record RotsWolSpanten = IDEAS.Buildings.Data.Interfaces.Insulation (
      final k=0.07,
      final c=840,
      final rho=110,
      final epsLw=0.8,
      final epsSw=0.8) "RotsWolSpanten";
  record RotsWolSKepers = IDEAS.Buildings.Data.Interfaces.Insulation (
      final k=0.06,
      final c=840,
      final rho=110,
      final epsLw=0.8,
      final epsSw=0.8) "RotsWolSKepers";
  record RotsWolRegelWerk=IDEAS.Buildings.Data.Interfaces.Insulation (
      final k=0.062,
      final c=840,
      final rho=110,
      final epsLw=0.8,
      final epsSw=0.8) "RotsWolRegelWerk";
end Insulation;
