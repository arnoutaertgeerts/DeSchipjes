within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystem
  //Extensions
  extends BaseClasses.PartialStorage(
    modulation=false,
    tan(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_dhw,
      redeclare package MediumHex = Medium,
      computeFlowResistance=false),
    conPID(k=0.1),
    pumpRadiators(addPowerToMedium=false),
    bou1(nPorts=2));

  //Parameters
  parameter Modelica.SIunits.Temperature THPmin=273.15+20
    "Minimal temperature on the evaporator side to use the HP";

  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpSupply_m_flowdhw1(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_dhw,
    measurePower=false,
    T_start=TSupply,
    measureSupplyT=true,
    measureReturnT=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={36,50})));
  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    realTrue=0,
    uLow=TStorage - 5,
    uHigh=TStorage,
    realFalse=m_flow_dhw)
    annotation (Placement(transformation(extent={{64,66},{44,86}})));
  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr(y=TStorage + 2)
    annotation (Placement(transformation(extent={{-34,14},{-14,34}})));
  IDEAS.Fluid.Production.NewHeatPumpWaterWater newHeatPumpWaterWater(
    onOff=true,
    modulationInput=false,
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal=m_flow_dhw,
    redeclare package Medium = Medium,
    m2_flow_nominal=m_flow_dhw,
    dp1_nominal=0,
    dp2_nominal=0,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T1_start=TSupply,
    T2_start=TSupply,
    use_onOffSignal=true,
    QNom=500)                                               annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={8,50})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{84,70},{72,82}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={54,34})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=heatExchanger.Tsup
         > THPmin)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  DistrictHeating.HeatingSystems.Control.PI
             pI(TSet=TSupply - 5,
    release=true,
    threshold=0.001,
    PID(
      controllerType=Modelica.Blocks.Types.SimpleController.PI,
      yMax=1,
      yMin=0,
      Ti=180,
      k=0.05))                    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={70,10})));
equation
  connect(hysteresis1.y, pumpDHW.u) annotation (Line(
      points={{43.2,76},{-24,76},{-24,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(hysteresis1.y, pumpSupply_m_flowdhw1.u) annotation (Line(
      points={{43.2,76},{36,76},{36,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, newHeatPumpWaterWater.port_a1) annotation (Line(
      points={{-14,56},{-10,56},{-10,60},{2,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, newHeatPumpWaterWater.port_b1) annotation (Line(
      points={{-14,44},{-10,44},{-10,40},{2,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_b2, pumpSupply_m_flowdhw1.port_a1)
    annotation (Line(
      points={{14,60},{20,60},{20,56},{26,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_a2, pumpSupply_m_flowdhw1.port_b2)
    annotation (Line(
      points={{14,40},{20,40},{20,44},{26,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperatureSensor.T, hysteresis1.u) annotation (Line(
      points={{72,76},{65.2,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperatureSensor.port, tan.heaPorVol[3]) annotation (Line(
      points={{84,76},{98,76},{98,56.15},{98,56.15}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(THotWaterSetExpr.y, newHeatPumpWaterWater.u) annotation (Line(
      points={{-13,24},{-8,24},{-8,48},{-2.8,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanExpression.y, newHeatPumpWaterWater.on) annotation (Line(
      points={{-39,70},{-8,70},{-8,52},{-2.8,52}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.heatPort, tan.heaPorSid) annotation (Line(
      points={{18,50},{22,50},{22,90},{103.6,90},{103.6,56}},
      smooth=Smooth.None,
      color={255,170,170}));
  connect(conPID.y, pumpRadiators.u) annotation (Line(
      points={{-109,40},{-100,40},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fixedTemperature.port, tan.heaPorSid) annotation (Line(
      points={{120,96},{103.6,96},{103.6,56}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(toKelvin.Kelvin, conPID.u_s) annotation (Line(
      points={{-81,-68},{-164,-68},{-164,40},{-132,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSensor, conPID.u_m) annotation (Line(
      points={{-204,-60},{-120,-60},{-120,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(slewRateLimiter.u, pI.y) annotation (Line(
      points={{93.2,10},{80.6,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatExchanger.Tsup, pI.senT2) annotation (Line(
      points={{40.4,-27.6},{40.4,18},{59.6,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatExchanger.massFlow2, pI.senMassFlow2) annotation (Line(
      points={{43.2,-27.4},{43.2,14},{59.6,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatExchanger.senT1, pI.T1) annotation (Line(
      points={{53.4,-27.4},{53.4,6},{59.6,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatExchanger.massFlow1, pI.senMassFlow1) annotation (Line(
      points={{56,-27.2},{56,2},{59.6,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_b1, tan.port_a) annotation (Line(
      points={{46,56},{88,56},{88,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_a2, tan.port_b) annotation (Line(
      points={{46,44},{112,44},{112,56},{108,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou2.ports[1], tan.port_b) annotation (Line(
      points={{54,38},{54,44},{112,44},{112,56},{108,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.portHex_a, dHWTap.port_hot) annotation (Line(
      points={{88,52.2},{84,52.2},{84,68},{180,68},{180,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.portHex_b, bou1.ports[2]) annotation (Line(
      points={{88,48},{84,48},{84,36},{138,36},{138,32}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}),      graphics));
end LTHeatingSystem;
