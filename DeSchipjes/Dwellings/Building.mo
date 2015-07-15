within DeSchipjes.Dwellings;
model Building
  extends IDEAS.Interfaces.Building(redeclare replaceable
      HeatingSystems.BaseClasses.HeatingSystem heatingSystem(QNom=building.Q_design));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Building;
