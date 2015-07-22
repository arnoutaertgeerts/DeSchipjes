within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystem
  //Extensions
  extends BaseClasses.PartialStorage(
    modulating=false,
    TSupply=273.15+55,
    TReturn=273.15+35);

  //Parameters
  parameter Modelica.SIunits.Temperature THPmin=273.15+20
    "Minimal temperature on the evaporator side to use the HP";

  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr(y=TStorage + 5)
    annotation (Placement(transformation(extent={{-78,38},{-58,58}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{84,74},{72,86}})));
  IDEAS.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={54,34})));
  IDEAS.Fluid.Production.HeatPumpWaterWater hpww(
    use_onOffSignal=false,
    modulationInput=false,
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    QNom=1000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,50})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumpDHWHex(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=sum(m_flow_nominal),
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{24,50},{36,62}})));
  Buildings.Fluid.FixedResistances.Pipe inletHex(
    nSeg=1,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
                            annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={70,56})));
  Buildings.Fluid.FixedResistances.Pipe outletHex(
    nSeg=1,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    dp_nominal=0,
    linearizeFlowResistance=true,
    thicknessIns=0.01,
    lambdaIns=0.026,
    diameter=0.02,
    length=10,
    allowFlowReversal=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
                            annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={70,44})));
  IDEAS.Controls.Discrete.HysteresisRelease_boolean onOffDHW(
    use_input=false,
    uLow_val=TStorage,
    uHigh_val=TStorage + 5,
    revert=true,
    enableRelease=false)
                 annotation (Placement(transformation(extent={{64,74},{52,86}})));
  Modelica.Blocks.Math.Gain mDHW(k=0.04)
    annotation (Placement(transformation(extent={{44,76},{36,84}})));
  Modelica.Blocks.Sources.Constant const(k=TSupply)
    annotation (Placement(transformation(extent={{8,-10},{28,10}})));
equation
  connect(tan.heaPorVol[4], temperatureSensor.port) annotation (Line(
      points={{110,52.45},{110,56},{110,56},{110,80},{84,80}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(pumpDHW.port_b, hpww.port_a1) annotation (Line(points={{-24,56},{-10,
          56},{-10,60},{-6,60}}, color={0,127,255}));
  connect(hpww.port_b2, pumpDHWHex.port_a) annotation (Line(points={{6,60},{10,
          60},{10,56},{24,56}}, color={0,127,255}));
  connect(pumpDHWHex.port_b, inletHex.port_a)
    annotation (Line(points={{36,56},{50,56},{64,56}}, color={0,127,255}));
  connect(outletHex.port_b, hpww.port_a2) annotation (Line(points={{64,44},{10,
          44},{10,40},{6,40}}, color={0,127,255}));
  connect(inletHex.port_b, tan.portHex_a) annotation (Line(points={{76,56},{92,
          56},{92,48.2},{100,48.2}}, color={0,127,255}));
  connect(outletHex.port_a, tan.portHex_b)
    annotation (Line(points={{76,44},{100,44},{100,44}}, color={0,127,255}));
  connect(THotWaterSetExpr.y, hpww.u)
    annotation (Line(points={{-57,48},{-10.8,48}}, color={0,0,127}));
  connect(onOffDHW.y,mDHW. u)
    annotation (Line(points={{51.4,80},{51.4,80},{44.8,80}},
                                                 color={0,0,127}));
  connect(temperatureSensor.T,onOffDHW. u)
    annotation (Line(points={{72,80},{72,80},{65.2,80}},
                                                       color={0,0,127}));
  connect(mDHW.y, pumpDHWHex.m_flow_in) annotation (Line(points={{35.6,80},{
          29.88,80},{29.88,63.2}}, color={0,0,127}));
  connect(mDHW.y, pumpDHW.m_flow_in) annotation (Line(points={{35.6,80},{-30.12,
          80},{-30.12,63.2}}, color={0,0,127}));
  connect(radPID.y, pumpRad.m_flow_in) annotation (Line(points={{-109,40},{
          -99.88,40},{-99.88,-24.8}}, color={0,0,127}));
  connect(bou2.ports[1], hpww.port_a2) annotation (Line(points={{54,38},{54,44},
          {10,44},{10,40},{6,40}}, color={0,127,255}));
  connect(const.y, supplyPID.u_s)
    annotation (Line(points={{29,0},{38.8,0}}, color={0,0,127}));
  connect(hpww.port_b1, TRet.port_a) annotation (Line(points={{-6,40},{-10,40},
          {-10,42},{-32,42},{-32,-44},{-14,-44}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end LTHeatingSystem;
