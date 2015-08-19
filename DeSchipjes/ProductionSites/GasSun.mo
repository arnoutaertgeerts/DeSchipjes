within DeSchipjes.ProductionSites;
model GasSun
  import DeSchipjes;
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(
    TSupRad=273.15+80,
    Qpeak=215000*scaler,
    Qbase=0,
    modulating=false);

  //Parameters
  parameter Modelica.SIunits.Area A=20*scaler "Area of the solar collectors";
  parameter Modelica.SIunits.Volume VTan=0.950*scaler
    "Volume of the storage tank";
  parameter Modelica.SIunits.Height hTan=1 "Height of the storage tank";
  parameter Modelica.SIunits.Length dIns=0.04 "Insulation thickness";

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_sun=0.161*scaler
    "Nominal massflow rate of the solar collector";
  parameter Modelica.SIunits.MassFlowRate m_flow_min_sun= 0.02*m_flow_nominal_sun
    "Minimal massflowrate of the solar collector";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_chp=0.14*scaler
    "Nominal massflow rate of the solar collector";

  //Variables
  Modelica.SIunits.Power PCHP "Gas consumption of the CHP";
  Modelica.SIunits.Power PelCHP "Electricity production of the CHP";

  Modelica.SIunits.Power ECHP "Integrated Gas consumption of the CHP";
  Modelica.SIunits.Power EelCHP "Integrated Electricity production of the CHP";
  Heaters.Boiler                boiler(
    modulationInput=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    dp_nominal=0,
    QNom=Qpeak,
    m2=40,
    use_onOffSignal=true,
    m_flow_nominal=5.2*0.2778*scaler)
    annotation (Placement(transformation(extent={{56,50},{76,70}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    riseTime=60,
    m_flow_nominal=m_flow_nominal_sun,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-32,-86},{-44,-74}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex bufferSolar(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    VTan=VTan,
    hTan=hTan,
    dIns=dIns,
    hHex_b=0.05,
    linearizeFlowResistance=true,
    massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package MediumHex = Medium,
    T_start=TSupRad,
    hHex_a=0.95,
    Q_flow_nominal=bufferSolar.mHex_flow_nominal*4200*40,
    THex_nominal=TSupRad + 5,
    TTan_nominal=273.15 + 63,
    hexSegMult=1,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    mHex_flow_nominal=m_flow_nominal_sun,
    allowFlowReversalHex=false)
    annotation (Placement(transformation(extent={{-4,-28},{16,-8}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-24,-72})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TSuni(redeclare package Medium =
        Medium, m_flow_nominal=m_flow_nominal_sun)
    annotation (Placement(transformation(extent={{-78,-16},{-66,-28}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TSuno(redeclare package Medium =
        Medium, m_flow_nominal=m_flow_nominal_sun)
    annotation (Placement(transformation(extent={{-34,-28},{-22,-16}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoio(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    tau=0) annotation (Placement(transformation(extent={{80,54},{92,66}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TBoii(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    tau=0) annotation (Placement(transformation(extent={{40,54},{52,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  inner IDEAS.SimInfoManager sim(filDir=Modelica.Utilities.Files.loadResource("modelica://IDEAS")
         + "/Inputs/")
    annotation (Placement(transformation(extent={{-80,-22},{-100,-2}})));
  Buildings.Fluid.SolarCollectors.EN12975 solar(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    linearizeFlowResistance=true,
    til=0.5,
    nColType=Buildings.Fluid.SolarCollectors.Types.NumberSelection.Area,
    totalArea=A,
    lat=0.8727,
    rho=0.2,
    azi=0.3,
    per=Buildings.Fluid.SolarCollectors.Data.GlazedFlatPlate.FP_TRNSYSValidation(),
    sysConfig=Buildings.Fluid.SolarCollectors.Types.SystemConfiguration.Parallel,
    use_shaCoe_in=true,
    nSeg=3,
    allowFlowReversal=false)
            annotation (Placement(transformation(extent={{-60,-32},{-40,-12}})));

  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex bufferChp(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    VTan=VTan,
    hTan=hTan,
    dIns=dIns,
    hHex_b=0.05,
    linearizeFlowResistance=true,
    massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    mHex_flow_nominal=m_flow_nominal_chp,
    redeclare package MediumHex = Medium,
    T_start=TSupRad,
    hHex_a=0.95,
    THex_nominal=TSupRad + 5,
    hexSegMult=1,
    TTan_nominal=273.15 + 30,
    Q_flow_nominal=bufferChp.mHex_flow_nominal*4200*30,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    allowFlowReversalHex=false)
    annotation (Placement(transformation(extent={{-44,6},{-24,26}})));
  Heaters.CHP cHP(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal_chp,
    dp_nominal=0,
    m=14*scaler,
    PNomRef=6000*scaler,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan1(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    m_flow_nominal=m_flow_nominal_chp,
    riseTime=60,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-60,2},{-72,14}})));
  Controls.ControlS1 controlS1_1(THigh=273.15 + 80, TSetHp=273.15 + 80)
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  IDEAS.Fluid.Valves.ThreeWayValveSwitch threeWayValveSwitch1(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={34,-60})));
  IDEAS.Fluid.Valves.ThreeWayValveSwitch threeWayValveSwitch2(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-8,28})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=m_flow_nominal_chp,
      realFalse=0.01*m_flow_nominal_chp)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-66,24})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort Tret(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{62,-66},{50,-54}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTopHp
    annotation (Placement(transformation(extent={{-34,32},{-42,40}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TBotHp
    annotation (Placement(transformation(extent={{-34,48},{-42,56}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTopSun
    annotation (Placement(transformation(extent={{6,-4},{-2,4}})));
  IDEAS.Fluid.Sources.FixedBoundary bou1(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-60,48})));
  Annex60.Controls.Continuous.LimPID solarPID(controllerType=Modelica.Blocks.Types.SimpleController.PI,
    reverseAction=true,
    Ti=30)
    annotation (Placement(transformation(extent={{-122,-34},{-110,-46}})));
  DeSchipjes.ProductionSites.Controls.SolarControls solarControls
    annotation (Placement(transformation(extent={{-72,-70},{-56,-54}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=solar.vol[3].T)
    annotation (Placement(transformation(extent={{-102,-66},{-84,-48}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TBotSun
    annotation (Placement(transformation(extent={{2,-94},{-6,-86}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1(             realTrue=
        m_flow_nominal_sun, realFalse=0.01*m_flow_nominal_sun)
    annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=0,
        origin={-46,-62})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=solar.vol[3].T)
    annotation (Placement(transformation(extent={{-140,-30},{-120,-10}})));
  Modelica.Blocks.Sources.Constant const1(
                                         k=273.15 + 90)
    annotation (Placement(transformation(extent={{-140,-46},{-128,-34}})));
equation

  der(ECHP)=PCHP;
  der(EelCHP)=PelCHP;

  PCHP=cHP.PFuel;
  PelCHP=cHP.PEl;
  Pboi=boiler.PFuelOrEl;
  PhpEl=0;
  Qsun=(solar.port_b.h_outflow-solar.port_a.h_outflow)*solar.m_flow;
  Qhp=0;
  Qsto=bufferSolar.Ql_flow + bufferChp.Ql_flow;

  connect(bufferSolar.portHex_b, fan.port_a) annotation (Line(
      points={{-4,-26},{-16,-26},{-16,-80},{-32,-80}},
      color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(bou.ports[1],fan. port_a) annotation (Line(points={{-24,-76},{-24,-80},
          {-32,-80}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(fan.port_b, TSuni.port_a) annotation (Line(
      points={{-44,-80},{-80,-80},{-80,-22},{-78,-22}},
      color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(TSuno.port_b, bufferSolar.portHex_a) annotation (Line(
      points={{-22,-22},{-4,-22},{-4,-21.8}},
      color={0,127,255},
      thickness=0.5));
  connect(boiler.port_b, TBoio.port_a)
    annotation (Line(points={{76,60},{80,60}}, color={0,127,255}));
  connect(TBoii.port_b, boiler.port_a) annotation (Line(
      points={{52,60},{56,60}},
      color={0,127,255},
      thickness=0.5));
  connect(boiler.heatPort, TRoo.port)
    annotation (Line(points={{66,50},{46,50},{46,0},{80,0}}, color={191,0,0}));
  connect(solar.port_b, TSuno.port_a)
    annotation (Line(points={{-40,-22},{-37,-22},{-34,-22}},
                                                          color={0,127,255}));
  connect(solar.port_a, TSuni.port_b) annotation (Line(
      points={{-60,-22},{-63,-22},{-66,-22}},
      color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(TBoio.port_b, port_b) annotation (Line(
      points={{92,60},{100,60}},
      color={0,127,255},
      thickness=0.5));
  connect(sim.weaBus1, solar.weaBus) annotation (Line(
      points={{-80,-12},{-60,-12},{-60,-12.4}},
      color={255,204,51},
      thickness=0.5));
  connect(bufferSolar.heaPorSid, TRoo.port) annotation (Line(points={{11.6,-18},
          {12,-18},{12,-6},{46,-6},{46,0},{80,0}}, color={191,0,0}));
  connect(cHP.port_b, bufferChp.portHex_a) annotation (Line(points={{-70,40},{-48,
          40},{-48,12.2},{-44,12.2}}, color={0,127,255}));
  connect(cHP.port_a, fan1.port_b) annotation (Line(points={{-90,40},{-94,40},{-94,
          8},{-72,8}}, color={0,127,255}));
  connect(fan1.port_a, bufferChp.portHex_b)
    annotation (Line(points={{-60,8},{-44,8}}, color={0,127,255}));
  connect(controlS1_1.boiOn, boiler.on) annotation (Line(points={{-19.4,74},{36,
          74},{36,78},{64,78},{64,70.8}}, color={255,0,255}));
  connect(controlS1_1.boi, boiler.u) annotation (Line(points={{-19.4,78},{32,78},
          {32,82},{68,82},{68,70.8}}, color={0,0,127}));
  connect(controlS1_1.hpOn, cHP.u) annotation (Line(points={{-19.4,86},{-16,86},
          {-16,96},{-80,96},{-80,50.8}}, color={255,0,255}));
  connect(bufferSolar.port_b, threeWayValveSwitch1.port_a1) annotation (Line(
        points={{16,-18},{20,-18},{20,-60},{24,-60}}, color={0,127,255}));
  connect(bufferChp.port_b, threeWayValveSwitch1.port_a1) annotation (Line(
        points={{-24,16},{20,16},{20,-6},{20,-60},{24,-60}}, color={0,127,255}));
  connect(bufferChp.port_a, threeWayValveSwitch2.port_a2)
    annotation (Line(points={{-44,16},{-44,28},{-18,28}}, color={0,127,255}));
  connect(bufferSolar.port_a, threeWayValveSwitch2.port_a1)
    annotation (Line(points={{-4,-18},{-8,-18},{-8,18}}, color={0,127,255}));
  connect(threeWayValveSwitch2.port_b, TBoii.port_a) annotation (Line(points={{-8,
          38},{-8,38},{-8,60},{40,60}}, color={0,127,255}));
  connect(threeWayValveSwitch1.port_a2, TBoii.port_a)
    annotation (Line(points={{34,-50},{34,60},{40,60}}, color={0,127,255}));
  connect(controlS1_1.hpOrSolar, threeWayValveSwitch2.switch) annotation (Line(
        points={{-30,69.4},{-30,52},{4,52},{4,28},{0,28}}, color={255,0,255}));
  connect(controlS1_1.noBuffer, threeWayValveSwitch1.switch) annotation (Line(
        points={{-26,69.4},{-26,56},{26,56},{26,-46},{14,-46},{14,-78},{34,-78},
          {34,-68}}, color={255,0,255}));
  connect(fan1.m_flow_in, booleanToReal.y) annotation (Line(points={{-65.88,15.2},
          {-66,15.2},{-66,19.6}}, color={0,0,127}));
  connect(booleanToReal.u, cHP.u) annotation (Line(points={{-66,28.8},{-66,28.8},
          {-66,96},{-80,96},{-80,50.8}}, color={255,0,255}));
  connect(threeWayValveSwitch1.port_b, Tret.port_b)
    annotation (Line(points={{44,-60},{50,-60}}, color={0,127,255}));
  connect(Tret.port_a, port_a)
    annotation (Line(points={{62,-60},{100,-60}}, color={0,127,255}));
  connect(Tret.T, controlS1_1.Tret) annotation (Line(points={{56,-53.4},{56,-53.4},
          {56,-48},{66,-48},{66,46},{-54,46},{-54,72},{-41,72}},
                                               color={0,0,127}));
  connect(bufferChp.heaPorVol[1], TTopHp.port) annotation (Line(points={{-34,15.55},
          {-34,15.55},{-34,36}}, color={191,0,0}));
  connect(bufferChp.heaPorVol[4], TBotHp.port)
    annotation (Line(points={{-34,16.45},{-34,52}}, color={191,0,0}));
  connect(controlS1_1.TstoTop, TTopHp.T) annotation (Line(points={{-41,84},{-46,
          84},{-46,36},{-42,36}}, color={0,0,127}));
  connect(TBotHp.T, controlS1_1.TstoBot) annotation (Line(points={{-42,52},{-50,
          52},{-50,80},{-41,80}}, color={0,0,127}));
  connect(TTopSun.port, bufferSolar.heaPorVol[1])
    annotation (Line(points={{6,0},{6,-18.45}}, color={191,0,0}));
  connect(TTopSun.T, controlS1_1.TstoTopSun) annotation (Line(points={{-2,0},{-96,
          0},{-96,88},{-41,88}}, color={0,0,127}));
  connect(bou1.ports[1], bufferChp.portHex_a) annotation (Line(points={{-60,44},
          {-60,40},{-48,40},{-48,12.2},{-44,12.2}}, color={0,127,255}));
  connect(solarPID.y, solar.shaCoe_in) annotation (Line(points={{-109.4,-40},{
          -109.4,-40},{-68,-40},{-68,-19.4},{-62,-19.4}},
                                                   color={0,0,127}));
  connect(realExpression1.y, solarControls.TCollector) annotation (Line(points={
          {-83.1,-57},{-74,-57},{-74,-58},{-74,-57.2},{-72.8,-57.2}}, color={0,0,
          127}));
  connect(bufferSolar.heaPorVol[4], TBotSun.port) annotation (Line(points={{6,-17.55},
          {6,-17.55},{6,-90},{2,-90}}, color={191,0,0}));
  connect(TBotSun.T, solarControls.TStoBot) annotation (Line(points={{-6,-90},{-86,
          -90},{-86,-62},{-72.8,-62}}, color={0,0,127}));
  connect(solarControls.Tret, controlS1_1.Tret) annotation (Line(points={{-72.8,
          -66.8},{-90,-66.8},{-90,-94},{66,-94},{66,46},{-54,46},{-54,72},{-41,72}},
        color={0,0,127}));
  connect(booleanToReal1.u, solarControls.on)
    annotation (Line(points={{-50.8,-62},{-55.52,-62}}, color={255,0,255}));
  connect(booleanToReal1.y, fan.m_flow_in) annotation (Line(points={{-41.6,-62},
          {-37.88,-62},{-37.88,-72.8}}, color={0,0,127}));
  connect(realExpression.y, solarPID.u_m) annotation (Line(points={{-119,-20},{
          -116,-20},{-116,-32.8}}, color={0,0,127}));
  connect(solarPID.u_s, const1.y)
    annotation (Line(points={{-123.2,-40},{-127.4,-40}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Line(points={{74,26},{38,-22}}, color={255,0,0}), Ellipse(
          extent={{-86,32},{-26,-30}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,170})}));
end GasSun;
