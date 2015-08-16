within DeSchipjes.ProductionSites.Heaters;
model CHP "Model of a non-modulating CHP"
  import DeSchipjes;

  //Extensions
  extends IDEAS.Fluid.Interfaces.TwoPortHeatMassExchanger(
    redeclare final IDEAS.Fluid.MixingVolumes.MixingVolume vol(
      nPorts=3, V=m/rho_default,
      prescribedHeatFlowRate=true,
      mSenFac=1 + Cp/(4180*m)),
    final showDesignFlowDirection=true);

  //Parameters
  parameter Modelica.SIunits.Mass m=50 "Water contents of the CHP";
  parameter Modelica.SIunits.Power PNom=PNomRef
    "Nominal power of the modeled CHP";
  parameter Modelica.SIunits.Power PNomRef
    "Nominal power of the CHP for which the data was produced";

  parameter Modelica.SIunits.HeatCapacity Cp=0
    "Heat capacity of the dry lumped material";

  final parameter Real scaler=PNom/PNomRef;

  //Interfaces
   Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,108})));

  //Components
  Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={20,-60})));
  DeSchipjes.Controls.OnOff onOff(ymin=0)
    annotation (Placement(transformation(extent={{-28,-54},{-16,-66}})));
  Modelica.Blocks.Math.Gain gain(k=scaler)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-2,-60})));
  Modelica.Blocks.Tables.CombiTable2D heatTable(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
      table=[0,0.5,0.75,1; 30,0.655,0.656,0.67; 40,0.616,0.617,0.631; 50,0.576,0.577,
        0.591; 60,0.537,0.538,0.552; 65,0.517,0.518,0.532])
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Modelica.Blocks.Math.Gain gain1(k=scaler)
    annotation (Placement(transformation(extent={{16,60},{36,80}})));
  Modelica.Blocks.Interfaces.RealOutput PFuel annotation (Placement(
        transformation(extent={{100,-50},{120,-30}}), iconTransformation(extent=
           {{100,-50},{120,-30}})));
  DeSchipjes.Controls.OnOff onOff1(
                                  ymin=0)
    annotation (Placement(transformation(extent={{-6,64},{6,76}})));
  Modelica.Blocks.Interfaces.RealOutput PEl annotation (Placement(
        transformation(extent={{100,50},{120,70}}), iconTransformation(extent={{
            100,30},{120,50}})));
  Buildings.Controls.SetPoints.Table ELFTable(table=[65,100; 68,50])
    annotation (Placement(transformation(extent={{-68,60},{-48,80}})));
  Buildings.Controls.SetPoints.Table electricEffTable(table=[50,0.203; 100,0.27])
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-14,40})));
  Modelica.Blocks.Math.Division product
    annotation (Placement(transformation(extent={{74,-50},{94,-30}})));
  Buildings.Fluid.Sensors.Temperature Ti(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-78,-8},{-98,-28}})));
  DeSchipjes.Controls.OnOff onOff2(
                                  ymin=0)
    annotation (Placement(transformation(extent={{16,34},{28,46}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=Ti.T - 273.15)
    annotation (Placement(transformation(extent={{-98,-64},{-78,-44}})));
  Modelica.Blocks.Logical.And heaterOn
    annotation (Placement(transformation(extent={{-40,26},{-28,14}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.0001)
    annotation (Placement(transformation(extent={{-60,16},{-52,24}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=m_flow)
    annotation (Placement(transformation(extent={{-98,10},{-78,30}})));
equation
  connect(onOff1.y, gain1.u)
    annotation (Line(points={{6.6,70},{6.6,70},{14,70}}, color={0,0,127}));
  connect(gain1.y, PEl) annotation (Line(points={{37,70},{80,70},{80,60},{110,60}},
        color={0,0,127}));
  connect(ELFTable.y, onOff1.u1)
    annotation (Line(points={{-47,70},{-7.2,70}}, color={0,0,127}));
  connect(PFuel, product.y)
    annotation (Line(points={{110,-40},{95,-40}}, color={0,0,127}));
  connect(electricEffTable.u, onOff1.u1) annotation (Line(points={{-26,40},{-30,
          40},{-30,70},{-7.2,70}}, color={0,0,127}));
  connect(product.u1, PEl) annotation (Line(points={{72,-34},{60,-34},{60,70},{80,
          70},{80,60},{110,60}}, color={0,0,127}));
  connect(heatTable.u2, onOff1.u1) annotation (Line(points={{-62,-66},{-66,-66},
          {-66,52},{-40,52},{-40,70},{-7.2,70}}, color={0,0,127}));
  connect(heatTable.y, onOff.u1)
    annotation (Line(points={{-39,-60},{-29.2,-60}}, color={0,0,127}));
  connect(onOff.y, gain.u)
    annotation (Line(points={{-15.4,-60},{-9.2,-60}}, color={0,0,127}));
  connect(gain.y, prescribedHeatFlow.Q_flow)
    annotation (Line(points={{4.6,-60},{7.3,-60},{10,-60}}, color={0,0,127}));
  connect(prescribedHeatFlow.port, vol.heatPort) annotation (Line(points={{30,-60},
          {42,-60},{42,-40},{-16,-40},{-16,-10},{-9,-10}}, color={191,0,0}));
  connect(Ti.port, port_a) annotation (Line(points={{-88,-8},{-88,0},{-86,0},{
          -100,0}}, color={0,127,255}));
  connect(product.u2, onOff2.y) annotation (Line(points={{72,-46},{50,-46},{50,40},
          {28.6,40}}, color={0,0,127}));
  connect(onOff2.u1, electricEffTable.y)
    annotation (Line(points={{14.8,40},{-3,40}},color={0,0,127}));
  connect(heatTable.u1, realExpression3.y)
    annotation (Line(points={{-62,-54},{-77,-54}}, color={0,0,127}));
  connect(ELFTable.u, realExpression3.y) annotation (Line(points={{-70,70},{-74,
          70},{-74,-54},{-77,-54}}, color={0,0,127}));
  connect(heaterOn.y, onOff1.u)
    annotation (Line(points={{-27.4,20},{0,20},{0,62.8}}, color={255,0,255}));
  connect(onOff2.u, onOff1.u) annotation (Line(points={{22,32.8},{22,32.8},{22,
          20},{0,20},{0,62.8}}, color={255,0,255}));
  connect(onOff.u, onOff1.u) annotation (Line(points={{-22,-52.8},{-22,4},{-22,
          4},{-22,20},{0,20},{0,62.8}}, color={255,0,255}));
  connect(greaterThreshold.y, heaterOn.u1)
    annotation (Line(points={{-51.6,20},{-41.2,20}}, color={255,0,255}));
  connect(greaterThreshold.u, realExpression.y)
    annotation (Line(points={{-60.8,20},{-77,20}}, color={0,0,127}));
  connect(u, heaterOn.u2) annotation (Line(points={{0,108},{0,86},{-44,86},{-44,
          24.8},{-41.2,24.8}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{70,60},{100,20}},
          lineColor={0,128,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="E"), Text(
          extent={{70,-20},{100,-60}},
          lineColor={0,128,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="G")}));
end CHP;
