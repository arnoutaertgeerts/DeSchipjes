within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  extends BaseClasses.PartialStorage(
    TSupply=273.15+50,
    TReturn=273.15+40);

  parameter Modelica.SIunits.Temperature TSupplyDHW=273.15+70;

  Controls.OnOff onOffRad[nZones] annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-100,-10})));
  Modelica.Blocks.Logical.Not notRad[nZones]
    annotation (Placement(transformation(extent={{-68,-16},{-80,-4}})));
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
  Controls.Switch switch1(on=TSupplyDHW, off=TSupply)
    annotation (Placement(transformation(extent={{16,-6},{28,6}})));
equation

  for i in 1:nZones loop
    connect(u, notRad[i].u) annotation (Line(points={{-40,-104},{-40,-104},{-40,
            -60},{10,-60},{10,-10},{-66.8,-10}},               color={255,0,255}));
  end for;
  connect(onOffRad.u, notRad.y) annotation (Line(
      points={{-92.8,-10},{-80.6,-10}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(onOffDHW.y, mDHW.u)
    annotation (Line(points={{-1,80},{-9.2,80}}, color={0,0,127}));
  connect(temperatureSensor.T, onOffDHW.u)
    annotation (Line(points={{66,80},{66,80},{22,80}}, color={0,0,127}));
  connect(temperatureSensor.port, tan.heaPorVol[end])
    annotation (Line(points={{74,80},{110,80},{110,52}},    color={191,0,0}));
  connect(mDHW.y, pumpDHW.m_flow_in) annotation (Line(points={{-18.4,80},{-30.12,
          80},{-30.12,63.2}}, color={0,0,127}));
  connect(onOffRad.y, pumpRad.m_flow_in) annotation (Line(points={{-100,-16.6},{
          -100,-24.8},{-99.88,-24.8}}, color={0,0,127}));
  connect(tan.portHex_a, inletHex.port_b) annotation (Line(points={{100,48.2},{
          92,48.2},{92,56},{56,56}},
                                  color={0,127,255}));
  connect(inletHex.port_a, pumpDHW.port_b)
    annotation (Line(points={{44,56},{-24,56}}, color={0,127,255}));
  connect(tan.portHex_b, outletHex.port_a)
    annotation (Line(points={{100,44},{56,44}}, color={0,127,255}));
  connect(outletHex.port_b, parallelPipesSplitter.port_b) annotation (Line(
        points={{44,44},{-36,44},{-36,-44},{-60,-44}}, color={0,127,255}));

  connect(onOffDHW.release, u) annotation (Line(points={{10,68},{10,-60},{-40,
          -60},{-40,-104}},      color={255,0,255}));
  connect(switch1.u, u) annotation (Line(points={{14.8,0},{10,0},{10,-60},{-40,-60},
          {-40,-104}}, color={255,0,255}));
  connect(switch1.y, supplyPID.u_s)
    annotation (Line(points={{28.6,0},{38.8,0},{38.8,0}},
                                                      color={0,0,127}));
  connect(radPID.y, onOffRad.u1) annotation (Line(points={{-109,40},{-100,40},{
          -100,-2.8}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end ITHeatingSystem;
