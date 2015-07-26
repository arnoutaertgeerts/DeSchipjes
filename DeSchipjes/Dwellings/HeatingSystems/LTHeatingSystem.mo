within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystem
  //Extensions
  extends BaseClasses.PartialStorage(
    modulating=false,
    TSupply=273.15+50,
    TReturn=273.15+40,
    radPID(strict=false));

  //Parameters
  parameter Modelica.SIunits.Temperature THPmin=273.15+20
    "Minimal temperature on the evaporator side to use the HP";

  Modelica.Blocks.Sources.RealExpression THotWaterSetExpr(y=TStorage + 5)
    annotation (Placement(transformation(extent={{-24,10},{-4,30}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{100,74},{88,86}})));
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
    QNom=1000,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
               annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={24,50})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumpDHWHex(
    redeclare package Medium = Medium,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    dynamicBalance=false,
    allowFlowReversal=true,
    m_flow_nominal=0.167)
    annotation (Placement(transformation(extent={{40,52},{52,64}})));
  Buildings.Fluid.FixedResistances.Pipe inletSto(
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
        origin={70,58})));
  Buildings.Fluid.FixedResistances.Pipe outletSto(
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
    revert=true,
    enableRelease=false,
    uLow_val=273.15 + 38,
    uHigh_val=TStorage)
                 annotation (Placement(transformation(extent={{80,74},{68,86}})));
  Modelica.Blocks.Math.Gain mDHW(k=0.167)
    annotation (Placement(transformation(extent={{60,76},{52,84}})));
  Modelica.Blocks.Sources.Constant const(k=TSupply)
    annotation (Placement(transformation(extent={{8,-10},{28,10}})));
equation
  DhwPow = hpww.PFuelOrEl;

  connect(tan.heaPorVol[4], temperatureSensor.port) annotation (Line(
      points={{110,52.45},{110,80},{100,80}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(hpww.port_b2, pumpDHWHex.port_a) annotation (Line(points={{30,60},{34,
          60},{34,58},{40,58}},
                            color={0,127,255}));
  connect(pumpDHWHex.port_b,inletSto. port_a)
    annotation (Line(points={{52,58},{52,58},{64,58}}, color={0,127,255}));
  connect(outletSto.port_b, hpww.port_a2) annotation (Line(
      points={{64,44},{34,44},{34,40},{30,40}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(inletSto.port_b, tan.portHex_a) annotation (Line(points={{76,58},{92,
          58},{92,48.2},{100,48.2}}, color={0,127,255}));
  connect(outletSto.port_a, tan.portHex_b)
    annotation (Line(points={{76,44},{100,44}},          color={0,127,255},
      pattern=LinePattern.Dash));
  connect(onOffDHW.y,mDHW. u)
    annotation (Line(points={{67.4,80},{67.4,80},{60.8,80}},
                                                 color={175,175,175}));
  connect(temperatureSensor.T,onOffDHW. u)
    annotation (Line(points={{88,80},{88,80},{81.2,80}},
                                                       color={175,175,175}));
  connect(mDHW.y, pumpDHWHex.m_flow_in) annotation (Line(points={{51.6,80},{
          45.88,80},{45.88,65.2}},
                             color={175,175,175}));
  connect(mDHW.y, pumpDHW.m_flow_in) annotation (Line(points={{51.6,80},{-30.12,
          80},{-30.12,63.2}}, color={175,175,175}));
  connect(radPID.y, pumpRad.m_flow_in) annotation (Line(points={{-109,40},{-99.88,
          40},{-99.88,-24.8}}, color={175,175,175}));
  connect(bou2.ports[1], hpww.port_a2) annotation (Line(
      points={{54,38},{54,44},{34,44},{34,40},{30,40}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(const.y, supplyPID.u_s)
    annotation (Line(points={{29,0},{38.8,0}}, color={0,0,127}));
  connect(THotWaterSetExpr.y, hpww.u) annotation (Line(points={{-3,20},{6,20},{
          6,48},{13.2,48}}, color={0,0,127}));
  connect(pumpDHW.port_b, hpww.port_a1) annotation (Line(points={{-24,56},{14,
          56},{14,60},{18,60}}, color={0,127,255}));
  connect(hpww.port_b1, TRet.port_a) annotation (Line(points={{18,40},{14,40},{
          14,42},{-32,42},{-32,-44},{-14,-44}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end LTHeatingSystem;
