within DeSchipjes.Tests;
model ModulationTemperature "A complete building model for testing"

  //Parameters
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.1;

  //Variables
  Modelica.SIunits.Energy ETot;

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Dwellings.Building        buildingTest(
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    standAlone=true,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    isDH=true,
    redeclare DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse
      building,
    modulation=true,
    redeclare Dwellings.HeatingSystems.ITHeatingSystemReverse     heatingSystem(
      QNom={2113,1409,1,1025,804,1},
      TSupply=273.15 + 50,
      TReturn=273.15 + 40),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=buildingTest.building.VZones,
        id=1))
    annotation (Placement(transformation(extent={{-30,20},{30,80}})));

  IDEAS.Fluid.BaseCircuits.PumpSupply_dp pumpSupply_dp(
    KvReturn=10,
    redeclare package Medium = IDEAS.Media.Water.Simple,
    m=25,
    measurePower=false,
    tauTSensor=0,
    dynamicBalance=false,
    includePipes=false,
    filteredSpeed=true,
    riseTime=180,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=0.15)
                        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,0})));
  Modelica.Blocks.Sources.Constant const(k=2500)
    annotation (Placement(transformation(extent={{48,-10},{28,10}})));
  IDEAS.Fluid.Sources.FixedBoundary bou(
    nPorts=1,
    redeclare package Medium = IDEAS.Media.Water.Simple,
    use_T=false)
    annotation (Placement(transformation(extent={{34,-36},{14,-16}})));
  Modelica.Blocks.Sources.Constant low(k=273.15 + 55)
    annotation (Placement(transformation(extent={{-68,-62},{-60,-54}})));
public
  Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0,
    redeclare package Medium = IDEAS.Media.Water.Simple)
    annotation (Placement(transformation(extent={{-8,-66},{12,-46}})));
protected
  inner IDEAS.Occupants.Extern.StrobeInfoManager                strobe(
    FilNam_mDHW="mDHW.txt",
    FilNam_QRad="QRad.txt",
    FilNam_TSet="sh_day.txt",
    FilNam_TSet2="sh_night.txt",
    StROBe_P=true,
    FilNam_P="P.txt",
    FilNam_Q="Q.txt",
    FilNam_QCon="Q.txt",
    filDir=Modelica.Utilities.Files.loadResource("modelica://Occupants") + "/")
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
public
  Controls.Modulator modulator
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  Modelica.Blocks.Sources.Constant high(k=273.15 + 75)
    annotation (Placement(transformation(extent={{-68,-46},{-60,-38}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,-50})));
equation
  der(ETot) = hea.Q_flow;

  connect(const.y, pumpSupply_dp.u) annotation (Line(
      points={{27,0},{20,0},{20,-6.66134e-16},{10.8,-6.66134e-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bou.ports[1], pumpSupply_dp.port_a1) annotation (Line(
      points={{14,-26},{6,-26},{6,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_dp.port_b2, hea.port_a) annotation (Line(
      points={{-6,-10},{-6,-38},{-18,-38},{-18,-56},{-8,-56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hea.port_b, pumpSupply_dp.port_a1) annotation (Line(
      points={{12,-56},{20,-56},{20,-38},{6,-38},{6,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_dp.port_a2, buildingTest.flowPort_return) annotation (Line(
      points={{-6,10},{-6,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_dp.port_b1, buildingTest.flowPort_supply) annotation (Line(
      points={{6,10},{6,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(modulator.on, buildingTest.u) annotation (Line(
      points={{-69,40},{-54,40},{-54,50},{-21,50}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(modulator.on, switch1.u2) annotation (Line(
      points={{-69,40},{-54,40},{-54,-50},{-48,-50}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(hea.TSet, switch1.y) annotation (Line(
      points={{-10,-50},{-25,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(low.y, switch1.u3) annotation (Line(
      points={{-59.6,-58},{-48,-58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(high.y, switch1.u1) annotation (Line(
      points={{-59.6,-42},{-48,-42}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(
      StopTime=604800,
      __Dymola_fixedstepsize=10,
      __Dymola_Algorithm="Rkfix4"),
    __Dymola_experimentSetupOutput);
end ModulationTemperature;
