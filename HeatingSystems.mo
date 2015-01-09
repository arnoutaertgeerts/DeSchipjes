within DeSchipjes;
package HeatingSystems
  model RadiatorsBoiler
    "CV installatie op basis van radiatoren en een gasketel"

    replaceable package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater;

    //Extensions
    extends IDEAS.Interfaces.BaseClasses.HeatingSystem(
      nEmbPorts=0);

    //Parameters
    parameter Modelica.SIunits.Temperature TSupply = 273.15+75;
    parameter Modelica.SIunits.Temperature TReturn = 273.15+65;

    final parameter Modelica.SIunits.MassFlowRate[nZones] m_flow_nominal = QNom/(4180.6*(TSupply-TReturn))
      "Nominal mass flow rates";

    //Components
    IDEAS.Fluid.Production.IdealHeater boiler(
      redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal))
                                         annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={80,30})));
    IDEAS.Fluid.HeatExchangers.Radiators.Radiator[nZones] radiator(
      QNom=QNom,
      TInNom=TSupply,
      TOutNom=TReturn,
      redeclare package Medium = Medium)
      annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-82,36})));

    Modelica.Blocks.Sources.RealExpression realExpression1(y=273.15 + 77)
      annotation (Placement(transformation(extent={{122,42},{102,62}})));
    IDEAS.Controls.Discrete.HysteresisRelease hysteresisRelease[nZones](revert=true)
      annotation (Placement(transformation(extent={{-68,-44},{-48,-24}})));
    Modelica.Blocks.Sources.RealExpression[nZones] uLow(y=273.15 + 20)
      annotation (Placement(transformation(extent={{-104,-66},{-84,-46}})));
    Modelica.Blocks.Sources.RealExpression[nZones] uHigh(y=273.15 + 21)
      annotation (Placement(transformation(extent={{-104,-32},{-84,-12}})));
    Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=293.15)
      "fixed temperature to simulate heat losses of hydraulic components"
      annotation (Placement(transformation(
          extent={{8,-8},{-8,8}},
          rotation=-90,
          origin={84,-8})));
    IDEAS.Fluid.Sources.FixedBoundary bou(
      redeclare package Medium = Medium,
      use_T=false,
      nPorts=1)
      annotation (Placement(transformation(extent={{26,-14},{46,6}})));
    Modelica.Blocks.Sources.RealExpression realExpression2(y=273.15 + 70)
      annotation (Placement(transformation(extent={{80,50},{60,70}})));
    IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow[nZones] pumpSupply(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal,
      includePipes=true,
      dpValve_nominalBot=0,
      use_powerCharacteristic=false,
      KvBot=10,
      useBalancingValve=true,
      measureSupplyT=false,
      measureReturnT=false,
      measurePower=false)
      annotation (Placement(transformation(extent={{-6,20},{-26,40}})));
    IDEAS.Fluid.BaseCircuits.MixingCircuit_Tset mixingCircuit(
      redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal),
      includePipes=true,
      KvBot=10,
      dpValve_nominalBot=0,
      useBalancingValve=true,
      CvDataBot=IDEAS.Fluid.Types.CvTypes.Kv,
      measureSupplyT=false,
      measureReturnT=false,
      mMix=1)  annotation (Placement(transformation(extent={{56,20},{36,40}})));
    Modelica.Blocks.Math.Gain gain[nZones](k=m_flow_nominal)
      annotation (Placement(transformation(extent={{-38,-44},{-18,-24}})));
    IDEAS.Fluid.BaseCircuits.ParallelPipesSplitter parallelPipesSplitter(
      redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal),
      V=0.1,
      n=nZones)
      annotation (Placement(transformation(extent={{26,20},{6,40}})));
  equation
    QHeaSys = -sum(radiator.heatPortCon.Q_flow) - sum(radiator.heatPortRad.Q_flow);
    P[1] = 0;
    Q[1] = 0;

    connect(radiator.heatPortRad, heatPortRad) annotation (Line(
        points={{-91,46},{-92,46},{-92,62},{-130,62},{-130,-20},{-200,-20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(radiator.heatPortCon, heatPortCon) annotation (Line(
        points={{-87,46},{-86,46},{-86,72},{-160,72},{-160,20},{-200,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(realExpression1.y, boiler.TSet) annotation (Line(
        points={{101,52},{84,52},{84,42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TSensor, hysteresisRelease.u) annotation (Line(
        points={{-204,-60},{-118,-60},{-118,-34},{-70,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(uLow.y, hysteresisRelease.uLow) annotation (Line(
        points={{-83,-56},{-76,-56},{-76,-42},{-70,-42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(uHigh.y, hysteresisRelease.uHigh) annotation (Line(
        points={{-83,-22},{-78,-22},{-78,-38},{-70,-38}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(realExpression2.y, mixingCircuit.TMixedSet) annotation (Line(
        points={{59,60},{46,60},{46,40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresisRelease.y, gain.u) annotation (Line(
        points={{-47,-34},{-40,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(boiler.heatPort, fixedTemperature.port) annotation (Line(
        points={{83,20},{84,20},{84,0}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(pumpSupply.port_b1, radiator.port_a) annotation (Line(
        points={{-26,36},{-72,36}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(radiator.port_b, pumpSupply.port_a2) annotation (Line(
        points={{-92,36},{-104,36},{-104,14},{-42,14},{-42,24},{-26,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pumpSupply.port_a1, parallelPipesSplitter.port_bN) annotation (Line(
        points={{-6,36},{6,36}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pumpSupply.port_b2, parallelPipesSplitter.port_aN) annotation (Line(
        points={{-6,24},{6,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(parallelPipesSplitter.port_a, mixingCircuit.port_b1) annotation (
        Line(
        points={{26,36},{36,36}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(parallelPipesSplitter.port_b, mixingCircuit.port_a2) annotation (
        Line(
        points={{26,24},{36,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(mixingCircuit.port_a1, boiler.port_b) annotation (Line(
        points={{56,36},{70,36}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(mixingCircuit.port_b2, boiler.port_a) annotation (Line(
        points={{56,24},{70,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(gain.y, pumpSupply.u) annotation (Line(
        points={{-17,-34},{0,-34},{0,52},{-16,52},{-16,40.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bou.ports[1], boiler.port_a) annotation (Line(
        points={{46,-4},{64,-4},{64,24},{70,24}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
              -100},{200,100}}), graphics));
  end RadiatorsBoiler;
end HeatingSystems;
