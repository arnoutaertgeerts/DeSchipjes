within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorage
  //Extensions
  extends PartialRadiators(
    dHWTap(m_flow_nominal=m_flow_dhw,
    redeclare package Medium=Medium,
    TDHWSet=273.15 + 38),
    bouDHW(nPorts=2),
    pumpDHW(m_flow_nominal=0.167));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=270,
        origin={116,24})));
  StorageTanks.uniSTOR tan(
    redeclare package Medium = Medium,
    m_flow_nominal=0.1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    R=1.625,
    redeclare package MediumHex = Medium,
    linearizeFlowResistance=true,
    allowFlowReversal=true,
    tau=300,
    hexSegMult=1,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    allowFlowReversalHex=false)
    annotation (Placement(transformation(extent={{100,42},{120,62}})));
equation

  Qsto = tan.Ql_flow;
  connect(tan.port_b, bouDHW.ports[2]) annotation (Line(points={{120,52},{126,
          52},{126,36},{140,36},{140,30}}, color={0,127,255},
      pattern=LinePattern.Dash));
  connect(tan.port_a, dHWTap.port_hot) annotation (Line(points={{100,52},{96,52},
          {96,54},{96,66},{174,66},{180,66},{180,36},{172,36}}, color={0,127,
          255}));
  connect(tan.heaPorSid, fixedTemperature.port)
    annotation (Line(points={{115.6,52},{116,52},{116,28}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end PartialStorage;
