within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  extends BaseClasses.PartialStorage;

  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    uLow=273.15 + 55,
    uHigh=273.15 + 65,
    realTrue=0,
    realFalse=m_flow_dhw)
    annotation (Placement(transformation(extent={{40,70},{20,90}})));
equation
  connect(storageTank_OneIntHX.T[1], hysteresis1.u) annotation (Line(
      points={{82,60.7077},{74,60.7077},{74,80},{41.2,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, storageTank_OneIntHX.port_a) annotation (Line(
      points={{-14,56},{60,56},{60,71.5385},{82,71.5385}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, storageTank_OneIntHX.port_b) annotation (Line(
      points={{-14,44},{82,44},{82,44.4615}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(hysteresis1.y, pumpDHW.u) annotation (Line(
      points={{19.2,80},{-24,80},{-24,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end ITHeatingSystem;
