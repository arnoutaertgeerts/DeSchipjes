within DeSchipjes.Dwellings.HeatingSystems.BaseClasses;
partial model PartialStorage
  //Extensions
  extends PartialRadiators(dHWTap(m_flow_nominal=m_flow_dhw, redeclare package
        Medium = Medium), bou1(nPorts=2));

  //Parameters
  parameter Modelica.SIunits.Length hTan=1.5 "Height of the storage tank";
  parameter Modelica.SIunits.Volume vTan=0.1 "Volume of the storage tank";

  Buildings.Fluid.Storage.StratifiedEnhancedInternalHex tan(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_dhw,
    dIns=0.02,
    redeclare package MediumHex = Medium,
    hHex_a=hTan,
    hHex_b=0,
    Q_flow_nominal=250,
    TTan_nominal=273 + 55,
    THex_nominal=273 + 55,
    mHex_flow_nominal=m_flow_dhw,
    dpHex_nominal=0)
    annotation (Placement(transformation(extent={{102,34},{82,54}})));
equation

  connect(tan.portHex_b, dHWTap.port_hot) annotation (Line(
      points={{102,36},{128,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tan.portHex_a, bou1.ports[2]) annotation (Line(
      points={{102,40.2},{120,40.2},{120,50},{160,50},{160,36},{166,36}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}), graphics));
end PartialStorage;
