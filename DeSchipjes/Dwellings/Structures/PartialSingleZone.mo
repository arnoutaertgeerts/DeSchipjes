within DeSchipjes.Dwellings.Structures;
partial model PartialSingleZone

  //Extensions
protected
  extends IDEAS.Interfaces.BaseClasses.Structure(
    nZones=1,
    final AZones={floor.AWall},
    final VZones={zone.V},
    final Q_design={zone.Q_design},
    final nEmb=0,
    final ATrans,
    redeclare package Medium = IDEAS.Media.Air);

  parameter Real left;
  parameter Real right;
  parameter Real front;
  parameter Real back;

  final parameter Real leftRad=left/180*Modelica.Constants.pi;
  final parameter Real rightRad=right/180*Modelica.Constants.pi;
  final parameter Real frontRad=front/180*Modelica.Constants.pi;
  final parameter Real backRad=back/180*Modelica.Constants.pi;

  //Components
  IDEAS.Buildings.Components.Zone zone(
    corrCV=5,
    redeclare package Medium = Medium,
    V=130.76,
    nSurf=9) annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
  IDEAS.Buildings.Components.OuterWall backWall(
    inc=1.5707963267949,
    AWall=27.33,
    azi=backRad,
    insulationThickness=0)
              annotation (Placement(transformation(
        extent={{-5.5,-10.5},{5.5,10.5}},
        rotation=0,
        origin={-85.5,0.5})));
  IDEAS.Buildings.Components.OuterWall frontWall(
    inc=1.5707963267949,
    AWall=35.55,
    azi=frontRad,
    insulationThickness=0)
               annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=180,
        origin={79,2})));
  IDEAS.Buildings.Components.OuterWall roof(
    final insulationThickness=0.08,
    redeclare final Data.Constructions.Old.DakHoofdGebouw constructionType,
    redeclare final Data.Insulation.RotsWolSpanten insulationType,
    AWall=50.38,
    inc=0,
    azi=0) annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=270,
        origin={1,36})));
  IDEAS.Buildings.Components.SlabOnGround floor(
    inc=0,
    azi=0,
    AWall=30.70,
    PWall=25,
    insulationThickness=0)
              annotation (Placement(transformation(extent={{-4,-50},{6,-30}})));
  IDEAS.Buildings.Components.InternalWall insideWall(
    inc=0,
    azi=0,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.BinnenMuur constructionType,
    AWall=38.24) annotation (Placement(transformation(
        extent={{-5,-10},{5,10}},
        rotation=90,
        origin={-45,0})));
  IDEAS.Buildings.Components.BoundaryWall commonWall(
    inc=1.5707963267949,
    final insulationThickness=0,
    redeclare final Data.Constructions.Old.GemeneMuur constructionType,
    AWall=36.14,
    azi=leftRad)
              annotation (Placement(transformation(extent={{50,-8},{40,12}})));
  IDEAS.Buildings.Components.Window windowBack(
    frac=0.15,
    redeclare Data.Frames.LoofHout fraType,
    inc=1.5707963267949,
    A=5.62,
    azi=back,
    redeclare DeSchipjes.Dwellings.Structures.Data.Glass.DubbelGlas glazing)
    annotation (Placement(transformation(extent={{-120,-10},{-110,10}})));
  IDEAS.Buildings.Components.Window windowFront(
    frac=0.12,
    redeclare Data.Frames.LoofHout fraType,
    inc=1.5707963267949,
    A=6.60,
    azi=front,
    redeclare DeSchipjes.Dwellings.Structures.Data.Glass.DubbelGlas glazing)
    annotation (Placement(transformation(extent={{112,-8},{102,12}})));
equation
  connect(insideWall.propsBus_a, zone.propsBus[1]) annotation (Line(
      points={{-49,5},{-49,10},{-22,10},{-22,5.77778},{-6,5.77778}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(insideWall.propsBus_b, zone.propsBus[2]) annotation (Line(
      points={{-49,-5},{-49,-8},{-20,-8},{-20,5.33333},{-6,5.33333}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(backWall.propsBus_a, zone.propsBus[3]) annotation (Line(
      points={{-80,4.7},{-60,4.7},{-60,-18},{-18,-18},{-18,4.88889},{-6,4.88889}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(windowBack.propsBus_a, zone.propsBus[4]) annotation (Line(
      points={{-110,4},{-94,4},{-94,-22},{-16,-22},{-16,4.44444},{-6,4.44444}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(roof.propsBus_a, zone.propsBus[5]) annotation (Line(
      points={{5,31},{5,14},{-12,14},{-12,4},{-6,4}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(floor.propsBus_a, zone.propsBus[6]) annotation (Line(
      points={{6,-36},{12,-36},{12,-22},{-14,-22},{-14,3.55556},{-6,3.55556}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(commonWall.propsBus_a, zone.propsBus[7]) annotation (Line(
      points={{40,6},{20,6},{20,-12},{-12,-12},{-12,3.11111},{-6,3.11111}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(frontWall.propsBus_a, zone.propsBus[8]) annotation (Line(
      points={{74,-2},{54,-2},{54,-16},{-10,-16},{-10,2.66667},{-6,2.66667}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(windowFront.propsBus_a, zone.propsBus[9]) annotation (Line(
      points={{102,6},{92,6},{92,-18},{-8,-18},{-8,2.22222},{-6,2.22222}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flowPort_Out[1], zone.flowPort_Out) annotation (Line(
      points={{-20,100},{-20,20},{2,20},{2,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flowPort_In[1], zone.flowPort_In) annotation (Line(
      points={{20,100},{18,100},{18,20},{8,20},{8,10},{6,10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(zone.gainCon, heatPortCon[1]) annotation (Line(
      points={{14,-3},{34,-3},{34,-28},{128,-28},{128,20},{150,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(zone.gainRad, heatPortRad[1]) annotation (Line(
      points={{14,-6},{30,-6},{30,-40},{140,-40},{140,-20},{150,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(zone.TSensor, TSensor[1]) annotation (Line(
      points={{14.6,0},{38,0},{38,-60},{156,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{150,100}}), graphics));
end PartialSingleZone;
