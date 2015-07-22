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
    m2_flow_nominal=m_flow_dhw,
    linearizeFlowResistance1=true,
    linearizeFlowResistance2=true)
                    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={50,50})));
  Modelica.Blocks.Sources.Constant const(k=TSupply)
    annotation (Placement(transformation(extent={{20,-6},{32,6}})));
equation

  connect(hex1.port_b1, dHWTap.port_hot) annotation (Line(
      points={{56,60},{60,60},{60,56},{178,56},{178,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hex1.port_a1, dHWTap.port_cold) annotation (Line(
      points={{56,40},{60,40},{60,44},{140,44},{140,36},{146,36}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(hex1.port_b2, parallelPipesSplitter.port_b) annotation (Line(
      points={{44,40},{40,40},{40,44},{-32,44},{-32,-44},{-60,-44}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(pumpDHW.m_flow_in, dHWTap.mDHW60C) annotation (Line(points={{-30.12,
          63.2},{-30.12,80},{130,80},{130,60},{159,60},{159,46}}, color={0,0,
          127}));
  connect(pumpDHW.port_b, hex1.port_a2) annotation (Line(points={{-24,56},{40,
          56},{40,60},{44,60}}, color={0,127,255}));
  connect(radPID.y, pumpRad.m_flow_in) annotation (Line(points={{-109,40},{-99.88,
          40},{-99.88,-24.8}}, color={0,0,127}));
  connect(supplyPID.u_s, const.y)
    annotation (Line(points={{38.8,0},{32.6,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end HTHeatingSystem;
