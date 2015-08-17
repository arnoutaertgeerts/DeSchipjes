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

  model S1 "Full model of a house in haarhakker street"

    //Extensions
    extends DeSchipjes.Interfaces.Scenario(
      redeclare Grids.Small.GridHT grid(modulating=false),
      redeclare ProductionSites.GasSun productionSite(n=2),
      TSupRad(u=70),
      TRetRad(u=50),
      TSupGrid(u=80),
      TRetGrid(u=63),
      Qbase(u=0),
      Qpeak(u=215.4));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
      experiment(
        StopTime=1.57785e+007,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput);
  end S1;

  model S2 "Full model of a house in haarhakker street"

    extends DeSchipjes.Interfaces.Scenario(
      redeclare Grids.Small.GridIT grid,
      redeclare ProductionSites.GasHPAW productionSite(n=2),
      Qpeak(u=154),
      TRetRad(u=35),
      TSupRad(u=45),
      TSupGrid(u=50),
      TRetGrid(u=40),
      Qbase(u=50));
  public
    Controls.Modulator modulator(start=2)
      annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
  equation
    connect(modulator.on, grid.u) annotation (Line(points={{-69,60},{-62,60},{
            -62,11}}, color={255,0,255}));
    connect(modulator.on, productionSite.modulation)
      annotation (Line(points={{-69,60},{28,60},{28,11}}, color={255,0,255}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}})),
      experiment(
        StopTime=2.62974e+006,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput);
  end S2;

  model S3 "Full model of a house in haarhakker street"

    extends DeSchipjes.Interfaces.Scenario(
      redeclare Grids.Small.GridIT grid,
      redeclare ProductionSites.GasBeoModulating productionSite(n=2),
      Qbase(u=28.8),
      TSupRad(u=45),
      TRetRad(u=35),
      TSupGrid(u=50),
      TRetGrid(u=40),
      Qpeak(u=154));
  public
    Controls.Modulator modulator(start=2)
      annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
  equation
    connect(modulator.on, grid.u) annotation (Line(points={{-69,60},{-62,60},{
            -62,11}}, color={255,0,255}));
    connect(modulator.on, productionSite.modulation) annotation (Line(points={{
            -69,60},{-20,60},{28,60},{28,11}}, color={255,0,255}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}})),
      experiment(
        StopTime=7.88923e+006,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput);
  end S3;

  model S4 "Full model of a house in haarhakker street"

    //Extensions
    extends DeSchipjes.Interfaces.Scenario(
      redeclare Grids.Small.GridLT grid(modulating=false),
      redeclare ProductionSites.GasBeo productionSite(n=2),
      Qbase(u=42.8),
      TSupGrid(u=50),
      TRetGrid(u=40),
      TSupRad(u=45),
      TRetRad(u=35));

    annotation (experiment(
        StopTime=2.6e+006,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"), __Dymola_experimentSetupOutput);
  end S4;

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

  model Occupants

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
      annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  end Occupants;
end Models;
