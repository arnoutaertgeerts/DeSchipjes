within DeSchipjes.ProductionSites;
model IdealProduction

  //Extensions
  extends Interfaces.BaseClasses.ProductionSite;

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
        origin={-8,26})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=TSupplyGrid)
    annotation (Placement(transformation(extent={{-52,60},{-32,80}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=grid_dp)
    annotation (Placement(transformation(extent={{40,16},{20,36}})));
  Heaters.IdealHeater idealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{-16,50},{4,70}})));
equation
  connect(centralPump.port_a2, port_a) annotation (Line(
      points={{-14,16},{-14,0},{-100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(centralPump.port_b1, port_b) annotation (Line(
      points={{-2,16},{-2,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression1.y, centralPump.u) annotation (Line(
      points={{19,26},{2.8,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(idealHeater.port_a, centralPump.port_b2) annotation (Line(
      points={{-16,60},{-24,60},{-24,44},{-14,44},{-14,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(idealHeater.port_b, centralPump.port_a1) annotation (Line(
      points={{4,60},{10,60},{10,44},{-2,44},{-2,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression.y, idealHeater.TSet) annotation (Line(
      points={{-31,70},{-26,70},{-26,66},{-18,66}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end IdealProduction;
