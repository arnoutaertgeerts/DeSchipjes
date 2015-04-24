within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialRadiatorsTRV
  //Extensions
  extends IDEAS.Interfaces.BaseClasses.HeatingSystem(
    isDH=true,
    nEmbPorts=0,
    nZones=6);

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
    2* flowController.dp + heatExchanger.dp1_nominal;

  parameter Modelica.SIunits.Pressure prescribedHead = 60000;

  IDEAS.Fluid.BaseCircuits.HeatExchanger heatExchanger(
    m_flow_nominal=sum(m_flow_nominal),
    dp1_nominal=200,
    dp2_nominal=200,
    redeclare package Medium = Medium,
    measureReturnT=false,
    dp=0,
    efficiency=0.9,
    m=25)                                          annotation (Placement(
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
    includePipes=true,
    measureSupplyT=false,
    measureReturnT=false,
    useBalancingValve=true,
    m=10,
    dp=200)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={96,-38})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Medium,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=90,
        origin={32,-12})));
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
    measurePower=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,50})));
  IDEAS.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 emTRV[nZones - 1](
      redeclare package Medium = Medium,
    Q_flow_nominal=QNom[2:nZones],
    T_a_nominal=TSupply,
    T_b_nominal=TReturn)                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-156,-32})));
   IDEAS.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 emThermostat(redeclare
      package Medium = Medium,
    Q_flow_nominal=QNom[1],
    T_a_nominal=TSupply,
    T_b_nominal=TReturn)       annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-130,8})));
  IDEAS.Fluid.BaseCircuits.ParallelPipesSplitter parallelPipesSplitter(
    redeclare package Medium = Medium,
    n=nZones - 1,
    V=0.1,
    m_flow_nominal=sum(m_flow_nominal[2:nZones]))
           annotation (Placement(transformation(extent={{-94,-48},{-114,-28}})));
  IDEAS.Fluid.BaseCircuits.PumpSupply_dp pumpSupply(
    KvReturn=3,
    m_flow_nominal=sum(m_flow_nominal),
    redeclare package Medium = Medium,
    measureSupplyT=false,
    measureReturnT=false,
    measurePower=false)
    annotation (Placement(transformation(extent={{-52,-48},{-72,-28}})));
  IDEAS.Fluid.BaseCircuits.ThermostaticRadiatorValve TRV[nZones - 1](
    redeclare package Medium = Medium,
    useBalancingValve=true,
    m_flow_nominal=m_flow_nominal[2:nZones],
    KvSupply=m_flow_nominal,
    dpValve_nominalSupply=10,
    KvReturn=m_flow_nominal[2:nZones]/sqrt(prescribedHead/10e5),
    PID(controllerType=Modelica.Blocks.Types.SimpleController.P),
    measureSupplyT=false,
    measureReturnT=false,
    measurePower=false)
    annotation (Placement(transformation(extent={{-120,-48},{-140,-28}})));
  IDEAS.Fluid.BaseCircuits.BalancingValve balancingValve(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal[1],
    includePipes=false,
    dp=0,
    KvReturn=m_flow_nominal[1]/sqrt(prescribedHead/10e5))
          annotation (Placement(transformation(extent={{-94,-8},{-114,12}})));
  ResidentialControl.Thermostats.OnOff onOff(TSetBoiler=273.15 + 70)
    annotation (Placement(transformation(extent={{-52,14},{-72,34}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=60000)
                                                                 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-62,-6})));
equation
  QHeaSys = -sum(emTRV.heatPortCon.Q_flow) - sum(emTRV.heatPortRad.Q_flow) - emThermostat.heatPortRad.Q_flow - emThermostat.heatPortCon.Q_flow;
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
      points={{80,-104},{80,-54},{124,-54},{124,54.6},{130,54.6}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(dHWTap.port_cold, bou1.ports[1]) annotation (Line(
      points={{156,46},{166,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_b2, heatExchanger.port_a2) annotation (Line(
      points={{-28,44},{-34,44},{-34,-44},{44,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(emTRV.heatPortRad, heatPortRad[2:nZones]) annotation (Line(
      points={{-158,-24.8},{-200,-24.8},{-200,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(emTRV.heatPortCon, heatPortCon[2:nZones]) annotation (Line(
      points={{-154,-24.8},{-154,20},{-200,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(emThermostat.heatPortRad, heatPortRad[1]) annotation (Line(
      points={{-132,15.2},{-132,15.2},{-132,16},{-180,16},{-180,-20},{-200,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(emThermostat.heatPortCon, heatPortCon[1]) annotation (Line(
      points={{-128,15.2},{-128,16},{-128,16},{-128,14},{-128,20},{-200,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(parallelPipesSplitter.port_bN,TRV. port_a1) annotation (Line(
      points={{-114,-32},{-120,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipesSplitter.port_aN,TRV. port_b2) annotation (Line(
      points={{-114,-44},{-120,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TRV.port_b1,emTRV. port_a) annotation (Line(
      points={{-140,-32},{-146,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(emTRV.port_b,TRV. port_a2) annotation (Line(
      points={{-166,-32},{-170,-32},{-170,-44},{-140,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(parallelPipesSplitter.port_a, pumpSupply.port_b1) annotation (Line(
      points={{-94,-32},{-72,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipesSplitter.port_b, pumpSupply.port_a2) annotation (Line(
      points={{-94,-44},{-72,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpSupply.port_b2, heatExchanger.port_a2) annotation (Line(
      points={{-52,-44},{44,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpSupply.port_a1, heatExchanger.port_b1) annotation (Line(
      points={{-52,-32},{44,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], heatExchanger.port_b1) annotation (Line(
      points={{32,-22},{32,-32},{44,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(emThermostat.port_a, balancingValve.port_b1) annotation (Line(
      points={{-120,8},{-114,8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(emThermostat.port_b, balancingValve.port_a2) annotation (Line(
      points={{-140,8},{-144,8},{-144,-4},{-114,-4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(balancingValve.port_b2, pumpSupply.port_a2) annotation (Line(
      points={{-94,-4},{-88,-4},{-88,-44},{-72,-44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(balancingValve.port_a1, pumpSupply.port_b1) annotation (Line(
      points={{-94,8},{-76,8},{-76,-32},{-72,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a1, heatExchanger.port_b1) annotation (Line(
      points={{-28,56},{-48,56},{-48,-32},{44,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TSensor[2:nZones], TRV.u) annotation (Line(
      points={{-204,-60},{-174,-60},{-174,-20},{-130,-20},{-130,-27.2}},
      smooth=Smooth.None,
      color={175,175,175}));
  connect(TSet[2:nZones], TRV.u1) annotation (Line(
      points={{20,-104},{20,-80},{-118,-80},{-118,-20},{-126,-20},{-126,-27}},
      smooth=Smooth.None,
      color={175,175,175}));
  connect(TSet[1], onOff.TSetpoint) annotation (Line(
      points={{20,-112.333},{20,-80},{-40,-80},{-40,26.2},{-52.2,26.2}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(TSensor[1], onOff.TSensor) annotation (Line(
      points={{-204,-60},{-44,-60},{-44,30},{-52.2,30}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(onOff.y1, booleanToReal.u) annotation (Line(
      points={{-66,13.4},{-66,10},{-62,10},{-62,6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanToReal.y, pumpSupply.u) annotation (Line(
      points={{-62,-17},{-62,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialRadiatorsTRV;
