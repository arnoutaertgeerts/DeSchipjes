within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  extends BaseClasses.PartialStorage(
    m_flow_dhw=0.06,
    modulation=true,
    pumpDHW(measureSupplyT=true, measureReturnT=true),
    heatExchanger(
      includePipes=true,
      UA=0.1,
      m=10),
    tan(energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
        massDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState),
    rad(Q_flow_nominal={2113,1409,1,1025,804,1}));

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{70,70},{58,82}})));
  Controls.OnOff onOff
    annotation (Placement(transformation(extent={{14,66},{-6,86}})));
  Controls.OnOff onOff1[nZones] annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-100,14})));
  Modelica.Blocks.Logical.Not not1[nZones]
    annotation (Placement(transformation(extent={{-62,4},{-82,24}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 40)
    annotation (Placement(transformation(extent={{12,-2},{20,6}})));
  Modelica.Blocks.Sources.Constant const2(k=273.15 + 70)
    annotation (Placement(transformation(extent={{12,14},{20,22}})));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter1(
                                                            Td=30, Rising=
        m_flow_dhw)
    annotation (Placement(transformation(extent={{-12,72},{-20,80}})));
equation
  connect(conPID.y, onOff1.u1) annotation (Line(
      points={{-109,40},{-100,40},{-100,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(onOff1.y, pumpRadiators.u) annotation (Line(
      points={{-100,3},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(not1.y, onOff1.u) annotation (Line(
      points={{-83,14},{-88,14}},
      color={255,0,255},
      smooth=Smooth.None));

  for i in 1:nZones loop
  end for;
  connect(toKelvin.Kelvin, conPID.u_s) annotation (Line(
      points={{-81,-68},{-160,-68},{-160,40},{-132,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSensor, conPID.u_m) annotation (Line(
      points={{-204,-60},{-120,-60},{-120,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperatureSensor.port, tan.heaPorVol[4]) annotation (Line(
      points={{70,76},{106,76},{106,56.45}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(fixedTemperature.port, tan.heaPorSid) annotation (Line(
      points={{120,96},{111.6,96},{111.6,56}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(onOff.y, slewRateLimiter1.u) annotation (Line(
      points={{-7,76},{-11.2,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(slewRateLimiter1.y, pumpDHW.u) annotation (Line(
      points={{-20.4,76},{-24,76},{-24,60.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, uniSTOR.portHex_a) annotation (Line(
      points={{-14,56},{88,56},{88,52.2},{96,52.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, uniSTOR.portHex_b) annotation (Line(
      points={{-14,44},{96,44},{96,48}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(temperatureSensor.T, onOff.u1) annotation (Line(
      points={{58,76},{16,76}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystem;
