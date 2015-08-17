within DeSchipjes.ProductionSites;
model GasBeo
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(
    final modulating=false,
    Qpeak=70000*scaler,
    Qbase=42800*scaler);

  //Parameters

  parameter Modelica.SIunits.Temperature TGround = 273.15+7;
  parameter Modelica.SIunits.Temperature TSupDhw=273.15+75
    "Supply temperature of the Grid for the DHW";

  parameter Modelica.SIunits.Volume VTan=0.950*scaler
    "Volume of the storage tank";
  parameter Modelica.SIunits.Height hTan=1 "Height of the storage tank";
  parameter Modelica.SIunits.Length dIns=0.04 "Insulation thickness";

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_hpww=1.03*scaler
    "Nominal massflow rate of the air-water hp";

  parameter Modelica.SIunits.Area A=20*scaler "Area of the solar collectors";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_sun=0.161*scaler
    "Nominal massflow rate of the solar collector";
  parameter Modelica.SIunits.MassFlowRate m_flow_min_sun= 0.00161*scaler
    "Minimal massflowrate of the solar collector";

  Heaters.Boiler                boiler(
                             m_flow_nominal=m_flow_nominal,
    QNom=Qpeak,
    modulationInput=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    dp_nominal=0,
    use_onOffSignal=true)
    annotation (Placement(transformation(extent={{56,50},{76,70}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-34,-46},{-46,-34}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex bufferHp(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    VTan=VTan,
    hTan=hTan,
    dIns=dIns,
    hHex_b=0.05,
    linearizeFlowResistance=true,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package MediumHex = Medium,
    T_start=TSupRad,
    hHex_a=0.95,
    TTan_nominal=TSupRad,
    THex_nominal=TSupRad + 5,
    mHex_flow_nominal=m_flow_nominal_hpww,
    Q_flow_nominal=bufferHp.mHex_flow_nominal*4200*40,
    hexSegMult=1)
    annotation (Placement(transformation(extent={{-14,-6},{6,14}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    redeclare package Medium = Medium,
    nPorts=1)                                       annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-60,-34})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpi(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-76,-4},{-68,4}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpo(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-38,-4},{-30,4}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoio(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{80,54},{92,66}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoii(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{40,54},{52,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{88,-4},{80,4}})));
  Heaters.HPWW42     hp(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    QNom=Qbase,
    m1_flow_nominal=m_flow_nominal_hpww*3.4,
    m2_flow_nominal=m_flow_nominal_hpww,
    dp1_nominal=0,
    dp2_nominal=0,
    m1=50*scaler,
    m2=50*scaler)
    annotation (Placement(transformation(extent={{-44,-4},{-64,16}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan1(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-80,30})));
  Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Medium,
    dp_nominal=0,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-64,42},{-48,58}})));
  Modelica.Blocks.Sources.Constant const(k=TGround)
    annotation (Placement(transformation(extent={{-86,68},{-78,76}})));
  Modelica.Blocks.Math.Gain gain(k=3.4) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={-91,21})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBeoo(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-44,44},{-32,56}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBeoi(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-80,44},{-68,56}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex bufferSolar(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    VTan=VTan,
    hTan=hTan,
    dIns=dIns,
    hHex_b=0.05,
    linearizeFlowResistance=true,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package MediumHex = Medium,
    T_start=TSupRad,
    hHex_a=0.95,
    TTan_nominal=TSupRad,
    THex_nominal=TSupRad + 5,
    Q_flow_nominal=bufferSolar.mHex_flow_nominal*4200*40,
    mHex_flow_nominal=m_flow_nominal_sun)
    annotation (Placement(transformation(extent={{-18,-70},{2,-50}})));
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
    use_shaCoe_in=false,
    nSeg=3) annotation (Placement(transformation(extent={{-66,-74},{-46,-54}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TSuni(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-80,-68},{-72,-60}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TSuno(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-42,-70},{-30,-58}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan2(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-42,-98},{-54,-86}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    use_T=false,
    redeclare package Medium = Medium,
    nPorts=1)                                       annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-72,-86})));
  IDEAS.Fluid.Valves.ThreeWayValveSwitch threeWayValveSwitch(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={24,14})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTopHp
    annotation (Placement(transformation(extent={{-4,36},{-12,44}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TBotHp
    annotation (Placement(transformation(extent={{-4,46},{-12,54}})));
  Controls.ControlS4 controls(TEco=273.15 + 20)
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.RealExpression TAmb(y=sim.Te)
    annotation (Placement(transformation(extent={{-56,58},{-40,74}})));
  IDEAS.Fluid.Valves.ThreeWayValveSwitch threeWayValveSwitch1(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={40,-60})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTopSun
    annotation (Placement(transformation(extent={{-10,-30},{-18,-22}})));
  IDEAS.Fluid.Sources.FixedBoundary bou1(
    use_T=false,
    redeclare package Medium = Medium,
    nPorts=1)                                       annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-72,18})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort Tret(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{76,-66},{64,-54}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=m_flow_nominal_hpww)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-40,-16})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TBotSun
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=180,
        origin={10,-76})));
  IDEAS.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam="modelica://Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    annotation (Placement(transformation(extent={{-96,-56},{-84,-44}})));
  Buildings.Fluid.SolarCollectors.Controls.SolarPumpController pumCon(per=solar.per)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=180,
        origin={16,-88})));
  Modelica.Blocks.Math.Gain gain1(k=m_flow_nominal_sun)
    "Flow rate of the system in kg/s"
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={4,-88})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=100, uMin=0.01) annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={-10,-88})));
equation

  Pboi=boiler.PFuelOrEl;
  PhpEl=hp.PEl;
  Qsun=(solar.port_b.h_outflow-solar.port_a.h_outflow)*solar.m_flow;
  Qhp=hp.QEvaporator;
  Qsto=bufferHp.Ql_flow + bufferSolar.Ql_flow;
  connect(bufferHp.portHex_b, fan.port_a) annotation (Line(points={{-14,-4},{
          -20,-4},{-20,-40},{-34,-40}},
                                    color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(fan.port_b, THpi.port_a)
    annotation (Line(points={{-46,-40},{-80,-40},{-80,0},{-76,0}},
                                                           color={0,127,255},
      thickness=0.5));
  connect(THpo.port_b, bufferHp.portHex_a)
    annotation (Line(points={{-30,0},{-14,0},{-14,0.2}}, color={0,127,255},
      thickness=0.5));
  connect(boiler.port_b, TBoio.port_a)
    annotation (Line(points={{76,60},{80,60}}, color={0,127,255}));
  connect(TBoii.port_b, boiler.port_a)
    annotation (Line(points={{52,60},{56,60}}, color={0,127,255}));
  connect(TBoio.port_b, port_b)
    annotation (Line(points={{92,60},{92,60},{100,60}}, color={0,127,255},
      thickness=0.5));
  connect(const.y, hea.TSet) annotation (Line(points={{-77.6,72},{-77.6,72},{-70,
          72},{-70,54.8},{-65.6,54.8}},
                color={175,175,175}));
  connect(THpi.port_b, hp.port_a2)
    annotation (Line(points={{-68,0},{-68,0},{-64,0}},
                                               color={0,127,255}));
  connect(fan1.port_a, hp.port_b1)
    annotation (Line(points={{-80,24},{-80,12},{-64,12}}, color={0,127,255},
      thickness=0.5));
  connect(gain.y, fan1.m_flow_in) annotation (Line(points={{-91,24.3},{-91,29.88},
          {-87.2,29.88}}, color={175,175,175}));
  connect(hea.port_b, TBeoo.port_a)
    annotation (Line(points={{-48,50},{-48,50},{-44,50}}, color={0,127,255}));
  connect(TBeoo.port_b, hp.port_a1) annotation (Line(points={{-32,50},{-32,50},{
          -32,12},{-44,12}},  color={0,127,255},
      thickness=0.5));
  connect(hea.port_a,TBeoi. port_b)
    annotation (Line(points={{-64,50},{-68,50}}, color={0,127,255}));
  connect(TBeoi.port_a, fan1.port_b)
    annotation (Line(points={{-80,50},{-80,44},{-80,36}}, color={0,127,255},
      thickness=0.5));
  connect(TSuni.port_b, solar.port_a) annotation (Line(points={{-72,-64},{-72,-64},
          {-66,-64}},      color={0,127,255}));
  connect(solar.port_b, TSuno.port_a)
    annotation (Line(points={{-46,-64},{-42,-64}}, color={0,127,255}));
  connect(fan2.port_b, TSuni.port_a) annotation (Line(points={{-54,-92},{-54,
          -92},{-80,-92},{-80,-64}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(TSuno.port_b, bufferSolar.portHex_a) annotation (Line(points={{-30,-64},
          {-18,-64},{-18,-63.8}}, color={0,127,255},
      thickness=0.5));
  connect(bufferSolar.portHex_b, fan2.port_a) annotation (Line(points={{-18,-68},
          {-18,-68},{-20,-68},{-20,-92},{-42,-92}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(threeWayValveSwitch.port_b, TBoii.port_a)
    annotation (Line(points={{24,22},{24,60},{40,60}}, color={0,127,255},
      thickness=0.5));
  connect(bufferHp.port_a, threeWayValveSwitch.port_a2) annotation (Line(points=
         {{-14,4},{-14,4},{-20,4},{-20,14},{16,14}}, color={0,127,255},
      thickness=0.5));
  connect(bufferSolar.port_a, threeWayValveSwitch.port_a1) annotation (Line(
        points={{-18,-60},{-20,-60},{-20,-44},{24,-44},{24,6}}, color={0,127,255},
      thickness=0.5));

  connect(bufferHp.port_b, bufferSolar.port_b) annotation (Line(points={{6,4},{
          10,4},{10,-60},{2,-60}},
                                color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(bufferHp.heaPorVol[1], TTopHp.port)
    annotation (Line(points={{-4,3.55},{-4,22},{-4,40}}, color={191,0,0}));
  connect(bufferHp.heaPorVol[4], TBotHp.port)
    annotation (Line(points={{-4,4.45},{-4,50}}, color={191,0,0}));
  connect(TAmb.y, controls.TAmb)
    annotation (Line(points={{-39.2,66},{-26,66},{-11,66}}, color={175,175,175}));
  connect(TTopHp.T, controls.TstoTop) annotation (Line(points={{-12,40},{-24,40},
          {-24,74},{-11,74}}, color={175,175,175}));
  connect(TBotHp.T, controls.TstoBot) annotation (Line(points={{-12,50},{-20,50},
          {-20,70},{-11,70}}, color={175,175,175}));
  connect(controls.boi, boiler.u) annotation (Line(points={{10.6,68},{22,68},{
          22,80},{68,80},{68,70.8}}, color={175,175,175}));
  connect(controls.boiOn, boiler.on) annotation (Line(points={{10.6,64},{26,64},
          {26,76},{64,76},{64,70.8}}, color={255,0,255}));
  connect(threeWayValveSwitch1.port_a1, bufferSolar.port_b)
    annotation (Line(points={{30,-60},{2,-60}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(threeWayValveSwitch1.port_a2, TBoii.port_a)
    annotation (Line(points={{40,-50},{40,60}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(TTopSun.T, controls.TstoTopSun) annotation (Line(points={{-18,-26},{
          -28,-26},{-28,78},{-11,78}},
                                   color={175,175,175}));
  connect(TTopSun.port, bufferSolar.heaPorVol[1]) annotation (Line(points={{-10,
          -26},{-8,-26},{-8,-60.45}}, color={191,0,0}));
  connect(controls.noBuffer, threeWayValveSwitch1.switch) annotation (Line(
        points={{4,59.4},{4,46},{54,46},{54,-74},{40,-74},{40,-68}}, color={255,
          0,255}));
  connect(controls.hpOrSolar, threeWayValveSwitch.switch) annotation (Line(
        points={{0,59.4},{0,40},{36,40},{36,14},{30.4,14}}, color={255,0,255}));
  connect(bou1.ports[1], hp.port_b1)
    annotation (Line(points={{-72,14},{-72,12},{-64,12}}, color={0,127,255},
      thickness=0.5));
  connect(THpo.port_a, hp.port_b2)
    annotation (Line(points={{-38,0},{-38,0},{-44,0}}, color={0,127,255}));
  connect(port_a, Tret.port_a)
    annotation (Line(points={{100,-60},{76,-60}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(Tret.port_b, threeWayValveSwitch1.port_b)
    annotation (Line(points={{64,-60},{50,-60}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(controls.Tret, Tret.T) annotation (Line(points={{-11,62},{-16,62},{
          -16,60},{-16,26},{70,26},{70,-53.4}},
                                            color={175,175,175}));
  connect(bou.ports[1], THpi.port_a) annotation (Line(points={{-60,-38},{-60,
          -40},{-80,-40},{-80,0},{-76,0}},
                                      color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(booleanToReal.y, fan.m_flow_in) annotation (Line(points={{-40,-20.4},{
          -40,-32.8},{-39.88,-32.8}}, color={0,0,127}));
  connect(gain.u, fan.m_flow_in) annotation (Line(points={{-91,17.4},{-91,-26},{
          -40,-26},{-40,-32.8},{-39.88,-32.8}}, color={175,175,175}));
  connect(bufferSolar.heaPorVol[4], TBotSun.port)
    annotation (Line(points={{-8,-59.55},{-8,-76},{6,-76}}, color={191,0,0}));
  connect(bou2.ports[1], TSuni.port_a) annotation (Line(points={{-72,-90},{-72,
          -92},{-80,-92},{-80,-64}},
                                color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(weaDat.weaBus, solar.weaBus) annotation (Line(
      points={{-84,-50},{-66,-50},{-66,-54.4}},
      color={255,204,51},
      thickness=0.5));
  connect(boiler.heatPort, TRoo.port) annotation (Line(points={{66,50},{66,22},{
          66,0},{80,0}}, color={255,213,170}));
  connect(bufferHp.heaPorSid, TRoo.port) annotation (Line(points={{1.6,4},{2,4},
          {2,-16},{66,-16},{66,0},{80,0}}, color={255,213,170}));
  connect(bufferSolar.heaPorSid, TRoo.port) annotation (Line(points={{-2.4,-60},
          {-2,-60},{-2,-16},{66,-16},{66,0},{80,0}}, color={255,213,170}));
  connect(pumCon.y, gain1.u) annotation (Line(points={{11.28,-88},{10,-88},{8.8,
          -88}}, color={0,0,127}));
  connect(gain1.y, limiter.u) annotation (Line(points={{-0.4,-88},{-2,-88},{-5.2,
          -88}}, color={0,0,127}));
  connect(fan2.m_flow_in, limiter.y) annotation (Line(points={{-47.88,-84.8},{-47.88,
          -80},{-26,-80},{-26,-88},{-14.4,-88}}, color={0,0,127}));
  connect(TBotSun.T, pumCon.TIn) annotation (Line(points={{14,-76},{40,-76},{40,
          -86.4},{20.8,-86.4}}, color={0,0,127}));
  connect(pumCon.weaBus, solar.weaBus) annotation (Line(
      points={{20.08,-90.4},{26,-90.4},{26,-90},{26,-50},{-66,-50},{-66,-54.4}},
      color={255,204,51},
      thickness=0.5));

  connect(controls.hpOn, hp.u) annotation (Line(points={{10.6,76},{14,76},{14,28},
          {-54,28},{-54,16.8}}, color={255,0,255}));
  connect(booleanToReal.u, hp.u) annotation (Line(points={{-40,-11.2},{-40,28},{
          -54,28},{-54,16.8}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Line(points={{74,26},{38,-22}}, color={255,0,0}),
        Ellipse(extent={{-82,10},{-66,-6}}, lineColor={255,0,0}),
        Ellipse(extent={{-64,10},{-48,-6}}, lineColor={255,0,0}),
        Ellipse(extent={{-46,10},{-30,-6}}, lineColor={255,0,0})}));
end GasBeo;
