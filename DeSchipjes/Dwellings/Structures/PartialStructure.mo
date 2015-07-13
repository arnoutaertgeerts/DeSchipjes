within DeSchipjes.Dwellings.Structures;
partial model PartialStructure "Standaard woning de schipjes"

  //Extensions
  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=6,
    final AZones={woonruimteA,keukenA,wcA,slaapkamerA,badkamerA,nachthalA},
    final VZones={woonruimte.V,keuken.V,wc.V,slaapkamer.V,badkamer.V,nachthal.V},
    final Q_design={woonruimte.Q_design, keuken.Q_design, badkamer.Q_design, slaapkamer.Q_design, wc.Q_design, nachthal.Q_design},
    final nEmb=0,
    final ATrans,
    redeclare package Medium = IDEAS.Media.Air);

  parameter Modelica.SIunits.Length isolatieTest=0;

  parameter Modelica.SIunits.Area woonruimteA=21.73;
  parameter Modelica.SIunits.Area keukenA=7.32;
  parameter Modelica.SIunits.Area wcA=1.65;
  parameter Modelica.SIunits.Area slaapkamerA=10.79;
  parameter Modelica.SIunits.Area badkamerA=3.61;
  parameter Modelica.SIunits.Area nachthalA=3.23;

  //Components
  IDEAS.Buildings.Components.Zone woonruimte(
    V=70.1,
    corrCV=5,
    nSurf=10,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{110,148},{130,168}})));
  IDEAS.Buildings.Components.Zone keuken(V=17.13, nSurf=8,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{86,102},{106,122}})));
  IDEAS.Buildings.Components.Zone wc(V=3.86, nSurf=7,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{88,46},{108,66}})));
  IDEAS.Buildings.Components.Zone slaapkamer(V=24.17, nSurf=10,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,-4},{110,16}})));
  IDEAS.Buildings.Components.Zone badkamer(V=8.09, nSurf=7,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,-48},{110,-28}})));
  IDEAS.Buildings.Components.Zone nachthal(V=7.24, nSurf=6,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{74,-90},{94,-70}})));
  IDEAS.Buildings.Components.BoundaryWall woonruimteGemeenschappelijk(
    AWall=17.10,
    inc=1.5707963267949,
    azi=2.3736477827123,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.GemeneMuur constructionType)
    annotation (Placement(transformation(extent={{-58,138},{-48,158}})));
  IDEAS.Buildings.Components.InternalWall woonruimteKeuken(
    AWall=6.97,
    inc=1.5707963267949,
    azi=2.3736477827123,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=180,
        origin={-19,180})));
  IDEAS.Buildings.Components.OuterWall woonruimteKoer(
    AWall=5.15,
    inc=1.5707963267949,
    azi=2.3736477827123)
    annotation (Placement(transformation(extent={{-138,158},{-128,178}})));
  IDEAS.Buildings.Components.SlabOnGround woonruimteVloer(
    PWall=18.92,
    inc=0,
    azi=0,
    AWall=woonruimteA)
    annotation (Placement(transformation(extent={{-68,176},{-58,196}})));
  IDEAS.Buildings.Components.OuterWall woonruimteAchtergevel(
    AWall=13.23,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-94,154},{-84,174}})));
  IDEAS.Buildings.Components.OuterWall woonruimteVoorgevel(
    AWall=9.29,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-114,128},{-104,148}})));
  IDEAS.Buildings.Components.InternalWall woonruimteHal(
    AWall=3.32,
    inc=0,
    azi=0,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={67,180})));
  IDEAS.Buildings.Components.InternalWall woonruimteBad(
    AWall=3.61,
    inc=0,
    azi=0,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={41,176})));
  IDEAS.Buildings.Components.InternalWall woonruimteSlaapkamer(
    AWall=10.79,
    inc=0,
    azi=0,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={11,182})));
  IDEAS.Buildings.Components.OuterWall keukenAchtergevel(
    AWall=7.56,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-132,94},{-122,114}})));
  IDEAS.Buildings.Components.Window woonruimteWindow(
    A=5.78,
    frac=0.12,
    redeclare Data.Frames.LoofHout fraType,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{76,138},{86,158}})));
  IDEAS.Buildings.Components.Window keukenWindowLarge(
    A=4.57,
    frac=0.15,
    redeclare Data.Frames.LoofHout fraType,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-90,92},{-80,112}})));
  IDEAS.Buildings.Components.Window keukenWindowSmall(
    A=1.05,
    frac=0.25,
    redeclare Data.Frames.LoofHout fraType,
    inc=1.5707963267949,
    azi=2.3736477827123)
    annotation (Placement(transformation(extent={{-72,92},{-62,112}})));
  IDEAS.Buildings.Components.BoundaryWall keukenGemeenschappelijk(
    AWall=5.92,
    inc=1.5707963267949,
    azi=2.3736477827123,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.GemeneMuur constructionType)
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=0,
        origin={-27,102})));
  IDEAS.Buildings.Components.SlabOnGround keukenVloer(
    AWall=7.27,
    PWall=11.16,
    inc=0,
    azi=0) annotation (Placement(transformation(extent={{-52,92},{-42,112}})));
  IDEAS.Buildings.Components.OuterWall keukenDak(
    AWall=keukenA,
    inc=0,
    azi=0,
    redeclare final Data.Constructions.Old.DakBijBouw constructionType,
    final insulationThickness=0.08,
    redeclare final Data.Insulation.RotsWolSKepers insulationType)
    annotation (Placement(transformation(extent={{-112,92},{-102,112}})));
  IDEAS.Buildings.Components.InternalWall keukenWC(
    AWall=1.96,
    inc=1.5707963267949,
    azi=3.9444441095072,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=0,
        origin={11,102})));
  IDEAS.Buildings.Components.BoundaryWall WCGemeenschappelijk(
    AWall=2.85,
    inc=1.5707963267949,
    azi=2.3736477827123,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.GemeneMuur constructionType)
    annotation (Placement(transformation(extent={{-28,46},{-18,66}})));
  IDEAS.Buildings.Components.OuterWall WCKoer(
    AWall=2.83,
    inc=1.5707963267949,
    azi=2.3736477827123)
    annotation (Placement(transformation(extent={{-134,46},{-124,66}})));
  IDEAS.Buildings.Components.Window raamwc(
    A=0.07,
    frac=0.89,
    redeclare Data.Frames.LoofHout fraType,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-66,46},{-56,66}})));
  IDEAS.Buildings.Components.OuterWall WCVoorgevel(
    AWall=2.65,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-110,46},{-100,66}})));
  IDEAS.Buildings.Components.SlabOnGround WCVloer(
    AWall=wcA,
    inc=0,
    azi=0,
    PWall=4.74)
    annotation (Placement(transformation(extent={{-48,46},{-38,66}})));
  IDEAS.Buildings.Components.OuterWall WCDak(
    AWall=wcA,
    inc=0,
    azi=0,
    final insulationThickness=0.08,
    redeclare final Data.Constructions.Old.DakBijBouw constructionType,
    redeclare final Data.Insulation.RotsWolSKepers insulationType) annotation (
      Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=270,
        origin={-83,58})));
  IDEAS.Buildings.Components.OuterWall slaapkamerZijgevel(
    AWall=2.41,
    inc=1.5707963267949,
    azi=2.3736477827123)
    annotation (Placement(transformation(extent={{-132,-2},{-122,18}})));
  IDEAS.Buildings.Components.OuterWall slaapkamerVoorgevel(
    AWall=13.22,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-114,-2},{-104,18}})));
  IDEAS.Buildings.Components.BoundaryWall slaapkamerGemeenschappelijk(
    AWall=10.27,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.GemeneMuur constructionType,
    inc=1.5707963267949,
    azi=2.3736477827123)
    annotation (Placement(transformation(extent={{-92,-2},{-82,18}})));
  IDEAS.Buildings.Components.InternalWall slaapkamerBadLiggend(
    AWall=4.26,
    inc=1.5707963267949,
    azi=3.9444441095072,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(extent={{-68,4},{-58,24}})));
  IDEAS.Buildings.Components.InternalWall slaapkamerBadStaand(
    AWall=1.12,
    inc=1.5707963267949,
    azi=2.3736477827123,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(extent={{-50,8},{-40,28}})));
  IDEAS.Buildings.Components.InternalWall slaapkamerHal(
    AWall=3.81,
    inc=1.5707963267949,
    azi=3.9444441095072,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(extent={{-30,-14},{-20,6}})));
  IDEAS.Buildings.Components.Window slaapkamerRaam(
    A=0.75,
    frac=0.21,
    redeclare Data.Frames.LoofHout fraType,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-12,-2},{-2,18}})));
  IDEAS.Buildings.Components.OuterWall slaapkamerDakLinks(
    AWall=11.73,
    redeclare final Data.Constructions.Old.DakHoofdGebouw constructionType,
    final insulationThickness=0.08,
    redeclare final Data.Insulation.RotsWolSpanten insulationType,
    inc=5.235987755983,
    azi=2.3736477827123) annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=270,
        origin={-21,30})));
  IDEAS.Buildings.Components.OuterWall badkamerAchtergevel(
    AWall=1.34,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-132,-38},{-122,-18}})));
  IDEAS.Buildings.Components.OuterWall badkamerZijgevel(
    AWall=4.05,
    inc=1.5707963267949,
    azi=2.3736477827123)
    annotation (Placement(transformation(extent={{-110,-38},{-100,-18}})));
  IDEAS.Buildings.Components.OuterWall badkamerDak(
    AWall=8.74,
    final insulationThickness=0.08,
    redeclare final Data.Constructions.Old.DakHoofdGebouw constructionType,
    redeclare final Data.Insulation.RotsWolSpanten insulationType,
    inc=5.3407075111026,
    azi=3.9444441095072) annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=270,
        origin={11,-22})));
  IDEAS.Buildings.Components.InternalWall badkamerHal(
    AWall=2.4,
    inc=1.5707963267949,
    azi=2.3736477827123,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType)
    annotation (Placement(transformation(extent={{-78,-38},{-68,-18}})));
  IDEAS.Buildings.Components.OuterWall halAchtergevel(
    AWall=1.06,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-130,-78},{-120,-58}})));
  IDEAS.Buildings.Components.OuterWall halDak(
    AWall=6.89,
    final insulationThickness=0.08,
    redeclare final Data.Constructions.Old.DakHoofdGebouw constructionType,
    redeclare final Data.Insulation.RotsWolSpanten insulationType,
    inc=5.3407075111026,
    azi=3.9444441095072) annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=270,
        origin={17,-66})));
  IDEAS.Buildings.Components.BoundaryWall halGemeenschappelijk(
    AWall=4.05,
    inc=1.5707963267949,
    azi=2.3736477827123,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.GemeneMuur constructionType)
    annotation (Placement(transformation(extent={{-108,-78},{-98,-58}})));
  IDEAS.Buildings.Components.OuterWall slaapkamerDakRechts(
    AWall=14.05,
    final insulationThickness=0.08,
    redeclare final Data.Constructions.Old.DakHoofdGebouw constructionType,
    redeclare final Data.Insulation.RotsWolSpanten insulationType,
    inc=2.0943951023932,
    azi=2.3736477827123) annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=270,
        origin={13,30})));
