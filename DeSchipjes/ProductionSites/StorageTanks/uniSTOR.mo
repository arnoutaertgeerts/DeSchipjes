within DeSchipjes.ProductionSites.StorageTanks;
model uniSTOR "The Vaillant uniSTOR tank"

  //Extensions
  extends Buildings.Fluid.Storage.StratifiedEnhancedInternalHex(
    VTan=0.950,
    hTan=0.820,
    dIns=0.05,
    kIns=Modelica.Math.log((ri+dIns)/ri)/(2*Modelica.Constants.pi*R*hTan),
    m_flow_nominal=0.028,
    hHex_a=0.815,
    hHex_b=0.05,
    Q_flow_nominal=31000,
    TTan_nominal=273.15+10,
    THex_nominal=273.15+80,
    mHex_flow_nominal=0.41);

  parameter Modelica.SIunits.ThermalResistance R;
  final parameter Real ri = sqrt(VTan/(Modelica.Constants.pi*hTan));

end uniSTOR;
