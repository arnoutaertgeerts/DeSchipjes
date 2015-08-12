within DeSchipjes.Interfaces.BaseClasses;
partial model Grid
  package Medium =
      IDEAS.Media.Water "Medium in the component";

  //Parameteres
  parameter Modelica.SIunits.Temperature TSupRad(displayUnit="Celsius") =  273.15+50
    "Supply temperature of the radiators";
  parameter Modelica.SIunits.Temperature TRetRad(displayUnit="Celsius") =  273.15+40
    "Return temperature of the radiators";
  parameter Modelica.SIunits.Temperature TStorage(displayUnit="Celsius") =  273.15+65
    "Temperature of the storage tank";

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.167
    "Nominal mass flow rate for one house";

  parameter Boolean modulating=true
    "Set to true if the grid modulates the supply temperature";

  Modelica.SIunits.Power Qgrid "Total power usage of the grid";
  Modelica.SIunits.Energy Egrid "Total energy usage of the grid";

  Modelica.SIunits.Power Qdis "Distribution heat losses";
  Modelica.SIunits.Energy Edis "Distribution energy loss";

  Modelica.SIunits.Power Qhea "Usefull heating power";
  Modelica.SIunits.Power Ehea "Usefull heating energy";

  Modelica.SIunits.Power Qsh "Usefull heating power for SH";
  Modelica.SIunits.Power Esh "Usefull heating energy for SH";

  Modelica.SIunits.Power Qdhw "Usefull heating power for DHW";
  Modelica.SIunits.Power Edhw "Usefull heating energy for DHW";

  Modelica.SIunits.Power PboosEl
    "Electricity power usage of the grid (booster HPs)";
  Modelica.SIunits.Energy EboosEl "Electric energy usage of the grid";

  Modelica.SIunits.Power Qhp "Heat power production of the grid (booster HPs)";
  Modelica.SIunits.Energy Ehp
    "Heat energy production of the grid (booster HPs)";

  Modelica.SIunits.Power Qren "Total renewable power";
  Modelica.SIunits.Energy Eren "Total renewable energy";

  Modelica.SIunits.Power Qsto "Heat loss of the storage tanks";
  Modelica.SIunits.Energy Esto "Energy loss of the storage tanks";

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  inner IDEAS.Occupants.Extern.StrobeInfoManager strobe(
    FilNam_Q="Q.txt",
    FilNam_mDHW="mDHW.txt",
    FilNam_QCon="QCon.txt",
    FilNam_QRad="QRad.txt",
    FilNam_TSet="sh_day.txt",
    FilNam_TSet2="sh_night.txt",
    FilNam_P="P.txt",
    StROBe_P=true,
    filDir=Modelica.Utilities.Files.loadResource("modelica://Occupants") + "/")
    annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium)
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-110,50},{-90,70}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}}),
        iconTransformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Blocks.Interfaces.BooleanInput u if modulating annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={80,110})));

equation
  Qgrid = (port_a.h_outflow-port_b.h_outflow)*port_a.m_flow;
  Qren = Qhp - PboosEl*2.5;

  der(Edis) = Qdis;
  der(EboosEl) = PboosEl;
  der(Egrid) = Qrid;
  der(Ehea) = Qhea;
  der(Eren) = Qren;
  der(Ehp) = Qhp;
  der(Esto) = Qsto;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{240,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{240,100}}), graphics={
        Rectangle(
          extent={{-100,100},{240,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,-26},{60,-26},{60,14},{40,34},{20,14},{20,-26}},
          lineColor={127,0,0},
          smooth=Smooth.None,
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{34,-26},{46,-6}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,60},{80,60}},
          color={0,128,255},
          smooth=Smooth.None),
        Rectangle(
          extent={{200,62},{-100,58}},
          lineColor={255,0,0},
          fillColor={255,170,85},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{200,58},{196,-4}},
          lineColor={255,0,0},
          fillColor={255,170,85},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{196,0},{180,-4}},
          lineColor={255,0,0},
          fillColor={255,170,85},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{80,-16},{60,-20}},
          lineColor={0,0,255},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{200,-58},{-100,-62}},
          lineColor={0,0,255},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{200,-16},{196,-62}},
          lineColor={0,0,255},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{60,-26},{100,-26},{100,14},{80,34},{60,14},{60,-26}},
          lineColor={127,0,0},
          smooth=Smooth.None,
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{74,-26},{86,-6}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{100,-26},{140,-26},{140,14},{120,34},{100,14},{100,-26}},
          lineColor={127,0,0},
          smooth=Smooth.None,
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{114,-26},{126,-6}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{140,-26},{180,-26},{180,14},{160,34},{140,14},{140,-26}},
          lineColor={127,0,0},
          smooth=Smooth.None,
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{154,-26},{166,-6}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{196,-16},{180,-20}},
          lineColor={0,0,255},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid)}));
end Grid;
