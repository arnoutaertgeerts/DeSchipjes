within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model HeatingSystem
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem;

  parameter Boolean modulating = true
    "Set to true to allow for time modulation of the DH grid";

  Modelica.Blocks.Interfaces.RealInput supplyT if modulating annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-104}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={38,-102})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-100},{200,100}}), graphics));
end HeatingSystem;
