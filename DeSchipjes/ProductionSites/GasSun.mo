within DeSchipjes.ProductionSites;
model GasSun
  //Extensions
  extends Interfaces.BaseClasses.ProductionSite(
    TSupRad=273.15+80,
    modulating=false);

  //Parameters
  parameter Modelica.SIunits.Area A=20*scaler "Area of the solar collectors";
  parameter Modelica.SIunits.Power Qboiler=215400*scaler
    "Nominal power of the boiler";

  parameter Modelica.SIunits.Volume VTan=0.950*scaler
    "Volume of the storage tank";
  parameter Modelica.SIunits.Height hTan=1 "Height of the storage tank";
  parameter Modelica.SIunits.Length dIns=0.04 "Insulation thickness";

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal_solar=0.161*scaler
    "Nominal massflow rate of the solar collector";

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
    m_flow_nominal=m_flow_nominal_solar)
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
    redeclare package MediumHex = Medium,
    T_start=TSupRad,
    hHex_a=0.95,
    Q_flow_nominal=tan.mHex_flow_nominal*4200*40,
    THex_nominal=TSupRad + 5,
    mHex_flow_nominal=m_flow_nominal_solar,
    TTan_nominal=273.15 + 63)
    annotation (Placement(transformation(extent={{-2,14},{18,34}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    nPorts=1,
    redeclare package Medium = Medium)              annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-32,-50})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBasei(redeclare package Medium =
        Medium, m_flow_nominal=m_flow_nominal_solar)
    annotation (Placement(transformation(extent={{-78,26},{-66,14}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TBaseo(redeclare package Medium =
        Medium, m_flow_nominal=m_flow_nominal_solar)
    annotation (Placement(transformation(extent={{-34,14},{-22,26}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort TPeako(redeclare package Medium =
        Medium,
    m_flow_nominal=m_flow_nominal,
    tau=0)
    annotation (Placement(transformation(extent={{66,54},{78,66}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort
                                         TPeaki(redeclare package Medium =
        Medium,
    m_flow_nominal=m_flow_nominal,
    tau=0)
    annotation (Placement(transformation(extent={{6,54},{18,66}})));
  Buildings.HeatTransfer.Sources.FixedTemperature TRoo(T=273.15 + 18)
    annotation (Placement(transformation(extent={{100,-10},{80,10}})));
  inner IDEAS.SimInfoManager sim(filDir=Modelica.Utilities.Files.loadResource("modelica://IDEAS")
         + "/Inputs/")
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
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
            annotation (Placement(transformation(extent={{-60,10},{-40,30}})));

  IDEAS.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam="modelica://Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Buildings.Fluid.SolarCollectors.Controls.SolarPumpController pumCon(per=solar.per)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Math.Gain gain(k=m_flow_nominal_solar)
    "Flow rate of the system in kg/s"
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-28,-10})));
  Modelica.Blocks.Sources.Constant const1(k=TSupRad)
    annotation (Placement(transformation(extent={{68,76},{60,84}})));
equation

  PeakPow = boiler.PFuelOrEl;
  BasePow = 0;

  connect(tan.portHex_b,fan. port_a) annotation (Line(points={{-2,16},{-14,16},{
          -14,-60},{-40,-60}},  color={0,127,255}));
  connect(bou.ports[1],fan. port_a) annotation (Line(points={{-32,-54},{-32,-60},
          {-40,-60}}, color={0,127,255}));
  connect(fan.port_b, TBasei.port_a) annotation (Line(points={{-60,-60},{-80,-60},
          {-80,20},{-78,20}}, color={0,127,255}));
  connect(TBaseo.port_b, tan.portHex_a)
    annotation (Line(points={{-22,20},{-2,20},{-2,20.2}}, color={0,127,255}));
  connect(boiler.port_b, TPeako.port_a)
    annotation (Line(points={{58,60},{66,60}}, color={0,127,255}));
  connect(tan.port_a, TPeaki.port_a) annotation (Line(points={{-2,24},{-12,24},{
          -12,60},{6,60}}, color={0,127,255}));
  connect(TPeaki.port_b, boiler.port_a)
    annotation (Line(points={{18,60},{38,60}}, color={0,127,255}));
  connect(boiler.heatPort, TRoo.port)
    annotation (Line(points={{48,50},{48,50},{48,0},{80,0}}, color={191,0,0}));
  connect(tan.heaPorBot, tan.heaPorSid) annotation (Line(points={{10,16.6},{10,14},
          {13.6,14},{13.6,24}}, color={191,0,0}));
  connect(tan.heaPorTop, tan.heaPorSid) annotation (Line(points={{10,31.4},{10,34},
          {13.6,34},{13.6,24}}, color={191,0,0}));
  connect(TRoo.port, tan.heaPorSid) annotation (Line(points={{80,0},{48,0},{48,28},
          {13.6,28},{13.6,24}}, color={191,0,0}));
  connect(tan.port_b, port_a) annotation (Line(points={{18,24},{28,24},{28,-60},
          {100,-60}}, color={0,127,255}));
  connect(solar.port_b, TBaseo.port_a)
    annotation (Line(points={{-40,20},{-37,20},{-34,20}}, color={0,127,255}));
  connect(solar.port_a, TBasei.port_b)
    annotation (Line(points={{-60,20},{-63,20},{-66,20}}, color={0,127,255}));
  connect(weaDat.weaBus, solar.weaBus) annotation (Line(
      points={{-60,90},{-40,90},{-40,40},{-60,40},{-60,29.6}},
      color={255,204,51},
      thickness=0.5));
  connect(pumCon.weaBus, solar.weaBus) annotation (Line(
      points={{-60.2,-4},{-88,-4},{-88,40},{-60,40},{-60,29.6}},
      color={255,204,51},
      thickness=0.5));
  connect(TBasei.T, pumCon.TIn) annotation (Line(points={{-72,13.4},{-72,-14},{
          -62,-14}}, color={0,0,127}));
  connect(pumCon.y, gain.u)
    annotation (Line(points={{-38.2,-10},{-32.8,-10}}, color={0,0,127}));
  connect(gain.y, fan.m_flow_in) annotation (Line(points={{-23.6,-10},{-20,-10},
          {-20,-40},{-49.8,-40},{-49.8,-48}}, color={0,0,127}));
  connect(const1.y, boiler.u)
    annotation (Line(points={{59.6,80},{50,80},{50,70.8}}, color={0,0,127}));
  connect(TPeako.port_b, port_b)
    annotation (Line(points={{78,60},{100,60}},          color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Line(points={{74,26},{38,-22}}, color={255,0,0}), Ellipse(
          extent={{-86,32},{-26,-30}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,170})}));
end GasSun;
