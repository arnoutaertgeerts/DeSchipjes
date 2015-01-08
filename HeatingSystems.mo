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
          origin={78,30})));
    IDEAS.Fluid.HeatExchangers.Radiators.Radiator[nZones] radiator(
      QNom=QNom,
      TInNom=TSupply,
      TOutNom=TReturn,
      redeclare package Medium = Medium)
      annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-82,40})));

    Extra.ZoneSplitter zoneSplitter(
      redeclare package Medium = Medium,
      n=nZones,
      m_flow_nominal=sum(m_flow_nominal),
      V=0.1) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=90,
          origin={14,30})));
    IDEAS.Fluid.FixedResistances.InsulatedPipe pipe_Insulated[nZones](
      m=1,
      UA=10,
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-50,50})));
    IDEAS.Fluid.FixedResistances.InsulatedPipe pipe_Insulated1[nZones](
      m=1,
      UA=10,
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={-50,10})));
    Modelica.Blocks.Sources.RealExpression realExpression1(y=273.15 + 77)
      annotation (Placement(transformation(extent={{122,42},{102,62}})));
    IDEAS.Controls.Discrete.HysteresisRelease hysteresisRelease[nZones](revert=true)
      annotation (Placement(transformation(extent={{-46,-44},{-26,-24}})));
    Modelica.Blocks.Sources.RealExpression[nZones] uLow(y=273.15 + 20)
      annotation (Placement(transformation(extent={{-82,-66},{-62,-46}})));
    Modelica.Blocks.Sources.RealExpression[nZones] uHigh(y=273.15 + 21)
      annotation (Placement(transformation(extent={{-82,-32},{-62,-12}})));
    Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=293.15)
      "fixed temperature to simulate heat losses of hydraulic components"
      annotation (Placement(transformation(
          extent={{7,-7},{-7,7}},
          rotation=-90,
          origin={81,-7})));
    IDEAS.Fluid.Sources.FixedBoundary bou(
      redeclare package Medium = Medium,
      use_T=false,
      nPorts=1)
      annotation (Placement(transformation(extent={{26,-14},{46,6}})));
    Modelica.Blocks.Sources.RealExpression realExpression2(y=273.15 + 70)
      annotation (Placement(transformation(extent={{70,62},{50,82}})));
    IDEAS.Fluid.BaseCircuits.PumpSupplyM[nZones] pumpSupplyM(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal,
      includePipes=true,
      measureSupplyT=false,
      measurePower=false,
      dpValve_nominalBot=0,
      KvBot=10)
      annotation (Placement(transformation(extent={{-6,20},{-26,40}})));
    IDEAS.Fluid.BaseCircuits.MixingCircuit mixingCircuit(
      redeclare package Medium = Medium,
      m_flow_nominal=sum(m_flow_nominal),
      includePipes=true,
      mPipe=1,
      KvBot=10,
      dpValve_nominalBot=0,
      measureSupplyT=false)
               annotation (Placement(transformation(extent={{56,20},{36,40}})));
    Modelica.Blocks.Math.Gain gain[nZones](k=m_flow_nominal)
      annotation (Placement(transformation(extent={{-16,-44},{4,-24}})));
  equation
    QHeaSys = -sum(radiator.heatPortCon.Q_flow) - sum(radiator.heatPortRad.Q_flow);
    P[1] = 0;
    Q[1] = 0;

    connect(radiator.heatPortRad, heatPortRad) annotation (Line(
        points={{-91,50},{-92,50},{-92,62},{-130,62},{-130,-20},{-200,-20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(radiator.heatPortCon, heatPortCon) annotation (Line(
        points={{-87,50},{-86,50},{-86,72},{-160,72},{-160,20},{-200,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(pipe_Insulated.port_b, radiator.port_a) annotation (Line(
        points={{-60,50},{-66,50},{-66,40},{-72,40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pipe_Insulated1.port_a, radiator.port_b) annotation (Line(
        points={{-60,10},{-100,10},{-100,40},{-92,40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(realExpression1.y, boiler.TSet) annotation (Line(
        points={{101,52},{82,52},{82,42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TSensor, hysteresisRelease.u) annotation (Line(
        points={{-204,-60},{-96,-60},{-96,-34},{-48,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(uLow.y, hysteresisRelease.uLow) annotation (Line(
        points={{-61,-56},{-54,-56},{-54,-42},{-48,-42}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(uHigh.y, hysteresisRelease.uHigh) annotation (Line(
        points={{-61,-22},{-56,-22},{-56,-38},{-48,-38}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(fixedTemperature.port, boiler.heatPort) annotation (Line(
        points={{81,0},{81,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(pumpSupplyM.port_b1, pipe_Insulated.port_a) annotation (Line(
        points={{-26,36},{-32,36},{-32,50},{-40,50}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pumpSupplyM.port_a2, pipe_Insulated1.port_b) annotation (Line(
        points={{-26,24},{-30,24},{-30,10},{-40,10}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pumpSupplyM.port_a1, zoneSplitter.port_bN) annotation (Line(
        points={{-6,36},{3.8,36}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(pumpSupplyM.port_b2, zoneSplitter.port_aN) annotation (Line(
        points={{-6,24},{3.8,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(mixingCircuit.port_a1, boiler.port_b) annotation (Line(
        points={{56,36},{68,36}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(mixingCircuit.port_b2, boiler.port_a) annotation (Line(
        points={{56,24},{68,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou.ports[1], boiler.port_a) annotation (Line(
        points={{46,-4},{62,-4},{62,24},{68,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(mixingCircuit.port_a2, zoneSplitter.port_b) annotation (Line(
        points={{36,24},{24,24}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(mixingCircuit.port_b1, zoneSplitter.port_a) annotation (Line(
        points={{36,36},{23.8,36}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(realExpression2.y, mixingCircuit.TMixedSet) annotation (Line(
        points={{49,72},{46,72},{46,40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(hysteresisRelease.y, gain.u) annotation (Line(
        points={{-25,-34},{-18,-34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain.y, pumpSupplyM.u) annotation (Line(
        points={{5,-34},{14,-34},{14,12},{-2,12},{-2,52},{-16,52},{-16,40.8}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
              -100},{200,100}}), graphics));
  end RadiatorsBoiler;
end HeatingSystems;
