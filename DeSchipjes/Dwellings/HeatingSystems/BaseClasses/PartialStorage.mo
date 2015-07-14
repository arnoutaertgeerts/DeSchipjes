within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorage
  //Extensions
  extends PartialRadiators(
    dHWTap(m_flow_nominal=m_flow_dhw,
    redeclare package Medium=Medium,
    TDHWSet=273.15 + 38),
    gain(k=(38 - 10)/(60 - 10)));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
    annotation (Placement(transformation(extent={{128,92},{120,100}})));
  StorageTanks.uniSTOR tan(
    redeclare package Medium = Medium,
    R=1.625,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package MediumHex = Medium)
    annotation (Placement(transformation(extent={{96,46},{116,66}})));
equation

  connect(tan.port_a, dHWTap.port_hot) annotation (Line(
      points={{96,56},{92,56},{92,68},{180,68},{180,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.heaPorTop, fixedTemperature.port) annotation (Line(
      points={{108,63.4},{108,96},{120,96}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(tan.heaPorBot, fixedTemperature.port) annotation (Line(
      points={{108,48.6},{108,44},{112,44},{112,70},{108,70},{108,96},{120,96}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(tan.heaPorSid, fixedTemperature.port) annotation (Line(
      points={{111.6,56},{112,56},{112,70},{108,70},{108,96},{120,96}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(tan.port_b, dHWTap.port_cold) annotation (Line(
      points={{116,56},{120,56},{120,36},{146,36}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorage;
