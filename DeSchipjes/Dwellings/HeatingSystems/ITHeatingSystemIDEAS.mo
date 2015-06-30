within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystemIDEAS
  extends BaseClasses.PartialStorageIDEAS(
    m_flow_dhw=0.06,
    modulation=true,
    pumpDHW(measureSupplyT=true, measureReturnT=true),
    rad(Q_flow_nominal={2113,1409,1,1025,804,1}),
    bou1(nPorts=2));

  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    realTrue=0,
    realFalse=m_flow_dhw,
    release=false,
    uLow=TStorage,
    uHigh=TStorage + 5)
    annotation (Placement(transformation(extent={{44,66},{24,86}})));
  Controls.OnOff onOff
    annotation (Placement(transformation(extent={{4,72},{-4,80}})));
  Controls.OnOff onOff1[nZones] annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={-100,14})));
  Modelica.Blocks.Logical.Not not1[nZones]
    annotation (Placement(transformation(extent={{-74,10},{-82,18}})));
  Modelica.Blocks.Sources.Constant const1(k=TSupply - 5)
    annotation (Placement(transformation(extent={{12,2},{20,10}})));
  Modelica.Blocks.Sources.Constant const2(k=273.15 + 70)
    annotation (Placement(transformation(extent={{12,18},{20,26}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,14})));
equation
  connect(hysteresis1.y, onOff.u1) annotation (Line(
      points={{23.2,76},{4.8,76}},
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
      points={{-82.4,14},{-95.2,14}},
      color={255,0,255},
      smooth=Smooth.None));

  for i in 1:nZones loop
    connect(HT, not1[i].u)   annotation (Line(
      points={{60,-104},{60,-60},{0,-60},{0,14},{-73.2,14}},
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
  connect(const1.y, switch1.u3) annotation (Line(
      points={{20.4,6},{28,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, switch1.u1) annotation (Line(
      points={{20.4,22},{28,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u2, onOff.u) annotation (Line(
      points={{28,14},{0,14},{0,71.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(fixedTemperature.port, tan.heatExchEnv) annotation (Line(
      points={{120,96},{104,96},{104,55.8},{95,55.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(hysteresis1.u, tan.T[4]) annotation (Line(
      points={{45.2,76},{102,76},{102,58.75},{98.4,58.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, tan.port_a) annotation (Line(
      points={{-14,56},{76,56},{76,70},{98.2,70},{98.2,66.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, tan.port_b) annotation (Line(
      points={{-14,44},{80,44},{80,48.2},{79.8,48.2}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(tan.portHXUpper, bou1.ports[2]) annotation (Line(
      points={{80,54},{76,54},{76,36},{140,36},{140,32}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(tan.portHXLower, dHWTap.port_hot) annotation (Line(
      points={{98.4,54},{180,54},{180,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(onOff.y, pumpDHW.u) annotation (Line(
      points={{-4.4,76},{-24,76},{-24,60.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, PIDSupplyT.u_s) annotation (Line(
      points={{51,14},{64,14}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystemIDEAS;
