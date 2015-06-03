within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorageMFlow
  //Extensions
  extends PartialRadiatorsMFlow(dHWTap(m_flow_nominal=m_flow_dhw, redeclare
        package Medium =
                 Medium), bou1(nPorts=2));

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
    Q_flow_nominal=250,
    TTan_nominal=273 + 55,
    THex_nominal=273 + 45,
    dpHex_nominal=0,
    mHex_flow_nominal=m_flow_dhw*0.9,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupply,
    massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(extent={{102,34},{82,54}})));
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
    annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
equation

  connect(tan.portHex_b, dHWTap.port_hot) annotation (Line(
      points={{102,36},{116,36},{116,36},{130,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.portHex_a, bou1.ports[2]) annotation (Line(
      points={{102,40.2},{120,40.2},{120,50},{162,50},{162,46},{166,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(fixedTemperature.port, tan.heaPorSid) annotation (Line(
      points={{-100,90},{86.4,90},{86.4,44}},
      color={255,170,170},
      smooth=Smooth.None));
  connect(tan.heaPorBot, tan.heaPorSid) annotation (Line(
      points={{90,36.6},{90,30},{86.4,30},{86.4,44}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(tan.heaPorTop, tan.heaPorSid) annotation (Line(
      points={{90,51.4},{90,56},{86.4,56},{86.4,44}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorageMFlow;
