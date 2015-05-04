within DeSchipjes.Dwellings.Structures.Renovated;
model HaarhakkerStraatHouse "House in the direction of the Haarhakkerstraat"
  extends RowHouse(
    streetAzi=(55+90)/180*Modelica.Constants.pi,
    perpendicularAzi=(145+90)/180*Modelica.Constants.pi,
    woonruimteWindow(azi=perpendicularAzi));
    annotation (Placement(transformation(extent={{210,170},{190,190}})));
end HaarhakkerStraatHouse;
