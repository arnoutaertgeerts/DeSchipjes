within DeSchipjes.Scenarios;
model S2ITHPAWGas
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMIT
      grid, redeclare DeSchipjes.ProductionSites.GasHPAW productionSite);

public
  DeSchipjes.Controls.Modulator
                     modulator(start=2)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
equation
  connect(grid.u, productionSite.u) annotation (Line(points={{-34,21},{-34,40},
          {30,40},{30,21}}, color={255,0,255}));
  connect(modulator.on, productionSite.u) annotation (Line(points={{-59,40},{
          -34,40},{-34,40},{30,40},{30,21}}, color={255,0,255}));
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="2")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})));
end S2ITHPAWGas;
