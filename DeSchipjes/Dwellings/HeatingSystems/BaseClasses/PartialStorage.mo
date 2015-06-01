within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorage
  //Extensions
  extends PartialRadiators(dHWTap(m_flow_nominal=m_flow_dhw, redeclare package
        Medium = Medium,
      TDHWSet=273.15 + 38), gain(k=(38 - 10)/(60 - 10)));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
    annotation (Placement(transformation(extent={{140,80},{120,100}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex tan(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_dhw,
    redeclare package MediumHex = Medium,
    dpHex_nominal=0,
    mHex_flow_nominal=m_flow_dhw*0.9,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupply,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    hexSegMult=1,
    VTan=0.1,
    hHex_b=0.05,
    dIns=0.07,
    hTan=0.75,
    hHex_a=0.7,
    TTan_nominal=333.15,
    THex_nominal=293.15,
    Q_flow_nominal=m_flow_dhw*4200*20)
    annotation (Placement(transformation(extent={{88,46},{108,66}})));
equation

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorage;
