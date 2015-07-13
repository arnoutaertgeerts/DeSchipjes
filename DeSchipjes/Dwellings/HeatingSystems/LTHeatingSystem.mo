within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystem
  //Extensions
  extends BaseClasses.PartialStorage(
    modulating=false,
    tan(
      redeclare package Medium = Medium,
      redeclare package MediumHex = Medium,
      computeFlowResistance=false),
    conPID(k=0.1),
    pumpRadiators(addPowerToMedium=false),
    TSupply=273.15+55,
    TReturn=273.15+35);

  //Parameters
  parameter Modelica.SIunits.Temperature THPmin=273.15+20
    "Minimal temperature on the evaporator side to use the HP";

  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpSupply_m_flowdhw1(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_dhw,
    measurePower=false,
    measureSupplyT=true,
    measureReturnT=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={36,50})));
  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr(y=TStorage + 2)
    annotation (Placement(transformation(extent={{-52,64},{-32,84}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{84,74},{72,86}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={54,34})));
  IDEAS.Fluid.Production.HP_WaterWater_TSet heatPumpWaterWater(
    use_onOffSignal=false,
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    redeclare
      IDEAS.Fluid.Production.Data.PerformanceMaps.HeatPumps.VitoCal300GBWS301dotA08
      heatPumpData,
    T_max=273.15 + 85) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={4,50})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow=TStorage + 5, uHigh=
        TStorage - 5)
            annotation (Placement(transformation(extent={{66,74},{54,86}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=0, realFalse=tan.mHex_flow_nominal)
    annotation (Placement(transformation(extent={{48,76},{40,84}})));
  Modelica.Blocks.Sources.Constant const(k=TSupply)
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
equation
  connect(TSensor, conPID.u_m) annotation (Line(
      points={{-204,-60},{-120,-60},{-120,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.y, pumpRadiators.u) annotation (Line(
      points={{-109,40},{-100,40},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_b1, tan.portHex_a) annotation (Line(
      points={{46,56},{88,56},{88,52},{92,52},{92,52.2},{96,52.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_a2, tan.portHex_b) annotation (Line(
      points={{46,44},{96,44},{96,48}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(bou2.ports[1], tan.portHex_b) annotation (Line(
      points={{54,38},{54,44},{96,44},{96,48}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpDHW.port_b1, heatPumpWaterWater.port_a1) annotation (Line(
      points={{-14,56},{-10,56},{-10,68},{-2,68},{-2,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, heatPumpWaterWater.port_b1) annotation (Line(
      points={{-14,44},{-10,44},{-10,34},{-2,34},{-2,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(heatPumpWaterWater.port_b2, pumpSupply_m_flowdhw1.port_a1)
    annotation (Line(
      points={{10,60},{10,68},{18,68},{18,56},{26,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(heatPumpWaterWater.port_a2, pumpSupply_m_flowdhw1.port_b2)
    annotation (Line(
      points={{10,40},{10,34},{20,34},{20,44},{26,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temperatureSensor.port, fixedTemperature.port) annotation (Line(
      points={{84,80},{106,80},{106,96},{120,96}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(hysteresis.u, temperatureSensor.T) annotation (Line(
      points={{67.2,80},{72,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis.y, booleanToReal.u) annotation (Line(
      points={{53.4,80},{48.8,80}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.u, booleanToReal.y) annotation (Line(
      points={{36,60.8},{36,80},{39.6,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpDHW.u, booleanToReal.y) annotation (Line(
      points={{-24,60.8},{-24,80},{39.6,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(THotWaterSetExpr.y, heatPumpWaterWater.TSet) annotation (Line(
      points={{-31,74},{-12,74},{-12,55},{-6,55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(supplyPID.u_s, const.y) annotation (Line(
      points={{48,10},{41,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}),      graphics));
end LTHeatingSystem;
