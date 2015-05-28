within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorage
  //Extensions
  extends PartialRadiators(dHWTap(m_flow_nominal=m_flow_dhw, redeclare package
        Medium = Medium));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
    annotation (Placement(transformation(extent={{140,80},{120,100}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex tan(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_dhw,
    dIns=0.02,
    redeclare package MediumHex = Medium,
    dpHex_nominal=0,
    mHex_flow_nominal=m_flow_dhw*0.9,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupply,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    hexSegMult=1,
    VTan=0.1,
    hTan=0.5,
    Q_flow_nominal=1000,
    TTan_nominal=TStorage - 5,
    THex_nominal=TStorage - 10,
    hHex_a=0.45,
    hHex_b=0.05)
    annotation (Placement(transformation(extent={{78,42},{98,62}})));
equation

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorage;
