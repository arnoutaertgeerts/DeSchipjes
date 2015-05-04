within DeSchipjes.Dwellings.Structures.Renovated.Examples;
model haarhakkerStraatHouse_lin
  extends Modelica.Icons.Example;
  BaseClasses.HaarhakkerStraatHouse_lin building
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  IDEAS.Buildings.Linearization.BaseClasses.StateSpace ssm(
    fileName="ssm.mat",
    nWin=5,
    x_start=293.15*ones(ssm.states),
    nQConv=6,
    nQRad=6)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add error[6](k2=-1)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
public
  inner IDEAS.SimInfoManager sim(linearize=true, offsetAzi=0.95993108859688)
    "Simulation information manager for climate data"
    annotation (Placement(transformation(extent={{-92,68},{-72,88}})));
  IDEAS.Buildings.Components.LinearizableWindow woonruimteWindow(
    A=5.78,
    frac=0.12,
    redeclare Data.Frames.LoofHout fraType,
    use_ctrl=false,
    linearize=true,
    linOut=true,
    inc=3.9444441095072,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-80,38},{-70,58}})));
  IDEAS.Buildings.Components.LinearizableWindow keukenWindowLarge(
    A=4.57,
    frac=0.15,
    redeclare Data.Frames.LoofHout fraType,
    use_ctrl=false,
    linearize=true,
    linOut=true,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-80,12},{-70,32}})));
  IDEAS.Buildings.Components.LinearizableWindow keukenWindowSmall(
    A=1.05,
    frac=0.25,
    redeclare Data.Frames.LoofHout fraType,
    use_ctrl=false,
    linearize=true,
    linOut=true,
    inc=1.5707963267949,
    azi=2.3736477827123)
    annotation (Placement(transformation(extent={{-80,-14},{-70,6}})));
  IDEAS.Buildings.Components.LinearizableWindow raamwc(
    A=0.07,
    frac=0.89,
    redeclare Data.Frames.LoofHout fraType,
    use_ctrl=false,
    linearize=true,
    linOut=true,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-80,-40},{-70,-20}})));
  IDEAS.Buildings.Components.LinearizableWindow slaapkamerRaam(
    A=0.75,
    frac=0.21,
    redeclare Data.Frames.LoofHout fraType,
    use_ctrl=false,
    linearize=true,
    linOut=true,
    inc=1.5707963267949,
    azi=3.9444441095072)
    annotation (Placement(transformation(extent={{-80,-68},{-70,-48}})));
  IDEAS.Buildings.Components.Interfaces.WinBus winBus1[5](nLay=3) annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-40,40}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=270,
        origin={-100,-40})));
  Modelica.Blocks.Sources.Sine sine[6](amplitude=100, freqHz=1/(86400*0.5))
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
initial algorithm
    ssm.y :=building.TSensor;

equation
  connect(sim.weaBus, building.weaBus1) annotation (Line(
      points={{-80.6,85.2},{-80.6,92},{-26,92},{-26,58},{-10,58}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
//   connect(keukenWindowLarge.winBus, singleRoom1.winBus1[1]) annotation (Line(
//       points={{-43.8,46},{-34,46},{-34,48.3},{-10,48.3}},
//       color={255,204,51},
//       thickness=0.5,
//       smooth=Smooth.None));
//   connect(keukenWindowLarge.winBus, singleRoom_SSM1.winBus[1]) annotation (Line(
//       points={{-43.8,46},{-34,46},{-34,0},{-10,0}},
//       color={255,204,51},
//       thickness=0.5,
//       smooth=Smooth.None));
  connect(ssm.y, error.u2) annotation (Line(
      points={{10.4,0},{18,0},{18,24},{38,24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(woonruimteWindow.winBus, winBus1[1]) annotation (Line(
      points={{-69.8,42},{-58,42},{-58,56},{-40,56}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(keukenWindowLarge.winBus, winBus1[2]) annotation (Line(
      points={{-69.8,16},{-56,16},{-56,48},{-40,48}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(keukenWindowSmall.winBus, winBus1[3]) annotation (Line(
      points={{-69.8,-10},{-54,-10},{-54,40},{-40,40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(raamwc.winBus, winBus1[4]) annotation (Line(
      points={{-69.8,-36},{-52,-36},{-52,32},{-40,32}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(sim.weaBus, woonruimteWindow.weaBus) annotation (Line(
      points={{-80.6,85.2},{-80.6,92},{-94,92},{-94,58},{-83,58}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(building.winBus1, winBus1) annotation (Line(
      points={{-10,42},{-24,42},{-24,40},{-40,40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(ssm.winBus, winBus1) annotation (Line(
      points={{-9.8,6},{-24,6},{-24,40},{-40,40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(building.TSensor, error.u1) annotation (Line(
      points={{11,50},{18,50},{18,36},{38,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(slaapkamerRaam.winBus, winBus1[5]) annotation (Line(
      points={{-69.8,-64},{-46,-64},{-46,24},{-40,24}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(keukenWindowLarge.weaBus, sim.weaBus) annotation (Line(
      points={{-83,32},{-94,32},{-94,92},{-80.6,92},{-80.6,85.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenWindowSmall.weaBus, sim.weaBus) annotation (Line(
      points={{-83,6},{-94,6},{-94,92},{-80.6,92},{-80.6,85.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(raamwc.weaBus, sim.weaBus) annotation (Line(
      points={{-83,-20},{-88,-20},{-88,-20},{-94,-20},{-94,92},{-80.6,92},{
          -80.6,85.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerRaam.weaBus, sim.weaBus) annotation (Line(
      points={{-83,-48},{-94,-48},{-94,92},{-80.6,92},{-80.6,85.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(ssm.Q_flowConv, sine.y) annotation (Line(
      points={{-10.6,0},{-19,0},{-19,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.Q_flowConv, sine.y) annotation (Line(
      points={{-11,53.6},{-19,53.6},{-19,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.Q_flowRad, sine.y) annotation (Line(
      points={{-11,46.2},{-19,46.2},{-19,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ssm.Q_flowRad, sine.y) annotation (Line(
      points={{-10.6,-6},{-19,-6},{-19,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), __Dymola_Commands(file="../scripts/haarhakkerStraatHouse_lin_sim_plot.mos"
        "Linearize, simulate, plot"));
end haarhakkerStraatHouse_lin;
