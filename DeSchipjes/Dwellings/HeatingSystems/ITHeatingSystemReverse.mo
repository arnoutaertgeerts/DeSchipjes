within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystemReverse
  extends BaseClasses.PartialStorage(
    m_flow_dhw=0.06,
    modulation=true,
    pumpDHW(measureSupplyT=true, measureReturnT=true),
    heatExchanger(
      includePipes=true,
      UA=0.1,
      m=10),
    tan(
      dIns=0.05,
      hTan=0.8,
      hHex_a=0.75,
      hHex_b=0.05,
      dExtHex=0.05,
      Q_flow_nominal=2000,
      VTan=0.1),
    rad(Q_flow_nominal={2113,1409,1,1025,804,1}),
    bou1(nPorts=2));

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{76,66},{56,86}})));
  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    realTrue=0,
    release=false,
    uLow=TStorage,
    uHigh=TStorage + 5,
    realFalse=2*m_flow_dhw)
    annotation (Placement(transformation(extent={{40,66},{20,86}})));
  Controls.OnOff onOff
    annotation (Placement(transformation(extent={{10,66},{-10,86}})));
  Controls.OnOff onOff1[nZones] annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-100,14})));
  Modelica.Blocks.Logical.Not not1[nZones]
    annotation (Placement(transformation(extent={{-62,4},{-82,24}})));
  IDEAS.Controls.Continuous.LimPID PIDSupplyT(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=180,
    k=0.5,
    yMax=1)
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 40)
    annotation (Placement(transformation(extent={{12,-2},{20,6}})));
  Modelica.Blocks.Sources.Constant const2(k=273.15 + 70)
    annotation (Placement(transformation(extent={{12,14},{20,22}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,10})));
equation
  connect(temperatureSensor.T, hysteresis1.u) annotation (Line(
      points={{56,76},{41.2,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hysteresis1.y, onOff.u1) annotation (Line(
      points={{19.2,76},{12,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(onOff.y, pumpDHW.u) annotation (Line(
      points={{-11,76},{-24,76},{-24,60.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HT, onOff.u) annotation (Line(
      points={{50,-104},{50,-60},{0,-60},{0,64}},
      color={255,0,255},
      smooth=Smooth.None));
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
    connect(HT, not1[i].u)   annotation (Line(
      points={{50,-104},{50,-60},{0,-60},{0,14},{-60,14}},
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
  connect(heatExchanger.massFlow2, PIDSupplyT.u_m) annotation (Line(
      points={{43.2,-27.4},{43.2,-16},{70,-16},{70,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PIDSupplyT.y, slewRateLimiter.u) annotation (Line(
      points={{81,10},{88,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, switch1.u3) annotation (Line(
      points={{20.4,2},{28,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, switch1.u1) annotation (Line(
      points={{20.4,18},{28,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, PIDSupplyT.u_s) annotation (Line(
      points={{51,10},{58,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u2, onOff.u) annotation (Line(
      points={{28,10},{0,10},{0,64}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(temperatureSensor.port, tan.heaPorVol[4]) annotation (Line(
      points={{76,76},{98,76},{98,56.45}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(fixedTemperature.port, tan.heaPorSid) annotation (Line(
      points={{120,90},{103.6,90},{103.6,56}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, tan.portHex_a) annotation (Line(
      points={{-14,56},{78,56},{78,52.2},{88,52.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, tan.portHex_b) annotation (Line(
      points={{-14,44},{88,44},{88,48},{88,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.port_a, dHWTap.port_hot) annotation (Line(
      points={{88,56},{82,56},{82,68},{180,68},{180,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.port_b, bou1.ports[2]) annotation (Line(
      points={{108,56},{120,56},{120,36},{138,36},{138,32}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystemReverse;