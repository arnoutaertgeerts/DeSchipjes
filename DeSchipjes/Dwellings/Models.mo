within DeSchipjes.Dwellings;
package Models
  extends Modelica.Icons.ExamplesPackage;
  model HaarhakkerFull "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Building building(
      isDH=true,
      redeclare DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse
        building,
      modulating=false,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(id=3, VZones=building.building.VZones),
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(QNom=building.Q_design))
      annotation (Placement(transformation(extent={{-20,20},{0,40}})));

    Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
      redeclare package Medium = Annex60.Media.Water,
      m_flow_nominal=0.5,
      dp_nominal=0)
      annotation (Placement(transformation(extent={{-20,-26},{0,-6}})));
    Modelica.Blocks.Sources.Constant const(k=273.15 + 60)
      annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
    IDEAS.Fluid.Sources.FixedBoundary bou(
      nPorts=1,
      use_T=false,
      redeclare package Medium = Annex60.Media.Water) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={24,-16})));
    inner IDEAS.SimInfoManager sim
      annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
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
  equation
    connect(building.flowPort_return, hea.port_a) annotation (Line(
        points={{-12,20},{-12,4},{-30,4},{-30,-16},{-20,-16}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(building.flowPort_supply, hea.port_b) annotation (Line(
        points={{-8,20},{-8,4},{12,4},{12,-16},{0,-16}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(hea.TSet, const.y) annotation (Line(
        points={{-22,-10},{-59,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bou.ports[1], hea.port_b) annotation (Line(
        points={{20,-16},{0,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end HaarhakkerFull;

  model HaarhakkerROMHT "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Building building(
      isDH=true,
      modulating=false,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building.building.VZones,
          id=5),
      redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem)
      annotation (Placement(transformation(extent={{18,0},{38,20}})));

    Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
      redeclare package Medium = Annex60.Media.Water,
      m_flow_nominal=0.5,
      dp_nominal=0)
      annotation (Placement(transformation(extent={{-34,-26},{-14,-6}})));
    Modelica.Blocks.Sources.Constant const(k=273.15 + 60)
      annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
    IDEAS.Fluid.Sources.FixedBoundary bou(
      use_T=false,
      redeclare package Medium = Annex60.Media.Water,
      nPorts=1)                                       annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=270,
          origin={0,-6})));
    inner IDEAS.SimInfoManager sim
      annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
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
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
        districtHeatingPipe(redeclare
          DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
          baseConfiguration))
      annotation (Placement(transformation(extent={{18,-32},{38,-12}})));
    Building building1(
      isDH=true,
      modulating=false,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building.building.VZones,
          id=5),
      redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem)
      annotation (Placement(transformation(extent={{48,0},{68,20}})));
    DistrictHeating.Interfaces.DHConnection dHConnection1(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
        districtHeatingPipe(redeclare
          DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
          baseConfiguration))
      annotation (Placement(transformation(extent={{48,-32},{68,-12}})));
  equation
    connect(hea.TSet, const.y) annotation (Line(
        points={{-36,-10},{-59,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(dHConnection.port_a3, building.flowPort_return) annotation (Line(
        points={{26,-12},{26,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection.port_b3, building.flowPort_supply) annotation (Line(
        points={{30,-12},{30,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(hea.port_b, dHConnection.port_a1) annotation (Line(
        points={{-14,-16},{18,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection.port_b2, hea.port_a) annotation (Line(
        points={{18,-28},{-52,-28},{-52,-16},{-34,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou.ports[1], dHConnection.port_a1) annotation (Line(
        points={{0,-10},{0,-16},{18,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection1.port_a3, building1.flowPort_return) annotation (Line(
        points={{56,-12},{56,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection1.port_b3, building1.flowPort_supply) annotation (Line(
        points={{60,-12},{60,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection.port_b1, dHConnection1.port_a1) annotation (Line(
        points={{38,-16},{48,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection.port_a2, dHConnection1.port_b2) annotation (Line(
        points={{38,-28},{48,-28}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics));
  end HaarhakkerROMHT;

  model HaarhakkerROMIT "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Building building(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building.building.VZones,
          id=5),
      modulating=true,
      redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem
        heatingSystem(QNom=building.building.Q_design))
      annotation (Placement(transformation(extent={{8,0},{28,20}})));

    IDEAS.Fluid.Sources.FixedBoundary bou(
      use_T=false,
      redeclare package Medium = Annex60.Media.Water,
      nPorts=1)                                       annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=270,
          origin={0,-6})));
    inner IDEAS.SimInfoManager sim
      annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
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
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
        districtHeatingPipe,
      Di=0.05)
      annotation (Placement(transformation(extent={{8,-32},{28,-12}})));
    Building building1(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building.building.VZones,
          id=5),
      modulating=true,
      redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem
        heatingSystem(QNom=building.building.Q_design))
      annotation (Placement(transformation(extent={{60,0},{80,20}})));
    DistrictHeating.Interfaces.DHConnection dHConnection1(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
        districtHeatingPipe,
      Di=0.05)
      annotation (Placement(transformation(extent={{60,-32},{80,-12}})));
    ProductionSites.IdealModulatingProduction idealModulatingProduction(
        m_flow_nominal=0.1)
      annotation (Placement(transformation(extent={{-60,-32},{-40,-12}})));
    IDEAS.Fluid.BaseCircuits.Measurements measurements(redeclare package Medium
        = IDEAS.Media.Water, m_flow_nominal=1)
      annotation (Placement(transformation(extent={{-30,-32},{-10,-12}})));
    IDEAS.Fluid.BaseCircuits.Measurements measurements1(redeclare package
        Medium = IDEAS.Media.Water, m_flow_nominal=1)
      annotation (Placement(transformation(extent={{34,-32},{54,-12}})));
  equation
    connect(dHConnection.port_a3, building.flowPort_return) annotation (Line(
        points={{16,-12},{16,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection.port_b3, building.flowPort_supply) annotation (Line(
        points={{20,-12},{20,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou.ports[1], dHConnection.port_a1) annotation (Line(
        points={{-8.88178e-016,-10},{-8.88178e-016,-16},{8,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection1.port_a3, building1.flowPort_return) annotation (Line(
        points={{68,-12},{68,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(dHConnection1.port_b3, building1.flowPort_supply) annotation (Line(
        points={{72,-12},{72,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(idealModulatingProduction.y, building.supplyT) annotation (Line(
          points={{-50,-11.4},{-50,10},{11,10}}, color={0,0,127}));
    connect(idealModulatingProduction.y, building1.supplyT) annotation (Line(
          points={{-50,-11.4},{-50,20},{58,20},{58,10},{63,10}}, color={0,0,127}));
    connect(idealModulatingProduction.port_b, measurements.port_a1) annotation
      (Line(points={{-40,-16},{-35,-16},{-30,-16}}, color={0,127,255}));
    connect(idealModulatingProduction.port_a, measurements.port_b2) annotation
      (Line(points={{-40,-28},{-35,-28},{-30,-28}}, color={0,127,255}));
    connect(measurements.port_b1, dHConnection.port_a1)
      annotation (Line(points={{-10,-16},{8,-16}}, color={0,127,255}));
    connect(measurements.port_a2, dHConnection.port_b2)
      annotation (Line(points={{-10,-28},{8,-28}}, color={0,127,255}));
    connect(measurements1.port_b1, dHConnection1.port_a1) annotation (Line(
          points={{54,-16},{57,-16},{60,-16}}, color={0,127,255}));
    connect(dHConnection.port_b1, measurements1.port_a1) annotation (Line(
          points={{28,-16},{31,-16},{34,-16}}, color={0,127,255}));
    connect(dHConnection.port_a2, measurements1.port_b2) annotation (Line(
          points={{28,-28},{31,-28},{34,-28}}, color={0,127,255}));
    connect(measurements1.port_a2, dHConnection1.port_b2) annotation (Line(
          points={{54,-28},{57,-28},{60,-28}}, color={0,127,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
      experiment(
        StopTime=250000,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Radau"),
      __Dymola_experimentSetupOutput);
  end HaarhakkerROMIT;
end Models;
