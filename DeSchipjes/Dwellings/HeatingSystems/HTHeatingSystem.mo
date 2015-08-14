within DeSchipjes.Dwellings.HeatingSystems;
model HTHeatingSystem
  extends BaseClasses.PartialRadiators(
    TSupply=273.15+70,
    TReturn=273.15+50,
    modulating=false,
    tab(table=[263.15,273.15 + 70; 273.15 + 20,273.15 + 70]),
    radPID(
      yMax=m_flow_nominal,
      k=0.001,
      Ti=360),
    rad(Q_flow_nominal=QNom));

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
equation

  Qdhw = (hex1.port_a2.h_outflow - hex1.port_b2.h_outflow)*hex1.port_a2.m_flow;
  PboosEl = 0;
  Qsto = 0;
  Qhp = 0;

  connect(hex1.port_b1, dHWTap.port_hot) annotation (Line(
      points={{56,60},{60,60},{60,56},{178,56},{178,36},{172,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hex1.port_a1, dHWTap.port_cold) annotation (Line(
      points={{56,40},{60,40},{60,44},{140,44},{140,36},{146,36}},
      color={0,127,255},
      pattern=LinePattern.Dash));
  connect(pumpDHW.m_flow_in, dHWTap.mDHW60C) annotation (Line(points={{-34.12,63.2},
          {-34.12,80},{130,80},{130,60},{159,60},{159,46}},       color={0,0,
          127}));
  connect(pumpDHW.port_b, hex1.port_a2) annotation (Line(points={{-28,56},{40,56},
          {40,60},{44,60}},     color={0,127,255}));
  connect(radPID.y, pumpRad.m_flow_in) annotation (Line(points={{-147.4,54},{-114,
          54},{-91.88,54},{-91.88,-24.8}}, color={0,0,127}));
  connect(hex1.port_b2, outletRad.port_a) annotation (Line(points={{44,40},{40,40},
          {40,42},{-30,42},{-30,-44},{40,-44}}, color={0,127,255}));
  connect(tab.y, supplyPID.u_s) annotation (Line(points={{28.4,4},{40,4},{40,14},
          {54.8,14}}, color={0,0,127}));
  connect(senMasFlo.m_flow, pumpSupply.m_flow_in) annotation (Line(points={{62,
          -25.4},{62,-18},{110.12,-18},{110.12,-24.8}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end HTHeatingSystem;
