within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  extends BaseClasses.PartialStorage(
    modulating=true,
    TSupply=273.15+55,
    TReturn=273.15+35,
    measurementsHouse(tauTSensor=0));

  parameter Modelica.SIunits.Temperature TSupplyDHW=273.15+70;

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{70,74},{58,86}})));
  Controls.OnOff onOffRad[nZones] annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-100,-10})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=TStorage)
    annotation (Placement(transformation(extent={{32,-16},{20,-4}})));
  Modelica.Blocks.Logical.Not notRad[nZones]
    annotation (Placement(transformation(extent={{-68,-16},{-80,-4}})));
  IDEAS.Controls.Discrete.HysteresisRelease_boolean onOffDHW(
    enableRelease=true,
    use_input=false,
    uLow_val=TStorage,
    uHigh_val=TStorage + 5,
    revert=true) annotation (Placement(transformation(extent={{20,70},{0,90}})));
  Modelica.Blocks.Math.Gain mDHW(k=tan.mHex_flow_nominal)
    annotation (Placement(transformation(extent={{-10,76},{-18,84}})));
  Controls.Switch switch1(off=TSupply, on=TSupplyDHW)
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
equation
  connect(onOffRad.y, pumpRadiators.u) annotation (Line(
      points={{-100,-16.6},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));

  for i in 1:nZones loop
      connect(notRad[i].u, greaterThreshold.y) annotation (Line(
      points={{-66.8,-10},{19.4,-10}},
      color={255,0,255},
      smooth=Smooth.None));
  end for;
  connect(temperatureSensor.port, tan.heaPorVol[4]) annotation (Line(
      points={{70,80},{106,80},{106,56.45}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(pumpDHW.port_b1, tan.portHex_a) annotation (Line(
      points={{-14,56},{86,56},{86,52.2},{96,52.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHW.port_a2, tan.portHex_b) annotation (Line(
      points={{-14,44},{96,44},{96,48}},
      color={0,127,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(onOffRad.u, notRad.y) annotation (Line(
      points={{-92.8,-10},{-80.6,-10}},
      color={255,0,255},
      smooth=Smooth.None));

  connect(conPID.y, onOffRad.u1) annotation (Line(
      points={{-109,40},{-100,40},{-100,-2.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(onOffDHW.release, greaterThreshold.y)
    annotation (Line(points={{10,68},{10,-10},{19.4,-10}}, color={255,0,255}));
  connect(onOffDHW.u, temperatureSensor.T)
    annotation (Line(points={{22,80},{58,80}}, color={0,0,127}));
  connect(onOffDHW.y, mDHW.u)
    annotation (Line(points={{-1,80},{-9.2,80}}, color={0,0,127}));
  connect(mDHW.y, pumpDHW.u) annotation (Line(points={{-18.4,80},{-24,80},{-24,60.8}},
        color={0,0,127}));
  connect(pumpHex.Tsup, greaterThreshold.u) annotation (Line(points={{98.4,-27.6},
          {98.4,-10},{33.2,-10}}, color={0,0,127}));
  connect(supplyPID.u_s, switch1.y)
    annotation (Line(points={{58,10},{51,10}}, color={0,0,127}));
  connect(switch1.u, greaterThreshold.y) annotation (Line(points={{28,10},{10,
          10},{10,-10},{19.4,-10}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end ITHeatingSystem;
