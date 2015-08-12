within DeSchipjes.Interfaces.BaseClasses;
partial model ProductionSite
  package Medium =
      IDEAS.Media.Water "Medium in the component";

  //Parameters
  parameter Modelica.SIunits.Temperature TSupRad(displayUnit="Celsius") =  273.15+55
    "Supply temperature of the Grid for the radiators";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.167*scaler
    "Nominal mass flow rate of the production site";
  parameter Modelica.SIunits.Power Qbase;
  parameter Modelica.SIunits.Power Qpeak;

  parameter Boolean modulating=true
    "Set to true if the production site modulates the supply temperature";

  parameter Integer n = 11 "Number of houses connected to the production site";

  final parameter Real scaler = n/11;

  //Variables
  Modelica.SIunits.Power Pboi "Primary gas power usage of the boiler";
  Modelica.SIunits.Energy Eboi "Primary gas energy usage of the boiler";

  Modelica.SIunits.Power PhpEl "Electricity power usage of the heat pump";
  Modelica.SIunits.Energy EhpEl "Electricity energy usage of the heat pump";

  Modelica.SIunits.Power Qhp "Heat power production of the heat pump";
  Modelica.SIunits.Energy Ehp "Energy production of the heat pump";

  Modelica.SIunits.Power Qsun "Renewable heat produced by the solar collector";
  Modelica.SIunits.Energy Esun "Energy poduced by the solar collector";

  Modelica.SIunits.Power Qren "Total renewable power";
  Modelica.SIunits.Energy Eren "Total renewable energy";

  Modelica.SIunits.Power Qsto "Heat loss of the storage tanks";
  Modelica.SIunits.Energy Esto "Energy loss of the storage tanks";

  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium)
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}}),
        iconTransformation(extent={{90,-70},{110,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{90,50},{110,70}}),
        iconTransformation(extent={{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealInput TBase annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-40,110})));
  Modelica.Blocks.Interfaces.RealInput THigh if
                                               modulating annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={40,110})));
equation

  Qren = Qsun + Qhp - PhpEl*2.5;

  der(Eren) = Qren;
  der(Eboi) = Pboi;
  der(EhpEl) = PhpEl;
  der(Esun) = Qsun;
  der(Ehp) = Qhp;
  der(Esto) = Qsto;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                               graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{100,62},{-2,58}},
          lineColor={255,0,0},
          fillColor={255,170,85},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,58},{-2,48}},
          lineColor={255,0,0},
          fillColor={255,170,85},
          fillPattern=FillPattern.Solid),
      Polygon(
        origin={-10.467,-6.062},
        lineColor = {255,128,0},
        fillColor = {255,128,0},
        fillPattern = FillPattern.Solid,
        points={{-19.938,9.533},{0.062,-10.467},{-19.938,-30.467},{40.062,-30.467},{60.062,-10.467},
              {40.062,9.533},{-19.938,9.533}},
          rotation=90),
        Rectangle(
          extent={{98,-58},{-2,-62}},
          lineColor={0,0,255},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,-58},{-2,-32}},
          lineColor={0,0,255},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
      Polygon(
        origin={-10.467,9.938},
        lineColor = {0,128,255},
        fillColor = {0,128,255},
        fillPattern = FillPattern.Solid,
        points={{-61.938,9.533},{-41.938,-10.467},{-61.938,-30.467},{-19.938,-30.467},{0,-10},
              {-19.938,9.533},{-61.938,9.533}},
          rotation=90),
        Ellipse(extent={{-86,32},{-26,-28}}, lineColor={28,108,200}),
        Ellipse(extent={{26,32},{86,-28}}, lineColor={28,108,200})}));
end ProductionSite;
