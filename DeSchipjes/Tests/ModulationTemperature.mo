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
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=buildingTest.building.VZones,
        id=1),
    redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
      heatingSystem(QNom={2113,1409,804,1025,10,10}))
    annotation (Placement(transformation(extent={{56,28},{36,48}})));

  Modelica.Blocks.Sources.Constant low(k=273.15 + 55)
    annotation (Placement(transformation(extent={{-64,-62},{-56,-54}})));
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
    annotation (Placement(transformation(extent={{-94,-60},{-74,-40}})));
  Modelica.Blocks.Sources.Constant high(k=273.15 + 75)
    annotation (Placement(transformation(extent={{-64,-46},{-56,-38}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-32,-50})));

  DistrictHeating.Interfaces.DHConnection dHConnection(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=0.5,
    length=20,
    allowFlowReversal=false,
    tau=60,
    redeclare DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe)
               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,22})));
  DistrictHeating.Interfaces.DHConnection dHConnection1(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=0.5,
    length=20,
    allowFlowReversal=false,
    tau=60,
    redeclare DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe)
               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,50})));
  Dwellings.Building        buildingTest1(
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    standAlone=true,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    isDH=true,
    redeclare DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse
      building,
    modulation=true,
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=buildingTest.building.VZones,
        id=2),
    redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystemIDEAS
      heatingSystem(QNom={2113,1409,804,1025,10,10}))
    annotation (Placement(transformation(extent={{56,58},{36,78}})));
  Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=0.5,
    dp_nominal=20,
    homotopyInitialization=true)
    annotation (Placement(transformation(extent={{12,-50},{32,-30}})));
  Annex60.Fluid.Sources.FixedBoundary bou(
    nPorts=1,
    redeclare package Medium = Buildings.Media.Water,
    use_T=false)
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={74,-14})));
  Modelica.Blocks.Sources.Constant high1(k=-5)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,-38})));
equation
  der(ETot) = hea.Q_flow;

  connect(modulator.on, switch1.u2) annotation (Line(
      points={{-73,-50},{-44,-50}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(low.y, switch1.u3) annotation (Line(
      points={{-55.6,-58},{-44,-58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(high.y, switch1.u1) annotation (Line(
      points={{-55.6,-42},{-44,-42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dHConnection.flowPortOut, buildingTest.flowPort_supply) annotation (
      Line(
      points={{30,24},{44,24},{44,28}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.flowPortIn, buildingTest.flowPort_return) annotation (
      Line(
      points={{30,20},{48,20},{48,28}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.port_b2, dHConnection.port_a2) annotation (Line(
      points={{14,40},{14,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.port_a1, dHConnection.port_b1) annotation (Line(
      points={{26,40},{26,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortOut, buildingTest1.flowPort_supply) annotation (
     Line(
      points={{30,52},{44,52},{44,58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection1.flowPortIn, buildingTest1.flowPort_return) annotation (
      Line(
      points={{30,48},{48,48},{48,58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dHConnection.port_b2, hea.port_a) annotation (Line(
      points={{14,12},{14,-24},{0,-24},{0,-40},{12,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection.port_a1, hea.port_b) annotation (Line(
      points={{26,12},{26,-22},{40,-22},{40,-40},{32,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hea.TSet, switch1.y) annotation (Line(
      points={{10,-34},{-12,-34},{-12,-50},{-21,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bou.ports[1], hea.port_a) annotation (Line(
      points={{0,-10},{14,-10},{14,-24},{0,-24},{0,-40},{12,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(switch1.y, add.u1) annotation (Line(
      points={{-21,-50},{-12,-50},{-12,-60},{68,-60},{68,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, buildingTest.supplyT) annotation (Line(
      points={{74,-3},{74,38},{53,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(buildingTest1.supplyT, buildingTest.supplyT) annotation (Line(
      points={{53,68},{74,68},{74,38},{53,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.u2, high1.y) annotation (Line(
      points={{80,-26},{80,-33.6}},
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
