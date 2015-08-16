within DeSchipjes.Scenarios;
model ReferenceBoiler "Single house with a boiler"

  parameter Integer ids[11] = {1,2,3,4,5,6,7,8,9,10,11};
  package Medium = Buildings.Media.Water;

  Modelica.SIunits.Power PrimPow "Primary power usage";
  Modelica.SIunits.Energy PrimEn "Primary energy usage";

  Modelica.SIunits.Power PeakPow "Primary power usage by the peak units";
  Modelica.SIunits.Energy PeakEn "Primary energy usage of the peak units";

  Modelica.Blocks.Sources.RealExpression TSupply1(y=haarHakker1.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{-84,50},{-64,70}})));
  inner IDEAS.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
protected
  inner IDEAS.Occupants.Extern.StrobeInfoManager                strobe(
    FilNam_mDHW="mDHW.txt",
    FilNam_QRad="QRad.txt",
    FilNam_TSet="sh_day.txt",
    FilNam_TSet2="sh_night.txt",
    StROBe_P=true,
    FilNam_P="P.txt",
    FilNam_Q="Q.txt",
    FilNam_QCon="Q.txt",
    filDir=Modelica.Utilities.Files.loadResource("modelica://Occupants") + "/")
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
public
  Dwellings.Building haarHakker1(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
    redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[1]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
      building)
    annotation (Placement(transformation(extent={{-70,40},{-50,60}})));
  Dwellings.Building haarHakker2(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[2]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
      building)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Dwellings.Building haarHakker3(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[3]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
      building)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Dwellings.Building haarHakker4(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[4]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
      building)
               annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Dwellings.Building haarHakker5(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[5]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
      building)
               annotation (Placement(transformation(extent={{50,40},{70,60}})));
  Dwellings.Building peterslei1(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[6]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM
      building) annotation (Placement(transformation(extent={{-84,-60},{-64,-40}})));
  Dwellings.Building peterslei2(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[7]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM
      building)
    annotation (Placement(transformation(extent={{-54,-60},{-34,-40}})));
  Dwellings.Building peterslei3(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[8]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM
      building)
    annotation (Placement(transformation(extent={{-24,-60},{-4,-40}})));
  Dwellings.Building peterslei4(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[9]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM
      building)
    annotation (Placement(transformation(extent={{6,-60},{26,-40}})));
  Dwellings.Building peterslei5(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[10]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM
      building)
    annotation (Placement(transformation(extent={{36,-60},{56,-40}})));
  Dwellings.Building peterslei6(
    final isDH=true,
    redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare package
        Medium = IDEAS.Media.Air),
    redeclare package Medium = Medium,
    modulating=false,
    redeclare DeSchipjes.Dwellings.HeatingSystems.BoilerHeatingSystem
      heatingSystem(QNom=haarHakker1.building.Q_design),
        redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=haarHakker1.building.VZones,
        id=ids[11]),
    redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.PetersLeiROM
      building)
    annotation (Placement(transformation(extent={{66,-60},{86,-40}})));
  ProductionSites.Heaters.Boiler boiler1(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{-72,10},{-52,30}})));
  ProductionSites.Heaters.Boiler boiler2(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{-42,10},{-22,30}})));
  ProductionSites.Heaters.Boiler boiler3(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{-12,10},{8,30}})));
  ProductionSites.Heaters.Boiler boiler4(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{18,10},{38,30}})));
  ProductionSites.Heaters.Boiler boiler5(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{48,10},{68,30}})));
  ProductionSites.Heaters.Boiler boiler6(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{-86,-90},{-66,-70}})));
  ProductionSites.Heaters.Boiler boiler7(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{-56,-90},{-36,-70}})));
  ProductionSites.Heaters.Boiler boiler8(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{-26,-90},{-6,-70}})));
  ProductionSites.Heaters.Boiler boiler9(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{4,-90},{24,-70}})));
  ProductionSites.Heaters.Boiler boiler10(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{34,-90},{54,-70}})));
  ProductionSites.Heaters.Boiler boiler11(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    use_onOffSignal=false,
    modulationInput=false,
    QNom=6500)
    annotation (Placement(transformation(extent={{64,-90},{84,-70}})));
  Modelica.Blocks.Sources.RealExpression TSupply2(y=haarHakker2.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{-54,50},{-34,70}})));
  Modelica.Blocks.Sources.RealExpression TSupply3(y=haarHakker3.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{-24,50},{-4,70}})));
  Modelica.Blocks.Sources.RealExpression TSupply4(y=haarHakker4.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{6,50},{26,70}})));
  Modelica.Blocks.Sources.RealExpression TSupply5(y=haarHakker5.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{36,50},{56,70}})));
  Modelica.Blocks.Sources.RealExpression TSupply6(y=peterslei1.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{-98,-50},{-78,-30}})));
  Modelica.Blocks.Sources.RealExpression TSupply7(y=peterslei2.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{-68,-50},{-48,-30}})));
  Modelica.Blocks.Sources.RealExpression TSupply8(y=peterslei3.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{-38,-50},{-18,-30}})));
  Modelica.Blocks.Sources.RealExpression TSupply9(y=peterslei4.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{-8,-50},{12,-30}})));
  Modelica.Blocks.Sources.RealExpression TSupply10(y=peterslei5.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{22,-50},{42,-30}})));
  Modelica.Blocks.Sources.RealExpression TSupply11(y=peterslei6.heatingSystem.switch.y)
    annotation (Placement(transformation(extent={{52,-50},{72,-30}})));
