within DeSchipjes.Dwellings.HeatingSystems;
model ITHeatingSystem
  extends BaseClasses.PartialStorage(
    TSupply=273.15+55,
    TReturn=273.15+35,
    tan(m_flow_nominal=0.1));

  parameter Modelica.SIunits.Temperature TSupplyDHW=273.15+70;

  Controls.OnOff onOffRad[nZones] annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-100,-10})));
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
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{74,76},{66,84}})));
public
  Controls.Modulator modulator(start=2)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=270,
        origin={10,-18})));
  Controls.Switch switch1(off=TSupply, on=TSupplyDHW)
    annotation (Placement(transformation(extent={{40,-6},{52,6}})));
equation
  connect(onOffRad.y, pumpRadiators.u) annotation (Line(
      points={{-100,-16.6},{-100,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));

  for i in 1:nZones loop
      connect(modulator.on, notRad[i].u)
    annotation (Line(points={{10,-13.6},{10,-10},{-66.8,-10}},
                                                      color={255,0,255}));
  end for;
  connect(pumpDHW.port_a2, tan.portHex_b) annotation (Line(
      points={{-14,44},{100,44},{100,44}},
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
  connect(onOffDHW.y, mDHW.u)
    annotation (Line(points={{-1,80},{-9.2,80}}, color={0,0,127}));
  connect(mDHW.y, pumpDHW.u) annotation (Line(points={{-18.4,80},{-24,80},{-24,60.8}},
        color={0,0,127}));
  connect(tan.portHex_a, pumpDHW.port_b1) annotation (Line(points={{100,48.2},{86,
          48.2},{86,56},{-14,56}}, color={0,127,255}));
  connect(temperatureSensor.T, onOffDHW.u)
    annotation (Line(points={{66,80},{66,80},{22,80}}, color={0,0,127}));
  connect(temperatureSensor.port, tan.heaPorVol[end])
    annotation (Line(points={{74,80},{110,80},{110,52}},    color={191,0,0}));
  connect(onOffDHW.release, modulator.on)
    annotation (Line(points={{10,68},{10,-13.6}},          color={255,0,255}));
  connect(switch1.u, modulator.on)
    annotation (Line(points={{38.8,0},{10,0},{10,-13.6}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})));
end ITHeatingSystem;
