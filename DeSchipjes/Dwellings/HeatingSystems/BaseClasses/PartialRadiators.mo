within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialRadiators
  //Extensions
  extends HeatingSystem(
    nLoads=0,
    isDH=true,
    nEmbPorts=0,
    TSet);

  //Parameters
  parameter Modelica.SIunits.Temperature TSupply=273.15+70
    "Radiator supply temperature";
  parameter Modelica.SIunits.Temperature TReturn=273.15+60
    "Radiator return temeprature";
  parameter Modelica.SIunits.Temperature TStorage=273.15+65
    "DHW storage temperature";

  parameter Modelica.SIunits.MassFlowRate m_flow_dhw=0.03
    "Nominal mass flow rate of DHW";

  parameter Real KVs[nZones] = ones(nZones)*10
    "Values for the balancing valves";
  parameter Real KV = 1 "Kv value of the main valve";

  final parameter Modelica.SIunits.MassFlowRate[nZones] m_flow_nominal = QNom/(4180.6*(TSupply-TReturn))
    "Nominal mass flow rates";

  final parameter Modelica.SIunits.Pressure dp_nominal=0
    "Nominal pressure drop of the DH grid in the dwelling";

  //Variables
  Modelica.SIunits.Temperature TZones[nZones] = radPID.u_s
    "Zone setpoint temperature";
  Modelica.SIunits.Temperature TZonem[nZones] = TSensor
    "Zone Measured temperature";
  Real TZoned[nZones] "Thermal space heating discomfort";

  Modelica.SIunits.Temperature TGridi = inlet.vol[1].T "Grid inlet temperature";
  Modelica.SIunits.Temperature TGrido = outlet.vol[1].T
    "Grid outlet temperature";

  Modelica.SIunits.Temperature Ti = TSup.T "Inlet temperature";
  Modelica.SIunits.Temperature To = TRet.T "Outlet temperature";

  Modelica.SIunits.Temperature TDhws = dHWTap.TDHWSet
    "DHW setpoint temperature";
  Modelica.SIunits.Temperature TDhwm = dHWTap.TDHW_actual
    "DHW measured temperature";
  Real TDhwd "Thermal domestic hot water discomfort";

  Modelica.SIunits.MassFlowRate mRad[nZones] = pumpRad.m_flow
    "massflow rate in the radiator";
  Modelica.SIunits.MassFlowRate mGrid = pumpSupply.m_flow
    "massflow rate in the grid";
  Modelica.SIunits.MassFlowRate mDhw = gain.y "Requested massflowrate for DHW";

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

  //Components
