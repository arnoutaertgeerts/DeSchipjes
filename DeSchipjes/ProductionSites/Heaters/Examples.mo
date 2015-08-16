within DeSchipjes.ProductionSites.Heaters;
package Examples

  model BaseExample

    Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(redeclare package Medium =
          IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
    Annex60.Fluid.Movers.FlowControlled_m_flow fan(redeclare package Medium =
          IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-20,10},{0,30}})));
    replaceable IDEAS.Fluid.Interfaces.TwoPortHeatMassExchanger twoPortHeatMassExchanger(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      dp_nominal=0)
      annotation (Placement(transformation(extent={{22,10},{42,30}})));
    Modelica.Blocks.Sources.Sine     InletTemperature(
      amplitude=20,
      offset=273.15 + 30,
      freqHz=1/1000)
      annotation (Placement(transformation(extent={{-96,40},{-76,60}})));
    Modelica.Blocks.Sources.Pulse    massFlow(
      amplitude=0.1,
      period=500,
      offset=0)
      annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
    Annex60.Fluid.Sources.FixedBoundary bou(nPorts=1, redeclare package Medium
        = IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-84,-40},{-64,-20}})));
    Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=2000)
      annotation (Placement(transformation(extent={{6,40},{26,60}})));
  equation
    connect(hea.port_b, fan.port_a)
      annotation (Line(points={{-40,20},{-20,20}}, color={0,127,255}));
    connect(fan.port_b, twoPortHeatMassExchanger.port_a)
      annotation (Line(points={{0,20},{0,20},{22,20}}, color={0,127,255}));
    connect(twoPortHeatMassExchanger.port_b, hea.port_a) annotation (Line(points={{42,20},
            {60,20},{60,-14},{-72,-14},{-72,20},{-60,20}},         color={0,127,255}));
    connect(InletTemperature.y, hea.TSet) annotation (Line(points={{-75,50},{
            -70,50},{-70,26},{-62,26}},
                                color={0,0,127}));
    connect(massFlow.y, fan.m_flow_in) annotation (Line(points={{-19,50},{-10.2,
            50},{-10.2,32}},
                         color={0,0,127}));
    connect(bou.ports[1], hea.port_a) annotation (Line(points={{-64,-30},{-54,
            -30},{-54,-14},{-72,-14},{-72,20},{-60,20}}, color={0,127,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})));
  end BaseExample;

  model BaseTwoPortExample

    Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(redeclare package Medium =
          IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-60,18},{-40,38}})));
    Annex60.Fluid.Movers.FlowControlled_m_flow fan(redeclare package Medium =
          IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-20,18},{0,38}})));
    replaceable IDEAS.Fluid.Interfaces.FourPortHeatMassExchanger twoPortHeatMassExchanger(
      redeclare package Medium1 = IDEAS.Media.Water,
      redeclare package Medium2 = IDEAS.Media.Water,
      m1_flow_nominal=0.1,
      m2_flow_nominal=0.1,
      dp1_nominal=0,
      dp2_nominal=0)
      annotation (Placement(transformation(extent={{-14,-22},{-34,-2}})));
    Modelica.Blocks.Sources.Sine     InletTemperature(
      amplitude=5,
      offset=273.15 + 7.5,
      freqHz=1/1000)
      annotation (Placement(transformation(extent={{-96,48},{-76,68}})));
    Modelica.Blocks.Sources.Pulse    massFlow(
      amplitude=0.1,
      period=500,
      offset=0)
      annotation (Placement(transformation(extent={{-40,48},{-20,68}})));
    Annex60.Fluid.Sources.FixedBoundary bou(nPorts=1, redeclare package Medium
        = IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-96,-12},{-86,-2}})));
    Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=2000)
      annotation (Placement(transformation(extent={{0,66},{20,86}})));
    Annex60.Fluid.HeatExchangers.HeaterCooler_T hea1(
                                                    redeclare package Medium =
          IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-50,-72},{-70,-52}})));
    Annex60.Fluid.Movers.FlowControlled_m_flow fan1(
                                                   redeclare package Medium =
          IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{26,-72},{6,-52}})));
    Modelica.Blocks.Sources.Sine     InletTemperature1(
      amplitude=10,
      freqHz=1/2000,
      offset=273.15 + 40)
      annotation (Placement(transformation(extent={{-6,-54},{-26,-34}})));
    Annex60.Fluid.Sources.FixedBoundary bou1(
                                            nPorts=1, redeclare package Medium
        = IDEAS.Media.Water)
      annotation (Placement(transformation(extent={{-92,-30},{-82,-20}})));
  equation
    connect(hea.port_b, fan.port_a)
      annotation (Line(points={{-40,28},{-20,28}}, color={0,127,255}));
    connect(InletTemperature.y, hea.TSet) annotation (Line(points={{-75,58},{-70,58},
            {-70,34},{-62,34}}, color={0,0,127}));
    connect(massFlow.y, fan.m_flow_in) annotation (Line(points={{-19,58},{-10.2,58},
            {-10.2,40}}, color={0,0,127}));
    connect(bou.ports[1], hea.port_a) annotation (Line(points={{-86,-7},{-86,-6},
            {-72,-6},{-72,28},{-60,28}},          color={0,127,255}));
    connect(fan.port_b, twoPortHeatMassExchanger.port_a1) annotation (Line(points=
           {{0,28},{14,28},{14,-6},{-14,-6}}, color={0,127,255}));
    connect(twoPortHeatMassExchanger.port_b1, hea.port_a) annotation (Line(points=
           {{-34,-6},{-38,-6},{-72,-6},{-72,28},{-60,28}}, color={0,127,255}));
    connect(InletTemperature1.y, hea1.TSet) annotation (Line(points={{-27,-44},{-42,
            -44},{-42,-56},{-48,-56}}, color={0,0,127}));
    connect(fan1.port_b, hea1.port_a)
      annotation (Line(points={{6,-62},{-24,-62},{-50,-62}}, color={0,127,255}));
    connect(twoPortHeatMassExchanger.port_b2, fan1.port_a) annotation (Line(
          points={{-14,-18},{32,-18},{32,-62},{26,-62}}, color={0,127,255}));
    connect(twoPortHeatMassExchanger.port_a2, hea1.port_b) annotation (Line(
          points={{-34,-18},{-74,-18},{-74,-62},{-70,-62}}, color={0,127,255}));
    connect(bou1.ports[1], hea1.port_b) annotation (Line(points={{-82,-25},{-78,
            -25},{-78,-24},{-74,-24},{-74,-62},{-70,-62}}, color={0,127,255}));
    connect(massFlow.y, fan1.m_flow_in) annotation (Line(points={{-19,58},{18,
            58},{54,58},{54,-42},{16.2,-42},{16.2,-50}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})));
  end BaseTwoPortExample;

  model CHP
    import DeSchipjes;
    extends BaseExample(
      redeclare DeSchipjes.ProductionSites.Heaters.CHP twoPortHeatMassExchanger(
        redeclare package Medium = IDEAS.Media.Water,
        m_flow_nominal=0.1,
        PNomRef=6000),
      hea(redeclare package Medium = IDEAS.Media.Water, m_flow_nominal=0.1),
      fan(redeclare package Medium = IDEAS.Media.Water, m_flow_nominal=0.1));

  equation
    connect(booleanPulse.y, twoPortHeatMassExchanger.u)
      annotation (Line(points={{27,50},{32,50},{32,30.8}}, color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}})));
  end CHP;

  model HPWW28E
    extends BaseTwoPortExample(redeclare HPWW28 twoPortHeatMassExchanger(
        redeclare package Medium1 = IDEAS.Media.Water,
        redeclare package Medium2 = IDEAS.Media.Water,
        m1_flow_nominal=0.1,
        m2_flow_nominal=0.1,
        dp1_nominal=0,
        dp2_nominal=0));
  equation

    connect(booleanPulse.y, twoPortHeatMassExchanger.u) annotation (Line(points={{21,76},
            {40,76},{40,8},{-24,8},{-24,-1.2}},         color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}})));
  end HPWW28E;

  model HPWW42E
    extends BaseTwoPortExample(redeclare HPWW42 twoPortHeatMassExchanger);
  equation

    connect(booleanPulse.y, twoPortHeatMassExchanger.u) annotation (Line(points={{21,76},
            {40,76},{40,8},{-24,8},{-24,-1.2}},         color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}})));
  end HPWW42E;

  model HPWWBE
    extends BaseTwoPortExample(
      redeclare Booster twoPortHeatMassExchanger,
      InletTemperature(amplitude=10, offset=273.15 + 30),
      InletTemperature1(amplitude=20, offset=273.15 + 30));
  equation

    connect(booleanPulse.y, twoPortHeatMassExchanger.u) annotation (Line(points={{21,76},
            {40,76},{40,8},{-24,8},{-24,-1.2}},         color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}})));
  end HPWWBE;

  model Boiler
    import DeSchipjes;
    extends BaseExample(
      redeclare DeSchipjes.ProductionSites.Heaters.Boiler
                                                       twoPortHeatMassExchanger(
        redeclare package Medium = IDEAS.Media.Water,
        m_flow_nominal=0.1,
        modulationInput=false),
      hea(redeclare package Medium = IDEAS.Media.Water, m_flow_nominal=0.1),
      fan(redeclare package Medium = IDEAS.Media.Water, m_flow_nominal=0.1),
      InletTemperature(amplitude=20, offset=273.15 + 50));

    Modelica.Blocks.Sources.Constant const(k=273.15 + 70)
      annotation (Placement(transformation(extent={{92,30},{72,50}})));
  equation
    connect(booleanPulse.y, twoPortHeatMassExchanger.on) annotation (Line(
          points={{27,50},{28,50},{28,50},{30,50},{30,30.8}}, color={255,0,255}));
    connect(const.y, twoPortHeatMassExchanger.u)
      annotation (Line(points={{71,40},{34,40},{34,30.8}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})));
  end Boiler;
end Examples;
