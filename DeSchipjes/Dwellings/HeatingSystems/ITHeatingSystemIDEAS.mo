within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystemIDEAS
  extends BaseClasses.PartialStorageIDEAS(
    m_flow_dhw=0.06,
    final modulating=true,
    pumpDHW(measureSupplyT=true, measureReturnT=true),
    bou1(nPorts=2),
    hex(m2_flow(fixed=false)),
    senMasFlo,
    supplyPID);

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
        origin={-100,10})));
  Modelica.Blocks.Logical.Not not1[nZones]
    annotation (Placement(transformation(extent={{-72,6},{-80,14}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=273.15 + 55)
    annotation (Placement(transformation(extent={{14,6},{6,14}})));
equation
  connect(hysteresis1.y, onOff.u1) annotation (Line(
      points={{23.2,76},{4.8,76}},
      color={0,0,127},
      smooth=Smooth.None));

  for i in 1:nZones loop
    connect(greaterThreshold.y, not1[i].u) annotation (Line(
      points={{5.6,10},{-71.2,10}},
      color={255,0,255},
      smooth=Smooth.None));
  end for;

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
  connect(tan.portHXLower, dHWTap.port_hot) annotation (Line(
      points={{98.4,54},{180,54},{180,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(onOff.y, pumpDHW.u) annotation (Line(
      points={{-4.4,76},{-24,76},{-24,60.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tan.portHXUpper, bou1.ports[2]) annotation (Line(
      points={{80,54},{76,54},{76,36},{140,36},{140,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(greaterThreshold.u, supplyPID.u_s) annotation (Line(
      points={{14.8,10},{48,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(greaterThreshold.y, onOff.u) annotation (Line(
      points={{5.6,10},{0,10},{0,71.2}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(not1.y, onOff1.u) annotation (Line(
      points={{-80.4,10},{-95.2,10}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(onOff1.y, pumpRadiators.u) annotation (Line(
      points={{-100,5.6},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.y, onOff1.u1) annotation (Line(
      points={{-109,40},{-100,40},{-100,14.8}},
      color={0,0,127},
      smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystemIDEAS;