protected
  Buildings.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad[nZones](
    redeclare package Medium = Medium,
    Q_flow_nominal=QNom,
    each T_a_nominal=TSupply,
    each T_b_nominal=TReturn,
    each nEle=1,
    each T_start=TSupply,
    each allowFlowReversal=true,
    each massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-124,-42},{-144,-22}})));

  DHWTap dHWTap(redeclare package Medium = Medium, m_flow_nominal=m_flow_dhw,
    TDHWSet=273.15 + 40)
    annotation (Placement(transformation(extent={{172,32},{146,46}})));

  Modelica.Blocks.Math.Gain gain(k=(TStorage - 273.15 - 20)/40)
                                                       annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,-76})));
  IDEAS.Fluid.BaseCircuits.ParallelPipesSplitter parallelPipesSplitter(n=nZones,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    T_start=TSupply,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)
    annotation (Placement(transformation(extent={{-60,-48},{-80,-28}})));

  ToKelvin toKelvin[nZones]
    annotation (Placement(transformation(extent={{-60,-78},{-80,-58}})));
  IDEAS.Fluid.Sources.FixedBoundary bouDHW(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=270,
        origin={140,26})));
  Buildings.Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal=sum(m_flow_nominal),
    m2_flow_nominal=sum(m_flow_nominal),
    dp1_nominal=20,
    dp2_nominal=20,
    linearizeFlowResistance1=false,
    linearizeFlowResistance2=false,
    allowFlowReversal1=true,
    allowFlowReversal2=true,
    eps=0.85)       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-38})));
  IDEAS.Fluid.Sources.FixedBoundary bouRad(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=90,
        origin={-20,-22})));
  IDEAS.Controls.Continuous.LimPID radPID[nZones](
    each controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Td=30,
    yMin=0.0001,
    each Ti=360,
    yMax=1.2*m_flow_nominal,
    each k=0.5)
    annotation (Placement(transformation(extent={{-130,30},{-110,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMin=0, uMax=1)     annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={130,-12})));
  Buildings.Fluid.FixedResistances.Pipe outlet(
    nSeg=1,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=sum(m_flow_nominal),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true)
               annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={120,-72})));
  Buildings.Fluid.FixedResistances.Pipe inlet(
    nSeg=1,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=sum(m_flow_nominal),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true)
               annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={160,-72})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumpSupply(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=sum(m_flow_nominal),
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{116,-38},{104,-26}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow[nZones] pumpRad(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{-94,-38},{-106,-26}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumpDHW(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=sum(m_flow_nominal),
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{-36,50},{-24,62}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TSup(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{52,-38},{40,-26}})));
  Buildings.Controls.Continuous.LimPID supplyPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.5,
    yMax=1,
    yMin=0.0001,
    Ti=360) annotation (Placement(transformation(extent={{40,-6},{52,6}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{68,-38},{56,-26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TRet(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-14,-50},{-2,-38}})));
initial equation

equation

  P[1] = 0;
  Q[1] = 0;

  Qhea = (hex.port_b2.h_outflow - hex.port_a2.h_outflow)*hex.port_b2.m_flow;
  Qsh = -sum(rad.heatPortCon.Q_flow) - sum(rad.heatPortRad.Q_flow);

  der(TDhwd) = max(0, TDhws - (TDhwm + 0.5)) / 3600;

  for i in 1:nZones loop
    der(TZoned[i]) = max(0, TZones[i] - (TZonem[i] + 0.5)) / 3600;

      connect(TSet[1], toKelvin[i].Celsius) annotation (Line(
      points={{20,-104},{20,-68},{-58,-68}},
      color={175,175,175},
      smooth=Smooth.None));
  end for;

  connect(mDHW60C, gain.u) annotation (Line(
      points={{80,-104},{80,-80.8}},
      color={175,175,175},
      smooth=Smooth.None));

  connect(rad.heatPortCon, heatPortCon) annotation (Line(
      points={{-132,-24.8},{-132,20},{-200,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatPortRad, rad.heatPortRad) annotation (Line(
      points={{-200,-20},{-136,-20},{-136,-24.8}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(TSensor,radPID. u_m) annotation (Line(
      points={{-204,-60},{-120,-60},{-120,28}},
      color={175,175,175},
      smooth=Smooth.None));

  connect(toKelvin.Kelvin,radPID. u_s) annotation (Line(
      points={{-81,-68},{-160,-68},{-160,40},{-132,40}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(bouRad.ports[1], parallelPipesSplitter.port_a) annotation (Line(
      points={{-20,-26},{-20,-32},{-60,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHWTap.port_cold, bouDHW.ports[1]) annotation (Line(
      points={{146,36},{144,36},{144,36},{140,36},{140,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(gain.y, limiter.u) annotation (Line(points={{80,-71.6},{80,-60},{130,
          -60},{130,-16.8}}, color={175,175,175}));
  connect(limiter.y, dHWTap.mDHW60C) annotation (Line(points={{130,-7.6},{130,
          60},{159,60},{159,46}}, color={175,175,175}));
  connect(inlet.port_a, flowPort_supply) annotation (Line(points={{160,-78},{
          160,-89},{160,-100}}, color={0,127,255}));
  connect(inlet.port_b, pumpSupply.port_a) annotation (Line(points={{160,-66},{
          160,-32},{116,-32}}, color={0,127,255}));
  connect(pumpSupply.port_b, hex.port_a1) annotation (Line(points={{104,-32},{
          90,-32},{90,-28},{86,-28}}, color={0,127,255}));
  connect(hex.port_b1, outlet.port_a) annotation (Line(points={{86,-48},{90,-48},
          {90,-44},{120,-44},{120,-66}}, color={0,127,255},
      pattern=LinePattern.Dash));
  connect(outlet.port_b, flowPort_return)
    annotation (Line(points={{120,-78},{120,-100}}, color={0,127,255},
      pattern=LinePattern.Dash));
  connect(parallelPipesSplitter.port_bN, pumpRad.port_a) annotation (Line(
        points={{-80,-32},{-94,-32}},           color={0,127,255}));
  connect(pumpRad.port_b, rad.port_a) annotation (Line(points={{-106,-32},{-106,
          -32},{-124,-32}}, color={0,127,255}));
  connect(rad.port_b, parallelPipesSplitter.port_aN) annotation (Line(points={{
          -144,-32},{-150,-32},{-150,-44},{-80,-44}}, color={0,127,255},
      pattern=LinePattern.Dash));
  connect(pumpDHW.port_a, parallelPipesSplitter.port_a) annotation (Line(points=
         {{-36,56},{-48,56},{-48,-32},{-60,-32}}, color={0,127,255}));
  connect(TSup.port_b, parallelPipesSplitter.port_a)
    annotation (Line(points={{40,-32},{-60,-32}}, color={0,127,255}));
  connect(TSup.T, supplyPID.u_m)
    annotation (Line(points={{46,-25.4},{46,-7.2}}, color={175,175,175}));
  connect(TSup.port_a, senMasFlo.port_b)
    annotation (Line(points={{52,-32},{56,-32}}, color={0,127,255}));
  connect(hex.port_b2, senMasFlo.port_a) annotation (Line(points={{74,-28},{72,
          -28},{70,-28},{70,-32},{68,-32}}, color={0,127,255}));
  connect(senMasFlo.m_flow, pumpSupply.m_flow_in) annotation (Line(points={{62,
          -25.4},{62,-20},{110.12,-20},{110.12,-24.8}}, color={175,175,175}));
  connect(parallelPipesSplitter.port_b, TRet.port_a) annotation (Line(
      points={{-60,-44},{-14,-44}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(TRet.port_b, hex.port_a2) annotation (Line(
      points={{-2,-44},{70,-44},{70,-48},{74,-48}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end PartialRadiators;
