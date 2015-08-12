within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model HeatingSystem
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem;

  //Parameters
  parameter Modelica.SIunits.Power[nZones] QNom
    "Nominal heating power of each zone";

  parameter Boolean modulating=true;

  //Variables
  Modelica.SIunits.Power Qhea "Usefull heating power";
  Modelica.SIunits.Power Ehea "Usefull heating energy";

  Modelica.SIunits.Power Qsh "Usefull heating power for SH";
  Modelica.SIunits.Power Esh "Usefull heating energy for SH";

  Modelica.SIunits.Power Qdhw "Usefull heating power for DHW";
  Modelica.SIunits.Power Edhw "Usefull heating energy for DHW";

  Modelica.SIunits.Power PboosEl
    "Electricity power usage of the grid (booster HPs)";
  Modelica.SIunits.Energy EboosEl "Electric energy usage of the grid";

  Modelica.SIunits.Power Qhp "Heat power production of the grid (booster HPs)";
  Modelica.SIunits.Energy Ehp
    "Heat energy production of the grid (booster HPs)";

  Modelica.SIunits.Power Qsto "Heat loss of the storage tanks";
  Modelica.SIunits.Energy Esto "Energy loss of the storage tanks";

  Modelica.Blocks.Interfaces.BooleanInput u if modulating annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-104})));

equation
  QHeaSys = 0;

  der(Ehea) = Qhea;
  der(Esh) = Qsh;
  der(Edhw) = Qdhw;
  der(EboosEl) = PboosEl;
  der(Ehp) = Qhp;
  der(Esto) = Qsto;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-100},{200,100}}), graphics));
end HeatingSystem;
