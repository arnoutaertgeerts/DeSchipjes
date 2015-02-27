within DeSchipjes.Dwellings.HeatingSystems;
model LTHeatingSystem
  extends BaseClasses.PartialStorage;

  IDEAS.Fluid.Production.NewHeatPumpWaterWater newHeatPumpWaterWater(
      redeclare package Medium = Medium) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={4,50})));
  IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpSupply_m_flowdhw1(
    redeclare package Medium = Medium,
    KvReturn=2,
    m_flow_nominal=m_flow_dhw,
    measurePower=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={34,50})));
  DistrictHeating.HeatingSystems.Control.Hysteresis hysteresis1(
    uLow=273.15 + 55,
    uHigh=273.15 + 65,
    realTrue=0,
    realFalse=m_flow_dhw)
    annotation (Placement(transformation(extent={{64,76},{44,96}})));
equation
  connect(pumpSupply_m_flowdhw.port_b1, newHeatPumpWaterWater.port_a1)
    annotation (Line(
      points={{-14,56},{-6,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw.port_a2, newHeatPumpWaterWater.port_b1)
    annotation (Line(
      points={{-14,44},{-6,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_b, pumpSupply_m_flowdhw1.port_a1)
    annotation (Line(
      points={{14,56},{24,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_a, pumpSupply_m_flowdhw1.port_b2)
    annotation (Line(
      points={{14,44},{24,44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_b1, storageTank_OneIntHX.port_a)
    annotation (Line(
      points={{44,56},{74,56},{74,71.5385},{82,71.5385}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpSupply_m_flowdhw1.port_a2, storageTank_OneIntHX.port_b)
    annotation (Line(
      points={{44,44},{82,44},{82,44.4615}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hysteresis1.y, pumpDHW.u) annotation (Line(
      points={{43.2,86},{-24,86},{-24,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(hysteresis1.y, pumpSupply_m_flowdhw1.u) annotation (Line(
      points={{43.2,86},{34,86},{34,60.8}},
      color={175,175,175},
      smooth=Smooth.None));
  connect(storageTank_OneIntHX.T[1], hysteresis1.u) annotation (Line(
      points={{82,60.7077},{82,62},{70,62},{70,86},{65.2,86}},
      color={175,175,175},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -200,-100},{200,100}}), graphics));
end LTHeatingSystem;
