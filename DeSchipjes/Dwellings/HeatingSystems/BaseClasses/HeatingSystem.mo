within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model HeatingSystem
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem;

  //Parameters
  parameter Modelica.SIunits.Power[nZones] QNom
    "Nominal heating power of each zone";
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-100},{200,100}}), graphics));
end HeatingSystem;
