within DeSchipjes.ProductionSites;
model GasHPAW
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(
    TSupRad=273.15+55);

  //Parameters
  parameter Modelica.SIunits.Power Qhpaw=50000*scaler
    "Nominal power of the air-water HP";
  parameter Modelica.SIunits.Power Qboiler=154000*scaler
    "Nominal power of the boiler";

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
    QNom=Qboiler,
    modulationInput=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    T_start=TSupRad,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{40,50},{60,70}})));
  IDEAS.Fluid.Production.HeatPumpAirWater hpaw(
    modulationInput=false,
    QNom=Qhpaw,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal_hpaw,
    dp_nominal=0,
    T_start=TSupRad,
    use_onOffSignal=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,20})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal_hpaw,
    T_start=TSupRad)
    annotation (Placement(transformation(extent={{-40,-70},{-60,-50}})));
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
    annotation (Placement(transformation(extent={{-10,14},{10,34}})));
  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold hpawOn(threshold=TMinHpaw)
    annotation (Placement(transformation(extent={{-70,36},{-62,44}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=sim.Te)
    annotation (Placement(transformation(extent={{-98,30},{-78,50}})));
  Controls.Switch TSetBoiler(on=TSupDhw, off=TSupRad)
    annotation (Placement(transformation(extent={{14,74},{26,86}})));
  Modelica.Blocks.Sources.RealExpression TSetHpaw(y=TSupRad)
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=m_flow_nominal_hpaw)
    annotation (Placement(transformation(extent={{-74,-30},{-54,-10}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-30,-50})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBasei(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-76,14},{-64,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBaseo(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-32,14},{-20,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TPeako(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{68,54},{80,66}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TPeaki(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{8,54},{20,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{100,-10},{80,10}})));
equation

  PeakPow = boiler.PFuelOrEl;
  BasePow = hpaw.PFuelOrEl*2.5;

  connect(tan.portHex_b, fan.port_a) annotation (Line(points={{-10,16},{-14,16},
          {-14,-60},{-40,-60}}, color={0,127,255}));
  connect(tan.port_b, port_a) annotation (Line(points={{10,24},{30,24},{30,-60},
          {100,-60}}, color={0,127,255}));
  connect(realExpression.y, hpawOn.u)
    annotation (Line(points={{-77,40},{-70.8,40}}, color={0,0,127}));
  connect(hpawOn.y, hpaw.on) annotation (Line(points={{-61.6,40},{-52,40},{-52,30.8}},
        color={255,0,255}));
  connect(TSetBoiler.y, boiler.u)
    annotation (Line(points={{26.6,80},{52,80},{52,70.8}}, color={0,0,127}));
  connect(TSetHpaw.y, hpaw.u)
    annotation (Line(points={{-59,60},{-48,60},{-48,30.8}}, color={0,0,127}));
  connect(u, TSetBoiler.u)
    annotation (Line(points={{0,110},{0,80},{12.8,80}}, color={255,0,255}));
  connect(bou.ports[1], fan.port_a) annotation (Line(points={{-30,-54},{-30,-60},
          {-40,-60}}, color={0,127,255}));
  connect(realExpression2.y, fan.m_flow_in) annotation (Line(points={{-53,-20},{
          -50,-20},{-50,-48},{-49.8,-48}},              color={0,0,127}));
  connect(fan.port_b, TBasei.port_a) annotation (Line(points={{-60,-60},{-80,-60},
          {-80,20},{-76,20}}, color={0,127,255}));
  connect(TBasei.port_b, hpaw.port_a)
    annotation (Line(points={{-64,20},{-60,20}}, color={0,127,255}));
  connect(hpaw.port_b, TBaseo.port_a)
    annotation (Line(points={{-40,20},{-40,20},{-32,20}}, color={0,127,255}));
  connect(TBaseo.port_b, tan.portHex_a) annotation (Line(points={{-20,20},{-10,
          20},{-10,20.2}}, color={0,127,255}));
  connect(boiler.port_b, TPeako.port_a)
    annotation (Line(points={{60,60},{68,60}}, color={0,127,255}));
  connect(TPeako.port_b, port_b)
    annotation (Line(points={{80,60},{100,60}}, color={0,127,255}));
  connect(tan.port_a, TPeaki.port_a) annotation (Line(points={{-10,24},{-14,24},
          {-14,60},{8,60}}, color={0,127,255}));
  connect(TPeaki.port_b, boiler.port_a)
    annotation (Line(points={{20,60},{40,60}}, color={0,127,255}));
  connect(boiler.heatPort, TRoo.port)
    annotation (Line(points={{50,50},{50,50},{50,0},{80,0}}, color={191,0,0}));
  connect(hpaw.heatPort, TRoo.port)
    annotation (Line(points={{-50,10},{-50,0},{80,0}}, color={191,0,0}));
  connect(tan.heaPorBot, tan.heaPorSid) annotation (Line(points={{2,16.6},{2,14},
          {5.6,14},{5.6,24}}, color={191,0,0}));
  connect(tan.heaPorTop, tan.heaPorSid) annotation (Line(points={{2,31.4},{2,34},
          {5.6,34},{5.6,24}}, color={191,0,0}));
  connect(TRoo.port, tan.heaPorSid) annotation (Line(points={{80,0},{50,0},{50,28},
          {5.6,28},{5.6,24}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Line(points={{-32,32},{-32,
              32},{-52,22},{-32,12},{-52,2},{-32,-8},{-52,-16},{-32,-28},{-32,
              -28}}, color={255,0,0}), Line(points={{74,26},{38,-22}}, color={
              255,0,0})}));
end GasHPAW;
