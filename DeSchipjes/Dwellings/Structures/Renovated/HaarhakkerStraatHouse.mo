within DeSchipjes.Dwellings.Structures.Renovated;
model HaarhakkerStraatHouse "House in the direction of the Haarhakkerstraat"
  extends RowHouse(
    right=243,
    left=63,
    front=153,
    back=-27,
    woonruimteWindow(addAngles=addAngles),
    keukenWindowSmall(addAngles=addAngles),
    keukenWindowLarge(addAngles=addAngles),
    raamwc(addAngles=addAngles),
    slaapkamerRaam(addAngles=addAngles),
    woonruimte(linearise=linearise),
    woonruimteHal(linearise_a=linearise, linearise_b=linearise),
    woonruimteBad(linearise_a=linearise, linearise_b=linearise),
    woonruimteSlaapkamer(linearise_a=linearise, linearise_b=linearise),
    woonruimteKeuken(linearise_a=linearise, linearise_b=linearise),
    woonruimteVloer(linearise=linearise),
    woonruimteAchtergevel(linearise=linearise),
    woonruimteKoer(linearise=linearise),
    woonruimteGemeenschappelijk(linearise=linearise),
    woonruimteVoorgevel(linearise=linearise));

    annotation (Placement(transformation(extent={{210,170},{190,190}})),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-100},{220,
            200}})));
end HaarhakkerStraatHouse;
