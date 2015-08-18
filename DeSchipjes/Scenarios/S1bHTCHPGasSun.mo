within DeSchipjes.Scenarios;
model S1bHTCHPGasSun
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(redeclare DeSchipjes.Grids.ROM.ROMHT
      grid(ids={1,3,4,5,6,8,10,11,13,14,19}),
    TSupRad(u=70),
    TRetRad(u=50),
    TRetGrid(u=63),
    TSupGrid(u=80));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-100,80},{100,-80}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="1b")}), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}})));
end S1bHTCHPGasSun;
