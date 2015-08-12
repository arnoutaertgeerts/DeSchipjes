within DeSchipjes.ProductionSites;
model GasBeoModulating
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(
    Qpeak=154000*scaler,
    Qbase=28800*scaler);

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

  IDEAS.Fluid.Production.Boiler boiler(
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
    annotation (Placement(transformation(extent={{-48,-46},{-60,-34}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex tan(
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
    Q_flow_nominal=tan.mHex_flow_nominal*4200*40,
    TTan_nominal=TSupRad,
    THex_nominal=TSupRad + 5,
    mHex_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-14,-6},{6,14}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-38,-32})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpi(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-80,-6},{-68,6}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpo(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-40,-6},{-28,6}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoio(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{80,54},{92,66}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoii(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{40,54},{52,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{80,-24},{72,-16}})));
  Heaters.HeatPumpWW hp(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    modulationInput=false,
    QNom=Qbase,
    use_onOffSignal=true)
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
        origin={-80,34})));
  Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Medium,
    dp_nominal=0,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-62,46},{-46,62}})));
  Modelica.Blocks.Sources.Constant const(k=TGround)
    annotation (Placement(transformation(extent={{-84,68},{-76,76}})));
  IDEAS.Fluid.Sources.FixedBoundary bou1(
    use_T=false,
    redeclare package Medium = Medium,
    nPorts=1)                                       annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-90,48})));
  Modelica.Blocks.Math.Gain gain(k=3.4) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-90,20})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBeoo(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-42,48},{-30,60}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBeoi(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-80,48},{-68,60}})));
  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex tan1(
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
    Q_flow_nominal=tan.mHex_flow_nominal*4200*40,
    TTan_nominal=TSupRad,
    THex_nominal=TSupRad + 5,
    mHex_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-16,-70},{4,-50}})));
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
    nSeg=5,
    use_shaCoe_in=false)
            annotation (Placement(transformation(extent={{-64,-74},{-44,-54}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TSuni(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-80,-70},{-68,-58}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TSuno(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-40,-70},{-28,-58}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan2(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-40,-96},{-52,-84}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-32,-82})));
  IDEAS.Fluid.Valves.ThreeWayValveSwitch threeWayValveSwitch(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={20,20})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTop
    annotation (Placement(transformation(extent={{-10,36},{-18,44}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TBot
    annotation (Placement(transformation(extent={{-10,48},{-18,56}})));
  Controls.ControlS3 controls
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
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTop1
    annotation (Placement(transformation(extent={{-8,-30},{-16,-22}})));
equation

  PeakPow = boiler.PFuelOrEl;
  BasePow = hpww.PFuelOrEl*2.5;
  connect(tan.portHex_b,fan. port_a) annotation (Line(points={{-14,-4},{-18,-4},
          {-18,-40},{-48,-40}}, color={0,127,255}));
  connect(bou.ports[1],fan. port_a) annotation (Line(points={{-38,-36},{-38,-40},
          {-48,-40}}, color={0,127,255}));
  connect(fan.port_b, THpi.port_a)
    annotation (Line(points={{-60,-40},{-80,-40},{-80,0}}, color={0,127,255}));
  connect(THpo.port_b, tan.portHex_a)
    annotation (Line(points={{-28,0},{-14,0},{-14,0.2}}, color={0,127,255}));
  connect(boiler.port_b, TBoio.port_a)
    annotation (Line(points={{76,60},{80,60}}, color={0,127,255}));
  connect(TBoii.port_b, boiler.port_a)
    annotation (Line(points={{52,60},{56,60}}, color={0,127,255}));
  connect(TBoio.port_b, port_b)
    annotation (Line(points={{92,60},{92,60},{100,60}}, color={0,127,255}));
  connect(const.y, hea.TSet) annotation (Line(points={{-75.6,72},{-75.6,72},{
          -68,72},{-68,58.8},{-63.6,58.8}},
                color={0,0,127}));
  connect(hp.port_b2, THpo.port_a)
    annotation (Line(points={{-44,0},{-44,0},{-40,0}}, color={0,127,255}));
  connect(THpi.port_b, hp.port_a2)
    annotation (Line(points={{-68,0},{-64,0}}, color={0,127,255}));
  connect(fan1.port_a, hp.port_b1)
    annotation (Line(points={{-80,28},{-80,12},{-64,12}}, color={0,127,255}));
  connect(bou1.ports[1], fan1.port_b)
    annotation (Line(points={{-86,48},{-80,48},{-80,40}}, color={0,127,255}));
  connect(gain.y, fan1.m_flow_in) annotation (Line(points={{-90,26.6},{-90,
          33.88},{-87.2,33.88}},
                          color={0,0,127}));
  connect(hea.port_b, TBeoo.port_a)
    annotation (Line(points={{-46,54},{-46,54},{-42,54}}, color={0,127,255}));
  connect(TBeoo.port_b, hp.port_a1) annotation (Line(points={{-30,54},{-30,54},
          {-30,12},{-44,12}}, color={0,127,255}));
  connect(hea.port_a,TBeoi. port_b)
    annotation (Line(points={{-62,54},{-66,54},{-68,54}},
                                                 color={0,127,255}));
  connect(TBeoi.port_a, fan1.port_b)
    annotation (Line(points={{-80,54},{-80,54},{-80,40}}, color={0,127,255}));
  connect(TSuni.port_b, solar.port_a) annotation (Line(points={{-68,-64},{-68,
          -64},{-64,-64}}, color={0,127,255}));
  connect(solar.port_b, TSuno.port_a)
    annotation (Line(points={{-44,-64},{-40,-64}}, color={0,127,255}));
  connect(fan2.port_b, TSuni.port_a) annotation (Line(points={{-52,-90},{-66,
          -90},{-80,-90},{-80,-64}}, color={0,127,255}));
  connect(TSuno.port_b, tan1.portHex_a) annotation (Line(points={{-28,-64},{-16,
          -64},{-16,-63.8}}, color={0,127,255}));
  connect(tan1.portHex_b, fan2.port_a) annotation (Line(points={{-16,-68},{-16,
          -90},{-40,-90}}, color={0,127,255}));
  connect(bou2.ports[1], fan2.port_a) annotation (Line(points={{-32,-86},{-32,
          -90},{-40,-90}}, color={0,127,255}));
  connect(threeWayValveSwitch.port_b, TBoii.port_a)
    annotation (Line(points={{20,30},{20,60},{40,60}}, color={0,127,255}));
  connect(tan.port_a, threeWayValveSwitch.port_a2)
    annotation (Line(points={{-14,4},{-14,20},{10,20}}, color={0,127,255}));
  connect(tan1.port_a, threeWayValveSwitch.port_a1) annotation (Line(points={{
          -16,-60},{-20,-60},{-20,-46},{20,-46},{20,10}}, color={0,127,255}));
  connect(tan.port_b, tan1.port_b) annotation (Line(points={{6,4},{12,4},{12,
          -60},{4,-60}}, color={0,127,255}));
  connect(tan.heaPorVol[1], TTop.port) annotation (Line(points={{-4,3.55},{-4,
          22},{-4,40},{-10,40}}, color={191,0,0}));
  connect(tan.heaPorVol[4], TBot.port)
    annotation (Line(points={{-4,4.45},{-4,52},{-10,52}}, color={191,0,0}));
  connect(TAmb.y, controls.TAmb)
    annotation (Line(points={{-39.2,66},{-26,66},{-11,66}}, color={0,0,127}));
  connect(TBase, controls.u) annotation (Line(points={{-40,110},{-40,88},{0,88},
          {0,81}}, color={255,0,255}));
  connect(TTop.T, controls.TstoTop) annotation (Line(points={{-18,40},{-22,40},
          {-22,74},{-11,74}}, color={0,0,127}));
  connect(TBot.T, controls.TstoBot) annotation (Line(points={{-18,52},{-20,52},
          {-20,70},{-11,70}}, color={0,0,127}));
  connect(controls.hpOn, hp.on) annotation (Line(points={{10.6,76},{16,76},{16,
          30},{-52,30},{-52,16.8}}, color={255,0,255}));
  connect(controls.hp, hp.u) annotation (Line(points={{10.6,72},{12,72},{12,34},
          {-56,34},{-56,16.8}}, color={0,0,127}));
  connect(controls.boi, boiler.u) annotation (Line(points={{10.6,68},{22,68},{
          22,80},{68,80},{68,70.8}}, color={0,0,127}));
  connect(controls.boiOn, boiler.on) annotation (Line(points={{10.6,64},{26,64},
          {26,76},{64,76},{64,70.8}}, color={255,0,255}));
  connect(port_a, threeWayValveSwitch1.port_b)
    annotation (Line(points={{100,-60},{50,-60}}, color={0,127,255}));
  connect(threeWayValveSwitch1.port_a1, tan1.port_b)
    annotation (Line(points={{30,-60},{4,-60}}, color={0,127,255}));
  connect(threeWayValveSwitch1.port_a2, TBoii.port_a)
    annotation (Line(points={{40,-50},{40,60}}, color={0,127,255}));
  connect(TTop1.T, controls.TstoTopSun) annotation (Line(points={{-16,-26},{-24,
          -26},{-24,62},{-11,62}}, color={0,0,127}));
  connect(TTop1.port, tan1.heaPorVol[1])
    annotation (Line(points={{-8,-26},{-6,-26},{-6,-60.45}}, color={191,0,0}));
  connect(controls.noBuffer, threeWayValveSwitch1.switch) annotation (Line(
        points={{4,59.4},{4,46},{56,46},{56,-76},{40,-76},{40,-68}}, color={255,
          0,255}));
  connect(controls.hpOrSolar, threeWayValveSwitch.switch) annotation (Line(
        points={{0,59.4},{0,40},{34,40},{34,20},{28,20}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Line(points={{74,26},{38,-22}}, color={255,0,0}),
        Ellipse(extent={{-82,10},{-66,-6}}, lineColor={255,0,0}),
        Ellipse(extent={{-64,10},{-48,-6}}, lineColor={255,0,0}),
        Ellipse(extent={{-46,10},{-30,-6}}, lineColor={255,0,0})}));
end GasBeoModulating;
