within DeSchipjes.Tests;
model LowTemperature "A complete building model for testing"

  //Parameters
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.1;

  //Variables
  Modelica.SIunits.Energy ETot;

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Dwellings.Building buildingTest(
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    standAlone=true,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    isDH=true,
    redeclare DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse
      building,
    modulating=true,
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=buildingTest.building.VZones,
        id=1),
    redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemIDEAS
      heatingSystem(QNom={2113,1409,804,1025,10,10}))
    annotation (Placement(transformation(extent={{56,28},{36,48}})));

  Modelica.Blocks.Sources.Constant low(k=273.15 + 55)
    annotation (Placement(transformation(extent={{-26,-38},{-18,-30}})));
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
    modulating=true,
    redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystemIDEAS
      heatingSystem(QNom={2113,1409,804,1025,10,10}),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=buildingTest1.building.VZones,
        id=3))
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
  connect(bou.ports[1], hea.port_a) annotation (Line(
      points={{0,-10},{14,-10},{14,-24},{0,-24},{0,-40},{12,-40}},
      color={0,127,255},
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
  connect(low.y, hea.TSet) annotation (Line(
      points={{-17.6,-34},{10,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(low.y, add.u1) annotation (Line(
      points={{-17.6,-34},{-8,-34},{-8,-58},{68,-58},{68,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(
      StopTime=604800,
      __Dymola_fixedstepsize=10,
      __Dymola_Algorithm="Rkfix4"),
    __Dymola_experimentSetupOutput);
end LowTemperature;
