within DeSchipjes.Scenarios;
model S4LTIdeal
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    TRadSupply=273.15+50,
    TRadReturn=273.15+40,
    TGrid=273.15+55,
    redeclare DeSchipjes.ProductionSites.IdealProduction productionSite(grid_dp=
          grid.dp_nominal*5),
    redeclare DeSchipjes.Grids.Full.LTFullGrid grid(strobe(filDir=
            Modelica.Utilities.Files.loadResource("modelica://Occupants") + "/"),
      QNom={2113,1409,1,1025,804,1},
      modulation=false));

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="4")}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(
      StopTime=1.05408e+07,
      Interval=900,
      __Dymola_fixedstepsize=10,
      __Dymola_Algorithm="Rkfix4"),
    __Dymola_experimentSetupOutput(
      derivatives=false,
      inputs=false,
      outputs=false,
      events=false));
end S4LTIdeal;
