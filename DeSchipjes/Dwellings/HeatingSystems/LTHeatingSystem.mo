within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystem
  import DeSchipjes;
  //Extensions
  extends BaseClasses.PartialStorage(
    modulating=false,
    TSupply=273.15+45,
    TReturn=273.15+35,
    radPID(strict=false),
    onOffController(bandwidth=1),
    pumpDHW(filteredSpeed=true),
    tan(Q_flow_nominal=0.16*4180*(tan.THex_nominal - tan.TTan_nominal),
        mHex_flow_nominal=0.16,
      allowFlowReversalHex=false));

  //Parameters
  parameter Modelica.SIunits.Temperature THPmin=273.15+20
    "Minimal temperature on the evaporator side to use the HP";

  ProductionSites.Heaters.Booster           hpww(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    QNom=2000,
    m1_flow_nominal=m_flow_dhw,
    m2_flow_nominal=m_flow_dhw,
    dp1_nominal=0,
    dp2_nominal=0,
    m_flow_min=0.02)
               annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={24,50})));

  Buildings.Controls.Continuous.LimPID dhwPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMax=1,
    Ti=180,
    k=0.01,
    yMin=0)
         annotation (Placement(transformation(extent={{6,84},{-6,96}})));

protected
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TStoTop
    annotation (Placement(transformation(extent={{106,86},{98,94}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={54,38})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumpDHWHex(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    m_flow_nominal=0.167,
    riseTime=60,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{44,50},{56,62}})));
  Buildings.Fluid.FixedResistances.Pipe inletSto(
    nSeg=1,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    length=20,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={70,56})));
  Buildings.Fluid.FixedResistances.Pipe outletSto(
    nSeg=1,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    allowFlowReversal=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    length=20)              annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={70,44})));
  Modelica.Blocks.Math.BooleanToReal
                            mDHW(                             realTrue=0.16*
        0.2778, realFalse=0.01*mDHW.realTrue)
    annotation (Placement(transformation(extent={{74,76},{66,84}})));
  Modelica_StateGraph2.Step boosterOn(
    use_activePort=true,
    nOut=1,
    nIn=1,
    initialStep=false)
           annotation (Placement(transformation(extent={{134,76},{126,84}})));
  Modelica_StateGraph2.Step boosterOff(
    nIn=1,
    nOut=1,
    initialStep=true)
            annotation (Placement(transformation(extent={{164,84},{156,76}})));
  Modelica_StateGraph2.Transition T1(
    use_firePort=false,
    use_conditionPort=false,
    waitTime=180,
    delayedTransition=true,
    condition=TStoTop.T < 273.15 + 45)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=270,
        origin={142,92})));
  Modelica_StateGraph2.Transition T2(
    use_firePort=false,
    use_conditionPort=false,
    waitTime=180,
    delayedTransition=false,
    condition=TStoBot.T > 273.15 + 55)
                  annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={142,72})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TStoBot
    annotation (Placement(transformation(extent={{106,68},{98,76}})));
  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr1(y=273.15 + 45)
    annotation (Placement(transformation(extent={{28,84},{18,96}})));

  .DeSchipjes.Controls.OnOff releaseDHW(ymin=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={-14,72})));
  Buildings.Fluid.FixedResistances.Pipe inletHp(
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    mSenFac=2)                                                 annotation (
      Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=180,
        origin={0,56})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor2
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={0,66})));
  Modelica.Blocks.Math.Gain gain1(k=0.19/0.16) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={26,80})));