equation

  PrimPow = boiler1.PFuelOrEl + boiler2.PFuelOrEl + boiler3.PFuelOrEl
    + boiler4.PFuelOrEl + boiler5.PFuelOrEl + boiler6.PFuelOrEl
    + boiler7.PFuelOrEl + boiler8.PFuelOrEl + boiler9.PFuelOrEl
    + boiler10.PFuelOrEl + boiler11.PFuelOrEl;
  der(PrimEn) = PrimPow;

  PeakPow = PrimPow;
  PeakEn = PrimEn;

  connect(TSupply1.y, boiler1.u)
    annotation (Line(points={{-63,60},{-60,60},{-60,30.8}}, color={0,0,127}));
  connect(TSupply2.y, boiler2.u)
    annotation (Line(points={{-33,60},{-30,60},{-30,30.8}}, color={0,0,127}));
  connect(TSupply3.y, boiler3.u)
    annotation (Line(points={{-3,60},{0,60},{0,30.8}}, color={0,0,127}));
  connect(TSupply4.y, boiler4.u)
    annotation (Line(points={{27,60},{30,60},{30,30.8}}, color={0,0,127}));
  connect(TSupply5.y, boiler5.u)
    annotation (Line(points={{57,60},{60,60},{60,30.8}}, color={0,0,127}));
  connect(TSupply6.y, boiler6.u) annotation (Line(points={{-77,-40},{-74,-40},{-74,
          -69.2}}, color={0,0,127}));
  connect(TSupply7.y, boiler7.u) annotation (Line(points={{-47,-40},{-44,-40},{-44,
          -69.2}}, color={0,0,127}));
  connect(TSupply8.y, boiler8.u) annotation (Line(points={{-17,-40},{-14,-40},{-14,
          -69.2}}, color={0,0,127}));
  connect(TSupply9.y, boiler9.u)
    annotation (Line(points={{13,-40},{16,-40},{16,-69.2}}, color={0,0,127}));
  connect(TSupply10.y, boiler10.u)
    annotation (Line(points={{43,-40},{46,-40},{46,-69.2}}, color={0,0,127}));
  connect(TSupply11.y, boiler11.u)
    annotation (Line(points={{73,-40},{76,-40},{76,-69.2}}, color={0,0,127}));
  connect(haarHakker1.flowPort_return, boiler1.port_a) annotation (Line(points={
          {-62,40},{-62,34},{-72,34},{-72,20}}, color={0,0,0}));
  connect(haarHakker1.flowPort_supply, boiler1.port_b) annotation (Line(points={
          {-58,40},{-58,34},{-52,34},{-52,20}}, color={0,0,0}));
  connect(boiler2.port_a, haarHakker2.flowPort_return) annotation (Line(points={
          {-42,20},{-42,34},{-32,34},{-32,40}}, color={0,127,255}));
  connect(boiler2.port_b, haarHakker2.flowPort_supply) annotation (Line(points={
          {-22,20},{-22,34},{-28,34},{-28,40}}, color={0,127,255}));
  connect(boiler3.port_a, haarHakker3.flowPort_return) annotation (Line(points={
          {-12,20},{-12,34},{-2,34},{-2,40}}, color={0,127,255}));
  connect(boiler3.port_b, haarHakker3.flowPort_supply)
    annotation (Line(points={{8,20},{8,34},{2,34},{2,40}}, color={0,127,255}));
  connect(boiler4.port_a, haarHakker4.flowPort_return) annotation (Line(points={
          {18,20},{18,34},{28,34},{28,40}}, color={0,127,255}));
  connect(boiler4.port_b, haarHakker4.flowPort_supply) annotation (Line(points={
          {38,20},{38,34},{38,36},{32,36},{32,40}}, color={0,127,255}));
  connect(boiler5.port_a, haarHakker5.flowPort_return) annotation (Line(points={
          {48,20},{48,36},{58,36},{58,40}}, color={0,127,255}));
  connect(haarHakker5.flowPort_supply, boiler5.port_b)
    annotation (Line(points={{62,40},{62,34},{68,34},{68,20}}, color={0,0,0}));
  connect(peterslei1.flowPort_return, boiler6.port_a) annotation (Line(points={{
          -76,-60},{-76,-60},{-76,-66},{-86,-66},{-86,-80}}, color={0,0,0}));
  connect(peterslei1.flowPort_supply, boiler6.port_b) annotation (Line(points={{
          -72,-60},{-72,-66},{-66,-66},{-66,-80}}, color={0,0,0}));
  connect(boiler7.port_a, peterslei2.flowPort_return) annotation (Line(points={{
          -56,-80},{-56,-80},{-56,-66},{-46,-66},{-46,-60}}, color={0,127,255}));
  connect(peterslei2.flowPort_supply, boiler7.port_b) annotation (Line(points={{
          -42,-60},{-42,-66},{-36,-66},{-36,-80}}, color={0,0,0}));
  connect(boiler8.port_a, peterslei3.flowPort_return) annotation (Line(points={{
          -26,-80},{-26,-80},{-26,-64},{-16,-64},{-16,-60}}, color={0,127,255}));
  connect(peterslei3.flowPort_supply, boiler8.port_b) annotation (Line(points={{
          -12,-60},{-12,-66},{-6,-66},{-6,-80}}, color={0,0,0}));
  connect(boiler9.port_a, peterslei4.flowPort_return) annotation (Line(points={{
          4,-80},{4,-66},{14,-66},{14,-60}}, color={0,127,255}));
  connect(peterslei4.flowPort_supply, boiler9.port_b) annotation (Line(points={{
          18,-60},{18,-66},{24,-66},{24,-80}}, color={0,0,0}));
  connect(boiler10.port_a, peterslei5.flowPort_return) annotation (Line(points={
          {34,-80},{34,-66},{44,-66},{44,-60}}, color={0,127,255}));
  connect(peterslei5.flowPort_supply, boiler10.port_b) annotation (Line(points={
          {48,-60},{48,-66},{54,-66},{54,-80}}, color={0,0,0}));
  connect(boiler11.port_a, peterslei6.flowPort_return) annotation (Line(points={
          {64,-80},{64,-66},{74,-66},{74,-60}}, color={0,127,255}));
  connect(peterslei6.flowPort_supply, boiler11.port_b) annotation (Line(points={
          {78,-60},{78,-66},{84,-66},{84,-80}}, color={0,0,0}));
  annotation (Icon(graphics={                                       Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="R")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})));
end ReferenceBoiler;
