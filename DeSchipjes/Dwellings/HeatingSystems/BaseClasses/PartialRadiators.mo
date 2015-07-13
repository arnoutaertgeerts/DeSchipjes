within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialRadiators
  //Extensions
  extends HeatingSystem(
    nLoads=0,
    isDH=true,
    nEmbPorts=0,
    TSet);

  parameter Modelica.SIunits.Temperature TSupply=273.15+70
    "Radiator supply temperature";
  parameter Modelica.SIunits.Temperature TReturn=273.15+60
    "Radiator return temeprature";
  parameter Modelica.SIunits.Temperature TStorage=273.15+60
    "DHW storage temperature";

  parameter Modelica.SIunits.MassFlowRate m_flow_dhw=0.03
    "Nominal mass flow rate of DHW";

  parameter Real KVs[nZones] = ones(nZones)*10
    "Values for the balancing valves";
  parameter Real KV = 1 "Kv value of the main valve";

  final parameter Modelica.SIunits.MassFlowRate[nZones] m_flow_nominal = QNom/(4180.6*(TSupply-TReturn))
    "Nominal mass flow rates";

  final parameter Modelica.SIunits.Pressure dp_nominal=0
    "Nominal pressure drop of the DH grid in the dwelling";

  //Variables
  Modelica.SIunits.Energy SpaceQ;
  Modelica.SIunits.Energy dhwQ;

  //Components
  IDEAS.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad[nZones](
    redeclare package Medium = Medium,
    Q_flow_nominal=QNom,
    T_a_nominal=TSupply,
    T_b_nominal=TReturn,
    nEle=1,
    T_start=TSupply,
    allowFlowReversal=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(extent={{-124,-42},{-144,-22}})));

  DHWTap dHWTap(redeclare package Medium = Medium, m_flow_nominal=m_flow_dhw,
    TDHWSet=273.15 + 40)
    annotation (Placement(transformation(extent={{172,32},{146,46}})));

  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpDHW(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_dhw,
    measurePower=false,
    dynamicBalance=false,
    includePipes=false,
    filteredSpeed=true,
    riseTime=180,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-24,50})));

  Modelica.Blocks.Math.Gain gain(k=(TStorage - 273.15 - 20)/40)
                                                       annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,-76})));

protected
  IDEAS.Fluid.BaseCircuits.ParallelPipesSplitter parallelPipesSplitter(n=nZones,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    V=0.025,
    T_start=TSupply,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)
    annotation (Placement(transformation(extent={{-60,-48},{-80,-28}})));

  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpRadiators[nZones](
    KvReturn=5,
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    includePipes=false,
    measurePower=false,
    dp=200,
    each dynamicBalance=false,
    tauTSensor=0,
    T_start=TSupply,
    allowFlowReversal=true,
    each riseTime=180,
    each filteredSpeed=true,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)
    annotation (Placement(transformation(extent={{-90,-48},{-110,-28}})));

  ToKelvin toKelvin[nZones]
    annotation (Placement(transformation(extent={{-60,-78},{-80,-58}})));

  IDEAS.Fluid.Sources.FixedBoundary bou1(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={140,28})));
public
  Buildings.Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal=sum(m_flow_nominal),
    m2_flow_nominal=sum(m_flow_nominal),
    dp1_nominal=20,
    dp2_nominal=20) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-38})));
  IDEAS.Fluid.BaseCircuits.Measurements measurementsHouse(redeclare package
      Medium = Medium, m_flow_nominal=sum(m_flow_nominal),
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)
    annotation (Placement(transformation(extent={{30,-48},{10,-28}})));
protected
  IDEAS.Fluid.Sources.FixedBoundary bouHouse(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=90,
        origin={-14,-22})));
public
  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpHex(
    KvReturn=1,
    redeclare package Medium = Medium,
    measureSupplyT=true,
    measureReturnT=true,
    m_flow_nominal=sum(m_flow_nominal),
    measurePower=false,
    filteredSpeed=true,
    riseTime=180,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)
    annotation (Placement(transformation(extent={{116,-48},{96,-28}})));

  Annex60.Controls.Continuous.LimPID supplyPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.5,
    yMax=sum(m_flow_nominal),
    yMin=abs(10E-4*sum(m_flow_nominal)),
    Ti=500)
    annotation (Placement(transformation(extent={{50,0},{70,20}})));
  Annex60.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{64,-38},{52,-26}})));
  IDEAS.Controls.Continuous.LimPID conPID[nZones](
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMax=m_flow_nominal,
    k=0.5,
    Ti=500)
    annotation (Placement(transformation(extent={{-130,30},{-110,50}})));
