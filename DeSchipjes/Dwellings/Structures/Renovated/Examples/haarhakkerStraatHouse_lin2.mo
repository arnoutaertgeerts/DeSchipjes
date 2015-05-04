within DeSchipjes.Dwellings.Structures.Renovated.Examples;
model haarhakkerStraatHouse_lin2
  extends Modelica.Icons.Example;
  BaseClasses.HaarhakkerStraatHouse_lin building
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
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

  BaseClasses.SSM sSM
    annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
equation
  connect(sim.weaBus, building.weaBus1) annotation (Line(
      points={{-80.6,85.2},{-80.6,92},{-26,92},{-26,54},{-10,54}},
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
  connect(keukenWindowLarge.weaBus, woonruimteWindow.weaBus) annotation (Line(
      points={{-83,32},{-94,32},{-94,58},{-83,58}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(keukenWindowSmall.weaBus, woonruimteWindow.weaBus) annotation (Line(
      points={{-83,6},{-94,6},{-94,58},{-83,58}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(raamwc.weaBus, woonruimteWindow.weaBus) annotation (Line(
      points={{-83,-20},{-94,-20},{-94,58},{-83,58}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaapkamerRaam.weaBus, woonruimteWindow.weaBus) annotation (Line(
      points={{-83,-48},{-94,-48},{-94,58},{-83,58}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(building.winBus1, winBus1) annotation (Line(
      points={{-10,46},{-24,46},{-24,40},{-40,40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(sSM.winBus, winBus1) annotation (Line(
      points={{-4,8},{-20,8},{-20,40},{-40,40}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(slaapkamerRaam.winBus, winBus1[5]) annotation (Line(
      points={{-69.8,-64},{-56,-64},{-56,-66},{-40,-66},{-40,24}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), __Dymola_Commands(file="../scripts/haarhakkerStraatHouse_lin_sim_plot.mos"
        "Linearize, simulate, plot"));
end haarhakkerStraatHouse_lin2;
