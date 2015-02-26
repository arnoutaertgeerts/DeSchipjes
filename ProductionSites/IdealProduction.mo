within DeSchipjes.ProductionSites;
model IdealProduction

  //Extensions
  extends Interfaces.BaseClasses.ProductionSite;

  //Parameters
  parameter Modelica.SIunits.Pressure Head=200000;
  parameter Modelica.SIunits.Temperature TSet=70+273.15;

  IDEAS.Fluid.Production.IdealHeater idealHeater(redeclare package Medium =
        Medium, m_flow_nominal=m_flow_nominal) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-8,70})));
  IDEAS.Fluid.BaseCircuits.PumpSupply_dp centralPump(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_nominal,
    measurePower=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-8,26})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=TSet)
    annotation (Placement(transformation(extent={{-52,60},{-32,80}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=Head)
    annotation (Placement(transformation(extent={{40,16},{20,36}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true)
    annotation (Placement(transformation(extent={{40,60},{20,80}})));
equation
  connect(centralPump.port_b2, idealHeater.port_a) annotation (Line(
      points={{-14,36},{-14,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, centralPump.port_a1) annotation (Line(
      points={{-2,60},{-2,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(centralPump.port_a2, port_a) annotation (Line(
      points={{-14,16},{-14,0},{-100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(centralPump.port_b1, port_b) annotation (Line(
      points={{-2,16},{-2,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression.y, idealHeater.u) annotation (Line(
      points={{-31,70},{-17.8,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realExpression1.y, centralPump.u) annotation (Line(
      points={{19,26},{2.8,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanExpression.y, idealHeater.u1) annotation (Line(
      points={{19,70},{2,70}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end IdealProduction;
