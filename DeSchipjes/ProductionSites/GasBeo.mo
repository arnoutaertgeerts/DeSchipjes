within DeSchipjes.ProductionSites;
model GasBeo
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite;

  //Parameters

  parameter Modelica.SIunits.Temperature TGround = 273.15+7;

  parameter Modelica.SIunits.Power Qhpww=42800*scaler
    "Nominal power of the air-water HP";
  parameter Modelica.SIunits.Power Qboiler=72000*scaler
    "Nominal power of the boiler";

  parameter Modelica.SIunits.Volume VTan=0.950*scaler
    "Volume of the storage tank";
  parameter Modelica.SIunits.Height hTan=1 "Height of the storage tank";
  parameter Modelica.SIunits.Length dIns=0.04 "Insulation thickness";

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_hpww=1.03*scaler
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
    annotation (Placement(transformation(extent={{38,50},{58,70}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-42,-66},{-54,-54}})));
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
    annotation (Placement(transformation(extent={{-10,14},{10,34}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-32,-50})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBasei(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-78,14},{-66,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBaseo(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-34,14},{-22,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TPeako(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{66,54},{78,66}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TPeaki(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{6,54},{18,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  Heaters.HeatPumpWW                        hpww(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=Qhpww)
    annotation (Placement(transformation(extent={{-40,16},{-60,36}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan1(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=TSupRad,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-80,54})));
  Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Medium,
    dp_nominal=0,
    m_flow_nominal=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-60,64},{-40,84}})));
  Modelica.Blocks.Sources.Constant const(k=TGround)
    annotation (Placement(transformation(extent={{-24,88},{-32,96}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=m_flow_nominal_hpww)
    annotation (Placement(transformation(extent={{-20,-30},{-40,-10}})));
  IDEAS.Fluid.Sources.FixedBoundary bou1(
    use_T=false,
    redeclare package Medium = Medium,
    nPorts=1)                                       annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-90,68})));
  Modelica.Blocks.Sources.Constant const1(k=TSupRad)
    annotation (Placement(transformation(extent={{70,76},{62,84}})));
  Modelica.Blocks.Math.Gain gain(k=3.4) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-90,40})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBeoi(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-34,68},{-22,80}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBeoo(redeclare package Medium =
        Medium, m_flow_nominal=sum(m_flow_nominal))
    annotation (Placement(transformation(extent={{-78,68},{-66,80}})));
equation

  PeakPow = boiler.PFuelOrEl;
  BasePow = hpww.PFuelOrEl*2.5;
  connect(tan.portHex_b,fan. port_a) annotation (Line(points={{-10,16},{-14,16},
          {-14,-60},{-42,-60}}, color={0,127,255}));
  connect(bou.ports[1],fan. port_a) annotation (Line(points={{-32,-54},{-32,-60},
          {-42,-60}}, color={0,127,255}));
  connect(fan.port_b, TBasei.port_a) annotation (Line(points={{-54,-60},{-80,-60},
          {-80,20},{-78,20}}, color={0,127,255}));
  connect(TBaseo.port_b, tan.portHex_a) annotation (Line(points={{-22,20},{-10,20},
          {-10,20.2}}, color={0,127,255}));
  connect(boiler.port_b, TPeako.port_a)
    annotation (Line(points={{58,60},{66,60}}, color={0,127,255}));
  connect(tan.port_a, TPeaki.port_a) annotation (Line(points={{-10,24},{-14,24},
          {-14,60},{6,60}}, color={0,127,255}));
  connect(TPeaki.port_b, boiler.port_a)
    annotation (Line(points={{18,60},{38,60}}, color={0,127,255}));
  connect(boiler.heatPort,TRoo. port)
    annotation (Line(points={{48,50},{48,50},{48,0},{80,0}}, color={191,0,0}));
  connect(tan.heaPorBot,tan. heaPorSid) annotation (Line(points={{2,16.6},{2,14},
          {5.6,14},{5.6,24}},   color={191,0,0}));
  connect(tan.heaPorTop,tan. heaPorSid) annotation (Line(points={{2,31.4},{2,34},
          {5.6,34},{5.6,24}},   color={191,0,0}));
  connect(TRoo.port,tan. heaPorSid) annotation (Line(points={{80,0},{48,0},{48,28},
          {5.6,28},{5.6,24}},   color={191,0,0}));
  connect(TPeako.port_b, port_b)
    annotation (Line(points={{78,60},{89,60},{100,60}}, color={0,127,255}));
  connect(tan.port_b, port_a) annotation (Line(points={{10,24},{26,24},{26,-60},
          {100,-60}}, color={0,127,255}));
  connect(const.y, hea.TSet) annotation (Line(points={{-32.4,92},{-32.4,92},{-66,
          92},{-66,80},{-62,80}},
                color={0,0,127}));
  connect(realExpression2.y, fan.m_flow_in) annotation (Line(points={{-41,-20},{
          -47.88,-20},{-47.88,-52.8}},  color={0,0,127}));
  connect(const1.y, boiler.u)
    annotation (Line(points={{61.6,80},{50,80},{50,70.8}}, color={0,0,127}));
  connect(hpww.u, boiler.u) annotation (Line(points={{-52,36.8},{-52,46},{30,46},
          {30,80},{50,80},{50,70.8}}, color={0,0,127}));
  connect(hpww.port_b2, TBaseo.port_a)
    annotation (Line(points={{-40,20},{-37,20},{-34,20}}, color={0,127,255}));
  connect(TBasei.port_b, hpww.port_a2)
    annotation (Line(points={{-66,20},{-63,20},{-60,20}}, color={0,127,255}));
  connect(fan1.port_a, hpww.port_b1)
    annotation (Line(points={{-80,48},{-80,32},{-60,32}}, color={0,127,255}));
  connect(bou1.ports[1], fan1.port_b)
    annotation (Line(points={{-86,68},{-80,68},{-80,60}}, color={0,127,255}));
  connect(gain.y, fan1.m_flow_in) annotation (Line(points={{-90,46.6},{-90,53.88},
          {-87.2,53.88}}, color={0,0,127}));
  connect(gain.u, fan.m_flow_in) annotation (Line(points={{-90,32.8},{-90,-20},{
          -47.88,-20},{-47.88,-52.8}}, color={0,0,127}));
  connect(hpww.heatPort, TRoo.port)
    annotation (Line(points={{-50,16},{-50,0},{80,0}}, color={191,0,0}));
  connect(hea.port_b, TBeoi.port_a)
    annotation (Line(points={{-40,74},{-34,74}}, color={0,127,255}));
  connect(TBeoi.port_b, hpww.port_a1) annotation (Line(points={{-22,74},{-20,74},
          {-20,32},{-40,32}}, color={0,127,255}));
  connect(hea.port_a, TBeoo.port_b)
    annotation (Line(points={{-60,74},{-66,74}}, color={0,127,255}));
  connect(TBeoo.port_a, fan1.port_b)
    annotation (Line(points={{-78,74},{-80,74},{-80,60}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Line(points={{74,26},{38,-22}}, color={255,0,0}),
        Ellipse(extent={{-82,10},{-66,-6}}, lineColor={255,0,0}),
        Ellipse(extent={{-64,10},{-48,-6}}, lineColor={255,0,0}),
        Ellipse(extent={{-46,10},{-30,-6}}, lineColor={255,0,0})}));
end GasBeo;