equation
  connect(woonruimteHal.propsBus_a, woonruimte.propsBus[1]) annotation (Line(
      points={{63,185},{63,163.8},{110,163.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteBad.propsBus_a, woonruimte.propsBus[2]) annotation (Line(
      points={{37,181},{37,163.4},{110,163.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteSlaapkamer.propsBus_a, woonruimte.propsBus[3]) annotation (
      Line(
      points={{7,187},{7,163},{110,163}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteKeuken.propsBus_a, woonruimte.propsBus[4]) annotation (Line(
      points={{-24,176},{-24,162},{44,162},{44,162.6},{110,162.6}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteGemeenschappelijk.propsBus_a, woonruimte.propsBus[5])
    annotation (Line(
      points={{-48,152},{34,152},{34,162.2},{110,162.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteVloer.propsBus_a, woonruimte.propsBus[6]) annotation (Line(
      points={{-58,190},{-42,190},{-42,161.8},{110,161.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteAchtergevel.propsBus_a, woonruimte.propsBus[7]) annotation (
     Line(
      points={{-84,168},{-62,168},{-62,161.4},{110,161.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteVoorgevel.propsBus_a, woonruimte.propsBus[8]) annotation (
      Line(
      points={{-104,142},{-64,142},{-64,161},{110,161}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteKoer.propsBus_a, woonruimte.propsBus[9]) annotation (Line(
      points={{-128,172},{-102,172},{-102,160.6},{110,160.6}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteKeuken.propsBus_b, keuken.propsBus[1]) annotation (Line(
      points={{-14,176},{-14,136},{-24,136},{-24,130},{26,130},{26,117.75},{86,117.75}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(woonruimteSlaapkamer.propsBus_b, slaapkamer.propsBus[1]) annotation (
      Line(
      points={{7,177},{7,150},{0,150},{0,132},{58,132},{58,11.8},{90,11.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(woonruimteBad.propsBus_b, badkamer.propsBus[1]) annotation (Line(
      points={{37,171},{37,-32.2857},{90,-32.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteHal.propsBus_b, nachthal.propsBus[1]) annotation (Line(
      points={{63,175},{63,-74.3333},{74,-74.3333}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimteWindow.propsBus_a, woonruimte.propsBus[10]) annotation (
      Line(
      points={{86,152},{98,152},{98,160.2},{110,160.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenWC.propsBus_a, keuken.propsBus[2]) annotation (Line(
      points={{16,106},{86,106},{86,117.25}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenWC.propsBus_b, wc.propsBus[1]) annotation (Line(
      points={{6,106},{2,106},{2,61.7143},{88,61.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenGemeenschappelijk.propsBus_a, keuken.propsBus[3]) annotation (
      Line(
      points={{-22,106},{-18,106},{-18,112},{86,112},{86,116.75}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenVloer.propsBus_a, keuken.propsBus[4]) annotation (Line(
      points={{-42,106},{-40,106},{-40,108},{-34,108},{-34,116.25},{86,116.25}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(keukenWindowSmall.propsBus_a, keuken.propsBus[5]) annotation (Line(
      points={{-62,106},{-56,106},{-56,115.75},{86,115.75}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenWindowLarge.propsBus_a, keuken.propsBus[6]) annotation (Line(
      points={{-80,106},{-74,106},{-74,115.25},{86,115.25}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenDak.propsBus_a, keuken.propsBus[7]) annotation (Line(
      points={{-102,106},{-96,106},{-96,114.75},{86,114.75}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenAchtergevel.propsBus_a, keuken.propsBus[8]) annotation (Line(
      points={{-122,108},{-114,108},{-114,114.25},{86,114.25}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(WCGemeenschappelijk.propsBus_a, wc.propsBus[2]) annotation (Line(
      points={{-18,60},{48,60},{48,58},{88,58},{88,61.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(WCVloer.propsBus_a, wc.propsBus[3]) annotation (Line(
      points={{-38,60},{26,60},{26,60.5714},{88,60.5714}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(raamwc.propsBus_a, wc.propsBus[4]) annotation (Line(
      points={{-56,60},{88,60}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(WCDak.propsBus_a, wc.propsBus[5]) annotation (Line(
      points={{-79,53},{-79,46},{-70,46},{-70,59.4286},{88,59.4286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(WCVoorgevel.propsBus_a, wc.propsBus[6]) annotation (Line(
      points={{-100,60},{-6,60},{-6,58.8571},{88,58.8571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(WCKoer.propsBus_a, wc.propsBus[7]) annotation (Line(
      points={{-124,60},{-18,60},{-18,58.2857},{88,58.2857}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerDakLinks.propsBus_a, slaapkamer.propsBus[2]) annotation (
      Line(
      points={{-17,25},{-17,11.4},{90,11.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerRaam.propsBus_a, slaapkamer.propsBus[3]) annotation (Line(
      points={{-2,12},{44,12},{44,11},{90,11}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerHal.propsBus_a, slaapkamer.propsBus[4]) annotation (Line(
      points={{-20,0},{36,0},{36,10.6},{90,10.6}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerBadStaand.propsBus_a, slaapkamer.propsBus[5]) annotation (
      Line(
      points={{-40,22},{26,22},{26,10.2},{90,10.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerBadLiggend.propsBus_a, slaapkamer.propsBus[6]) annotation (
      Line(
      points={{-58,18},{16,18},{16,9.8},{90,9.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerGemeenschappelijk.propsBus_a, slaapkamer.propsBus[7])
    annotation (Line(
      points={{-82,12},{4,12},{4,9.4},{90,9.4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerVoorgevel.propsBus_a, slaapkamer.propsBus[8]) annotation (
      Line(
      points={{-104,12},{-8,12},{-8,9},{90,9}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerZijgevel.propsBus_a, slaapkamer.propsBus[9]) annotation (
      Line(
      points={{-122,12},{-16,12},{-16,8.6},{90,8.6}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerBadStaand.propsBus_b, badkamer.propsBus[2]) annotation (
      Line(
      points={{-50,22},{-52,22},{-52,-32.8571},{90,-32.8571}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerBadLiggend.propsBus_b, badkamer.propsBus[3]) annotation (
      Line(
      points={{-68,18},{-72,18},{-72,20},{-76,20},{-76,-12},{-44,-12},{-44,
          -33.4286},{90,-33.4286}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(badkamerHal.propsBus_a, badkamer.propsBus[4]) annotation (Line(
      points={{-68,-24},{-60,-24},{-60,-34},{90,-34}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(badkamerDak.propsBus_a, badkamer.propsBus[5]) annotation (Line(
      points={{15,-27},{15,-34.5714},{90,-34.5714}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(badkamerZijgevel.propsBus_a, badkamer.propsBus[6]) annotation (Line(
      points={{-100,-24},{-90,-24},{-90,-35.1429},{90,-35.1429}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(badkamerAchtergevel.propsBus_a, badkamer.propsBus[7]) annotation (
      Line(
      points={{-122,-24},{-112,-24},{-112,-35.7143},{90,-35.7143}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(badkamerHal.propsBus_b, nachthal.propsBus[3]) annotation (Line(
      points={{-78,-24},{-82,-24},{-82,-75.6667},{74,-75.6667}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerHal.propsBus_b, nachthal.propsBus[2]) annotation (Line(
      points={{-30,0},{-34,0},{-34,-75},{74,-75}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(halGemeenschappelijk.propsBus_a, nachthal.propsBus[4]) annotation (
      Line(
      points={{-98,-64},{-62,-64},{-62,-76.3333},{74,-76.3333}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(halDak.propsBus_a, nachthal.propsBus[5]) annotation (Line(
      points={{21,-71},{21,-77},{74,-77}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(halAchtergevel.propsBus_a, nachthal.propsBus[6]) annotation (Line(
      points={{-120,-64},{-116,-64},{-116,-78},{74,-78},{74,-77.6667}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(woonruimte.gainCon, heatPortCon[1]) annotation (Line(
      points={{130,155},{176,155},{176,11.6667},{150,11.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(woonruimte.gainRad, heatPortRad[1]) annotation (Line(
      points={{130,152},{174,152},{174,-28.3333},{150,-28.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(keuken.gainCon, heatPortCon[2]) annotation (Line(
      points={{106,109},{156,109},{156,15},{150,15}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(keuken.gainRad, heatPortRad[2]) annotation (Line(
      points={{106,106},{142,106},{142,-25},{150,-25}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(slaapkamer.gainCon, heatPortCon[4]) annotation (Line(
      points={{110,3},{120,3},{120,4},{132,4},{132,21.6667},{150,21.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(slaapkamer.gainRad, heatPortRad[4]) annotation (Line(
      points={{110,0},{188,0},{188,-18.3333},{150,-18.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(woonruimte.TSensor, TSensor[1]) annotation (Line(
      points={{130.6,158},{176,158},{176,-68.3333},{156,-68.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(keuken.TSensor, TSensor[2]) annotation (Line(
      points={{106.6,112},{160,112},{160,-65},{156,-65}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(slaapkamer.TSensor, TSensor[4]) annotation (Line(
      points={{110.6,6},{166,6},{166,-58.3333},{156,-58.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(nachthal.TSensor, TSensor[6]) annotation (Line(
      points={{94.6,-80},{162.3,-80},{162.3,-51.6667},{156,-51.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(nachthal.gainCon, heatPortCon[6]) annotation (Line(
      points={{94,-83},{162,-83},{162,28.3333},{150,28.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nachthal.gainRad, heatPortRad[6]) annotation (Line(
      points={{94,-86},{164,-86},{164,-11.6667},{150,-11.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(woonruimte.flowPort_Out, flowPort_Out[1]) annotation (Line(
      points={{118,168},{118,170},{-2,170},{-2,91.6667},{-20,91.6667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(woonruimte.flowPort_In, flowPort_In[1]) annotation (Line(
      points={{122,168},{122,188},{20,188},{20,91.6667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(keuken.flowPort_Out, flowPort_Out[2]) annotation (Line(
      points={{94,122},{94,144},{-20,144},{-20,95}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(keuken.flowPort_In, flowPort_In[2]) annotation (Line(
      points={{98,122},{94,122},{94,174},{20,174},{20,95}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(wc.flowPort_Out, flowPort_Out[3]) annotation (Line(
      points={{96,66},{96,90},{-20,90},{-20,98.3333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(wc.flowPort_In, flowPort_In[3]) annotation (Line(
      points={{100,66},{102,66},{102,96},{44,96},{44,98.3333},{20,98.3333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(slaapkamer.flowPort_Out, flowPort_Out[4]) annotation (Line(
      points={{98,16},{98,46},{-20,46},{-20,101.667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(slaapkamer.flowPort_In, flowPort_In[4]) annotation (Line(
      points={{102,16},{104,16},{104,36},{20,36},{20,101.667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(badkamer.flowPort_Out, flowPort_Out[5]) annotation (Line(
      points={{98,-28},{98,-10},{-20,-10},{-20,105}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(badkamer.flowPort_In, flowPort_In[5]) annotation (Line(
      points={{102,-28},{102,-6},{20,-6},{20,105}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(slaapkamerDakRechts.propsBus_a, slaapkamer.propsBus[10]) annotation (
      Line(
      points={{17,25},{17,8.2},{90,8.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(nachthal.flowPort_In, flowPort_In[6]) annotation (Line(
      points={{86,-70},{86,72},{20,72},{20,108.333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(nachthal.flowPort_Out, flowPort_Out[6]) annotation (Line(
      points={{82,-70},{78,-70},{78,18},{-20,18},{-20,108.333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(badkamer.TSensor, TSensor[3]) annotation (Line(
      points={{110.6,-38},{134,-38},{134,-61.6667},{156,-61.6667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(badkamer.gainCon, heatPortCon[3]) annotation (Line(
      points={{110,-41},{178,-41},{178,18.3333},{150,18.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(badkamer.gainRad, heatPortRad[3]) annotation (Line(
      points={{110,-44},{150,-44},{150,-21.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(wc.TSensor, TSensor[5]) annotation (Line(
      points={{108.6,56},{128,56},{128,-55},{156,-55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(wc.gainCon, heatPortCon[5]) annotation (Line(
      points={{108,53},{150,53},{150,52},{150,52},{150,25}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(wc.gainRad, heatPortRad[5]) annotation (Line(
      points={{108,50},{120,50},{120,-15},{150,-15}},
      color={191,0,0},
      smooth=Smooth.None));

  // Linerization connections
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{220,200}}), graphics));
end PartialStructure;
