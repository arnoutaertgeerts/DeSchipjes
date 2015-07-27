within DeSchipjes.Scenarios;
model S3ITBEOGas
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMIT
      grid, redeclare DeSchipjes.ProductionSites.GasBeoModulating
      productionSite,
    Qbase(u=28.8),
    Qpeak(u=154));

public
  DeSchipjes.Controls.Modulator modulator(start=2)
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{0,46},{12,34}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=TSupDhw.y)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
equation
  connect(modulator.on, grid.u)
    annotation (Line(points={{-69,40},{-62,40},{-62,11}}, color={255,0,255}));
  connect(switch1.u2, grid.u)
    annotation (Line(points={{-1.2,40},{-62,40},{-62,11}}, color={255,0,255}));
  connect(switch1.u3, productionSite.TBase) annotation (Line(points={{-1.2,44.8},
          {-6,44.8},{-6,76},{32,76},{32,11}}, color={0,0,127}));
  connect(switch1.y, productionSite.THigh)
    annotation (Line(points={{12.6,40},{24,40},{24,11}}, color={0,0,127}));
  connect(realExpression1.y, switch1.u1) annotation (Line(points={{-19,30},{-6,
          30},{-6,35.2},{-1.2,35.2}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="3")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=604800,
      __Dymola_fixedstepsize=5,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput);
end S3ITBEOGas;
