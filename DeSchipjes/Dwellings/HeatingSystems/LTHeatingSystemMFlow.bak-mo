within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystemMFlow
  //Extensions
  extends BaseClasses.PartialStorageMFlow(
    tan(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_dhw,
      VTan=0.1,
      dIns=0.02,
      redeclare package MediumHex = Medium,
      hTan=0.5,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
      hHex_a=0.40), limiter(uMax=0.15));

  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpSupply_m_flowdhw1(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_dhw,
    measurePower=false,
    T_start=TSupply)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={36,50})));
  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    realTrue=0,
    realFalse=m_flow_dhw,
    uLow=TStorage - 5,
    uHigh=TStorage)
    annotation (Placement(transformation(extent={{64,76},{44,96}})));
  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr(y=TStorage + 2)
    annotation (Placement(transformation(extent={{-38,14},{-18,34}})));
  IDEAS.Fluid.Production.NewHeatPumpWaterWater newHeatPumpWaterWater(
    use_onOffSignal=false,
    onOff=true,
    modulationInput=false,
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal=m_flow_dhw,
    redeclare package Medium = Medium,
    QNom=1000,
    m2_flow_nominal=m_flow_dhw,
    dp1_nominal=0,
    dp2_nominal=0,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T1_start=TSupply,
    T2_start=TSupply)                                       annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={6,50})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{100,76},{80,96}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=270,
        origin={64,30})));
equation
  connect(hysteresis1.y, pumpDHW.u) annotation (Line(
      points={{43.2,86},{-24,86},{-24,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(hysteresis1.y, pumpSupply_m_flowdhw1.u) annotation (Line(
      points={{43.2,86},{36,86},{36,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, newHeatPumpWaterWater.port_a1) annotation (Line(
      points={{-14,56},{-10,56},{-10,60},{0,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, newHeatPumpWaterWater.port_b1) annotation (Line(
      points={{-14,44},{-10,44},{-10,40},{0,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_b2, pumpSupply_m_flowdhw1.port_a1)
    annotation (Line(
      points={{12,60},{20,60},{20,56},{26,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_a2, pumpSupply_m_flowdhw1.port_b2)
    annotation (Line(
      points={{12,40},{20,40},{20,44},{26,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_b1, tan.port_a) annotation (Line(
      points={{46,56},{108,56},{108,44},{102,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_a2, tan.port_b) annotation (Line(
      points={{46,44},{82,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperatureSensor.T, hysteresis1.u) annotation (Line(
      points={{80,86},{65.2,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperatureSensor.port, tan.heaPorVol[3]) annotation (Line(
      points={{100,86},{116,86},{116,48},{92,48},{92,44.15}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_a2, bou2.ports[1]) annotation (Line(
      points={{46,44},{64,44},{64,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(THotWaterSetExpr.y, newHeatPumpWaterWater.u) annotation (Line(
      points={{-17,24},{-12,24},{-12,48},{-4.8,48}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}),      graphics));
end LTHeatingSystemMFlow;
