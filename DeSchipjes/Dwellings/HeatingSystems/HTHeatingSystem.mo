within DeSchipjes.Dwellings.HeatingSystems;
model HTHeatingSystem
  extends BaseClasses.PartialRadiators(
    modulating=false);

public
  Buildings.Fluid.HeatExchangers.ConstantEffectiveness hex1(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    dp1_nominal=20,
    dp2_nominal=20,
    m1_flow_nominal=m_flow_dhw,
    m2_flow_nominal=m_flow_dhw)
                    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={48,50})));
  Modelica.Blocks.Sources.Constant const(k=TSupply)
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
equation

  connect(pumpDHW.u, dHWTap.mDHW60C) annotation (Line(
      points={{-24,60.8},{-24,78},{158,78},{158,78},{159,78},{159,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, hex1.port_a2) annotation (Line(
      points={{-14,56},{34,56},{34,60},{42,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, hex1.port_b2) annotation (Line(
      points={{-14,44},{34,44},{34,40},{42,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hex1.port_b1, dHWTap.port_hot) annotation (Line(
      points={{54,60},{180,60},{180,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(supplyPID.u_s, const.y) annotation (Line(
      points={{48,10},{41,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.y, pumpRadiators.u) annotation (Line(
      points={{-109,40},{-100,40},{-100,-27.2}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(hex1.port_a1, dHWTap.port_cold) annotation (Line(
      points={{54,40},{140,40},{140,36},{146,36}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}),      graphics));
end HTHeatingSystem;
