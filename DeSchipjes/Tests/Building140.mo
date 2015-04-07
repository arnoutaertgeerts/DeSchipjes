within DeSchipjes.Tests;
model Building140 "A complete building model for testing"

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  IDEAS.Interfaces.Building building(
    redeclare IDEAS.Buildings.Validation.BaseClasses.Occupant.None occupant,
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    standAlone=true,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    redeclare DeSchipjes.Dwellings.Structures.Old.House140 building,
    isDH=true,
    redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem(
        QNom={2113,1409,1,1025,804,1}))
    annotation (Placement(transformation(extent={{-30,20},{30,80}})));
  IDEAS.Fluid.Production.IdealHeater idealHeater(m_flow_nominal=0.5)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,-50})));
  IDEAS.Fluid.BaseCircuits.PumpSupply_dp pumpSupply_dp(
    KvReturn=10,
    redeclare package Medium = IDEAS.Media.Water.Simple,
    m_flow_nominal=0.5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,0})));
  Modelica.Blocks.Sources.Constant const(k=100000)
    annotation (Placement(transformation(extent={{48,-10},{28,10}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    nPorts=1,
    redeclare package Medium = IDEAS.Media.Water.Simple,
    use_T=false)
    annotation (Placement(transformation(extent={{48,-40},{28,-20}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 75)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true)
    annotation (Placement(transformation(extent={{48,-60},{28,-40}})));
equation
  connect(idealHeater.port_b, pumpSupply_dp.port_a1) annotation (Line(
      points={{6,-40},{6,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_a, pumpSupply_dp.port_b2) annotation (Line(
      points={{-6,-40},{-6,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_dp.port_b1, building.flowPort_supply) annotation (Line(
      points={{6,10},{6,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_dp.port_a2, building.flowPort_return) annotation (Line(
      points={{-6,10},{-6,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const.y, pumpSupply_dp.u) annotation (Line(
      points={{27,0},{20,0},{20,-6.66134e-16},{10.8,-6.66134e-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bou.ports[1], pumpSupply_dp.port_a1) annotation (Line(
      points={{28,-30},{6,-30},{6,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, idealHeater.u) annotation (Line(
      points={{-19,-50},{-9.8,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(idealHeater.u1, booleanExpression.y) annotation (Line(
      points={{10,-50},{27,-50}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Building140;
