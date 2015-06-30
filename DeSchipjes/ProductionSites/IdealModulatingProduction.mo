within DeSchipjes.ProductionSites;
model IdealModulatingProduction

  //Extensions
  extends Interfaces.BaseClasses.ProductionSite;

  //Parameters
  parameter Modelica.SIunits.Temperature TSupplyGridHigh = 273.15+75;

  //Variables
  Modelica.SIunits.Energy ETot "Total energy consumed";

  //Components
  IDEAS.Fluid.BaseCircuits.PumpSupply_dp centralPump(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_nominal,
    measurePower=false,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dynamicBalance=false)
                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={6,20})));
  Heaters.IdealHeater idealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{4,44},{24,64}})));
  Modelica.Blocks.Sources.Constant low(k=TSupplyGrid)
    annotation (Placement(transformation(extent={{-56,48},{-48,56}})));
public
  Controls.Modulator modulator
    annotation (Placement(transformation(extent={{-88,50},{-68,70}})));
  Modelica.Blocks.Sources.Constant high(k=TSupplyGridHigh)
    annotation (Placement(transformation(extent={{-56,64},{-48,72}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-32,60})));
  Annex60.Utilities.Math.Max max(nin=11) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={0,-60})));
  Annex60.Controls.Continuous.LimPID conPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=30,
    yMin=0,
    reverseAction=true,
    k=1E6,
    yMax=10E6)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  Modelica.Blocks.Sources.Constant const(k=0.98)
    annotation (Placement(transformation(extent={{-28,-44},{-20,-36}})));
equation
  der(ETot) = idealHeater.Q_flow;

  connect(centralPump.port_a2, port_a) annotation (Line(
      points={{-1.77636e-15,10},{-1.77636e-15,0},{-100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(centralPump.port_b1, port_b) annotation (Line(
      points={{12,10},{12,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_a, centralPump.port_b2) annotation (Line(
      points={{4,54},{0,54},{0,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, centralPump.port_a1) annotation (Line(
      points={{24,54},{28,54},{28,36},{12,36},{12,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(modulator.on,switch1. u2) annotation (Line(
      points={{-67,60},{-44,60}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(low.y,switch1. u3) annotation (Line(
      points={{-47.6,52},{-44,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(high.y,switch1. u1) annotation (Line(
      points={{-47.6,68},{-44,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, idealHeater.TSet) annotation (Line(
      points={{-21,60},{2,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y, switch1.u2) annotation (Line(
      points={{20,110},{20,80},{-60,80},{-60,60},{-44,60}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(max.y, conPID.u_m) annotation (Line(
      points={{0,-55.6},{0,-52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u, max.u) annotation (Line(
      points={{-112,-80},{-2.22045e-16,-80},{-2.22045e-16,-64.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.u_s, const.y) annotation (Line(
      points={{-12,-40},{-19.6,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conPID.y, centralPump.u) annotation (Line(
      points={{11,-40},{40,-40},{40,20},{16.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end IdealModulatingProduction;
