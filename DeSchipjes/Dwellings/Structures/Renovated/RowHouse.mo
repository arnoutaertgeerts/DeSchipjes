within DeSchipjes.Dwellings.Structures.Renovated;
model RowHouse
  "Renovated house not in a corner. These houses include: 152, 154, 156, 148, 146, 144, 142, 140, 138"
  extends PartialRenovated(
    woonruimteHal(azi=0),
    woonruimteKeuken(azi=perpendicularAzi),
    woonruimteGemeenschappelijk(azi=perpendicularAzi),
    woonruimteAchtergevel(azi=streetAzi),
    woonruimteVoorgevel(azi=streetAzi),
    woonruimteKoer(azi=perpendicularAzi),
    keukenAchtergevel(azi=streetAzi),
    keukenWindowLarge(azi=streetAzi),
    keukenWindowSmall(azi=streetAzi),
    keukenGemeenschappelijk(azi=perpendicularAzi),
    keukenWC(azi=streetAzi),
    WCKoer(azi=perpendicularAzi),
    WCVoorgevel(azi=streetAzi),
    raamwc(azi=streetAzi),
    WCGemeenschappelijk(azi=perpendicularAzi),
    slaapkamerZijgevel(azi=perpendicularAzi),
    slaapkamerVoorgevel(azi=streetAzi),
    slaapkamerGemeenschappelijk(azi=perpendicularAzi),
    slaapkamerBadLiggend(azi=streetAzi),
    slaapkamerBadStaand(azi=perpendicularAzi),
    slaapkamerDakLinks(azi=perpendicularAzi),
    slaapkamerDakRechts(azi=perpendicularAzi),
    slaapkamerHal(azi=streetAzi),
    slaapkamerRaam(azi=streetAzi),
    badkamerAchtergevel(azi=streetAzi),
    badkamerZijgevel(azi=perpendicularAzi),
    badkamerHal(azi=perpendicularAzi),
    badkamerDak(azi=streetAzi, inc=306),
    WCDak(azi=streetAzi),
    halAchtergevel(azi=streetAzi),
    halGemeenschappelijk(azi=perpendicularAzi),
    halDak(azi=streetAzi),
    keukenDak(azi=streetAzi),
    woonruimteWindow(inc=1.5707963267949, azi=perpendicularAzi));

  parameter Modelica.SIunits.Angle streetAzi
    "Azimuth parallel to the street direction";
  parameter Modelica.SIunits.Angle perpendicularAzi
    "Azimuth perpendicular on the street direction";

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{220,200}}), graphics));
end RowHouse;
