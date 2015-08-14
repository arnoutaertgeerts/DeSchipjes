within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystem
  //Extensions
  extends BaseClasses.PartialStorage(
    modulating=false,
    TSupply=273.15+45,
    TReturn=273.15+35,
    radPID(strict=false),
    onOffController(bandwidth=1));

  //Parameters
  parameter Modelica.SIunits.Temperature THPmin=273.15+20
    "Minimal temperature on the evaporator side to use the HP";

  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr(y=TStorage + 5)
    annotation (Placement(transformation(extent={{-20,26},{-10,38}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TStoTop
    annotation (Placement(transformation(extent={{106,86},{98,94}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={54,38})));
  IDEAS.Fluid.Production.HeatPumpWaterWater hpww(
    modulationInput=false,
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    QNom=2000,
    use_onOffSignal=true,
    useQSet=false)
               annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={24,50})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumpDHWHex(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    m_flow_nominal=0.167,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{44,52},{56,64}})));
  Buildings.Fluid.FixedResistances.Pipe inletSto(
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
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={70,58})));
  Buildings.Fluid.FixedResistances.Pipe outletSto(
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
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={70,44})));
  Modelica.Blocks.Math.BooleanToReal
                            mDHW(realTrue=0.167, realFalse=0)
    annotation (Placement(transformation(extent={{74,76},{66,84}})));
  Modelica_StateGraph2.Step boosterOn(
    use_activePort=true,
    initialStep=true,
    nOut=1,
    nIn=1) annotation (Placement(transformation(extent={{134,76},{126,84}})));
  Modelica_StateGraph2.Step boosterOff(
    initialStep=false,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{156,84},{164,76}})));
  Modelica_StateGraph2.Transition T1(
    waitTime=900,
    delayedTransition=true,
    use_firePort=false,
    use_conditionPort=false,
    condition=TStoTop.T < TDhws)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=270,
        origin={142,90})));
  Modelica_StateGraph2.Transition T2(
    waitTime=900,
    delayedTransition=true,
    use_firePort=false,
    use_conditionPort=false,
    condition=TStoBot.T > TStorage)
                  annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={150,74})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TStoBot
    annotation (Placement(transformation(extent={{106,68},{98,76}})));
  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr1(y=273.15 + 45)
    annotation (Placement(transformation(extent={{28,84},{18,96}})));

  Buildings.Controls.Continuous.LimPID dhwPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMax=1,
    Ti=180,
    k=0.01,
    yMin=0)
         annotation (Placement(transformation(extent={{6,84},{-6,96}})));
public
  .DeSchipjes.Controls.OnOff releaseDHW(ymin=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={-16,72})));
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) annotation (
      Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=180,
        origin={0,56})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor2
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={0,66})));
  Annex60.Fluid.Actuators.Valves.ThreeWayEqualPercentageLinear val(
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    from_dp=false,
    m_flow_nominal=m_flow_dhw,
    dpValve_nominal=10,
    l={0.0001,0.0001},
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-22,50},{-10,62}})));
equation
  Qdhw = (hpww.port_a1.h_outflow - hpww.port_a1.h_outflow)*hpww.port_a1.m_flow;
  PboosEl = hpww.PFuelOrEl;
  Qhp = hpww.heatSource.heatPort2.Q_flow - hpww.heatSource.heatPort1.Q_flow;
  connect(hpww.port_b2, pumpDHWHex.port_a) annotation (Line(points={{30,60},{34,
          60},{34,58},{44,58}},
                            color={0,127,255}));
  connect(pumpDHWHex.port_b,inletSto. port_a)
    annotation (Line(points={{56,58},{56,58},{64,58}}, color={0,127,255}));
  connect(outletSto.port_b, hpww.port_a2) annotation (Line(
      points={{64,44},{34,44},{34,40},{30,40}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(inletSto.port_b, tan.portHex_a) annotation (Line(points={{76,58},{92,
          58},{92,48.2},{100,48.2}}, color={0,127,255}));
  connect(outletSto.port_a, tan.portHex_b)
    annotation (Line(points={{76,44},{100,44}},          color={0,127,255},
      pattern=LinePattern.Dash));
  connect(bou2.ports[1], hpww.port_a2) annotation (Line(
      points={{54,42},{54,44},{34,44},{34,40},{30,40}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(mDHW.y, pumpDHWHex.m_flow_in) annotation (Line(points={{65.6,80},{49.88,
          80},{49.88,65.2}}, color={0,0,127}));
  connect(pumpDHW.m_flow_in, pumpDHWHex.m_flow_in) annotation (Line(points={{-34.12,
          63.2},{-34.12,80},{49.88,80},{49.88,65.2}}, color={0,0,127}));
  connect(boosterOn.activePort, mDHW.u)
    annotation (Line(points={{125.28,80},{74.8,80}}, color={255,0,255}));
  connect(T2.outPort, boosterOff.inPort[1])
    annotation (Line(points={{155,74},{160,74},{160,76}}, color={0,0,0}));
  connect(T2.inPort, boosterOn.outPort[1])
    annotation (Line(points={{146,74},{130,74},{130,75.4}}, color={0,0,0}));
  connect(T1.outPort, boosterOn.inPort[1])
    annotation (Line(points={{137,90},{130,90},{130,84}}, color={0,0,0}));
  connect(T1.inPort, boosterOff.outPort[1])
    annotation (Line(points={{146,90},{160,90},{160,84.6}}, color={0,0,0}));
  connect(tan.heaPorVol[4], TStoBot.port) annotation (Line(points={{110,52.45},{
          110,52.45},{110,72},{106,72}}, color={191,0,0}));
  connect(TStoTop.port, tan.heaPorVol[2])
    annotation (Line(points={{106,90},{110,90},{110,51.85}}, color={191,0,0}));
  connect(hpww.on, mDHW.u) annotation (Line(points={{13.2,52},{8,52},{8,72},{80,
          72},{80,80},{74.8,80}}, color={255,0,255}));
  connect(THotWaterSetExpr1.y, dhwPID.u_s)
    annotation (Line(points={{17.5,90},{7.2,90}}, color={0,0,127}));
  connect(THotWaterSetExpr.y, hpww.u) annotation (Line(points={{-9.5,32},{8,32},
          {8,48},{13.2,48}}, color={0,0,127}));
  connect(hpww.heatPort, fixedTemperature.port) annotation (Line(points={{34,50},
          {40,50},{40,32},{116,32},{116,28}}, color={191,0,0}));
  connect(dhwPID.y, releaseDHW.u1)
    annotation (Line(points={{-6.6,90},{-16,90},{-16,76.8}}, color={0,0,127}));
  connect(releaseDHW.u, mDHW.u) annotation (Line(points={{-11.2,72},{80,72},{80,
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
  connect(val.port_1, pumpDHW.port_b)
    annotation (Line(points={{-22,56},{-25,56},{-28,56}}, color={0,127,255}));
  connect(val.port_2, inletHp.port_a)
    annotation (Line(points={{-10,56},{-7,56},{-4,56}}, color={0,127,255}));
  connect(val.port_3, outletRad.port_a) annotation (Line(points={{-16,50},{-16,
          44},{-32,44},{-32,-44},{40,-44}}, color={0,127,255}));
  connect(releaseDHW.y, val.y)
    annotation (Line(points={{-16,67.6},{-16,63.2}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end LTHeatingSystem;
