within DeSchipjes.ProductionSites.Heaters;
model HPAWVitoA60 "Vito air-water HP"

  //Extensions
  extends BaseClasses.HPAW(
    COPTable(table=[0,-20,-15,-7,2,7,10,12,20; 35,1.99,2.31,2.9,3.6,4.1,4.2,
          4.13,4.85; 45,1.69,2.01,2.44,2.97,3.37,3.59,3.61,4.21; 55,1.54,1.73,
          2.22,2.56,2.8,3.08,3.15,3.61; 70,1.53,1.72,2.21,2.55,2.7,3.07,3.14,
          3.60]),
    powerTable(table=[0,-20,-15,-7,2,7,10,12,20; 35,11809,12701.3,13517.2,
          13888.9,14658.5,15381,15980.6,16635.1; 45,13319.5,13810.9,14918,
          15932.7,16913.9,17214.5,18005.5,18669.8; 55,13961,15439.3,15450.5,
          17996.1,19642.9,19480.5,20000,21144; 70,13962,15440,15451,17997,19643,
          19481,20001,21145]),
    QNomRef=50000);

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.RealExpression TAmbient1(y=sim.Te - 273.15)
    annotation (Placement(transformation(extent={{-8,26},{4,42}})));
  Modelica.Blocks.Sources.RealExpression TEvap1(y=Ti.T - 273.15)
    annotation (Placement(transformation(extent={{-8,48},{4,64}})));
  Buildings.Fluid.Sensors.Temperature Ti(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-90,8},{-70,28}})));
equation
  connect(powerTable.u1, TEvap1.y) annotation (Line(points={{18,46},{10,46},{10,
          56},{4.6,56}}, color={0,0,127}));
  connect(powerTable.u2, TAmbient1.y)
    annotation (Line(points={{18,34},{4.6,34}}, color={0,0,127}));
  connect(COPTable.u1, TEvap1.y) annotation (Line(points={{26,76},{10,76},{10,
          56},{4.6,56}}, color={0,0,127}));
  connect(COPTable.u2, TAmbient1.y) annotation (Line(points={{26,64},{14,64},{
          14,34},{4.6,34}}, color={0,0,127}));
  connect(Ti.port, preDro.port_a)
    annotation (Line(points={{-80,8},{-80,0},{-60,0}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end HPAWVitoA60;
