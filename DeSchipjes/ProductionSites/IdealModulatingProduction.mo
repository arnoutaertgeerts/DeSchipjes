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
    annotation (Placement(transformation(extent={{-64,28},{-56,36}})));
public
  Controls.Modulator modulator(start=2)
    annotation (Placement(transformation(extent={{-96,30},{-76,50}})));
  Modelica.Blocks.Sources.Constant high(k=TSupplyGridHigh)
    annotation (Placement(transformation(extent={{-64,44},{-56,52}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-40,40})));

equation
  der(ETot) = idealHeater.Q_flow;

  connect(modulator.on,switch1. u2) annotation (Line(
      points={{-75,40},{-52,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(low.y,switch1. u3) annotation (Line(
      points={{-55.6,32},{-52,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(high.y,switch1. u1) annotation (Line(
      points={{-55.6,48},{-52,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, idealHeater.TSet) annotation (Line(
      points={{-29,40},{0,40},{0,6},{8,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(idealHeater.port_b, port_b) annotation (Line(points={{30,0},{52,0},{
          52,60},{100,60}}, color={0,127,255}));
  connect(idealHeater.port_a, port_a) annotation (Line(points={{10,0},{0,0},{0,
          -60},{100,-60}}, color={0,127,255}));
  connect(y, idealHeater.TSet)
    annotation (Line(points={{0,106},{0,6},{8,6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end IdealModulatingProduction;
