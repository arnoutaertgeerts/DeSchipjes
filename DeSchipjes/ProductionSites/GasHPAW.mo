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

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_hpaw=1.195*scaler
    "Nominal massflow rate of the air-water hp";

  DeSchipjes.ProductionSites.Heaters.Boiler
                                boiler(
                             m_flow_nominal=m_flow_nominal,
    QNom=Qpeak,
    modulationInput=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    dp_nominal=0,
    use_onOffSignal=true,
    m2=15*scaler)
    annotation (Placement(transformation(extent={{56,50},{76,70}})));
  DeSchipjes.ProductionSites.Heaters.HPAWVitoA60
                                          hp(
    QNom=Qbase,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal_hpaw,
    dp_nominal=0,
    T_start=TSupRad,
    m=13*scaler)           annotation (Placement(transformation(
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
    annotation (Placement(transformation(extent={{-10,-70},{-30,-50}})));
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
    mHex_flow_nominal=m_flow_nominal_hpaw,
    redeclare package MediumHex = Medium,
    T_start=TSupRad,
    hHex_a=0.95,
    THex_nominal=TSupRad + 5,
    hexSegMult=1,
    TTan_nominal=273.15 + 30,
    Q_flow_nominal=bufferHp.mHex_flow_nominal*4200*30)
    annotation (Placement(transformation(extent={{4,14},{24,34}})));
  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpi(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-62,14},{-50,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort THpo(redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-16,14},{-4,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoio(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{80,54},{92,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{88,-4},{80,4}})));
  DeSchipjes.ProductionSites.Controls.ControlS2 controls
    annotation (Placement(transformation(extent={{-64,46},{-44,66}})));
  Modelica.Blocks.Sources.RealExpression TAmb(y=sim.Te)
    annotation (Placement(transformation(extent={{-100,42},{-80,62}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TBot
    annotation (Placement(transformation(extent={{-4,-16},{-16,-4}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=m_flow_nominal_hpaw,
      realFalse=0)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-20,-30})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TTop
    annotation (Placement(transformation(extent={{-4,34},{-16,46}})));
  IDEAS.Fluid.Valves.ThreeWayValveSwitch threeWayValveSwitch(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={40,-60})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBoii(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{40,54},{52,66}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-52,-52})));
equation

  Pboi=boiler.PFuelOrEl;
  PhpEl=hp.PEl;
  Qsun=0;
  Qhp=hp.QEvaporator;
  Qsto=bufferHp.Ql_flow;

  connect(bufferHp.portHex_b, fan.port_a) annotation (Line(points={{4,16},{0,16},
          {0,-60},{-10,-60}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(fan.port_b, THpi.port_a) annotation (Line(points={{-30,-60},{-66,-60},
          {-66,20},{-62,20}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(THpi.port_b, hp.port_a)
    annotation (Line(points={{-50,20},{-46,20}}, color={0,127,255}));
  connect(hp.port_b, THpo.port_a)
    annotation (Line(points={{-26,20},{-26,20},{-16,20}}, color={0,127,255},
      thickness=0.5));
  connect(THpo.port_b, bufferHp.portHex_a)
    annotation (Line(points={{-4,20},{4,20},{4,20.2}}, color={0,127,255},
      thickness=0.5));
  connect(boiler.port_b, TBoio.port_a)
    annotation (Line(points={{76,60},{76,60},{80,60}}, color={0,127,255}));
  connect(TBoio.port_b, port_b)
    annotation (Line(points={{92,60},{100,60}}, color={0,127,255},
      thickness=0.5));
  connect(boiler.heatPort, TRoo.port)
    annotation (Line(points={{66,50},{66,50},{66,0},{80,0}}, color={191,0,0}));
  connect(bufferHp.heaPorBot, bufferHp.heaPorSid) annotation (Line(points={{16,16.6},
          {16,14},{19.6,14},{19.6,24}}, color={191,0,0}));
  connect(bufferHp.heaPorTop, bufferHp.heaPorSid) annotation (Line(points={{16,31.4},
          {16,34},{19.6,34},{19.6,24}}, color={191,0,0}));
  connect(TRoo.port, bufferHp.heaPorSid) annotation (Line(points={{80,0},{66,0},
          {66,28},{19.6,28},{19.6,24}}, color={191,0,0}));
  connect(controls.boi, boiler.u) annotation (Line(points={{-43.4,54},{-12,54},{
          -12,80},{68,80},{68,70.8}}, color={0,0,127}));
  connect(controls.boiOn, boiler.on) annotation (Line(points={{-43.4,50},{-8,50},
          {-8,76},{64,76},{64,70.8}}, color={255,0,255}));
  connect(TAmb.y,controls. TAmb)
    annotation (Line(points={{-79,52},{-65,52}}, color={0,0,127}));
  connect(booleanToReal.y, fan.m_flow_in) annotation (Line(points={{-20,-36.6},
          {-20,-48},{-19.8,-48}},color={0,0,127}));
  connect(bufferHp.heaPorVol[4], TBot.port) annotation (Line(points={{14,24.45},
          {14,24.45},{14,-8},{14,-10},{-4,-10}}, color={191,0,0}));
  connect(TBot.T,controls. TstoBot) annotation (Line(points={{-16,-10},{-74,-10},
          {-74,56},{-65,56}}, color={0,0,127}));
  connect(bufferHp.heaPorVol[1], TTop.port)
    annotation (Line(points={{14,23.55},{14,40},{-4,40}}, color={191,0,0}));
  connect(TTop.T,controls. TstoTop) annotation (Line(points={{-16,40},{-70,40},{
          -70,60},{-65,60}}, color={0,0,127}));
  connect(threeWayValveSwitch.port_b, port_a)
    annotation (Line(points={{50,-60},{50,-60},{100,-60}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(controls.noBuffer, threeWayValveSwitch.switch) annotation (Line(
        points={{-54,45.4},{-54,32},{-80,32},{-80,-80},{40,-80},{40,-68}},
        color={255,0,255}));
  connect(bufferHp.port_b, threeWayValveSwitch.port_a1) annotation (Line(points=
         {{24,24},{24,24},{24,-60},{30,-60}}, color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(threeWayValveSwitch.port_a2, TBoii.port_a)
    annotation (Line(points={{40,-50},{40,6},{40,60}},
                                                color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(TBoii.port_b, boiler.port_a)
    annotation (Line(points={{52,60},{56,60}}, color={0,127,255}));
  connect(bufferHp.port_a, TBoii.port_a) annotation (Line(points={{4,24},{0,24},
          {0,46},{40,46},{40,60}}, color={0,127,255},
      thickness=0.5));
  connect(bou.ports[1], THpi.port_a) annotation (Line(
      points={{-52,-56},{-52,-60},{-66,-60},{-66,20},{-62,20}},
      color={0,127,255},
      thickness=0.5,
      pattern=LinePattern.DashDot));
  connect(modulation, controls.u) annotation (Line(points={{0,110},{0,86},{-54,
          86},{-54,67}}, color={255,0,255}));
  connect(controls.hpOn, hp.u) annotation (Line(points={{-43.4,62},{-36,62},{-36,
          30.8}}, color={255,0,255}));
  connect(booleanToReal.u, hp.u) annotation (Line(points={{-20,-22.8},{-20,-22.8},
          {-20,44},{-36,44},{-36,30.8}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Line(points={{-32,32},{-32,
              32},{-52,22},{-32,12},{-52,2},{-32,-8},{-52,-16},{-32,-28},{-32,
              -28}}, color={255,0,0}), Line(points={{74,26},{38,-22}}, color={
              255,0,0})}));
end GasHPAW;
