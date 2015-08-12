within DeSchipjes.ProductionSites;
model GasHPAW
  import DeSchipjes;
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(
    TSupRad=273.15+55,
    Qpeak=154000*scaler,
    Qbase=50000*scaler,
    final modulating=true);

  //Parameters
  parameter Modelica.SIunits.Volume VTan=0.950*scaler
    "Volume of the storage tank";
  parameter Modelica.SIunits.Height hTan=1 "Height of the storage tank";
  parameter Modelica.SIunits.Length dIns=0.04 "Insulation thickness";

  parameter Modelica.SIunits.Temperature TMinHpaw=273.15
    "Minimal operating temperature of the hp";
  parameter Modelica.SIunits.Temperature TSupDhw=273.15+75
    "Supply temperature of the Grid for the DHW";

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_hpaw=1.19*scaler
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
    annotation (Placement(transformation(extent={{54,50},{74,70}})));
  IDEAS.Fluid.Production.HeatPumpAirWater hp(
    QNom=Qbase,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal_hpaw,
    dp_nominal=0,
    T_start=TSupRad,
    use_onOffSignal=true,
    modulating=true,
    modulationInput=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,20})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal_hpaw,
    T_start=TSupRad)
    annotation (Placement(transformation(extent={{-12,-70},{-32,-50}})));
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
    mHex_flow_nominal=m_flow_nominal_hpaw,
    redeclare package MediumHex = Medium,
    T_start=TSupRad,
    hHex_a=0.95,
    Q_flow_nominal=tan.mHex_flow_nominal*4200*40,
    TTan_nominal=TSupRad,
    THex_nominal=TSupRad + 5)
    annotation (Placement(transformation(extent={{4,14},{24,34}})));
  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={10,-52})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpi(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-62,14},{-50,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpo(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-18,14},{-6,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoio(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{78,54},{90,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{88,-4},{80,4}})));
  DeSchipjes.ProductionSites.Controls.ControlS2 controls
    annotation (Placement(transformation(extent={{-64,46},{-44,66}})));
  Modelica.Blocks.Sources.RealExpression TAmb(y=sim.Te)
    annotation (Placement(transformation(extent={{-100,42},{-80,62}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TBot
    annotation (Placement(transformation(extent={{-6,-16},{-18,-4}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=m_flow_nominal_hpaw)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-22,-30})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTop
    annotation (Placement(transformation(extent={{-6,34},{-18,46}})));
  IDEAS.Fluid.Valves.ThreeWayValveSwitch threeWayValveSwitch(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={38,-60})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoii(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{38,54},{50,66}})));
equation

  Pboi=boiler.PFuelOrEl;
  PhpEl=hpaw.PFuelOrEl;
  Qsun=0;
  Qhp=-hpaw.heatSource.heatPort2.Q_flow;
  Qsto=tan.Ql_flow;

  connect(tan.portHex_b, fan.port_a) annotation (Line(points={{4,16},{0,16},{0,-60},
          {-12,-60}},           color={0,127,255}));
  connect(bou.ports[1], fan.port_a) annotation (Line(points={{10,-56},{10,-60},{
          -12,-60}},  color={0,127,255}));
  connect(fan.port_b, THpi.port_a) annotation (Line(points={{-32,-60},{-66,-60},
          {-66,20},{-62,20}}, color={0,127,255}));
  connect(THpi.port_b, hp.port_a)
    annotation (Line(points={{-50,20},{-46,20}}, color={0,127,255}));
  connect(hp.port_b, THpo.port_a)
    annotation (Line(points={{-26,20},{-26,20},{-18,20}}, color={0,127,255}));
  connect(THpo.port_b, tan.portHex_a)
    annotation (Line(points={{-6,20},{4,20},{4,20.2}}, color={0,127,255}));
  connect(boiler.port_b, TBoio.port_a)
    annotation (Line(points={{74,60},{74,60},{78,60}}, color={0,127,255}));
  connect(TBoio.port_b, port_b)
    annotation (Line(points={{90,60},{100,60}}, color={0,127,255}));
  connect(boiler.heatPort, TRoo.port)
    annotation (Line(points={{64,50},{64,50},{64,0},{80,0}}, color={191,0,0}));
  connect(hp.heatPort, TRoo.port)
    annotation (Line(points={{-36,10},{-36,0},{80,0}}, color={191,0,0}));
  connect(tan.heaPorBot, tan.heaPorSid) annotation (Line(points={{16,16.6},{16,14},
          {19.6,14},{19.6,24}},
                              color={191,0,0}));
  connect(tan.heaPorTop, tan.heaPorSid) annotation (Line(points={{16,31.4},{16,34},
          {19.6,34},{19.6,24}},
                              color={191,0,0}));
  connect(TRoo.port, tan.heaPorSid) annotation (Line(points={{80,0},{64,0},{64,28},
          {19.6,28},{19.6,24}},
                              color={191,0,0}));
  connect(controls.hpOn, hp.on) annotation (Line(points={{-43.4,62},{-38,62},{-38,
          30.8}}, color={255,0,255}));
  connect(controls.u, TBase) annotation (Line(points={{-54,67},{-54,80},{-40,80},
          {-40,110}}, color={255,0,255}));
  connect(controls.boi, boiler.u) annotation (Line(points={{-43.4,54},{-12,54},{
          -12,80},{66,80},{66,70.8}}, color={0,0,127}));
  connect(controls.boiOn, boiler.on) annotation (Line(points={{-43.4,50},{-8,50},
          {-8,76},{62,76},{62,70.8}}, color={255,0,255}));
  connect(TAmb.y,controls. TAmb)
    annotation (Line(points={{-79,52},{-65,52}}, color={0,0,127}));
  connect(booleanToReal.u, hp.on) annotation (Line(points={{-22,-22.8},{-22,62},
          {-38,62},{-38,30.8}}, color={255,0,255}));
  connect(booleanToReal.y, fan.m_flow_in) annotation (Line(points={{-22,-36.6},{
          -22,-48},{-21.8,-48}}, color={0,0,127}));
  connect(tan.heaPorVol[4], TBot.port) annotation (Line(points={{14,24.45},{14,24.45},
          {14,-8},{14,-10},{-6,-10}}, color={191,0,0}));
  connect(TBot.T,controls. TstoBot) annotation (Line(points={{-18,-10},{-74,-10},
          {-74,56},{-65,56}}, color={0,0,127}));
  connect(tan.heaPorVol[1], TTop.port)
    annotation (Line(points={{14,23.55},{14,40},{-6,40}}, color={191,0,0}));
  connect(TTop.T,controls. TstoTop) annotation (Line(points={{-18,40},{-70,40},{
          -70,60},{-65,60}}, color={0,0,127}));
  connect(threeWayValveSwitch.port_b, port_a)
    annotation (Line(points={{48,-60},{48,-60},{100,-60}}, color={0,127,255}));
  connect(controls.noBuffer, threeWayValveSwitch.switch) annotation (Line(
        points={{-54,45.4},{-54,32},{-80,32},{-80,-80},{38,-80},{38,-68}},
        color={255,0,255}));
  connect(tan.port_b, threeWayValveSwitch.port_a1) annotation (Line(points={{24,24},
          {24,24},{24,-60},{28,-60}},     color={0,127,255}));
  connect(controls.hp, hp.u) annotation (Line(points={{-43.4,58},{-34,58},{-34,
          30.8}}, color={0,0,127}));
  connect(threeWayValveSwitch.port_a2, TBoii.port_a)
    annotation (Line(points={{38,-50},{38,60}}, color={0,127,255}));
  connect(TBoii.port_b, boiler.port_a)
    annotation (Line(points={{50,60},{54,60}}, color={0,127,255}));
  connect(tan.port_a, TBoii.port_a) annotation (Line(points={{4,24},{0,24},{0,
          46},{38,46},{38,60}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Line(points={{-32,32},{-32,
              32},{-52,22},{-32,12},{-52,2},{-32,-8},{-52,-16},{-32,-28},{-32,
              -28}}, color={255,0,0}), Line(points={{74,26},{38,-22}}, color={
              255,0,0})}));
end GasHPAW;
