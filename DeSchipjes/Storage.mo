within DeSchipjes;
package Storage
  model Comparison
    IDEAS.Fluid.Storage.StorageTank_OneIntHX storageTank_OneIntHX
      annotation (Placement(transformation(extent={{-8,34},{10,60}})));
  end Comparison;

  model BuildingsStorage
    extends Setup(
      solColSup(nPorts=1),
      toSolCol(nPorts=1),
      hotWatOut(nPorts=1),
      bouCol(nPorts=1));

    Buildings.Fluid.Storage.StratifiedEnhancedInternalHex tan(
      m_flow_nominal=0.001,
      VTan=0.151416,
      dIns=0.0762,
      CHex=40,
      Q_flow_nominal=0.278*4200*20,
      mHex_flow_nominal=0.278,
      hTan=1.746,
      hHex_a=0.995,
      energyDynamicsHex=Modelica.Fluid.Types.Dynamics.FixedInitial,
      hHex_b=0.1,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      TTan_nominal=293.15,
      THex_nominal=323.15,
      redeclare package Medium = Buildings.Media.Water,
      redeclare package MediumHex = Buildings.Media.Water)
      "Tank with heat exchanger"
      annotation (Placement(transformation(extent={{-10,-6},{10,14}})));
  equation
    connect(solColSup.ports[1], tan.portHex_a) annotation (Line(
        points={{-60,0},{-60,0.2},{-10,0.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(toSolCol.ports[1], tan.portHex_b) annotation (Line(
        points={{-60,-50},{-40,-50},{-40,-4},{-10,-4}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(tan.port_a, hotWatOut.ports[1]) annotation (Line(
        points={{-10,4},{-20,4},{-20,50},{-60,50}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(tan.port_b, bouCol.ports[1]) annotation (Line(
        points={{10,4},{20,4},{20,0},{54,0}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end BuildingsStorage;

  model IDEASStorage
    extends Setup(
      solColSup(nPorts=1),
      toSolCol(nPorts=1),
      hotWatOut(nPorts=1),
      bouCol(nPorts=1));

    IDEAS.Fluid.Storage.StorageTank_OneIntHX storageTank_OneIntHX(
      redeclare package MediumHX = Buildings.Media.Water,
      redeclare package Medium = Buildings.Media.Water,
      nbrNodes=4,
      volumeTank=0.15,
      heightTank=1.746,
      m_flow_nominal_HX=0.278)
      annotation (Placement(transformation(extent={{-20,-8},{-2,18}})));
  equation
    connect(solColSup.ports[1], storageTank_OneIntHX.portHXUpper) annotation (
        Line(
        points={{-60,0},{-20,0}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(storageTank_OneIntHX.portHXLower, toSolCol.ports[1]) annotation (
        Line(
        points={{-20,-6},{-40,-6},{-40,-50},{-60,-50}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(storageTank_OneIntHX.port_a, hotWatOut.ports[1]) annotation (Line(
        points={{-2,16},{0,16},{0,50},{-60,50}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(storageTank_OneIntHX.port_b, bouCol.ports[1]) annotation (Line(
        points={{-2,-6},{20,-6},{20,0},{54,0}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics),
      experiment(
        StopTime=3600,
        __Dymola_fixedstepsize=10,
        __Dymola_Algorithm="Rkfix4"),
      __Dymola_experimentSetupOutput);
  end IDEASStorage;

  partial model Setup
    Buildings.Fluid.Sources.Boundary_pT hotWatOut(redeclare package Medium =
          Buildings.Media.Water) "Hot water outlet"
                                   annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={-70,50})));
    Buildings.Fluid.Sources.MassFlowSource_T solColSup(
      m_flow=0.278,
      T=343.15,
      redeclare package Medium = Buildings.Media.Water)
      "Water from solar collector"
                annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={-70,0})));
    Buildings.Fluid.Sources.Boundary_pT toSolCol(
      T=283.15, redeclare package Medium = Buildings.Media.Water)
      "Water to solar collector"           annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={-70,-50})));
    Buildings.Fluid.Sources.MassFlowSource_T bouCol(
      use_T_in=false,
      nPorts=1,
      m_flow=0.1,
      T=283.15,
      redeclare package Medium = Buildings.Media.Water) "Cold water boundary"
      annotation (Placement(transformation(extent={{74,-10},{54,10}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end Setup;
end Storage;
