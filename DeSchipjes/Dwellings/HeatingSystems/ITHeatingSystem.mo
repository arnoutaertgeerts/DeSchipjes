within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  import DeSchipjes;
  extends BaseClasses.PartialStorage(
    radPID(yMin=0),
    realExpression1(y=273.15 + 70));

  parameter Modelica.SIunits.Temperature TSupplyDHW=273.15+70;

  .DeSchipjes.Controls.OnOff onOffRad[nZones] annotation (Placement(
        transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-92,-4})));
  Modelica.Blocks.Logical.Not notRad[nZones]
    annotation (Placement(transformation(extent={{-68,-10},{-80,2}})));
  IDEAS.Controls.Discrete.HysteresisRelease_boolean onOffDHW(
    enableRelease=true,
    use_input=false,
    uLow_val=TStorage,
    uHigh_val=TStorage + 5,
    revert=true) annotation (Placement(transformation(extent={{20,70},{0,90}})));
  Modelica.Blocks.Math.Gain mDHW(k=0.167)
    annotation (Placement(transformation(extent={{-10,76},{-18,84}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{74,76},{66,84}})));
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
        origin={50,56})));
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
        origin={50,44})));
  Modelica.Blocks.Logical.Switch
                              switch1
    annotation (Placement(transformation(extent={{40,8},{52,20}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=273.15 + 70)
    annotation (Placement(transformation(extent={{14,14},{28,28}})));
equation

  Qdhw = (tan.portHex_a.h_outflow - tan.portHex_b.h_outflow)*tan.portHex_a.m_flow;
  PboosEl = 0;
  Qhp = 0;

  for i in 1:nZones loop
    connect(u, notRad[i].u) annotation (Line(points={{-40,-104},{-40,-104},{-40,
            -60},{10,-60},{10,-4},{-66.8,-4}},                 color={255,0,255}));
  end for;
  connect(onOffRad.u, notRad.y) annotation (Line(
      points={{-84.8,-4},{-80.6,-4}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(onOffDHW.y, mDHW.u)
    annotation (Line(points={{-1,80},{-9.2,80}}, color={0,0,127}));
  connect(temperatureSensor.T, onOffDHW.u)
    annotation (Line(points={{66,80},{66,80},{22,80}}, color={0,0,127}));
  connect(temperatureSensor.port, tan.heaPorVol[end])
    annotation (Line(points={{74,80},{110,80},{110,52}},    color={191,0,0}));
  connect(mDHW.y, pumpDHW.m_flow_in) annotation (Line(points={{-18.4,80},{-34.12,
          80},{-34.12,63.2}}, color={0,0,127}));
  connect(onOffRad.y, pumpRad.m_flow_in) annotation (Line(points={{-92,-10.6},{-92,
          -24.8},{-91.88,-24.8}},      color={0,0,127}));
  connect(tan.portHex_a, inletHex.port_b) annotation (Line(points={{100,48.2},{
          92,48.2},{92,56},{56,56}},
                                  color={0,127,255}));
  connect(inletHex.port_a, pumpDHW.port_b)
    annotation (Line(points={{44,56},{-28,56}}, color={0,127,255}));
  connect(tan.portHex_b, outletHex.port_a)
    annotation (Line(points={{100,44},{56,44}}, color={0,127,255}));

  connect(onOffDHW.release, u) annotation (Line(points={{10,68},{10,-60},{-40,
          -60},{-40,-104}},      color={255,0,255}));
  connect(supplyPID.u_s, switch1.y)
    annotation (Line(points={{54.8,14},{54,14},{52.6,14}}, color={0,0,127}));
  connect(tab.y, switch1.u3) annotation (Line(points={{28.4,4},{34,4},{34,9.2},{
          38.8,9.2}}, color={0,0,127}));
  connect(switch1.u2, u) annotation (Line(points={{38.8,14},{10,14},{10,-60},{-40,
          -60},{-40,-104}}, color={255,0,255}));
  connect(switch1.u1, realExpression1.y) annotation (Line(points={{38.8,18.8},{34,
          18.8},{34,21},{28.7,21}}, color={0,0,127}));
  connect(onOff.y, pumpSupply.m_flow_in) annotation (Line(points={{86.4,14},{110.12,
          14},{110.12,-24.8}}, color={0,0,127}));
  connect(outletHex.port_b, outletRad.port_a) annotation (Line(points={{44,44},
          {6,44},{-32,44},{-32,-44},{40,-44}}, color={0,127,255}));
  connect(radPID.y, onOffRad.u1) annotation (Line(points={{-147.4,54},{-92,54},
          {-92,3.2}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end ITHeatingSystem;
