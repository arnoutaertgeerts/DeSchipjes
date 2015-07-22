within DeSchipjes.Scenarios;
package Ideal

  model HTIdeal
    import DeSchipjes;
    extends DeSchipjes.Interfaces.Scenario(redeclare
        DeSchipjes.ProductionSites.Ideal.IdealProduction
                                                   productionSite(TSupRad=
            273.15 + 75, m_flow_nominal=4),
      redeclare DeSchipjes.Grids.ROM.ROMHT          grid);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-80,80},{80,-80}},
            lineColor={135,135,135},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="H")}),
      experiment(
        StopTime=250000,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput,
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}})));
  end HTIdeal;

  model ITIdeal "IT grid with ideal production"
    import DeSchipjes;
    extends DeSchipjes.Interfaces.Scenario(
      redeclare DeSchipjes.Grids.ROM.ROMIT     grid(TSupRad=273.15 + 50,
        m_flow_nominal=0.41*11,
        TRetRad=273.15 + 40),                  redeclare
        DeSchipjes.ProductionSites.Ideal.IdealModulatingProduction
                                                             productionSite(
          m_flow_nominal=4));

  public
    DeSchipjes.Controls.Modulator
                       modulator(start=2)
      annotation (Placement(transformation(extent={{-82,50},{-62,70}})));
  equation
    connect(modulator.on, grid.u)
      annotation (Line(points={{-61,60},{-34,60},{-34,21}}, color={255,0,255}));
    connect(productionSite.u, grid.u) annotation (Line(points={{30,21},{30,60},{-34,
            60},{-34,21}}, color={255,0,255}));
    annotation (Icon(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={135,135,135},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="M")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}})),
      experiment(
        StopTime=250000,
        __Dymola_fixedstepsize=30,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput);
  end ITIdeal;

  model LTIdeal
    import DeSchipjes;
    extends DeSchipjes.Interfaces.Scenario(redeclare
        DeSchipjes.ProductionSites.Ideal.IdealProduction
                                                   productionSite(m_flow_nominal=1),
      redeclare DeSchipjes.Grids.ROM.ROMLT       grid(
          modulating=false));

    annotation (Icon(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={135,135,135},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="L")}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics),
      experiment(
        StopTime=604800,
        Interval=900,
        __Dymola_fixedstepsize=10,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput(
        derivatives=false,
        inputs=false,
        outputs=false,
        events=false));
  end LTIdeal;
end Ideal;
