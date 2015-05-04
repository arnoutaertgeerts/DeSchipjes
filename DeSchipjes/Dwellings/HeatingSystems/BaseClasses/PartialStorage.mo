within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorage
  //Extensions
  extends PartialRadiators(dHWTap(m_flow_nominal=m_flow_dhw, redeclare package
        Medium = Medium), bou1(nPorts=2));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex tan(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_dhw,
    dIns=0.02,
    redeclare package MediumHex = Medium,
    hHex_a=hTan,
    hHex_b=0,
    TTan_nominal=273 + 55,
    THex_nominal=273 + 45,
    dpHex_nominal=0,
    mHex_flow_nominal=m_flow_dhw*0.9,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupply,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    hexSegMult=1,
    Q_flow_nominal=500)
    annotation (Placement(transformation(extent={{80,42},{100,62}})));
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
    annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
equation

  connect(fixedTemperature.port, tan.heaPorSid) annotation (Line(
      points={{-100,90},{95.6,90},{95.6,52}},
      color={255,170,170},
      smooth=Smooth.None));
  connect(tan.port_b, bou1.ports[2]) annotation (Line(
      points={{100,52},{160,52},{160,42},{164,42}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.port_a, dHWTap.port_hot) annotation (Line(
      points={{80,52},{76,52},{76,36},{128,36}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorage;
