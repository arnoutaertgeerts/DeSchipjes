within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystemIDEAS
  //Extensions
  extends BaseClasses.PartialStorageIDEAS(
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
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={54,34})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=
        measurementsHouse.Tsup > THPmin)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
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
  connect(THotWaterSetExpr.y, newHeatPumpWaterWater.u) annotation (Line(
      points={{-13,24},{-8,24},{-8,48},{-2.8,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanExpression.y, newHeatPumpWaterWater.on) annotation (Line(
      points={{-39,70},{-8,70},{-8,52},{-2.8,52}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(TSensor, conPID.u_m) annotation (Line(
      points={{-204,-60},{-120,-60},{-120,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.y, pumpRadiators.u) annotation (Line(
      points={{-109,40},{-100,40},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.heatPort, fixedTemperature.port) annotation (
      Line(
      points={{18,50},{24,50},{24,96},{120,96}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(tan.heatExchEnv, fixedTemperature.port) annotation (Line(
      points={{95,55.8},{100,55.8},{100,96},{120,96}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(hysteresis1.u, tan.T[4]) annotation (Line(
      points={{65.2,76},{106,76},{106,58.75},{98.4,58.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_b1, tan.port_a) annotation (Line(
      points={{46,56},{76,56},{76,72},{98.2,72},{98.2,66.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_a2, tan.port_b) annotation (Line(
      points={{46,44},{79.8,44},{79.8,48.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.portHXUpper, bou1.ports[2]) annotation (Line(
      points={{80,54},{76,54},{76,36},{140,36},{140,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.portHXLower, dHWTap.port_hot) annotation (Line(
      points={{98.4,54},{178,54},{178,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou2.ports[1], tan.port_b) annotation (Line(
      points={{54,38},{54,44},{79.8,44},{79.8,48.2}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}),      graphics));
end LTHeatingSystemIDEAS;
