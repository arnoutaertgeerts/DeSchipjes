within DeSchipjes.Scenarios;
model S1HTGasSun
  import DeSchipjes;
  extends DeSchipjes.Interfaces.Scenario(
    m_flow_nominal=0.5,
    redeclare ProductionSites.IdealProduction productionSite,
    redeclare DeSchipjes.Grids.BaseClasses.HTGrid grid);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={135,135,135},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="1")}));
end S1HTGasSun;
