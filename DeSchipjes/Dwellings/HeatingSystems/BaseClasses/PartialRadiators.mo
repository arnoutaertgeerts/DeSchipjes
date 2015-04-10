within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialRadiators
  //Extensions
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem(
    isDH=true,
    nEmbPorts=0);

  //Parameters
  parameter Modelica.SIunits.Power[nZones] QNom=2000*ones(nZones)
    "Nominal heating power of each zone";
  parameter Modelica.SIunits.Temperature TSupply=273.15+70
    "Radiator supply temperature";
  parameter Modelica.SIunits.Temperature TReturn=273.15+60
    "Radiator return temeprature";
  parameter Modelica.SIunits.Temperature TBoiler=273.15+80
    "Radiator return temeprature";

  parameter Modelica.SIunits.MassFlowRate m_flow_dhw=0.1
    "Nominal mass flow rate of DHW";

  parameter Real KVs[nZones] = ones(nZones)*10
    "Values for the balancing valves";

  final parameter Modelica.SIunits.MassFlowRate[nZones] m_flow_nominal = QNom/(4180.6*(TSupply-TReturn))
    "Nominal mass flow rates";

  final parameter Modelica.SIunits.Pressure dp_nominal=
    2* flowController.dp + heatExchanger.dp1_nominal
    "Nominal pressure drop of the DH grid in the dwelling";

  IDEAS.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad[nZones](
    redeclare package Medium = Medium,
    Q_flow_nominal=QNom,
    T_a_nominal=TSupply,
    T_b_nominal=TReturn,
    nEle=2,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(extent={{-124,-42},{-144,-22}})));
  IDEAS.Fluid.BaseCircuits.HeatExchanger heatExchanger(
    m_flow_nominal=sum(m_flow_nominal),
    dp1_nominal=200,
    dp2_nominal=200,
    redeclare package Medium = Medium,
    measureReturnT=false,
    efficiency=0.9,
    m=25,
    dp=50,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                                                   annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={54,-38})));
  IDEAS.Fluid.BaseCircuits.FlowController flowController(
      redeclare package Medium = Medium,
    CvDataSupply=IDEAS.Fluid.Types.CvTypes.Kv,
    m_flow_nominal=sum(m_flow_nominal),
    dpValve_nominalSupply=0,
    KvReturn=5,
    KvSupply=1,
    measureSupplyT=false,
    measureReturnT=false,
    useBalancingValve=true,
    m=10,
    dp=200,
    includePipes=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={96,-38})));
  IDEAS.Fluid.BaseCircuits.ParallelPipesSplitter parallelPipesSplitter(n=nZones,
    redeclare package Medium = Medium,
    m_flow_nominal=sum(m_flow_nominal),
    V=0.025)
    annotation (Placement(transformation(extent={{-62,-48},{-82,-28}})));
  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpRadiators[nZones](
    KvReturn=5,
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    includePipes=false,
    measurePower=false,
    dp=200,
    filteredSpeed=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false)
    annotation (Placement(transformation(extent={{-92,-48},{-112,-28}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=90,
        origin={30,-12})));
  DistrictHeating.HeatingSystems.Control.Hysteresis
                     hysteresis[nZones](
    realFalse=m_flow_nominal,
    release=false,
    uLow=273.15 + 19,
    uHigh=273.15 + 21,
    realTrue=0)
    annotation (Placement(transformation(extent={{-138,40},{-118,60}})));
  DistrictHeating.HeatingSystems.Control.PI
             pI(TSet=TSupply - 5,
    release=true,
    PID(
      controllerType=Modelica.Blocks.Types.SimpleController.PI,
      yMax=1,
      yMin=0,
      k=0.1,
      Ti=1000))                   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={80,4})));
  DHWTap dHWTap(redeclare package Medium = Medium, m_flow_nominal=m_flow_dhw)
    annotation (Placement(transformation(extent={{130,42},{156,56}})));
  IDEAS.Fluid.Sources.FixedBoundary bou1(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=0,
        origin={176,46})));
  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpDHW(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_dhw,
    measurePower=false,
    filteredSpeed=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false)
                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-24,50})));
equation
  QHeaSys = -sum(rad.heatPortCon.Q_flow) - sum(rad.heatPortRad.Q_flow);
  P[1] = 0;
  Q[1] = 0;

  connect(flowController.port_a1, flowPort_supply) annotation (Line(
      points={{106,-32},{160,-32},{160,-100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(flowController.port_b2, flowPort_return) annotation (Line(
      points={{106,-44},{120,-44},{120,-100}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(flowController.port_b1,heatExchanger. port_a1) annotation (Line(
      points={{86,-32},{64,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(heatExchanger.port_b2,flowController. port_a2) annotation (Line(
      points={{64,-44},{86,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(heatExchanger.port_b1,parallelPipesSplitter. port_a) annotation (Line(
      points={{44,-32},{-62,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipesSplitter.port_b,heatExchanger. port_a2) annotation (Line(
      points={{-62,-44},{44,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(parallelPipesSplitter.port_aN, pumpRadiators.port_b2) annotation (
      Line(
      points={{-82,-44},{-92,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(parallelPipesSplitter.port_bN, pumpRadiators.port_a1) annotation (
      Line(
      points={{-82,-32},{-92,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpRadiators.port_b1, rad.port_a) annotation (Line(
      points={{-112,-32},{-124,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(rad.port_b, pumpRadiators.port_a2) annotation (Line(
      points={{-144,-32},{-152,-32},{-152,-44},{-112,-44}},
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
  connect(TSensor,hysteresis. u) annotation (Line(
      points={{-204,-60},{-180,-60},{-180,50},{-139.2,50}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(hysteresis.y, pumpRadiators.u) annotation (Line(
      points={{-117.2,50},{-102,50},{-102,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pI.y,flowController. u) annotation (Line(
      points={{90.6,4},{96,4},{96,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pI.senMassFlow1,heatExchanger. massFlow1) annotation (Line(
      points={{69.6,-4},{62,-4},{62,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pI.T1,heatExchanger. senT1) annotation (Line(
      points={{69.6,0},{60,0},{60,-27.4},{59.4,-27.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pI.senMassFlow2,heatExchanger. massFlow2) annotation (Line(
      points={{69.6,8},{49.2,8},{49.2,-27.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pI.senT2,heatExchanger. Tsup) annotation (Line(
      points={{69.6,12},{46.4,12},{46.4,-27.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mDHW60C, dHWTap.mDHW60C) annotation (Line(
      points={{80,-104},{80,-54},{124,-54},{124,56},{143,56}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(bou.ports[1], parallelPipesSplitter.port_a) annotation (Line(
      points={{30,-22},{30,-32},{-62,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHWTap.port_cold, bou1.ports[1]) annotation (Line(
      points={{156,46},{166,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_b2, heatExchanger.port_a2) annotation (Line(
      points={{-34,44},{-40,44},{-40,-44},{44,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpDHW.port_a1, parallelPipesSplitter.port_a) annotation (Line(
      points={{-34,56},{-54,56},{-54,-32},{-62,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialRadiators;
