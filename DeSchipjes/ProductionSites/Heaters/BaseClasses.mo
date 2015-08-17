within DeSchipjes.ProductionSites.Heaters;
package BaseClasses

  model HPAW "Model of a non-modulating Air waterr HP"
    import DeSchipjes;

    //Extensions
    extends IDEAS.Fluid.Interfaces.TwoPortHeatMassExchanger(
      redeclare final IDEAS.Fluid.MixingVolumes.MixingVolume vol(
        nPorts=3, V=m/rho_default,
        prescribedHeatFlowRate=true,
        mSenFac=1 + Cp/(4180*m)),
      final showDesignFlowDirection=true);

    //Parameters
    parameter Modelica.SIunits.Mass m=10 "Water contents of the heatpump";
    parameter Modelica.SIunits.Power QNom=QNomRef
      "Nominal power of the modeled heatpump";
    parameter Modelica.SIunits.Power QNomRef
      "Nominal power of the heatpump for which the data was produced";

    final parameter Real scaler=QNom/QNomRef;

    parameter Modelica.SIunits.HeatCapacity Cp=0
      "Heat capacity of the dry lumped material";

    Modelica.SIunits.Power QEvaporator=-prescribedHeatFlow.port.Q_flow;
    Modelica.SIunits.Power Qren=QEvaporator-PEl*2.5;
    Real COP;
    Modelica.SIunits.Power Q "Heat delivered to the evaporator";

    //Interfaces
     Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,108})));

    //Components
    Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={30,-34})));
    Modelica.Blocks.Tables.CombiTable2D COPTable(table=[0,-15,-10,-7,-2,2,7,12,
          18,30; 30,4820,5576,6023,6892,7642,10208,11652,13518,13518; 35,4590,
          5279,5685,6484,7177,9578,10931,12692,12692; 40,4430,5056,5430,6174,
          6824,9100,10386,12072,12072; 45,4320,4906,5255,5957,6576,8765,10008,
          11647,11647; 50,4270,4824,5155,5828,6426,8564,9786,11408,11408],
        smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{28,60},{48,80}})));
    DeSchipjes.Controls.OnOff onOff(ymin=0)
      annotation (Placement(transformation(extent={{-36,-44},{-24,-56}})));
    Modelica.Blocks.Tables.CombiTable2D powerTable(
                                                  table=[0,-15,-10,-7,-2,2,7,12,18,
          30; 30,4820,5576,6023,6892,7642,10208,11652,13518,13518; 35,4590,5279,5685,
          6484,7177,9578,10931,12692,12692; 40,4430,5056,5430,6174,6824,9100,10386,
          12072,12072; 45,4320,4906,5255,5957,6576,8765,10008,11647,11647; 50,4270,
          4824,5155,5828,6426,8564,9786,11408,11408], smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{20,30},{40,50}})));
    Modelica.Blocks.Math.Gain gain1(k=scaler)
      annotation (Placement(transformation(extent={{74,30},{94,50}})));
    Modelica.Blocks.Interfaces.RealOutput PEl annotation (Placement(
          transformation(extent={{100,30},{120,50}}), iconTransformation(extent={{
              100,30},{120,50}})));
    DeSchipjes.Controls.OnOff onOff1(
                                    ymin=0)
      annotation (Placement(transformation(extent={{48,34},{60,46}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=m_flow)
      annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.001)
      annotation (Placement(transformation(extent={{-52,36},{-44,44}})));
    Modelica.Blocks.Logical.And heaterOn
      annotation (Placement(transformation(extent={{-32,46},{-20,34}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=Q)
      annotation (Placement(transformation(extent={{-66,-60},{-46,-40}})));
    DeSchipjes.Controls.OnOff onOff2(
                                    ymin=0)
      annotation (Placement(transformation(extent={{60,64},{72,76}})));
  equation

    COP=onOff2.y;
    Q=PEl*COP;

    connect(prescribedHeatFlow.port, vol.heatPort) annotation (Line(points={{20,-34},
            {20,-34},{-20,-34},{-20,-10},{-9,-10}},                color={191,0,0}));
    connect(powerTable.y, onOff1.u1)
      annotation (Line(points={{41,40},{46.8,40}},  color={0,0,127}));
    connect(onOff1.y, gain1.u)
      annotation (Line(points={{60.6,40},{72,40}},color={0,0,127}));
    connect(realExpression.y, greaterThreshold.u)
      annotation (Line(points={{-69,40},{-52.8,40}}, color={0,0,127}));
    connect(greaterThreshold.y, heaterOn.u1)
      annotation (Line(points={{-43.6,40},{-33.2,40}}, color={255,0,255}));
    connect(gain1.y, PEl)
      annotation (Line(points={{95,40},{110,40}}, color={0,0,127}));
    connect(u, heaterOn.u2) annotation (Line(points={{0,108},{0,68},{-40,68},{
            -40,44.8},{-33.2,44.8}}, color={255,0,255}));
    connect(heaterOn.y, onOff1.u) annotation (Line(points={{-19.4,40},{-12,40},{-12,
            20},{54,20},{54,32.8}}, color={255,0,255}));
    connect(heaterOn.y, onOff.u) annotation (Line(points={{-19.4,40},{-12,40},{
            -12,20},{-30,20},{-30,-42.8}}, color={255,0,255}));
    connect(onOff.u1, realExpression1.y)
      annotation (Line(points={{-37.2,-50},{-45,-50}}, color={0,0,127}));
    connect(onOff2.u1, COPTable.y)
      annotation (Line(points={{58.8,70},{49,70}}, color={0,0,127}));
    connect(onOff2.u, onOff1.u) annotation (Line(points={{66,62.8},{66,20},{54,20},
            {54,32.8}}, color={255,0,255}));
    connect(onOff.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{-23.4,-50},
            {52,-50},{52,-34},{40,-34}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Line(
            points={{-60,80},{-60,22},{-40,42},{-20,22},{0,42},{20,22},{40,42},{60,
                22},{60,80}},
            color={28,108,200},
            thickness=0.5), Text(
            extent={{70,60},{100,20}},
            lineColor={0,128,255},
            lineThickness=0.5,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="E")}));
  end HPAW;

  model HPWW "Model of a non-modulating water water HP"
    import DeSchipjes;

    //Extensions
    extends IDEAS.Fluid.Interfaces.FourPortHeatMassExchanger(
      redeclare final IDEAS.Fluid.MixingVolumes.MixingVolume vol2(
        nPorts=3, V=m2/rho2_nominal,
        prescribedHeatFlowRate=true,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        mSenFac=1 + Cp/(4180*m2)),
      vol1(V=m1/rho1_nominal,
        prescribedHeatFlowRate=true,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        mSenFac=1 + Cp/(4180*m1)));

    //Parameters
    parameter Modelica.SIunits.Mass m1=20 "Water contents of the condensor";
    parameter Modelica.SIunits.Mass m2=20 "Water contents of the evaporator";
    parameter Modelica.SIunits.Power QNom=QNomRef
      "Nominal power of the modeled heatpump";
    parameter Modelica.SIunits.Power QNomRef
      "Nominal power of the heatpump for which the data was produced";
    parameter Modelica.SIunits.MassFlowRate m_flow_min=QNom/(4*4180)
      "Minimal massflowrate of the condensor. Defaults to a temperature difference of 4 degrees at nominal power";

    parameter Modelica.SIunits.HeatCapacity Cp=0
      "Heat capacity of the dry lumped material";

    final parameter Real scaler=QNom/QNomRef;

    //Variables
    Modelica.SIunits.Power P;
    Modelica.SIunits.Power Q1;
    Modelica.SIunits.Power Q2;
    Modelica.SIunits.Power QEvaporator;
    Modelica.SIunits.Power QCondensor;
    Modelica.SIunits.Power Qren;
    Real COP;

    //Interfaces
     Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,108})));

    //Components
  //protected
    Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,-40})));
    Modelica.Blocks.Tables.CombiTable2D COPTable(smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments)
      annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
    Modelica.Blocks.Math.Gain gain(k=scaler)
      annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
    Modelica.Blocks.Tables.CombiTable2D powerTable
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Math.Gain gain1(k=scaler)
      annotation (Placement(transformation(extent={{84,-6},{96,6}})));
    DeSchipjes.Controls.OnOff onOff1(
                                    ymin=0)
      annotation (Placement(transformation(extent={{-6,-14},{6,-26}})));
    DeSchipjes.Controls.OnOff onOff2(
                                    ymin=0)
      annotation (Placement(transformation(extent={{66,6},{78,-6}})));
    Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-28,40})));
    Modelica.Blocks.Math.Gain gain2(
                                   k=scaler)
      annotation (Placement(transformation(extent={{-54,34},{-42,46}})));
    DeSchipjes.Controls.OnOff onOff3(
                                    ymin=0)
      annotation (Placement(transformation(extent={{-72,34},{-60,46}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=-Q1)
      annotation (Placement(transformation(extent={{-98,30},{-78,50}})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=Q2)
      annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
    Modelica.Blocks.Sources.RealExpression realExpression2(y=P)
      annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  public
    Modelica.Blocks.Interfaces.RealOutput PEl annotation (Placement(
          transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={
              {100,-10},{120,10}})));
    Buildings.Fluid.Sensors.Temperature Ti1(redeclare package Medium = Medium1)
      annotation (Placement(transformation(extent={{-54,60},{-42,72}})));
    Modelica.Blocks.Sources.RealExpression realExpression3(y=vol1.T - 273.15)
      annotation (Placement(transformation(extent={{-96,-38},{-76,-18}})));
    Modelica.Blocks.Sources.RealExpression realExpression4(y=Ti2.T - 273.15)
      annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TEvaporator
      annotation (Placement(transformation(extent={{26,-54},{38,-42}})));
    Modelica.Blocks.Sources.RealExpression realExpression5(y=m1_flow)
      annotation (Placement(transformation(extent={{14,30},{34,50}})));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=
          m_flow_min)
      annotation (Placement(transformation(extent={{42,36},{50,44}})));
    Modelica.Blocks.Logical.And heaterOn
      annotation (Placement(transformation(extent={{62,46},{74,34}})));
    DeSchipjes.Controls.OnOff onOff4(
                                    ymin=0)
      annotation (Placement(transformation(extent={{6,-30},{18,-42}})));
    Buildings.Fluid.Sensors.Temperature Ti2(redeclare package Medium = Medium1)
      annotation (Placement(transformation(extent={{94,-46},{82,-34}})));
  equation

    P = powerTable.y;
    COP = onOff4.y;

    Q2 = P*COPTable.y;
    Q1 = Q2*(1-1/COPTable.y);
    Qren = QEvaporator - PEl*2.5;

    QEvaporator = -prescribedHeatFlow.port.Q_flow;
    QCondensor = -prescribedHeatFlow1.port.Q_flow;
    connect(gain.y, prescribedHeatFlow.Q_flow)
      annotation (Line(points={{41,-20},{60,-20},{60,-30}},
                                                         color={0,0,127}));
    connect(prescribedHeatFlow.port, vol2.heatPort) annotation (Line(points={{60,-50},
            {60,-50},{60,-60},{12,-60}}, color={191,0,0}));
    connect(onOff1.y, gain.u)
      annotation (Line(points={{6.6,-20},{18,-20}}, color={0,0,127}));
    connect(gain2.y, prescribedHeatFlow1.Q_flow) annotation (Line(points={{-41.4,40},
            {-41.4,40},{-38,40}}, color={0,0,127}));
    connect(onOff3.y, gain2.u) annotation (Line(points={{-59.4,40},{-59.4,40},{-55.2,
            40}}, color={0,0,127}));
    connect(prescribedHeatFlow1.port, vol1.heatPort) annotation (Line(points={{-18,
            40},{-14,40},{-14,60},{-10,60}}, color={191,0,0}));
    connect(onOff3.u1, realExpression.y) annotation (Line(points={{-73.2,40},{-73.2,
            40},{-77,40}}, color={0,0,127}));
    connect(onOff1.u1, realExpression1.y)
      annotation (Line(points={{-7.2,-20},{-11,-20}}, color={0,0,127}));
    connect(onOff2.u1, realExpression2.y)
      annotation (Line(points={{64.8,0},{64.8,0},{61,0}},  color={0,0,127}));
    connect(PEl, gain1.y)
      annotation (Line(points={{110,0},{96.6,0}}, color={0,0,127}));
    connect(onOff3.u, onOff1.u) annotation (Line(points={{-66,32.8},{-66,20},{0,20},
            {0,-12.8}}, color={255,0,255}));
    connect(onOff2.u, onOff1.u) annotation (Line(points={{72,7.2},{72,20},{0,20},{
            0,-12.8}}, color={255,0,255}));
    connect(port_a1, Ti1.port)
      annotation (Line(points={{-100,60},{-74,60},{-48,60}}, color={0,127,255}));
    connect(realExpression4.y, powerTable.u1) annotation (Line(points={{-75,0},{-68,
            0},{-68,6},{-62,6}}, color={0,0,127}));
    connect(realExpression3.y, powerTable.u2) annotation (Line(points={{-75,-28},{
            -72,-28},{-72,-6},{-62,-6}}, color={0,0,127}));
    connect(realExpression3.y, COPTable.u2) annotation (Line(points={{-75,-28},{-72,
            -28},{-72,-36},{-62,-36}}, color={0,0,127}));
    connect(COPTable.u1, powerTable.u1) annotation (Line(points={{-62,-24},{-68,-24},
            {-68,6},{-62,6}}, color={0,0,127}));
    connect(TEvaporator.port, vol2.heatPort) annotation (Line(points={{26,-48},
            {24,-48},{22,-48},{22,-60},{12,-60}}, color={191,0,0}));
    connect(greaterThreshold.u, realExpression5.y)
      annotation (Line(points={{41.2,40},{35,40}}, color={0,0,127}));
    connect(greaterThreshold.y, heaterOn.u1)
      annotation (Line(points={{50.4,40},{60.8,40}}, color={255,0,255}));
    connect(u, heaterOn.u2) annotation (Line(points={{0,108},{0,86},{56,86},{56,44.8},
            {60.8,44.8}}, color={255,0,255}));
    connect(heaterOn.y, onOff1.u) annotation (Line(points={{74.6,40},{80,40},{80,20},
            {0,20},{0,-12.8}}, color={255,0,255}));
    connect(onOff2.y, gain1.u)
      annotation (Line(points={{78.6,0},{82.8,0},{82.8,0}}, color={0,0,127}));
    connect(COPTable.y, onOff4.u1) annotation (Line(points={{-39,-30},{-36,-30},{-36,
            -36},{4.8,-36}}, color={0,0,127}));
    connect(onOff4.u, onOff1.u) annotation (Line(points={{12,-28.8},{12,-4},{0,-4},
            {0,-12.8}}, color={255,0,255}));
    connect(port_a2, Ti2.port) annotation (Line(points={{100,-60},{100,-52},{
            100,-46},{88,-46}}, color={0,127,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={Line(
            points={{-60,80},{-60,22},{-40,42},{-20,22},{0,42},{20,22},{40,42},{60,
                22},{60,80}},
            color={28,108,200},
            thickness=0.5),
          Line(
            points={{94,60},{100,60}},
            color={28,108,200},
            thickness=0.5),                            Line(
            points={{-60,29},{-60,-29},{-40,-9},{-20,-29},{0,-9},{20,-29},{40,-9},
                {60,-29},{60,29}},
            color={255,0,0},
            thickness=0.5,
            origin={2,-51},
            rotation=180),
          Text(
            extent={{70,20},{100,-20}},
            lineColor={0,128,255},
            lineThickness=0.5,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            textString="E")}));
  end HPWW;

  model BoilerHeatSource
    //Extensions
    extends IDEAS.Fluid.Production.BaseClasses.Partial3DHeatSource(
      tableInput1(y=Tin2 - 273.15),
      tableInput2(y=m_flow2/m_flow_nominal),
      redeclare Boiler data);

    //Parameters
    constant Real kgps2lph=3600/Medium.density(Medium.setState_pTX(Medium.p_default, Medium.T_default, Medium.X_default))*1000;

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end BoilerHeatSource;

  record Boiler "Heater used in deschipjes"
  //Extensions
    extends IDEAS.Fluid.Production.BaseClasses.PartialModulatingRecord(
      useTin2=true,
      useTout2=true,
      useTin1=false,
      efficiencyData=true,
      n=5,
      QNomRef=10100,
      etaRef=1,
      modulationVector={30,45,60,80,100},
      heat={
        [0.0,0.05,0.06667,0.1,0.1667,0.25,
          0.35,0.5,0.6667,0.8333,1; 20,0.9751,0.9768,0.981,0.9847,0.9882,0.992,0.992,
          0.992,0.992,0.992; 30,0.962,0.9636,0.968,0.9735,0.9776,0.982,0.982,0.982,
          0.982,0.982; 40,0.938,0.938,0.938,0.942,0.942,0.953,0.953,0.953,0.953,0.953;
          50,0.902,0.902,0.9035,0.905,0.905,0.91,0.91,0.91,0.91,0.91; 55,0.87,0.87,
          0.87,0.87,0.87,0.87,0.87,0.87,0.87,0.87; 60,0.87,0.87,0.87,0.87,0.87,0.87,
          0.87,0.87,0.87,0.87; 70,0.863,0.863,0.863,0.863,0.863,0.863,0.863,0.863,
          0.863,0.863; 80,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852],
        [0.0,0.05,0.06667,0.1,0.1667,0.25,
          0.35,0.5,0.6667,0.8333,1; 20,0.9707,0.9707,0.9725,0.9775,0.9804,0.9832,0.9873,
          0.9877,0.9877,0.9877; 30,0.9551,0.9551,0.9568,0.9619,0.9667,0.97,0.9746,
          0.9751,0.9751,0.9751; 40,0.9303,0.9303,0.9303,0.9303,0.9343,0.9343,0.9343,
          0.9453,0.9453,0.9453; 50,0.8945,0.8945,0.8945,0.8971,0.8975,0.8975,0.8975,
          0.9025,0.9025,0.9025; 55,0.8683,0.8683,0.8683,0.8683,0.8683,0.8683,0.8683,
          0.8683,0.8683,0.8683; 60,0.8683,0.8683,0.8683,0.8683,0.8683,0.8683,0.8683,
          0.8683,0.8683,0.8683; 70,0.8617,0.8617,0.8617,0.8617,0.8617,0.8617,0.8617,
          0.8617,0.8617,0.8617; 80,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852,
          0.852,0.852],
        [0.0,0.05,0.06667,0.1,0.1667,0.25,
          0.35,0.5,0.6667,0.8333,1; 20,0.9664,0.9664,0.9665,0.971,0.974,0.9766,0.9796,
          0.983,0.9834,0.9834; 30,0.9483,0.9483,0.9483,0.9528,0.9562,0.9604,0.9639,
          0.9678,0.9683,0.9683; 40,0.9226,0.9226,0.9226,0.9226,0.9226,0.9226,0.9226,
          0.9226,0.9376,0.93766; 50,0.887,0.887,0.887,0.89,0.887,0.89,0.89,0.89,0.895,
          0.895; 55,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,
          0.8666; 60,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,0.8666,
          0.8666; 70,0.8604,0.8604,0.8604,0.8604,0.8604,0.8604,0.8604,0.8604,0.8604,
          0.8604; 80,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852],
        [0.0,0.05,0.06667,0.1,0.1667,0.25,
          0.35,0.5,0.6667,0.8333,1; 20,0.9607,0.9607,0.9607,0.9622,0.9663,0.9686,0.9713,
          0.9739,0.9764,0.9777; 30,0.9391,0.9391,0.9391,0.94,0.9447,0.9476,0.9519,
          0.9548,0.9577,0.9591; 40,0.9123,0.9123,0.9123,0.9123,0.9123,0.9163,0.9163,
          0.9163,0.9163,0.9273; 50,0.887,0.887,0.887,0.887,0.8778,0.88,0.88,0.88,0.88,
          0.885; 55,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,
          0.8643; 60,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,0.8643,
          0.8643; 70,0.8587,0.8587,0.8587,0.8587,0.8587,0.8587,0.8587,0.8587,0.8587,
          0.8587; 80,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852,0.852],
        [0.0,0.05,0.06667,0.1,0.1667,
          0.25,0.35,0.5,0.6667,0.8333,1; 20,0.955,0.955,0.955,0.9551,0.9581,0.9613,
          0.9638,0.9661,0.9682,0.9702; 30,0.93,0.93,0.93,0.93,0.9331,0.9363,0.9401,
          0.9433,0.9456,0.948; 40,0.902,0.902,0.902,0.902,0.902,0.902,0.906,0.906,
          0.906,0.906; 50,0.867,0.867,0.867,0.867,0.867,0.869,0.87,0.87,0.87,0.87;
          55,0.862,0.862,0.862,0.862,0.862,0.862,0.862,0.862,0.862,0.862; 60,0.862,
          0.862,0.862,0.862,0.862,0.862,0.862,0.862,0.862,0.862; 70,0.857,0.857,0.857,
          0.857,0.857,0.857,0.857,0.857,0.857,0.857; 80,0.852,0.852,0.852,0.852,0.852,
          0.852,0.852,0.852,0.852,0.852]},
      power=heat,
      m2 = 400,
      m2_flow_nominal = 0.15,
      dp2_nominal = 0);

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})));
  end Boiler;
end BaseClasses;
