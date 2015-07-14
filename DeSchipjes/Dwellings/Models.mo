within DeSchipjes.Dwellings;
package Models
  extends Modelica.Icons.ExamplesPackage;
  model HaarhakkerFull "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Building building(
      isDH=true,
      redeclare DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse
        building,
      modulating=false,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(id=3, VZones=building.building.VZones),
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(QNom=building.Q_design))
      annotation (Placement(transformation(extent={{-20,20},{0,40}})));

    Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
      redeclare package Medium = Annex60.Media.Water,
      m_flow_nominal=0.5,
      dp_nominal=0)
      annotation (Placement(transformation(extent={{-20,-26},{0,-6}})));
    Modelica.Blocks.Sources.Constant const(k=273.15 + 60)
      annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
    IDEAS.Fluid.Sources.FixedBoundary bou(
      nPorts=1,
      use_T=false,
      redeclare package Medium = Annex60.Media.Water) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={24,-16})));
    inner IDEAS.SimInfoManager sim
      annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  protected
    inner IDEAS.Occupants.Extern.StrobeInfoManager                strobe(
      FilNam_mDHW="mDHW.txt",
      FilNam_QRad="QRad.txt",
      FilNam_TSet="sh_day.txt",
      FilNam_TSet2="sh_night.txt",
      StROBe_P=true,
      FilNam_P="P.txt",
      FilNam_Q="Q.txt",
      FilNam_QCon="Q.txt",
      filDir=Modelica.Utilities.Files.loadResource("modelica://Occupants") + "/")
      annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  equation
    connect(building.flowPort_return, hea.port_a) annotation (Line(
        points={{-12,20},{-12,4},{-30,4},{-30,-16},{-20,-16}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(building.flowPort_supply, hea.port_b) annotation (Line(
        points={{-8,20},{-8,4},{12,4},{12,-16},{0,-16}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(hea.TSet, const.y) annotation (Line(
        points={{-22,-10},{-59,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bou.ports[1], hea.port_b) annotation (Line(
        points={{20,-16},{0,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end HaarhakkerFull;

  model HaarhakkerROM "Full model of a house in haarhakker street"

    //Extensions
    extends Modelica.Icons.Example;

    Building building(
      isDH=true,
      modulating=false,
      redeclare IDEAS.VentilationSystems.None ventilationSystem(redeclare
          package Medium = IDEAS.Media.Air),
      redeclare DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem
        heatingSystem(QNom=building.Q_design),
      redeclare DeSchipjes.Dwellings.Structures.Renovated.ROM.HaarhakkerROM
        building,
      redeclare IDEAS.Occupants.Extern.StROBe occupant(VZones=building.building.VZones,
          id=5))
      annotation (Placement(transformation(extent={{-20,14},{0,34}})));

    Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
      redeclare package Medium = Annex60.Media.Water,
      m_flow_nominal=0.5,
      dp_nominal=0)
      annotation (Placement(transformation(extent={{-20,-26},{0,-6}})));
    Modelica.Blocks.Sources.Constant const(k=273.15 + 60)
      annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
    IDEAS.Fluid.Sources.FixedBoundary bou(
      nPorts=1,
      use_T=false,
      redeclare package Medium = Annex60.Media.Water) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={24,-16})));
    inner IDEAS.SimInfoManager sim
      annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  protected
    inner IDEAS.Occupants.Extern.StrobeInfoManager                strobe(
      FilNam_mDHW="mDHW.txt",
      FilNam_QRad="QRad.txt",
      FilNam_TSet="sh_day.txt",
      FilNam_TSet2="sh_night.txt",
      StROBe_P=true,
      FilNam_P="P.txt",
      FilNam_Q="Q.txt",
      FilNam_QCon="Q.txt",
      filDir=Modelica.Utilities.Files.loadResource("modelica://Occupants") + "/")
      annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  equation
    connect(building.flowPort_return, hea.port_a) annotation (Line(
        points={{-12,14},{-12,4},{-30,4},{-30,-16},{-20,-16}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(building.flowPort_supply, hea.port_b) annotation (Line(
        points={{-8,14},{-8,4},{12,4},{12,-16},{0,-16}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(hea.TSet, const.y) annotation (Line(
        points={{-22,-10},{-59,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bou.ports[1], hea.port_b) annotation (Line(
        points={{20,-16},{0,-16}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics));
  end HaarhakkerROM;
end Models;
