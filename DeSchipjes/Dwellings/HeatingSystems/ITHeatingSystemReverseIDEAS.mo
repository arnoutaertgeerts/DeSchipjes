within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystemReverseIDEAS
  extends BaseClasses.PartialStorageIDEAS(
    m_flow_dhw=0.06,
    modulation=true,
    pumpDHW(measureSupplyT=true, measureReturnT=true),
    rad(Q_flow_nominal={2113,1409,1,1025,804,1}),
    bou1(nPorts=2));

  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    realTrue=0,
    release=false,
    uLow=TStorage,
    uHigh=TStorage + 5,
    realFalse=2*m_flow_dhw)
    annotation (Placement(transformation(extent={{58,66},{38,86}})));
  Controls.OnOff onOff
    annotation (Placement(transformation(extent={{4,72},{-4,80}})));
  Controls.OnOff onOff1[nZones] annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={-100,14})));
  Modelica.Blocks.Logical.Not not1[nZones]
    annotation (Placement(transformation(extent={{-62,4},{-82,24}})));
equation
  connect(hysteresis1.y, onOff.u1) annotation (Line(
      points={{37.2,76},{4.8,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HT, onOff.u) annotation (Line(
      points={{60,-104},{60,-60},{0,-60},{0,71.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(conPID.y, onOff1.u1) annotation (Line(
      points={{-109,40},{-100,40},{-100,18.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(onOff1.y, pumpRadiators.u) annotation (Line(
      points={{-100,9.6},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(not1.y, onOff1.u) annotation (Line(
      points={{-83,14},{-95.2,14}},
      color={255,0,255},
      smooth=Smooth.None));

  for i in 1:nZones loop
    connect(HT, not1[i].u)   annotation (Line(
      points={{60,-104},{60,-60},{0,-60},{0,14},{-60,14}},
      color={255,0,255},
      smooth=Smooth.None));
  end for;
  connect(toKelvin.Kelvin, conPID.u_s) annotation (Line(
      points={{-81,-68},{-160,-68},{-160,40},{-132,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSensor, conPID.u_m) annotation (Line(
      points={{-204,-60},{-120,-60},{-120,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tan.heatExchEnv, fixedTemperature.port) annotation (Line(
      points={{95,55.8},{110,55.8},{110,96},{120,96}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(hysteresis1.u, tan.T[4]) annotation (Line(
      points={{59.2,76},{104,76},{104,58.75},{98.4,58.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tan.portHXLower, pumpDHW.port_a2) annotation (Line(
      points={{98.4,54},{98,54},{98,44},{-14,44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpDHW.port_b1, tan.portHXUpper) annotation (Line(
      points={{-14,56},{80,56},{80,54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.port_b, bou1.ports[2]) annotation (Line(
      points={{79.8,48.2},{80,48.2},{80,36},{140,36},{140,32}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(tan.port_a, dHWTap.port_hot) annotation (Line(
      points={{98.2,66.2},{180,66.2},{180,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(onOff.y, pumpDHW.u) annotation (Line(
      points={{-4.4,76},{-24,76},{-24,60.8}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystemReverseIDEAS;
