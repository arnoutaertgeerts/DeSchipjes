within DeSchipjes.ProductionSites.Ideal;
model IdealModulatingProduction

  //Extensions
  extends Interfaces.BaseClasses.ProductionSite;

  //Parameters
  parameter Modelica.SIunits.Temperature TSupDhw = 273.15+75;

  //Variables
  Modelica.SIunits.Energy ETot "Total energy consumed";

  //Components
  Annex60.Fluid.HeatExchangers.HeaterCooler_T
                      idealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  .DeSchipjes.Controls.Switch switch1(on=TSupDhw, off=TSupRad) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-40,40})));

equation
  der(ETot) = idealHeater.Q_flow;

  connect(idealHeater.port_b, port_b) annotation (Line(points={{30,0},{52,0},{
          52,60},{100,60}}, color={0,127,255}));
  connect(idealHeater.port_a, port_a) annotation (Line(points={{10,0},{0,0},{0,
          -60},{100,-60}}, color={0,127,255}));
  connect(switch1.y, idealHeater.TSet)
    annotation (Line(points={{-29,40},{0,40},{0,6},{8,6}}, color={0,0,127}));
  connect(u, switch1.u) annotation (Line(points={{0,110},{0,60},{-60,60},{-60,40},
          {-52,40}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end IdealModulatingProduction;
