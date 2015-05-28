within DeSchipjes.Dwellings.HeatingSystems;
model HTHeatingSystem
  extends BaseClasses.PartialRadiators(
    modulation=false,
    bou1(nPorts=2), pumpRadiators(
      use_powerCharacteristic=false,
      motorCooledByFluid=false),
    flowController(                   m=25),
    heatExchanger(                      includePipes=true));

  IDEAS.Fluid.BaseCircuits.HeatExchanger heatExchanger1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_dhw,
    dp1_nominal=200,
    dp2_nominal=200) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={46,50})));
equation
  connect(heatExchanger1.port_a2, bou1.ports[2]) annotation (Line(
      points={{56,44},{100,44},{100,34},{160,34},{160,42},{164,42}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));

  connect(heatExchanger1.port_b1, dHWTap.port_hot) annotation (Line(
      points={{56,56},{112,56},{112,36},{128,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, heatExchanger1.port_a1) annotation (Line(
      points={{-14,56},{36,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, heatExchanger1.port_b2) annotation (Line(
      points={{-14,44},{36,44}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(pumpDHW.u, dHWTap.mDHW60C) annotation (Line(
      points={{-24,60.8},{-24,78},{124,78},{124,60},{141,60},{141,46}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}),      graphics));
end HTHeatingSystem;
