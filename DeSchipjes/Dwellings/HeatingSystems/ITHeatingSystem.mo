within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  extends BaseClasses.PartialStorage(
    modulating=true);

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{70,70},{58,82}})));
  Controls.OnOff onOffDHW
    annotation (Placement(transformation(extent={{6,70},{-6,82}})));
  Controls.OnOff onOffRad[nZones] annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-100,10})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=273.15 + 60)
    annotation (Placement(transformation(extent={{28,4},{16,16}})));
  Modelica.Blocks.Logical.Not notRad[nZones]
    annotation (Placement(transformation(extent={{-68,4},{-80,16}})));
equation
  connect(onOffRad.y, pumpRadiators.u) annotation (Line(
      points={{-100,3.4},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));

  for i in 1:nZones loop
      connect(notRad[i].u, greaterThreshold.y) annotation (Line(
      points={{-66.8,10},{15.4,10}},
      color={255,0,255},
      smooth=Smooth.None));
  end for;
  connect(temperatureSensor.port, tan.heaPorVol[4]) annotation (Line(
      points={{70,76},{106,76},{106,56.45}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(temperatureSensor.T, onOffDHW.u1) annotation (Line(
      points={{58,76},{7.2,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, tan.portHex_a) annotation (Line(
      points={{-14,56},{86,56},{86,52.2},{96,52.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, tan.portHex_b) annotation (Line(
      points={{-14,44},{96,44},{96,48}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(onOffDHW.u, greaterThreshold.y) annotation (Line(
      points={{0,68.8},{0,10},{15.4,10}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(onOffRad.u, notRad.y) annotation (Line(
      points={{-92.8,10},{-80.6,10}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(supplyT, greaterThreshold.u) annotation (Line(
      points={{60,-104},{60,-60},{40,-60},{40,10},{29.2,10}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(supplyPID.u_s, greaterThreshold.u) annotation (Line(
      points={{48,10},{29.2,10}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(conPID.y, onOffRad.u1) annotation (Line(
      points={{-109,40},{-100,40},{-100,17.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(onOffDHW.y, pumpDHW.u) annotation (Line(
      points={{-6.6,76},{-24,76},{-24,60.8}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystem;
