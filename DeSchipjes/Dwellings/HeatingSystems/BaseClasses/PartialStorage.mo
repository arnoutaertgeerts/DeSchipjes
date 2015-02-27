within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorage
  //Extensions
  extends PartialRadiators(dHWTap(m_flow_nominal=m_flow_dhw, redeclare package
        Medium = Medium));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  IDEAS.Fluid.Storage.StorageTank_OneIntHX storageTank_OneIntHX(
    redeclare package MediumHX = Medium,
    redeclare package Medium = Medium,
    nbrNodes=5,
    m_flow_nominal_HX=m_flow_dhw,
    volumeTank=vTan,
    heightTank=hTan)
    annotation (Placement(transformation(extent={{104,42},{82,74}})));
equation
  connect(storageTank_OneIntHX.portHXLower, dHWTap.port_hot) annotation (Line(
      points={{104,46.9231},{130,46.9231},{130,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storageTank_OneIntHX.portHXUpper, dHWTap.port_cold) annotation (Line(
      points={{104,51.8462},{108,51.8462},{108,60},{160,60},{160,46},{156,
          46}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorage;
