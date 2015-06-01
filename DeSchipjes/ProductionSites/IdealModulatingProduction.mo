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
        origin={24,22})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=grid_dp)
    annotation (Placement(transformation(extent={{72,12},{52,32}})));
  Heaters.IdealHeater idealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{22,44},{42,64}})));
  Modelica.Blocks.Sources.Constant low(k=TSupplyGrid)
    annotation (Placement(transformation(extent={{-34,48},{-26,56}})));
public
  Controls.Modulator modulator
    annotation (Placement(transformation(extent={{-88,50},{-68,70}})));
  Modelica.Blocks.Sources.Constant high(k=TSupplyGridHigh)
    annotation (Placement(transformation(extent={{-34,64},{-26,72}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-2,60})));
equation
  der(ETot) = idealHeater.Q_flow;

  connect(centralPump.port_a2, port_a) annotation (Line(
      points={{18,12},{18,0},{-100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(centralPump.port_b1, port_b) annotation (Line(
      points={{30,12},{30,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression1.y, centralPump.u) annotation (Line(
      points={{51,22},{34.8,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(idealHeater.port_a, centralPump.port_b2) annotation (Line(
      points={{22,54},{18,54},{18,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, centralPump.port_a1) annotation (Line(
      points={{42,54},{46,54},{46,36},{30,36},{30,32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(modulator.on,switch1. u2) annotation (Line(
      points={{-67,60},{-14,60}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(low.y,switch1. u3) annotation (Line(
      points={{-25.6,52},{-14,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(high.y,switch1. u1) annotation (Line(
      points={{-25.6,68},{-14,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, idealHeater.TSet) annotation (Line(
      points={{9,60},{20,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y, switch1.u2) annotation (Line(
      points={{0,110},{0,84},{-50,84},{-50,60},{-14,60}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end IdealModulatingProduction;