initial equation

equation
  QHeaSys = -sum(rad.heatPortCon.Q_flow) - sum(rad.heatPortRad.Q_flow);
  der(SpaceQ) = QHeaSys;
  dhwQ = 0;

  P[1] = 0;
  Q[1] = 0;

  for i in 1:nZones loop
      connect(TSet[1], toKelvin[i].Celsius) annotation (Line(
      points={{20,-104},{20,-68},{-58,-68},{-58,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  end for;

  connect(pumpDHW.port_a1, parallelPipesSplitter.port_a) annotation (Line(
      points={{-34,56},{-54,56},{-54,-32},{-60,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(mDHW60C, gain.u) annotation (Line(
      points={{80,-104},{80,-80.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(gain.y, dHWTap.mDHW60C) annotation (Line(
      points={{80,-71.6},{80,-62},{132,-62},{132,52},{159,52},{159,46}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(dHWTap.port_cold, bou1.ports[1]) annotation (Line(
      points={{146,36},{140,36},{140,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(measurementsHouse.port_b1, parallelPipesSplitter.port_a) annotation (
      Line(
      points={{10,-32},{-60,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(measurementsHouse.port_a2, parallelPipesSplitter.port_b) annotation (
      Line(
      points={{10,-44},{-60,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpDHW.port_b2, parallelPipesSplitter.port_b) annotation (Line(
      points={{-34,44},{-40,44},{-40,-44},{-60,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpHex.port_b2, flowPort_return) annotation (Line(
      points={{116,-44},{120,-44},{120,-100}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpHex.port_a1, flowPort_supply) annotation (Line(
      points={{116,-32},{160,-32},{160,-100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bouHouse.ports[1], parallelPipesSplitter.port_a) annotation (Line(
      points={{-14,-26},{-14,-32},{-60,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(measurementsHouse.port_b2, hex.port_a2) annotation (Line(
      points={{30,-44},{70,-44},{70,-48},{74,-48}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(hex.port_b1, pumpHex.port_a2) annotation (Line(
      points={{86,-48},{90,-48},{90,-44},{96,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(hex.port_a1, pumpHex.port_b1) annotation (Line(
      points={{86,-28},{90,-28},{90,-32},{96,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(measurementsHouse.port_a1, senMasFlo.port_b) annotation (Line(
      points={{30,-32},{52,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senMasFlo.port_a, hex.port_b2) annotation (Line(
      points={{64,-32},{70,-32},{70,-28},{74,-28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(measurementsHouse.Tsup, supplyPID.u_m) annotation (Line(
      points={{12.4,-27.6},{12.4,-14},{60,-14},{60,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(supplyPID.y, pumpHex.u) annotation (Line(
      points={{71,10},{106,10},{106,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(parallelPipesSplitter.port_bN, pumpRadiators.port_a1) annotation (
      Line(
      points={{-80,-32},{-90,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipesSplitter.port_aN, pumpRadiators.port_b2) annotation (
      Line(
      points={{-80,-44},{-90,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpRadiators.port_b1, rad.port_a) annotation (Line(
      points={{-110,-32},{-124,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpRadiators.port_a2, rad.port_b) annotation (Line(
      points={{-110,-44},{-148,-44},{-148,-32},{-144,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(rad.heatPortCon, heatPortCon) annotation (Line(
      points={{-132,-24.8},{-132,20},{-200,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatPortRad, rad.heatPortRad) annotation (Line(
      points={{-200,-20},{-136,-20},{-136,-24.8}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(TSensor, conPID.u_m) annotation (Line(
      points={{-204,-60},{-120,-60},{-120,28}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(toKelvin.Kelvin, conPID.u_s) annotation (Line(
      points={{-81,-68},{-160,-68},{-160,40},{-132,40}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialRadiators;
