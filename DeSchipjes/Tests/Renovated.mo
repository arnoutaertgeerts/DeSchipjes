within DeSchipjes.Tests;
model Renovated "A complete building model for testing"

  //Parameters
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.1;

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Interfaces.Building building(
    redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
      ventilationSystem,
    standAlone=true,
    redeclare IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
          heatLosses=false)),
    isDH=true,
    redeclare DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse
      building,
    redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem(
      QNom={2113,1409,1,1025,804,1},
      TSupply=273.15 + 45,
      TReturn=273.15 + 35,
      TBoiler=273.15 + 45),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building.building.VZones))
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
    annotation (Placement(transformation(extent={{48,-40},{28,-20}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 45)
    annotation (Placement(transformation(extent={{-60,-56},{-40,-36}})));
protected
  inner IDEAS.Occupants.Extern.StrobeInfoManager                strobe(
    FilNam_Q="Q.txt",
    FilNam_mDHW="mDHW.txt",
    FilNam_QCon="QCon.txt",
    FilNam_QRad="QRad.txt",
    FilNam_TSet="sh_day.txt",
    FilNam_TSet2="sh_night.txt",
    FilNam_P="P.txt",
    filDir=Modelica.Utilities.Files.loadResource("modelica://IDEAS") +
        "/Inputs/")
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
public
  Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{-8,-62},{12,-42}})));
equation
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
  connect(pumpSupply_dp.port_b2, hea.port_a) annotation (Line(
      points={{-6,-10},{-6,-36},{-18,-36},{-18,-52},{-8,-52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hea.port_b, pumpSupply_dp.port_a1) annotation (Line(
      points={{12,-52},{20,-52},{20,-38},{6,-38},{6,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, hea.TSet) annotation (Line(
      points={{-39,-46},{-10,-46}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(
      StopTime=600000,
      __Dymola_fixedstepsize=25,
      __Dymola_Algorithm="Rkfix4"),
    __Dymola_experimentSetupOutput);
end Renovated;
