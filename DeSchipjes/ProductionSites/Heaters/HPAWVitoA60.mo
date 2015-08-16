within DeSchipjes.ProductionSites.Heaters;
model HPAWVitoA60 "Vito air-water HP"

  //Extensions
  extends BaseClasses.HPAW(
    COPTable(table=[0,
          -20,-15,-7,2,7,10,12,20; 35,1.99,2.31,2.9,3.6,4.1,4.2,4.13,4.85; 45,1.69,
          2.01,2.44,2.97,3.37,3.59,3.61,4.21; 55,1.54,1.73,2.22,2.56,2.8,3.08,3.15,
          3.61]),
    powerTable(table=[0,-20,-15,-7,2,7,10,12,20; 35,11809,12701.3,
          13517.2,13888.9,14658.5,15381,15980.6,16635.1; 45,13319.5,13810.9,14918,
          15932.7,16913.9,17214.5,18005.5,18669.8; 55,13961,15439.3,15450.5,17996.1,
          19642.9,19480.5,20000,21144]));

  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.RealExpression TAmbient(y=sim.Te)
    annotation (Placement(transformation(extent={{-100,14},{-86,32}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TEvaporator
    annotation (Placement(transformation(extent={{-4,40},{8,52}})));
equation
  connect(TAmbient.y, COPTable.u2) annotation (Line(points={{-85.3,23},{-80,23},
          {-80,-56},{-72,-56}}, color={0,0,127}));
  connect(powerTable.u1, TEvaporator.T)
    annotation (Line(points={{18,46},{14,46},{8,46}}, color={0,0,127}));
  connect(vol.heatPort, TEvaporator.port) annotation (Line(points={{-9,-10},{-20,
          -10},{-20,16},{-4,16},{-4,46}}, color={191,0,0}));
  connect(COPTable.u1, TEvaporator.T) annotation (Line(points={{-72,-44},{-84,-44},
          {-84,-74},{60,-74},{60,12},{12,12},{12,46},{8,46}}, color={0,0,127}));
  connect(TAmbient.y, powerTable.u2) annotation (Line(points={{-85.3,23},{6,23},
          {6,34},{18,34}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end HPAWVitoA60;
