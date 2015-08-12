within DeSchipjes;
package Models
  extends Modelica.Icons.ExamplesPackage;
  model HaarhakkerFull "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Dwellings.Building building(
      isDH=true,
      redeclare DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse
        building,
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

    Modelica.SIunits.Power DisPow;
    Modelica.SIunits.Energy DisEn;

    Dwellings.Building building1(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium =
                   IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      modulating=false,
      redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem(
          QNom=building1.building.Q_design),
      redeclare IDEAS.Occupants.Extern.StROBe occupant(id=5, VZones=building1.building.VZones))
      annotation (Placement(transformation(extent={{12,0},{32,20}})));

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
    Dwellings.Building building2(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      modulating=false,
      redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem(
          QNom=building1.building.Q_design),
      redeclare IDEAS.Occupants.Extern.StROBe occupant(id=5, VZones=building1.building.VZones))
      annotation (Placement(transformation(extent={{64,0},{84,20}})));
    ProductionSites.GasSun gasSun(TSupRad=273.15 + 80, n=2)
      annotation (Placement(transformation(extent={{-40,-32},{-20,-12}})));
  public
    DistrictHeating.Interfaces.DHConnection Pipe1(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR25S
        dim,
      H=0.6,
      lambdaG=1.2)
             annotation (Placement(transformation(extent={{12,-32},{32,-12}})));

    DistrictHeating.Interfaces.DHConnection Pipe2(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR25S
        dim,
      H=0.6,
      lambdaG=1.2)
             annotation (Placement(transformation(extent={{64,-32},{84,-12}})));

    IDEAS.Controls.ControlHeating.HeatingCurves.HeatingCurve heatingCurve(
      TOut_nominal=273.15 - 10,
      TRoo=293.15 + 2,
      TSup_nominal=273.15 + 80,
      TRet_nominal=273.15 + 63,
      TRoo_nominal=293.15 + 2,
      TSupMin=273.15 + 65)
      annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=sim.Te)
      annotation (Placement(transformation(extent={{-94,6},{-74,26}})));
  equation
    DisPow = Pipe1.QLosses + Pipe2.QLosses;
    der(DisEn) = DisPow;

    connect(Pipe1.port_a2, Pipe2.port_b2)
      annotation (Line(points={{32,-28},{48,-28},{64,-28}}, color={0,127,255}));
    connect(Pipe1.port_b1, Pipe2.port_a1)
      annotation (Line(points={{32,-16},{48,-16},{64,-16}}, color={0,127,255}));
    connect(building1.flowPort_return, Pipe1.port_a3)
      annotation (Line(points={{20,0},{20,-6},{20,-12}}, color={0,0,0}));
    connect(building1.flowPort_supply, Pipe1.port_b3)
      annotation (Line(points={{24,0},{24,-6},{24,-12}}, color={0,0,0}));
    connect(building2.flowPort_return, Pipe2.port_a3)
      annotation (Line(points={{72,0},{72,-6},{72,-12}}, color={0,0,0}));
    connect(building2.flowPort_supply, Pipe2.port_b3)
      annotation (Line(points={{76,0},{76,-6},{76,-12}}, color={0,0,0}));
    connect(gasSun.port_b, Pipe1.port_a1)
      annotation (Line(points={{-20,-16},{-4,-16},{12,-16}}, color={0,127,255}));
    connect(gasSun.port_a, Pipe1.port_b2)
      annotation (Line(points={{-20,-28},{12,-28}}, color={0,127,255}));
    connect(bou.ports[1], Pipe1.port_a1)
      annotation (Line(points={{0,-10},{0,-16},{12,-16}}, color={0,127,255}));
    connect(heatingCurve.TOut,realExpression. y)
      annotation (Line(points={{-62,16},{-73,16}}, color={0,0,127}));
    connect(heatingCurve.TSup, gasSun.TBase)
      annotation (Line(points={{-39,16},{-34,16},{-34,-11}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
      experiment(
        StopTime=604800,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput);
  end HaarhakkerROMHT;

  model HaarhakkerROMIT "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Modelica.SIunits.Power DisPow;
    Modelica.SIunits.Energy DisEn;

    Dwellings.Building building1(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium =
                   IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
          QNom=building1.building.Q_design),
      redeclare IDEAS.Occupants.Extern.StROBe occupant(id=1, VZones=building1.building.VZones))
      annotation (Placement(transformation(extent={{30,0},{50,20}})));

    IDEAS.Fluid.Sources.FixedBoundary bou(
      use_T=false,
      redeclare package Medium = Annex60.Media.Water,
      nPorts=1)                                       annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=270,
          origin={0,-10})));
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
    DistrictHeating.Interfaces.DHConnection Pipe1(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR25S
        dim(lambdaI=0.04))
             annotation (Placement(transformation(extent={{30,-32},{50,-12}})));

    Dwellings.Building building2(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem(
          QNom=building1.building.Q_design),
      redeclare IDEAS.Occupants.Extern.StROBe occupant(id=2, VZones=building1.building.VZones))
                 annotation (Placement(transformation(extent={{76,0},{96,20}})));
    DistrictHeating.Interfaces.DHConnection Pipe2(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR25S
        dim(lambdaI=0.04))
             annotation (Placement(transformation(extent={{76,-32},{96,-12}})));

    ProductionSites.GasHPAW                   idealModulatingProduction(
      VTan=0.950/5,
      hTan=1,
      m_flow_nominal_hpaw=1.19/5)
      annotation (Placement(transformation(extent={{-60,-32},{-40,-12}})));
  public
    Controls.Modulator modulator(start=2)
      annotation (Placement(transformation(extent={{-92,40},{-72,60}})));
    IDEAS.Fluid.Sensors.TemperatureTwoPort TSup(redeclare package Medium =
          IDEAS.Media.Water, m_flow_nominal=0.82)
      annotation (Placement(transformation(extent={{-20,-22},{-8,-10}})));
    IDEAS.Fluid.Sensors.TemperatureTwoPort TRet(redeclare package Medium =
          IDEAS.Media.Water, m_flow_nominal=0.82)
      annotation (Placement(transformation(extent={{-20,-34},{-32,-22}})));
    IDEAS.Controls.ControlHeating.HeatingCurves.HeatingCurve heatingCurve(
      TOut_nominal=273.15 - 10,
      TRoo=293.15 + 2,
      TRoo_nominal=293.15 + 2,
      TSup_nominal=273.15 + 55,
      TRet_nominal=273.15 + 45)
      annotation (Placement(transformation(extent={{-60,8},{-40,28}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=sim.Te)
      annotation (Placement(transformation(extent={{-94,14},{-74,34}})));
    Modelica.Blocks.Logical.Switch switch1
      annotation (Placement(transformation(extent={{-8,4},{-20,16}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=273.15 + 70)
      annotation (Placement(transformation(extent={{28,-10},{8,10}})));
  protected
    Buildings.Fluid.FixedResistances.Pipe inlet(
      nSeg=1,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      dp_nominal=0,
      linearizeFlowResistance=true,
      thicknessIns=0.01,
      lambdaIns=0.026,
      diameter=0.02,
      allowFlowReversal=true,
      m_flow_nominal=0.167,
      length=1,
      redeclare package Medium = IDEAS.Media.Water)
                 annotation (Placement(transformation(
          extent={{6,-6},{-6,6}},
          rotation=180,
          origin={62,-16})));
    Buildings.Fluid.FixedResistances.Pipe inlet1(
      nSeg=1,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      dp_nominal=0,
      linearizeFlowResistance=true,
      thicknessIns=0.01,
      lambdaIns=0.026,
      diameter=0.02,
      allowFlowReversal=true,
      m_flow_nominal=0.167,
      length=1,
      redeclare package Medium = IDEAS.Media.Water)
                 annotation (Placement(transformation(
          extent={{6,6},{-6,-6}},
          rotation=180,
          origin={62,-28})));
  equation

    DisPow = Pipe1.QLosses + Pipe2.QLosses;
    der(DisEn) = DisPow;
    connect(Pipe1.port_a3, building1.flowPort_return) annotation (Line(
        points={{38,-12},{38,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe1.port_b3, building1.flowPort_supply) annotation (Line(
        points={{42,-12},{42,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou.ports[1], Pipe1.port_a1) annotation (Line(
        points={{-8.88178e-016,-14},{-8.88178e-016,-16},{30,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe2.port_a3, building2.flowPort_return) annotation (Line(
        points={{84,-12},{84,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe2.port_b3, building2.flowPort_supply) annotation (Line(
        points={{88,-12},{88,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(modulator.on, building1.u)
      annotation (Line(points={{-71,50},{40,50},{40,20.8}}, color={255,0,255}));
    connect(modulator.on,building2. u) annotation (Line(points={{-71,50},{86,50},
            {86,20.8}}, color={255,0,255}));
    connect(idealModulatingProduction.port_b, TSup.port_a) annotation (Line(
          points={{-40,-16},{-32,-16},{-20,-16}}, color={0,127,255}));
    connect(TSup.port_b, Pipe1.port_a1)
      annotation (Line(points={{-8,-16},{30,-16}},         color={0,127,255}));
    connect(idealModulatingProduction.port_a, TRet.port_b)
      annotation (Line(points={{-40,-28},{-32,-28}}, color={0,127,255}));
    connect(TRet.port_a, Pipe1.port_b2)
      annotation (Line(points={{-20,-28},{30,-28}},color={0,127,255}));
    connect(heatingCurve.TOut,realExpression. y)
      annotation (Line(points={{-62,24},{-73,24}}, color={0,0,127}));
    connect(heatingCurve.TSup, idealModulatingProduction.TBase) annotation (Line(
          points={{-39,24},{-30,24},{-30,0},{-54,0},{-54,-11}}, color={0,0,127}));
    connect(switch1.u1, idealModulatingProduction.TBase) annotation (Line(points={
            {-6.8,14.8},{-2,14.8},{-2,24},{-30,24},{-30,0},{-54,0},{-54,-11}},
          color={0,0,127}));
    connect(switch1.y, idealModulatingProduction.THigh) annotation (Line(points={{
            -20.6,10},{-24,10},{-24,-4},{-46,-4},{-46,-11}}, color={0,0,127}));
    connect(switch1.u2, building1.u) annotation (Line(points={{-6.8,10},{4,10},{4,
            50},{40,50},{40,20.8}}, color={255,0,255}));
    connect(switch1.u3, realExpression1.y) annotation (Line(points={{-6.8,5.2},{-2,
            5.2},{-2,0},{7,0}}, color={0,0,127}));
    connect(Pipe1.port_b1, inlet.port_a)
      annotation (Line(points={{50,-16},{56,-16}}, color={0,127,255}));
    connect(inlet.port_b, Pipe2.port_a1)
      annotation (Line(points={{68,-16},{76,-16}}, color={0,127,255}));
    connect(Pipe1.port_a2, inlet1.port_a)
      annotation (Line(points={{50,-28},{56,-28}}, color={0,127,255}));
    connect(inlet1.port_b, Pipe2.port_b2)
      annotation (Line(points={{68,-28},{76,-28}}, color={0,127,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
      experiment(
        StopTime=604800,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput);
  end HaarhakkerROMIT;

  model HaarhakkerROMLT "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Modelica.SIunits.Power DisPow;
    Modelica.SIunits.Energy DisEn;

    Dwellings.Building building1(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium =
                   IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building1.building.VZones,
          id=1),
      modulating=false,
      redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem(
          QNom=building1.building.Q_design))
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
    DistrictHeating.Interfaces.DHConnection Pipe1(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR25S
        dim) annotation (Placement(transformation(extent={{8,-32},{28,-12}})));

    Dwellings.Building building2(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building1.building.VZones,
          id=2),
      modulating=false,
      redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem(
          QNom=building1.building.Q_design))
      annotation (Placement(transformation(extent={{60,0},{80,20}})));
    DistrictHeating.Interfaces.DHConnection Pipe2(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta districtHeatingPipe,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR25S
        dim) annotation (Placement(transformation(extent={{60,-32},{80,-12}})));

    ProductionSites.GasBeo gasBeoConstantGround(
      modulating=false,
      n=2) annotation (Placement(transformation(extent={{-40,-32},{-20,-12}})));
    IDEAS.Controls.ControlHeating.HeatingCurves.HeatingCurve heatingCurve(
      TOut_nominal=273.15 - 10,
      TRoo=293.15 + 2,
      TRoo_nominal=293.15 + 2,
      TSup_nominal=273.15 + 55,
      TRet_nominal=273.15 + 45)
      annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=sim.Te)
      annotation (Placement(transformation(extent={{-94,6},{-74,26}})));
  equation

    DisPow = Pipe1.QLosses + Pipe2.QLosses;
    der(DisEn) = DisPow;
    connect(Pipe1.port_a3, building1.flowPort_return) annotation (Line(
        points={{16,-12},{16,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe1.port_b3, building1.flowPort_supply) annotation (Line(
        points={{20,-12},{20,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou.ports[1], Pipe1.port_a1) annotation (Line(
        points={{-8.88178e-016,-10},{-8.88178e-016,-16},{8,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe2.port_a3, building2.flowPort_return) annotation (Line(
        points={{68,-12},{68,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe2.port_b3, building2.flowPort_supply) annotation (Line(
        points={{72,-12},{72,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe1.port_b1, Pipe2.port_a1)
      annotation (Line(points={{28,-16},{60,-16}}, color={0,127,255}));
    connect(Pipe1.port_a2, Pipe2.port_b2)
      annotation (Line(points={{28,-28},{44,-28},{60,-28}}, color={0,127,255}));
    connect(gasBeoConstantGround.port_b, Pipe1.port_a1)
      annotation (Line(points={{-20,-16},{8,-16}}, color={0,127,255}));
    connect(gasBeoConstantGround.port_a, Pipe1.port_b2)
      annotation (Line(points={{-20,-28},{8,-28}}, color={0,127,255}));
    connect(heatingCurve.TOut,realExpression. y)
      annotation (Line(points={{-62,16},{-73,16}}, color={0,0,127}));
    connect(heatingCurve.TSup, gasBeoConstantGround.TBase)
      annotation (Line(points={{-39,16},{-34,16},{-34,-11}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
      experiment(
        StopTime=604800,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput);
  end HaarhakkerROMLT;

  model PipeRK4 "Test for the simulation of pipe models with RK4"
    extends Modelica.Icons.Example;
    Buildings.Fluid.FixedResistances.Pipe pipe(
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal=0,
      linearizeFlowResistance=true,
      thicknessIns=0.01,
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=m_flow.k,
      allowFlowReversal=true,
      mSenFac=1,
      length=10,
      lambdaIns=0.08,
      nSeg=1,
      energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      T_start=273.15 + 70,
      diameter=0.02) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={30,0})));
    Annex60.Fluid.HeatExchangers.HeaterCooler_T
                                        idealHeater(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=m_flow.k,
      allowFlowReversal=true,
      dp_nominal=0)
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Buildings.Fluid.Movers.FlowControlled_m_flow fan(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=m_flow.k,
      allowFlowReversal=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
    Modelica.Blocks.Sources.Constant m_flow(k=0.42)
      annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
    Modelica.Blocks.Sources.Pulse inletT(
      amplitude=20,
      offset=273.15 + 50,
      period=3600)
      annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=m_flow.k,
      allowFlowReversal=true)
      annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    Annex60.Fluid.Sources.FixedBoundary bou(
      nPorts=1,
      redeclare package Medium = Annex60.Media.Water,
      T=273.15 + 50) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-60,-40})));
    Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=18)
      annotation (Placement(transformation(extent={{4,-4},{-4,4}},
          rotation=270,
          origin={30,-12})));
  equation

    connect(idealHeater.port_b, pipe.port_a) annotation (Line(points={{0,0},{20,
            0},{20,1.33227e-015}}, color={0,127,255}));
    connect(fan.port_b, idealHeater.port_a)
      annotation (Line(points={{-60,0},{-20,0}}, color={0,127,255}));
    connect(m_flow.y, fan.m_flow_in) annotation (Line(points={{-59,50},{-52,50},
            {-52,20},{-70.2,20},{-70.2,12}}, color={0,0,127}));
    connect(inletT.y, idealHeater.TSet) annotation (Line(points={{-19,50},{-12,
            50},{-12,20},{-30,20},{-30,6},{-22,6}}, color={0,0,127}));
    connect(pipe.port_b, senTem.port_a)
      annotation (Line(points={{40,0},{50,0},{60,0}}, color={0,127,255}));
    connect(senTem.port_b, fan.port_a) annotation (Line(points={{80,0},{90,0},{
            90,-20},{-90,-20},{-90,0},{-80,0}}, color={0,127,255}));
    connect(bou.ports[1], fan.port_a) annotation (Line(points={{-60,-30},{-60,
            -20},{-90,-20},{-90,0},{-80,0}}, color={0,127,255}));
    connect(pipe.heatPort, fixedTemperature.port)
      annotation (Line(points={{30,-5},{30,-8}}, color={191,0,0}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}})),
      experiment(
        StopTime=50000,
        __Dymola_fixedstepsize=15,
        __Dymola_Algorithm="Rkfix4"),
      __Dymola_experimentSetupOutput);
  end PipeRK4;
end Models;
