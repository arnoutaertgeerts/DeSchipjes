within DeSchipjes.Interfaces;
model WeaBusConverter "Convert the IDEAS WeaBus to the Buildings WeaBus"

  Buildings.BoundaryConditions.WeatherData.Bus weaBusBuildings
    "Weather data bus" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
public
  IDEAS.Buildings.Components.Interfaces.WeaBus weaBusIdeas(numSolBus=numAzi + 1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,0})));
  Modelica.Blocks.Routing.RealPassThrough solZen
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Routing.RealPassThrough HGloHor
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Routing.RealPassThrough HDifHor
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Routing.RealPassThrough HDirNor
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Routing.RealPassThrough cloTim
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Blocks.Routing.RealPassThrough solTim
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Blocks.Routing.RealPassThrough TDryBul
    annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
equation
  connect(solZen.y, weaBusBuildings.solZen) annotation (Line(points={{-59,70},{
          0,70},{80,70},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HGloHor.y, weaBusBuildings.HGloHor) annotation (Line(points={{-39,50},
          {18,50},{76,50},{76,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HDifHor.y, weaBusBuildings.HDifHor) annotation (Line(points={{-19,30},
          {24,30},{70,30},{70,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HDirNor.y, weaBusBuildings.HDirNor) annotation (Line(points={{21,-10},
          {64,-10},{64,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TDryBul.y, weaBusBuildings.TDryBul) annotation (Line(points={{81,-70},
          {94,-70},{94,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HGloHor.u, weaBusIdeas.solGloHor) annotation (Line(points={{-62,50},{
          -90,50},{-90,0},{-100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HDifHor.u, weaBusIdeas.solDifHor) annotation (Line(points={{-42,30},{
          -86,30},{-86,0},{-100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HDirNor.u, weaBusIdeas.solDirPer) annotation (Line(points={{-2,-10},{
          -72,-10},{-72,0},{-100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(solZen.u, weaBusIdeas.angZen) annotation (Line(points={{-82,70},{-94,
          70},{-94,0},{-100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(cloTim.y, weaBusBuildings.cloTim) annotation (Line(points={{41,-30},{
          84,-30},{84,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(solTim.y, weaBusBuildings.solTim) annotation (Line(points={{61,-50},{
          88,-50},{88,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TDryBul.u, weaBusIdeas.Te) annotation (Line(points={{58,-70},{-12,-70},
          {-82,-70},{-82,0.05},{-100.05,0.05}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end WeaBusConverter;
