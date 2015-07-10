within DeSchipjes.Tests;
model LowTemperature "A complete building model for testing"

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
    redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem(
      QNom={2113,1409,1,1025,804,1},
      TSupply=273.15 + 50,
      TReturn=273.15 + 40,
      TBoiler=273.15 + 50),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse
      building,
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=buildingTest.building.VZones,
        id=5),
    modulation=false,
    modulating=false)
    annotation (Placement(transformation(extent={{-30,20},{30,80}})));

  Modelica.Blocks.Sources.Constant const1(k=273.15 + 55)
    annotation (Placement(transformation(extent={{-60,-58},{-40,-38}})));
public
  Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0,
    redeclare package Medium = IDEAS.Media.Water.Simple)
    annotation (Placement(transformation(extent={{-8,-64},{12,-44}})));
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
    measureSupplyT=false,
    measureReturnT=false,
    redeclare DistrictHeating.Pipes.DoublePipes.TwinPipeGround
      districtHeatingPipe)
                         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,-4})));
  Buildings.Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Buildings.Media.Water,
    use_T=false,
    nPorts=1) annotation (Placement(transformation(extent={{52,-56},{32,-36}})));
equation
  der(ETot) = hea.Q_flow;

  connect(const1.y, hea.TSet) annotation (Line(
      points={{-39,-48},{-10,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hea.port_b, dHConnection.port_a1) annotation (Line(
      points={{12,-54},{20,-54},{20,-34},{6,-34},{6,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dHConnection.port_b2, hea.port_a) annotation (Line(
      points={{-6,-14},{-6,-34},{-16,-34},{-16,-54},{-8,-54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(buildingTest.flowPort_return, dHConnection.port_a2) annotation (Line(
      points={{-6,20},{-6,6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(buildingTest.flowPort_supply, dHConnection.port_b1) annotation (Line(
      points={{6,20},{6,6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bou.ports[1], dHConnection.port_a1) annotation (Line(
      points={{32,-46},{20,-46},{20,-34},{6,-34},{6,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(
      StopTime=3.15569e+007,
      __Dymola_fixedstepsize=10,
      __Dymola_Algorithm="Lsodar"),
    __Dymola_experimentSetupOutput);
end LowTemperature;
