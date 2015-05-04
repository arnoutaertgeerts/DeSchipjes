within DeSchipjes.Tests;
model RenovatedMFlow "A complete building model for testing"

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  IDEAS.Interfaces.Building building(
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    standAlone=true,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    isDH=true,
    redeclare DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse
      building,
    redeclare IDEAS.Occupants.Standards.None occupant(TSet_val={273.15 + 20,
          273.15 + 20,273.15 + 20,273.15 + 20,273.15 + 20,273.15 + 20}),
    redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystemMFlow
      heatingSystem(QNom={2113,1409,1,1025,804,1}))
    annotation (Placement(transformation(extent={{-30,20},{30,80}})));

  IDEAS.Fluid.Production.IdealHeater idealHeater(m_flow_nominal=0.5,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,-50})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = IDEAS.Media.Water.Simple,
    use_T=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{48,-40},{28,-20}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 75)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true)
    annotation (Placement(transformation(extent={{48,-60},{28,-40}})));
equation
  connect(const1.y, idealHeater.u) annotation (Line(
      points={{-19,-50},{-9.8,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(idealHeater.u1, booleanExpression.y) annotation (Line(
      points={{10,-50},{27,-50}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(idealHeater.port_a, building.flowPort_return) annotation (Line(
      points={{-6,-40},{-6,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, building.flowPort_supply) annotation (Line(
      points={{6,-40},{6,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], building.flowPort_supply) annotation (Line(
      points={{28,-30},{6,-30},{6,20}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(
      StopTime=600000,
      __Dymola_fixedstepsize=30,
      __Dymola_Algorithm="Rkfix4"),
    __Dymola_experimentSetupOutput);
end RenovatedMFlow;
