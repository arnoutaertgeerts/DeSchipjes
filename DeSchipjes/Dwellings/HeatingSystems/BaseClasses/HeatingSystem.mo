within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model HeatingSystem
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem;

  //Parameters
  parameter Modelica.SIunits.Power[nZones] QNom
    "Nominal heating power of each zone";

  parameter Boolean modulating=true;
  Modelica.Blocks.Interfaces.BooleanInput u if modulating annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-104})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-100},{200,100}}), graphics));
end HeatingSystem;
