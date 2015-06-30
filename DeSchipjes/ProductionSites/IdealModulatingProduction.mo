within DeSchipjes.ProductionSites;
model IdealModulatingProduction

  //Extensions
  extends Interfaces.BaseClasses.ProductionSite;

  //Parameters
  parameter Modelica.SIunits.Temperature TSupplyGridHigh = 273.15+75;

  //Variables
  Modelica.SIunits.Energy ETot "Total energy consumed";

  //Components
  Heaters.IdealHeater idealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
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

  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,106})));
equation
  der(ETot) = idealHeater.Q_flow;

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
      points={{-21,60},{-10,60},{-10,6},{8,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(port_a, idealHeater.port_a) annotation (Line(
      points={{-100,0},{10,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, port_b) annotation (Line(
      points={{30,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(y, idealHeater.TSet) annotation (Line(
      points={{0,106},{0,60},{-10,60},{-10,6},{8,6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end IdealModulatingProduction;
