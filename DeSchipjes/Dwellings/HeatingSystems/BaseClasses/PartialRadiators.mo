within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialRadiators
  //Extensions
  extends HeatingSystem(
    nLoads=0,
    isDH=true,
    nEmbPorts=0,
    TSet);

  //Parameters
  parameter Modelica.SIunits.Power[nZones] QNom=2000*ones(nZones)
    "Nominal heating power of each zone";

  parameter Modelica.SIunits.Temperature TSupply=273.15+70
    "Radiator supply temperature";
  parameter Modelica.SIunits.Temperature TReturn=273.15+60
    "Radiator return temeprature";
  parameter Modelica.SIunits.Temperature TBoiler=273.15+80
    "Radiator return temeprature";
  parameter Modelica.SIunits.Temperature TStorage=273.15+60
    "DHW temperature setpoint";

  parameter Modelica.SIunits.MassFlowRate m_flow_dhw=0.03
    "Nominal mass flow rate of DHW";

  parameter Real KVs[nZones] = ones(nZones)*10
    "Values for the balancing valves";
  parameter Real KV = 1 "Kv value of the main valve";

  final parameter Modelica.SIunits.MassFlowRate[nZones] m_flow_nominal = QNom/(4180.6*(TSupply-TReturn))
    "Nominal mass flow rates";

  final parameter Modelica.SIunits.Pressure dp_nominal=
    2* flowController.dp + heatExchanger.dp1_nominal
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
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    nEle=1,
    T_start=TSupply,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{-124,-42},{-144,-22}})));
  IDEAS.Fluid.BaseCircuits.HeatExchanger heatExchanger(
    m_flow_nominal=sum(m_flow_nominal),
    dp1_nominal=200,
    dp2_nominal=200,
    redeclare package Medium = Medium,
    measureReturnT=false,
    efficiency=0.9,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    dynamicBalance=true,
    tauTSensor=0,
    T_start=TSupply,
    includePipes=true,
    m=50,
    dp=0)                                          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={48,-38})));
  IDEAS.Fluid.BaseCircuits.FlowController flowController(
      redeclare package Medium = Medium,
    CvDataSupply=IDEAS.Fluid.Types.CvTypes.Kv,
    m_flow_nominal=sum(m_flow_nominal),
    dpValve_nominalSupply=0,
    KvReturn=5,
    measureSupplyT=false,
    measureReturnT=false,
    useBalancingValve=true,
    m=10,
    dp=200,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    flowRegulator(riseTime=180),
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    includePipes=false,
    dynamicBalance=false,
    T_start=TSupply,
    KvSupply=KV)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={106,-38})));

  DHWTap dHWTap(redeclare package Medium = Medium, m_flow_nominal=m_flow_dhw,
    TDHWSet=273.15 + 40)
    annotation (Placement(transformation(extent={{172,32},{146,46}})));

  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpDHW(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_dhw,
    measurePower=false,
    filteredSpeed=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false,
    T_start=TSupply)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-24,50})));

  IDEAS.Controls.Continuous.LimPID conPID[nZones](
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=180,
    yMax=m_flow_nominal,
    k=0.5)
    annotation (Placement(transformation(extent={{-130,30},{-110,50}})));
  Modelica.Blocks.Math.Gain gain(k=(TStorage - 273.15 - 20)/40)
                                                       annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-76})));

protected
  IDEAS.Fluid.BaseCircuits.ParallelPipesSplitter parallelPipesSplitter(n=nZones,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    V=0.025,
    T_start=TSupply)
    annotation (Placement(transformation(extent={{-60,-48},{-80,-28}})));

  IDEAS.Fluid.Sources.FixedBoundary bou1(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=270,
        origin={140,28})));

  IDEAS.Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=90,
        origin={12,-24})));

  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpRadiators[nZones](
    KvReturn=5,
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    includePipes=false,
    measurePower=false,
    dp=200,
    each energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    each dynamicBalance=false,
    tauTSensor=0,
    each filteredSpeed=true,
    each riseTime=180,
    T_start=TSupply,
    allowFlowReversal=true)
    annotation (Placement(transformation(extent={{-90,-48},{-110,-28}})));

  ToKelvin toKelvin[nZones]
    annotation (Placement(transformation(extent={{-60,-78},{-80,-58}})));

