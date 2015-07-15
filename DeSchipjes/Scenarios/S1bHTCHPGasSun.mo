within DeSchipjes.Scenarios;
model S1bHTCHPGasSun
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMHT
      grid);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-100,80},{100,-80}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="1b")}));
end S1bHTCHPGasSun;