equation
  Qdhw = (hpww.port_a1.h_outflow - hpww.port_a1.h_outflow)*hpww.port_a1.m_flow;
  PboosEl = hpww.PEl;
  Qhp = hpww.QEvaporator;
  connect(hpww.port_b2, pumpDHWHex.port_a) annotation (Line(points={{30,60},{34,
          60},{34,56},{44,56}},
                            color={0,127,255}));
  connect(pumpDHWHex.port_b,inletSto. port_a)
    annotation (Line(points={{56,56},{56,56},{64,56}}, color={0,127,255}));
  connect(outletSto.port_b, hpww.port_a2) annotation (Line(
      points={{64,44},{34,44},{34,40},{30,40}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(inletSto.port_b, tan.portHex_a) annotation (Line(points={{76,56},{92,
          56},{92,48.2},{100,48.2}}, color={0,127,255}));
  connect(outletSto.port_a, tan.portHex_b)
    annotation (Line(points={{76,44},{100,44}},          color={0,127,255},
      pattern=LinePattern.Dash));
  connect(bou2.ports[1], hpww.port_a2) annotation (Line(
      points={{54,42},{54,44},{34,44},{34,40},{30,40}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(mDHW.y, pumpDHWHex.m_flow_in) annotation (Line(points={{65.6,80},{
          49.88,80},{49.88,63.2}},
                             color={0,0,127}));
  connect(boosterOn.activePort, mDHW.u)
    annotation (Line(points={{125.28,80},{74.8,80}}, color={255,0,255}));
  connect(T2.outPort, boosterOff.inPort[1])
    annotation (Line(points={{147,72},{160,72},{160,76}}, color={0,0,0}));
  connect(T2.inPort, boosterOn.outPort[1])
    annotation (Line(points={{138,72},{130,72},{130,75.4}}, color={0,0,0}));
  connect(T1.outPort, boosterOn.inPort[1])
    annotation (Line(points={{137,92},{130,92},{130,84}}, color={0,0,0}));
  connect(T1.inPort, boosterOff.outPort[1])
    annotation (Line(points={{146,92},{160,92},{160,84.6}}, color={0,0,0}));
  connect(tan.heaPorVol[4], TStoBot.port) annotation (Line(points={{110,52.45},{
          110,52.45},{110,72},{106,72}}, color={191,0,0}));
  connect(TStoTop.port, tan.heaPorVol[2])
    annotation (Line(points={{106,90},{110,90},{110,51.85}}, color={191,0,0}));
  connect(THotWaterSetExpr1.y, dhwPID.u_s)
    annotation (Line(points={{17.5,90},{7.2,90}}, color={0,0,127}));
  connect(dhwPID.y, releaseDHW.u1)
    annotation (Line(points={{-6.6,90},{-14,90},{-14,76.8}}, color={0,0,127}));
  connect(releaseDHW.u, mDHW.u) annotation (Line(points={{-9.2,72},{80,72},{80,
          80},{74.8,80}},
                      color={255,0,255}));
  connect(tab.y, supplyPID.u_s) annotation (Line(points={{28.4,4},{48,4},{48,14},
          {54.8,14}}, color={0,0,127}));
  connect(onOff.y, pumpSupply.m_flow_in) annotation (Line(points={{86.4,14},{110.12,
          14},{110.12,-24.8}}, color={0,0,127}));
  connect(radPID.y, pumpRad.m_flow_in) annotation (Line(points={{-147.4,54},{-91.88,
          54},{-91.88,-24.8}}, color={0,0,127}));
  connect(hpww.port_b1, outletRad.port_a) annotation (Line(points={{18,40},{14,40},
          {14,44},{-32,44},{-32,-44},{40,-44}}, color={0,127,255}));
  connect(inletHp.port_b, hpww.port_a1) annotation (Line(points={{4,56},{14,56},
          {14,60},{18,60}}, color={0,127,255}));
  connect(inletHp.heatPort, temperatureSensor2.port) annotation (Line(points={{
          2.498e-016,58},{0,58},{0,62},{-2.498e-016,62}}, color={191,0,0}));
  connect(dhwPID.u_m, temperatureSensor2.T) annotation (Line(points={{0,82.8},{
          0,82.8},{0,70},{2.498e-016,70}}, color={0,0,127}));
  connect(hpww.u, mDHW.u) annotation (Line(points={{13.2,50},{8,50},{8,72},{80,72},
          {80,80},{74.8,80}}, color={255,0,255}));
  connect(gain1.u, pumpDHWHex.m_flow_in) annotation (Line(points={{30.8,80},{
          49.88,80},{49.88,63.2}}, color={0,0,127}));
  connect(pumpDHW.port_b, inletHp.port_a)
    annotation (Line(points={{-28,56},{-16,56},{-4,56}}, color={0,127,255}));
  connect(gain1.y, pumpDHW.m_flow_in) annotation (Line(points={{21.6,80},{
          -34.12,80},{-34.12,63.2}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end LTHeatingSystem;
