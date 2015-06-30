within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorageIDEAS
  //Extensions
  extends PartialRadiators(dHWTap(m_flow_nominal=m_flow_dhw, redeclare package
        Medium = Medium,
      TDHWSet=273.15 + 38), gain(k=(38 - 10)/(60 - 10)));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
    annotation (Placement(transformation(extent={{128,92},{120,100}})));
  Storage.IDEASStorageTank tan(
    redeclare package MediumHX = Medium,
    redeclare package Medium = Medium,
    nbrNodes=4,
    volumeTank=0.1,
    heightTank=0.75,
    m_flow_nominal_HX=m_flow_dhw)
    annotation (Placement(transformation(extent={{80,42},{98,68}})));
equation

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorageIDEAS;
