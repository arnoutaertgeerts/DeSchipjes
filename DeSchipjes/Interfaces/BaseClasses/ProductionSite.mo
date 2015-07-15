within DeSchipjes.Interfaces.BaseClasses;
partial model ProductionSite
  package Medium =
      IDEAS.Media.Water "Medium in the component";

  //Parameters
  parameter Modelica.SIunits.Temperature TSupplyGrid(displayUnit="Celsius") =  273.15+60
    "Supply temperature of the Grid";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal;
  parameter Boolean modulating=true;

  Modelica.Blocks.Interfaces.RealOutput y if modulating annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,106})));

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
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                               graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                               graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
      Polygon(
        origin={9.533,-30.062},
        lineColor = {255,0,0},
        fillColor = {255,0,0},
        fillPattern = FillPattern.Solid,
        points = {{-40,-90},{-20,-70},{0,-90},{0,-50},{-20,-30},{-40,-50},{-40,-90}},
          rotation=270),
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
          rotation=90)}));
end ProductionSite;
