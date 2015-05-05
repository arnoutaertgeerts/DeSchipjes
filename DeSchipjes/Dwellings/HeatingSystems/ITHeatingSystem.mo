within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  extends BaseClasses.PartialStorage;

  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    realTrue=0,
    realFalse=m_flow_dhw,
    uLow=TStorage - 5,
    uHigh=TStorage)
    annotation (Placement(transformation(extent={{40,66},{20,86}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{76,66},{56,86}})));
equation
  connect(pumpDHW.port_a2, storageTank_OneIntHX.port_b) annotation (Line(
      points={{-14,44},{82,44},{82,44.4615}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(hysteresis1.y, pumpDHW.u) annotation (Line(
      points={{19.2,76},{-24,76},{-24,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(hysteresis1.u, temperatureSensor.T) annotation (Line(
      points={{41.2,76},{56,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(temperatureSensor.port, tan.heaPorVol[2]) annotation (Line(
      points={{76,76},{92,76},{92,43.85}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, tan.port_a) annotation (Line(
      points={{-14,56},{106,56},{106,44},{102,44}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystem;
