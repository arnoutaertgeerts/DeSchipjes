within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialRadiators
  import DeSchipjes;
  //Extensions
  extends HeatingSystem(
    nLoads=0,
    isDH=true,
    nEmbPorts=0,
    TSet);

  //Parameters
  parameter Modelica.SIunits.Temperature TSupply=273.15+45
    "Radiator supply temperature";
  parameter Modelica.SIunits.Temperature TReturn=273.15+35
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

  Modelica.SIunits.Temperature TSupplym = inletRad.vol[1].T
    "Inlet measured temperature";
  Modelica.SIunits.Temperature TSupplys = supplyPID.u_s
    "Inlet setpoint temperature";
  Modelica.SIunits.Temperature TReturm = outletRad.vol[1].T
    "Measured Outlet temperature";

  Modelica.SIunits.Temperature TDhws = dHWTap.TDHWSet
    "DHW setpoint temperature";
  Modelica.SIunits.Temperature TDhwm = dHWTap.TDHW_actual
    "DHW measured temperature";
  Real TDhwd "Thermal domestic hot water discomfort";

  Modelica.SIunits.MassFlowRate mRad[nZones] = pumpRad.m_flow
    "massflow rate in the radiator";
  Modelica.SIunits.MassFlowRate mSupply = pumpSupply.m_flow
    "massflow rate in the grid";
  Modelica.SIunits.MassFlowRate mDhw = pumpDHW.m_flow_in
    "massflow rate used for producing DHW";
  Modelica.SIunits.MassFlowRate mDhwReq = gain.y
    "Requested DHW massflowrate at 40°C";

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
  Buildings.Controls.Continuous.LimPID supplyPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMax=sum(m_flow_nominal),
    Ti=180,
    k=0.005,
    yMin=0.01*supplyPID.yMax)
            annotation (Placement(transformation(extent={{56,8},{68,20}})));

  Buildings.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad[nZones](
    redeclare package Medium = Medium,
    each T_a_nominal=TSupply,
    each T_b_nominal=TReturn,
    each nEle=1,
    each T_start=TSupply,
    each allowFlowReversal=true,
    each massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal,
    Q_flow_nominal=1.5*QNom)
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
    yMax=1.2*m_flow_nominal,
    each Ti=180,
    each k=0.005)
    annotation (Placement(transformation(extent={{-160,48},{-148,60}})));
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
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
               annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={120,-72})));
  Buildings.Fluid.FixedResistances.Pipe inlet(
    nSeg=1,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=sum(m_flow_nominal),
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
               annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={160,-72})));
  Annex60.Fluid.Movers.FlowControlled_m_flow   pumpSupply(
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    allowFlowReversal=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    filteredSpeed=true,
    riseTime=100,
    dynamicBalance=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(extent={{116,-38},{104,-26}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow[nZones] pumpRad(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{-86,-38},{-98,-26}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumpDHW(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=sum(m_flow_nominal),
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    allowFlowReversal=true,
    filteredSpeed=false,
    addPowerToMedium=true)
    annotation (Placement(transformation(extent={{-40,50},{-28,62}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{68,-38},{56,-26}})));
  Buildings.Controls.SetPoints.Table tab(table=[263.15,TSupply + 5; 273.15 + 20,
        273.15 + 20])
    annotation (Placement(transformation(extent={{20,0},{28,8}})));
  Modelica.Blocks.Logical.OnOffController onOffController[nZones](bandwidth=1)
    annotation (Placement(transformation(extent={{-142,28},{-130,40}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal[nZones](realFalse=0,
      realTrue=1.2*m_flow_nominal)
    annotation (Placement(transformation(extent={{-120,28},{-108,40}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=sim.Te)
    annotation (Placement(transformation(extent={{4,-2},{16,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.01)
    annotation (Placement(transformation(extent={{20,-16},{28,-8}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=sum(radPID.y) + mDhw)
    annotation (Placement(transformation(extent={{4,-18},{16,-6}})));
  DeSchipjes.Controls.OnOff onOff
    annotation (Placement(transformation(extent={{78,10},{86,18}})));
  Buildings.Fluid.FixedResistances.Pipe inletRad(
    nSeg=1,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
                            annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=180,
        origin={44,-32})));
  Buildings.Fluid.FixedResistances.Pipe outletRad(
    nSeg=1,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
                            annotation (Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=180,
        origin={44,-44})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor1
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={44,-22})));

equation
  P[1] = 0;
  Q[1] = 0;

  Qhea = -(hex.port_b2.h_outflow - hex.port_a2.h_outflow)*hex.port_b2.m_flow;
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
      points={{-204,-60},{-154,-60},{-154,46.8}},
      color={175,175,175},
      smooth=Smooth.None));

  connect(toKelvin.Kelvin,radPID. u_s) annotation (Line(
      points={{-81,-68},{-166,-68},{-166,54},{-161.2,54}},
      color={175,175,175},
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
  connect(pumpRad.port_b, rad.port_a) annotation (Line(points={{-98,-32},{-98,-32},
          {-124,-32}},      color={0,127,255}));
  connect(hex.port_b2, senMasFlo.port_a) annotation (Line(points={{74,-28},{72,
          -28},{70,-28},{70,-32},{68,-32}}, color={0,127,255}));
  connect(onOffController.reference, radPID.u_s) annotation (Line(points={{-143.2,
          37.6},{-166,37.6},{-166,54},{-161.2,54}}, color={0,0,127}));
  connect(onOffController.u, radPID.u_m) annotation (Line(points={{-143.2,30.4},
          {-154,30.4},{-154,46.8}}, color={0,0,127}));
  connect(booleanToReal.u, onOffController.y)
    annotation (Line(points={{-121.2,34},{-129.4,34}}, color={255,0,255}));
  connect(tab.u, realExpression.y)
    annotation (Line(points={{19.2,4},{16.6,4}}, color={0,0,127}));
  connect(realExpression1.y,greaterThreshold. u)
    annotation (Line(points={{16.6,-12},{16.6,-12},{19.2,-12}},
                                                             color={0,0,127}));
  connect(supplyPID.y, onOff.u1)
    annotation (Line(points={{68.6,14},{77.2,14}},           color={0,0,127}));
  connect(greaterThreshold.y, onOff.u) annotation (Line(points={{28.4,-12},{82,-12},
          {82,9.2}}, color={255,0,255}));
  connect(inletRad.port_a, senMasFlo.port_b)
    annotation (Line(points={{48,-32},{48,-32},{56,-32}}, color={0,127,255}));
  connect(inletRad.port_b, pumpDHW.port_a) annotation (Line(points={{40,-32},{-46,
          -32},{-46,56},{-40,56}}, color={0,127,255}));
  connect(bouRad.ports[1], pumpDHW.port_a) annotation (Line(points={{-20,-26},{-20,
          -32},{-46,-32},{-46,56},{-40,56}}, color={0,127,255}));
  connect(outletRad.port_b, hex.port_a2) annotation (Line(points={{48,-44},{70,-44},
          {70,-48},{74,-48}}, color={0,127,255}));
  connect(outletRad.port_a, rad[1].port_b) annotation (Line(points={{40,-44},{-54,
          -44},{-148,-44},{-148,-32},{-144,-32}}, color={0,127,255}));
  connect(pumpRad[1].port_a, inletRad.port_b) annotation (Line(points={{-86,-32},
          {-24,-32},{40,-32}}, color={0,127,255}));
  connect(inletRad.heatPort, temperatureSensor1.port)
    annotation (Line(points={{44,-30},{44,-26}}, color={191,0,0}));
  connect(temperatureSensor1.T, supplyPID.u_m) annotation (Line(points={{44,-18},
          {44,-6},{62,-6},{62,6.8}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end PartialRadiators;