public
  IDEAS.Controls.Continuous.LimPID PIDSupplyT(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.5,
    yMax=1,
    Ti=180)
    annotation (Placement(transformation(extent={{66,4},{86,24}})));
  Controls.OnOff onOff2
    annotation (Placement(transformation(extent={{92,10},{100,18}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=1E-4)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={96,0})));
equation
  QHeaSys = -sum(rad.heatPortCon.Q_flow) - sum(rad.heatPortRad.Q_flow);
  der(SpaceQ) = QHeaSys;
  dhwQ = 0;

  P[1] = 0;
  Q[1] = 0;

  connect(flowController.port_a1, flowPort_supply) annotation (Line(
      points={{116,-32},{160,-32},{160,-100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flowController.port_b2, flowPort_return) annotation (Line(
      points={{116,-44},{120,-44},{120,-100}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(flowController.port_b1,heatExchanger. port_a1) annotation (Line(
      points={{96,-32},{58,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(heatExchanger.port_b2,flowController. port_a2) annotation (Line(
      points={{58,-44},{96,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(heatExchanger.port_b1,parallelPipesSplitter. port_a) annotation (Line(
      points={{38,-32},{-60,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipesSplitter.port_b,heatExchanger. port_a2) annotation (Line(
      points={{-60,-44},{38,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(parallelPipesSplitter.port_aN, pumpRadiators.port_b2) annotation (
      Line(
      points={{-80,-44},{-90,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(parallelPipesSplitter.port_bN, pumpRadiators.port_a1) annotation (
      Line(
      points={{-80,-32},{-90,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpRadiators.port_b1, rad.port_a) annotation (Line(
      points={{-110,-32},{-124,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(rad.port_b, pumpRadiators.port_a2) annotation (Line(
      points={{-144,-32},{-152,-32},{-152,-44},{-110,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(heatPortCon,rad. heatPortCon) annotation (Line(
      points={{-200,20},{-132,20},{-132,-24.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatPortRad,rad. heatPortRad) annotation (Line(
      points={{-200,-20},{-136,-20},{-136,-24.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bou.ports[1], parallelPipesSplitter.port_a) annotation (Line(
      points={{12,-28},{12,-32},{-60,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_b2, heatExchanger.port_a2) annotation (Line(
      points={{-34,44},{-40,44},{-40,-44},{38,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpDHW.port_a1, parallelPipesSplitter.port_a) annotation (Line(
      points={{-34,56},{-54,56},{-54,-32},{-60,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TSet, toKelvin.Celsius) annotation (Line(
      points={{20,-104},{20,-68},{-58,-68}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(mDHW60C, gain.u) annotation (Line(
      points={{80,-104},{80,-88}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(gain.y, dHWTap.mDHW60C) annotation (Line(
      points={{80,-65},{80,-54},{132,-54},{132,60},{159,60},{159,46}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(dHWTap.port_cold, bou1.ports[1]) annotation (Line(
      points={{146,36},{140,36},{140,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PIDSupplyT.u_m, heatExchanger.Tsup) annotation (Line(
      points={{76,2},{76,-6},{40.4,-6},{40.4,-27.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(onOff2.u, greaterThreshold.y) annotation (Line(
      points={{96,9.2},{96,4.4}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(PIDSupplyT.y, onOff2.u1) annotation (Line(
      points={{87,14},{91.2,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(onOff2.y, flowController.u) annotation (Line(
      points={{100.4,14},{106,14},{106,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(greaterThreshold.u, heatExchanger.massFlow2) annotation (Line(
      points={{96,-4.8},{96,-12},{43.2,-12},{43.2,-27.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valveOpening, flowController.u) annotation (Line(
      points={{40,-104},{40,-60},{68,-60},{68,-20},{106,-20},{106,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialRadiators;
