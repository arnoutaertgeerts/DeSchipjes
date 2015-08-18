within DeSchipjes.Interfaces;
model Scenario

  Modelica.SIunits.Energy Eprim;
  Modelica.SIunits.Energy Eren;
  Modelica.SIunits.Energy Esto;

  replaceable BaseClasses.ProductionSite productionSite(
           m_flow_nominal=grid.m_flow_nominal*productionSite.scaler,
    TSupRad=TSupGrid.y,
    Qbase=Qbase.y*productionSite.scaler,
    Qpeak=Qpeak.y*productionSite.scaler)
    annotation (Placement(transformation(extent={{38,-10},{18,10}})),choicesAllMatching=true);
  IDEAS.Fluid.Sources.FixedBoundary bou(
    use_T=false,
    redeclare package Medium = IDEAS.Media.Water,
    nPorts=1)    annotation (Placement(transformation(
        extent={{4,4},{-4,-4}},
        rotation=90,
        origin={-10,0})));
  replaceable BaseClasses.Grid grid(
    TSupRad=TSupRad.y,
    TRetRad=TRetRad.y,
    TStorage=TStorage.y)
    annotation (Placement(transformation(extent={{-44,-10},{-78,10}})),
                                                                      choicesAllMatching=true);
  Controls.Input TSupRad(
    u=50,
    unit="°C",
    b=273.15)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Controls.Input TStorage(
    u=65,
    unit="°C",
    b=273.15)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Controls.Input TSupGrid(
    u=55,
    final unit="°C",
    final a=1,
    final b=273.15) annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Controls.Input TSupDhw(
    u=70,
    final unit="°C",
    final a=1,
    final b=273.15) annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Controls.Input TRetRad(
    u=40,
    final unit="°C",
    final a=1,
    final b=273.15)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Controls.Input TRetGrid(
    u=45,
    final unit="°C",
    final a=1,
    final b=273.15) annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Controls.Input Qbase(
    u=55,
    final unit="kW",
    final a=1000,
    final b=0) annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Controls.Input Qpeak(
    final unit="kW",
    final a=1000,
    final b=0,
    u=72)      annotation (Placement(transformation(extent={{60,-20},{80,0}})));
equation

  Eprim = productionSite.Eboi + 2.5*(productionSite.EhpEl + grid.EboosEl);
  Eren = productionSite.Eren + grid.Eren;
  Esto = productionSite.Esto + grid.Esto;

  connect(grid.port_a, productionSite.port_b) annotation (Line(
      points={{-44,6},{18,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(productionSite.port_a, grid.port_b) annotation (Line(
      points={{18,-6},{-44,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], grid.port_b) annotation (Line(
      points={{-10,-4},{-10,-6},{-44,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false)),           Icon(coordinateSystem(extent={{-100,
            -100},{100,100}}, preserveAspectRatio=false), graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end Scenario;
