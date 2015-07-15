within DeSchipjes.Scenarios;
model S4LTIdeal
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare
      DeSchipjes.ProductionSites.IdealProduction productionSite,
    redeclare DeSchipjes.Grids.ROM.ROMLT       grid(strobe(filDir=
            Modelica.Utilities.Files.loadResource("modelica://Occupants") + "/"),
        modulating=false));

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
