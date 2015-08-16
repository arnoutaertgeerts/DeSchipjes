within DeSchipjes.Dwellings.HeatingSystems;
model BoilerHeatingSystem
  extends BaseClasses.PartialStorage(
    TSupply=273.15+50,
    TReturn=273.15+40,
    modulating=false,
    hex(eps=1));

  parameter Modelica.SIunits.Temperature TSupplyDHW=273.15+70;

  IDEAS.Controls.Discrete.HysteresisRelease_boolean onOffDHW(
    use_input=false,
    revert=true,
    enableRelease=false,
    uLow_val=273.15 + 38,
    uHigh_val=TStorage)
                 annotation (Placement(transformation(extent={{20,70},{0,90}})));
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
  .DeSchipjes.Controls.Switch switch(on=TSupplyDHW, off=TSupply)
    annotation (Placement(transformation(extent={{0,-6},{12,6}})));
  Modelica.Blocks.Logical.GreaterThreshold
                                        lessThreshold
    annotation (Placement(transformation(extent={{-42,74},{-54,86}})));
  IDEAS.Fluid.Sources.FixedBoundary bou9(
    use_T=false,
    redeclare package Medium = IDEAS.Media.Water,
    nPorts=1)    annotation (Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=90,
        origin={168,-44})));
equation

  DhwPow = (inletHex.port_a.h_outflow - outletHex.port_a.h_outflow)*inletHex.m_flow;

  for i in 1:nZones loop
  end for;

  connect(onOffDHW.y, mDHW.u)
    annotation (Line(points={{-1,80},{-9.2,80}}, color={0,0,127}));
  connect(temperatureSensor.port, tan.heaPorVol[end])
    annotation (Line(points={{74,80},{110,80},{110,52}},    color={191,0,0}));
  connect(mDHW.y, pumpDHW.m_flow_in) annotation (Line(points={{-18.4,80},{-30.12,
          80},{-30.12,63.2}}, color={0,0,127}));
  connect(tan.portHex_a, inletHex.port_b) annotation (Line(points={{100,48.2},{
          92,48.2},{92,56},{56,56}},
                                  color={0,127,255}));
  connect(inletHex.port_a, pumpDHW.port_b)
    annotation (Line(points={{44,56},{-24,56}}, color={0,127,255}));
  connect(tan.portHex_b, outletHex.port_a)
    annotation (Line(points={{100,44},{56,44}}, color={0,127,255}));
  connect(outletHex.port_b, parallelPipesSplitter.port_b) annotation (Line(
        points={{44,44},{-36,44},{-36,-44},{-60,-44}}, color={0,127,255}));

  connect(switch.y, supplyPID.u_s)
    annotation (Line(points={{12.6,0},{38.8,0}}, color={0,0,127}));
  connect(onOffDHW.u, temperatureSensor.T)
    annotation (Line(points={{22,80},{66,80}}, color={0,0,127}));
  connect(mDHW.y, lessThreshold.u) annotation (Line(points={{-18.4,80},{-40.8,
          80}},        color={0,0,127}));
  connect(switch.u, lessThreshold.y) annotation (Line(points={{-1.2,0},{-1.2,0},
          {-60,0},{-60,80},{-54.6,80}}, color={255,0,255}));
  connect(radPID.y, pumpRad.m_flow_in) annotation (Line(points={{-109,40},{
          -99.88,40},{-99.88,-24.8}}, color={0,0,127}));
  connect(bou9.ports[1], pumpSupply.port_a) annotation (Line(points={{168,-48},
          {168,-54},{160,-54},{160,-32},{116,-32}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end BoilerHeatingSystem;
