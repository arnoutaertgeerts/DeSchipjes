within DeSchipjes.Grids;
package Small

  partial model PartialGrid
    extends Interfaces.BaseClasses.Grid;

    Dwellings.Building building1(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium =
                   IDEAS.Media.Air),
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building1.building.VZones,
          id=3),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      modulating=modulating)
      annotation (Placement(transformation(extent={{48,10},{68,30}})));
  public
    DistrictHeating.Interfaces.DHConnection Pipe1(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      H=0.6,
      lambdaG=1.2,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
        districtHeatingPipe(redeclare
          DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
          baseConfiguration),
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR32S
        dim(lambdaI=0.04))
             annotation (Placement(transformation(extent={{48,-22},{68,-2}})));
    Dwellings.Building building2(
      isDH=true,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      modulating=modulating,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building1.building.VZones,
          id=1)) annotation (Placement(transformation(extent={{94,10},{114,30}})));
    DistrictHeating.Interfaces.DHConnection Pipe2(
      redeclare package Medium = IDEAS.Media.Water,
      m_flow_nominal=0.1,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dynamicBalance=false,
      linearizeFlowResistance=true,
      allowFlowReversal=true,
      redeclare DistrictHeating.Pipes.DoublePipes.DHPlugDelta
        districtHeatingPipe(redeclare
          DistrictHeating.Pipes.DoublePipes.Configurations.TwinPipeGround
          baseConfiguration),
      redeclare
        DistrictHeating.Pipes.BaseClasses.PipeConfig.IsoPlusDoubleStandard.IsoPlusDR20S
        dim(lambdaI=0.04))
             annotation (Placement(transformation(extent={{94,-22},{114,-2}})));
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
          origin={80,-6})));
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
          origin={80,-18})));
  equation

    Qgrid = (port_a.h_outflow-port_b.h_outflow)*port_a.m_flow;

    Qdis = Pipe1.QLosses + Pipe2.QLosses;

    Qhea = building1.heatingSystem.Qhea + building2.heatingSystem.Qhea;
    Qsh = building1.heatingSystem.Qsh + building2.heatingSystem.Qsh;
    Qdhw = building1.heatingSystem.Qdhw + building2.heatingSystem.Qdhw;

    Qsto = building1.heatingSystem.Qsto + building2.heatingSystem.Qsto;

    Qhp = building1.heatingSystem.Qhp + building2.heatingSystem.Qhp;
    PboosEl = building1.heatingSystem.PboosEl + building2.heatingSystem.PboosEl;

    connect(Pipe1.port_a3,building1. flowPort_return) annotation (Line(
        points={{56,-2},{56,10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe1.port_b3,building1. flowPort_supply) annotation (Line(
        points={{60,-2},{60,10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe2.port_a3,building2. flowPort_return) annotation (Line(
        points={{102,-2},{102,10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe2.port_b3,building2. flowPort_supply) annotation (Line(
        points={{106,-2},{106,10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(Pipe1.port_b1,inlet. port_a)
      annotation (Line(points={{68,-6},{74,-6}},   color={0,127,255}));
    connect(inlet.port_b,Pipe2. port_a1)
      annotation (Line(points={{86,-6},{94,-6}},   color={0,127,255}));
    connect(Pipe1.port_a2,inlet1. port_a)
      annotation (Line(points={{68,-18},{74,-18}}, color={0,127,255}));
    connect(inlet1.port_b,Pipe2. port_b2)
      annotation (Line(points={{86,-18},{94,-18}}, color={0,127,255}));
    connect(Pipe1.port_a1, port_a) annotation (Line(points={{48,-6},{12,-6},{-32,-6},
            {-32,60},{-100,60}}, color={0,127,255}));
    connect(Pipe1.port_b2, port_b) annotation (Line(points={{48,-18},{-32,-18},{-32,
            -60},{-100,-60}}, color={0,127,255}));
    connect(u, building1.u) annotation (Line(points={{80,110},{80,110},{80,40},
            {58,40},{58,30.8}}, color={255,0,255}));
    connect(u, building2.u) annotation (Line(points={{80,110},{80,40},{104,40},
            {104,30.8}}, color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{240,100}})));
  end PartialGrid;

  model GridHT
    extends PartialGrid(
      building1(
        redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
          heatingSystem(
            QNom=building1.building.Q_design,
            TSupply=TSupRad,
            TReturn=TRetRad,
            TStorage=TStorage)),
      building2(
        redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
          heatingSystem(
            QNom=building1.building.Q_design,
            TSupply=TSupRad,
            TReturn=TRetRad,
            TStorage=TStorage)));

  end GridHT;

  model GridIT
    extends PartialGrid(
       building1(
        redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem
          heatingSystem(
            QNom=building1.building.Q_design,
            TSupply=TSupRad,
            TReturn=TRetRad,
            TStorage=TStorage)),
      building2(
        redeclare DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem
          heatingSystem(
            QNom=building1.building.Q_design,
            TSupply=TSupRad,
            TReturn=TRetRad,
            TStorage=TStorage)));
  equation

  end GridIT;

  model GridLT
    extends PartialGrid(
      building1(
        redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
          heatingSystem(
            QNom=building1.building.Q_design,
            TSupply=TSupRad,
            TReturn=TRetRad,
            TStorage=TStorage)),
      building2(
        redeclare DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem
          heatingSystem(
            QNom=building1.building.Q_design,
            TSupply=TSupRad,
            TReturn=TRetRad,
            TStorage=TStorage)));
  equation

  end GridLT;
end Small;
