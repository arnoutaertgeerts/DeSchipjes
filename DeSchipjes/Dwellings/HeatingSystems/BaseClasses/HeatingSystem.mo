within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
model HeatingSystem
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem;

  parameter Boolean modulation = true
    "Set to true to allow for time modulation of the DH grid";

  Modelica.Blocks.Interfaces.BooleanInput HT if modulation annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-104}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-102})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-100},{200,100}}), graphics));
end HeatingSystem;
