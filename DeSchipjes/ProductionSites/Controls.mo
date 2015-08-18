within DeSchipjes.ProductionSites;
package Controls

  model ControlS1
    import DeSchipjes;

    extends PartialControls;

    parameter Modelica.SIunits.Temperature TEco=273.15+15;
    parameter Modelica.SIunits.Temperature THigh=273.15+70;
    parameter Modelica.SIunits.Temperature TSetHp=273.15+50;

    Modelica.Blocks.Interfaces.RealInput TstoTop
      annotation (Placement(transformation(extent={{-130,20},{-90,60}})));
    Modelica.Blocks.Interfaces.RealInput TstoBot
      annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
    Modelica.Blocks.Interfaces.BooleanOutput hpOn
      annotation (Placement(transformation(extent={{96,50},{116,70}})));
    Modelica_StateGraph2.Step stateOn(
      use_activePort=true,
      initialStep=true,
      nOut=1,
      nIn=1)
      annotation (Placement(transformation(extent={{-64,16},{-56,24}})));
    Modelica_StateGraph2.Transition T1(
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false,
      waitTime=180)
      annotation (Placement(transformation(extent={{-64,-4},{-56,4}})));
    Modelica_StateGraph2.Transition T2(
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-60,40})));
    Modelica.Blocks.Logical.LessThreshold greaterThreshold1(threshold=TSetHp)
      annotation (Placement(transformation(extent={{-86,34},{-74,46}})));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold2(threshold=TSetHp)
      annotation (Placement(transformation(extent={{-86,-6},{-74,6}})));
    Modelica.Blocks.Interfaces.RealOutput hp
      annotation (Placement(transformation(extent={{96,10},{116,30}})));
    Modelica.Blocks.Interfaces.RealOutput boi
      annotation (Placement(transformation(extent={{96,-30},{116,-10}})));
    Modelica.Blocks.Sources.Constant const(k=TSetHp + 2)
      annotation (Placement(transformation(extent={{60,10},{80,30}})));
    Modelica.Blocks.Interfaces.BooleanOutput boiOn
      annotation (Placement(transformation(extent={{96,-70},{116,-50}})));
    Modelica.Blocks.Sources.Constant const1(k=THigh)
      annotation (Placement(transformation(extent={{66,-24},{74,-16}})));
    Modelica.Blocks.Interfaces.BooleanOutput noBuffer annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={40,-106})));
    Modelica.Blocks.Interfaces.BooleanOutput hpOrSolar "If true, use hp buffer"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,-106})));
    Modelica.Blocks.Interfaces.RealInput TstoTopSun
      annotation (Placement(transformation(extent={{-130,60},{-90,100}})));
    Modelica.Blocks.Interfaces.RealInput Tret
      annotation (Placement(transformation(extent={{-130,-100},{-90,-60}})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{10,-84},{18,-76}})));
    Modelica.Blocks.Logical.And and4
      annotation (Placement(transformation(extent={{28,-76},{36,-84}})));
    Modelica_StateGraph2.Step bufferHp(
      use_activePort=true,
      initialStep=true,
      nIn=1,
      nOut=1)
      annotation (Placement(transformation(extent={{-30,16},{-22,24}})));
    Modelica_StateGraph2.Step bufferSolar(
      initialStep=false,
      nIn=1,
      nOut=1)
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          rotation=180,
          origin={-10,18})));
    Modelica_StateGraph2.Transition T3(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTopSun > TstoTop + 5,
      waitTime=180)
      annotation (Placement(transformation(extent={{-30,-4},{-22,4}})));
    Modelica_StateGraph2.Transition T4(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTop > TstoTopSun + 5,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-26,40})));
    Modelica_StateGraph2.Step solarOff(
      use_activePort=true,
      initialStep=true,
      nIn=1,
      nOut=1) annotation (Placement(transformation(extent={{10,16},{18,24}})));
    Modelica_StateGraph2.Transition T5(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTopSun > Tret + 2,
      waitTime=180)
      annotation (Placement(transformation(extent={{10,-4},{18,4}})));
    Modelica_StateGraph2.Transition T6(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=Tret > TstoTopSun + 2,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={14,40})));
    Modelica_StateGraph2.Step stateOff(
      initialStep=false,
      nIn=1,
      nOut=1)
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          rotation=180,
          origin={-46,20})));
    Modelica_StateGraph2.Step solarOn(
      initialStep=false,
      nIn=1,
      nOut=1) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={32,20})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant
      annotation (Placement(transformation(extent={{64,-70},{84,-50}})));
  equation
    connect(TstoTop, greaterThreshold1.u)
      annotation (Line(points={{-110,40},{-110,40},{-87.2,40}},
                                                      color={0,0,127}));
    connect(TstoBot, greaterThreshold2.u)
      annotation (Line(points={{-110,0},{-110,0},{-87.2,0}},
                                                    color={0,0,127}));
    connect(const.y, hp)
      annotation (Line(points={{81,20},{94,20},{106,20}}, color={0,0,127}));
    connect(greaterThreshold1.y, T2.conditionPort) annotation (Line(points={{-73.4,
            40},{-73.4,40},{-65,40}},
                                    color={255,0,255}));
    connect(greaterThreshold2.y, T1.conditionPort)
      annotation (Line(points={{-73.4,0},{-73.4,0},{-65,0}}, color={255,0,255}));
    connect(and4.y, noBuffer) annotation (Line(points={{36.4,-80},{40,-80},{40,
            -106}}, color={255,0,255}));
    connect(hpOrSolar, not1.u) annotation (Line(points={{0,-106},{0,-80},{9.2,-80}},
                   color={255,0,255}));
    connect(not1.y, and4.u1) annotation (Line(points={{18.4,-80},{27.2,-80},{27.2,
            -80}}, color={255,0,255}));
    connect(solarOff.activePort, and4.u2) annotation (Line(points={{18.72,20},{
            22,20},{22,-76.8},{27.2,-76.8}}, color={255,0,255}));

    connect(T1.outPort, stateOff.inPort[1]) annotation (Line(points={{-60,-5},{-60,
            -10},{-46,-10},{-46,16}}, color={0,0,0}));
    connect(stateOn.outPort[1], T1.inPort)
      annotation (Line(points={{-60,15.4},{-60,9.7},{-60,4}}, color={0,0,0}));
    connect(T2.outPort, stateOn.inPort[1])
      annotation (Line(points={{-60,35},{-60,29.5},{-60,24}}, color={0,0,0}));
    connect(T2.inPort, stateOff.outPort[1]) annotation (Line(points={{-60,44},{-60,
            48},{-46,48},{-46,24.6}}, color={0,0,0}));
    connect(T4.outPort, bufferHp.inPort[1])
      annotation (Line(points={{-26,35},{-26,29.5},{-26,24}}, color={0,0,0}));
    connect(bufferHp.outPort[1], T3.inPort)
      annotation (Line(points={{-26,15.4},{-26,9.7},{-26,4}}, color={0,0,0}));
    connect(T3.outPort, bufferSolar.inPort[1]) annotation (Line(points={{-26,-5},{
            -26,-10},{-10,-10},{-10,14}}, color={0,0,0}));
    connect(T4.inPort, bufferSolar.outPort[1]) annotation (Line(points={{-26,44},{
            -26,48},{-10,48},{-10,22.6}}, color={0,0,0}));
    connect(T6.outPort, solarOff.inPort[1])
      annotation (Line(points={{14,35},{14,24}}, color={0,0,0}));
    connect(solarOff.outPort[1], T5.inPort)
      annotation (Line(points={{14,15.4},{14,4}}, color={0,0,0}));
    connect(T5.outPort, solarOn.inPort[1]) annotation (Line(points={{14,-5},{14,
            -10},{32,-10},{32,16}}, color={0,0,0}));
    connect(T6.inPort, solarOn.outPort[1]) annotation (Line(points={{14,44},{14,
            48},{32,48},{32,24.6}}, color={0,0,0}));
    connect(stateOn.activePort, hpOn) annotation (Line(points={{-55.28,20},{-52,
            20},{-52,60},{106,60}}, color={255,0,255}));
    connect(const1.y, boi) annotation (Line(points={{74.4,-20},{106,-20},{106,
            -20}}, color={0,0,127}));
    connect(boiOn, booleanConstant.y)
      annotation (Line(points={{106,-60},{85,-60}}, color={255,0,255}));
    connect(bufferHp.activePort, not1.u) annotation (Line(points={{-21.28,20},{
            -18,20},{-18,-60},{0,-60},{0,-80},{9.2,-80}}, color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-94,-94},{-8,-100}},
            lineColor={28,108,200},
            textString="Use HP if TbufHP > TBufSun and Tamb < 15"), Text(
            extent={{50,-84},{100,-106}},
            lineColor={28,108,200},
            horizontalAlignment=TextAlignment.Left,
            textString="Use solar buffer if we don't use 
the HP and TbufSun > Tret")}),    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end ControlS1;

  model ControlS2
    import DeSchipjes;
    extends PartialControls;

    parameter Modelica.SIunits.Temperature TEco=273.15+15;
    parameter Modelica.SIunits.Temperature THigh=273.15+70;
    parameter Modelica.SIunits.Temperature TSetHp=273.15+50;

    Modelica.Blocks.Interfaces.RealInput TstoTop
      annotation (Placement(transformation(extent={{-130,20},{-90,60}})));
    Modelica.Blocks.Interfaces.RealInput TstoBot
      annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
    Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,110})));
    Modelica.Blocks.Interfaces.BooleanOutput hpOn
      annotation (Placement(transformation(extent={{96,50},{116,70}})));
    Modelica.Blocks.Logical.LessThreshold greaterThreshold(threshold=TEco)
      annotation (Placement(transformation(extent={{-56,-46},{-44,-34}})));
    Modelica.Blocks.Logical.And and1
      annotation (Placement(transformation(extent={{10,54},{22,66}})));
    Modelica_StateGraph2.Step stateOn(
      nOut=1,
      nIn=1,
      use_activePort=true,
      initialStep=true)
      annotation (Placement(transformation(extent={{-64,16},{-56,24}})));
    Modelica_StateGraph2.Step stateOff(
      nIn=1,
      nOut=1,
      initialStep=false)
      annotation (Placement(transformation(extent={{-64,-18},{-56,-10}})));
    Modelica_StateGraph2.Transition T1(
      use_conditionPort=true,
      use_firePort=false,
      waitTime=180,
      delayedTransition=false)
      annotation (Placement(transformation(extent={{-64,-4},{-56,4}})));
    Modelica_StateGraph2.Transition T2(
      use_conditionPort=true,
      use_firePort=false,
      delayedTransition=true,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-60,40})));
    Modelica.Blocks.Logical.LessThreshold greaterThreshold1(threshold=TSetHp)
      annotation (Placement(transformation(extent={{-82,34},{-70,46}})));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold2(threshold=TSetHp
           - 5)
      annotation (Placement(transformation(extent={{-82,-6},{-70,6}})));
    Modelica.Blocks.Interfaces.RealOutput hp
      annotation (Placement(transformation(extent={{96,10},{116,30}})));
    Modelica.Blocks.Interfaces.RealOutput boi
      annotation (Placement(transformation(extent={{96,-30},{116,-10}})));
    Modelica.Blocks.Logical.Switch switch
      annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
    Modelica.Blocks.Sources.Constant const(k=TSetHp + 2)
      annotation (Placement(transformation(extent={{60,10},{80,30}})));
    Modelica.Blocks.Interfaces.BooleanOutput boiOn
      annotation (Placement(transformation(extent={{96,-70},{116,-50}})));
    Modelica.Blocks.Sources.Constant const1(k=THigh)
      annotation (Placement(transformation(extent={{40,-16},{48,-8}})));
    Modelica.Blocks.Logical.Or and3
      annotation (Placement(transformation(extent={{46,-66},{58,-54}})));
    Modelica.Blocks.Interfaces.RealInput TAmb
      annotation (Placement(transformation(extent={{-130,-60},{-90,-20}})));
    Modelica.Blocks.Interfaces.BooleanOutput noBuffer annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,-106})));
    Buildings.Controls.SetPoints.Table tab(table=[263.15,273.15 + 50; 273.15 + 20,
          273.15 + 20])
      annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{10,28},{18,36}})));
    Modelica.Blocks.Logical.Or and2
      annotation (Placement(transformation(extent={{52,54},{64,66}})));
    Modelica.Blocks.Logical.And and4
      annotation (Placement(transformation(extent={{28,26},{40,38}})));
    Modelica.Blocks.Logical.And and5
      annotation (Placement(transformation(extent={{-6,-6},{6,6}},
          rotation=270,
          origin={0,-84})));
  equation
    connect(stateOn.outPort[1], T1.inPort)
      annotation (Line(points={{-60,15.4},{-60,4}}, color={0,0,0}));
    connect(T1.outPort, stateOff.inPort[1])
      annotation (Line(points={{-60,-5},{-60,-5},{-60,-10}}, color={0,0,0}));
    connect(TstoTop, greaterThreshold1.u)
      annotation (Line(points={{-110,40},{-83.2,40}}, color={0,0,127}));
    connect(TstoBot, greaterThreshold2.u)
      annotation (Line(points={{-110,0},{-83.2,0}}, color={0,0,127}));
    connect(T2.outPort, stateOn.inPort[1])
      annotation (Line(points={{-60,35},{-60,24}}, color={0,0,0}));
    connect(T2.inPort, stateOff.outPort[1]) annotation (Line(points={{-60,44},{-60,
            48},{-40,48},{-40,-22},{-60,-22},{-60,-18.6}}, color={0,0,0}));
    connect(u, switch.u2) annotation (Line(points={{0,110},{0,110},{0,-20},{58,-20}},
          color={255,0,255}));
    connect(switch.y, boi)
      annotation (Line(points={{81,-20},{81,-20},{106,-20}}, color={0,0,127}));
    connect(const.y, hp)
      annotation (Line(points={{81,20},{94,20},{106,20}}, color={0,0,127}));
    connect(const1.y, switch.u1) annotation (Line(points={{48.4,-12},{48.4,-12},{58,
            -12}}, color={0,0,127}));
    connect(and3.y, boiOn)
      annotation (Line(points={{58.6,-60},{82,-60},{106,-60}},
                                                      color={255,0,255}));
    connect(and3.u1, switch.u2) annotation (Line(points={{44.8,-60},{0,-60},{0,-20},
            {58,-20}}, color={255,0,255}));
    connect(TAmb, greaterThreshold.u)
      annotation (Line(points={{-110,-40},{-57.2,-40}}, color={0,0,127}));
    connect(tab.u, greaterThreshold.u) annotation (Line(points={{-62,-70},{-74,-70},
            {-74,-40},{-57.2,-40}}, color={0,0,127}));
    connect(tab.y, switch.u3) annotation (Line(points={{-39,-70},{0,-70},{40,-70},
            {40,-28},{58,-28}}, color={0,0,127}));
    connect(greaterThreshold1.y, T2.conditionPort) annotation (Line(points={{-69.4,
            40},{-68,40},{-65,40}}, color={255,0,255}));
    connect(greaterThreshold2.y, T1.conditionPort)
      annotation (Line(points={{-69.4,0},{-69.4,0},{-65,0}}, color={255,0,255}));
    connect(greaterThreshold.y, not1.u) annotation (Line(points={{-43.4,-40},{-8,-40},
            {-8,32},{9.2,32}}, color={255,0,255}));
    connect(and1.y, and2.u1) annotation (Line(points={{22.6,60},{22.6,60},{50.8,60}},
          color={255,0,255}));
    connect(and2.y, hpOn)
      annotation (Line(points={{64.6,60},{106,60},{106,60}}, color={255,0,255}));
    connect(stateOn.activePort, and1.u1) annotation (Line(points={{-55.28,20},{-32,
            20},{-32,60},{8.8,60}}, color={255,0,255}));
    connect(and1.u2, not1.u) annotation (Line(points={{8.8,55.2},{-8,55.2},{-8,32},
            {9.2,32}}, color={255,0,255}));
    connect(not1.y, and4.u1) annotation (Line(points={{18.4,32},{26.8,32}},
          color={255,0,255}));
    connect(and4.u2, switch.u2) annotation (Line(points={{26.8,27.2},{0,27.2},{0,-20},
            {58,-20}}, color={255,0,255}));
    connect(and4.y, and2.u2) annotation (Line(points={{40.6,32},{46,32},{46,55.2},
            {50.8,55.2}}, color={255,0,255}));
    connect(and3.u2, not1.u) annotation (Line(points={{44.8,-64.8},{-8,-64.8},{-8,
            32},{9.2,32}}, color={255,0,255}));
    connect(and5.y, noBuffer)
      annotation (Line(points={{0,-90.6},{0,-106},{0,-106}}, color={255,0,255}));
    connect(and5.u1, switch.u2)
      annotation (Line(points={{0,-76.8},{0,-20},{58,-20}}, color={255,0,255}));
    connect(and5.u2, not1.u) annotation (Line(points={{-4.8,-76.8},{-4.8,-72},{-6,
            -72},{-8,-72},{-8,32},{9.2,32}}, color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}},
            preserveAspectRatio=false)));
  end ControlS2;

  model ControlS3
    import DeSchipjes;

    extends PartialControls;

    parameter Modelica.SIunits.Temperature TEco=273.15+15;
    parameter Modelica.SIunits.Temperature THigh=273.15+70;
    parameter Modelica.SIunits.Temperature TSetHp=273.15+50;

    Modelica.Blocks.Interfaces.RealInput TstoTop
      annotation (Placement(transformation(extent={{-130,20},{-90,60}})));
    Modelica.Blocks.Interfaces.RealInput TstoBot
      annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
    Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,110})));
    Modelica.Blocks.Interfaces.BooleanOutput hpOn
      annotation (Placement(transformation(extent={{96,50},{116,70}})));
    Modelica.Blocks.Logical.LessThreshold greaterThreshold(threshold=TEco)
      annotation (Placement(transformation(extent={{-58,-44},{-50,-36}})));
    Modelica.Blocks.Logical.And and1
      annotation (Placement(transformation(extent={{10,54},{22,66}})));
    Modelica_StateGraph2.Step stateOn(
      use_activePort=true,
      initialStep=true,
      nOut=1,
      nIn=1)
      annotation (Placement(transformation(extent={{-64,16},{-56,24}})));
    Modelica_StateGraph2.Transition T1(
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false,
      waitTime=180)
      annotation (Placement(transformation(extent={{-64,-4},{-56,4}})));
    Modelica_StateGraph2.Transition T2(
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-60,40})));
    Modelica.Blocks.Logical.LessThreshold greaterThreshold1(threshold=TSetHp)
      annotation (Placement(transformation(extent={{-86,34},{-74,46}})));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold2(threshold=TSetHp)
      annotation (Placement(transformation(extent={{-86,-6},{-74,6}})));
    Modelica.Blocks.Interfaces.RealOutput hp
      annotation (Placement(transformation(extent={{96,10},{116,30}})));
    Modelica.Blocks.Interfaces.RealOutput boi
      annotation (Placement(transformation(extent={{96,-30},{116,-10}})));
    Modelica.Blocks.Logical.Switch switch
      annotation (Placement(transformation(extent={{66,-30},{86,-10}})));
    Modelica.Blocks.Sources.Constant const(k=TSetHp + 2)
      annotation (Placement(transformation(extent={{60,10},{80,30}})));
    Modelica.Blocks.Interfaces.BooleanOutput boiOn
      annotation (Placement(transformation(extent={{96,-70},{116,-50}})));
    Modelica.Blocks.Sources.Constant const1(k=THigh)
      annotation (Placement(transformation(extent={{50,-16},{58,-8}})));
    Modelica.Blocks.Logical.Or and3
      annotation (Placement(transformation(extent={{44,-34},{56,-46}})));
    Modelica.Blocks.Interfaces.RealInput TAmb
      annotation (Placement(transformation(extent={{-130,-60},{-90,-20}})));
    Modelica.Blocks.Interfaces.BooleanOutput noBuffer annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={40,-106})));
    Buildings.Controls.SetPoints.Table tab(table=[263.15,273.15 + 50; 273.15 + 20,
          273.15 + 20])
      annotation (Placement(transformation(extent={{-56,-32},{-48,-24}})));
    Modelica.Blocks.Interfaces.BooleanOutput hpOrSolar "If true, use hp buffer"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,-106})));
    Modelica.Blocks.Interfaces.RealInput TstoTopSun
      annotation (Placement(transformation(extent={{-130,60},{-90,100}})));
    Modelica.Blocks.Interfaces.RealInput Tret
      annotation (Placement(transformation(extent={{-130,-100},{-90,-60}})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{10,-84},{18,-76}})));
    Modelica.Blocks.Logical.And and4
      annotation (Placement(transformation(extent={{28,-76},{36,-84}})));
    Modelica_StateGraph2.Step bufferHp(
      use_activePort=true,
      initialStep=true,
      nIn=1,
      nOut=1)
      annotation (Placement(transformation(extent={{-30,16},{-22,24}})));
    Modelica_StateGraph2.Step bufferSolar(
      initialStep=false,
      nIn=1,
      nOut=1)
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          rotation=180,
          origin={-10,18})));
    Modelica_StateGraph2.Transition T3(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTopSun > TstoTop + 5,
      waitTime=180)
      annotation (Placement(transformation(extent={{-30,-4},{-22,4}})));
    Modelica_StateGraph2.Transition T4(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTop > TstoTopSun + 5,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-26,40})));
    Modelica_StateGraph2.Blocks.MathBoolean.And
                                and2(nu=3)
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          rotation=270,
          origin={0,-68})));
    Modelica.Blocks.Logical.Not not2
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          rotation=270,
          origin={0,-48})));
    Modelica_StateGraph2.Step solarOff(
      use_activePort=true,
      initialStep=true,
      nIn=1,
      nOut=1) annotation (Placement(transformation(extent={{10,16},{18,24}})));
    Modelica_StateGraph2.Transition T5(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTopSun > Tret + 2,
      waitTime=180)
      annotation (Placement(transformation(extent={{10,-4},{18,4}})));
    Modelica_StateGraph2.Transition T6(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=Tret > TstoTopSun + 2,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={14,40})));
    Modelica_StateGraph2.Step stateOff(
      initialStep=false,
      nIn=1,
      nOut=1)
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          rotation=180,
          origin={-46,20})));
    Modelica_StateGraph2.Step solarOn(
      initialStep=false,
      nIn=1,
      nOut=1) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={32,20})));
  equation
    connect(TstoTop, greaterThreshold1.u)
      annotation (Line(points={{-110,40},{-110,40},{-87.2,40}},
                                                      color={0,0,127}));
    connect(TstoBot, greaterThreshold2.u)
      annotation (Line(points={{-110,0},{-110,0},{-87.2,0}},
                                                    color={0,0,127}));
    connect(u, switch.u2) annotation (Line(points={{0,110},{0,110},{0,-20},{64,-20}},
          color={255,0,255}));
    connect(switch.y, boi)
      annotation (Line(points={{87,-20},{87,-20},{106,-20}}, color={0,0,127}));
    connect(const.y, hp)
      annotation (Line(points={{81,20},{94,20},{106,20}}, color={0,0,127}));
    connect(const1.y, switch.u1) annotation (Line(points={{58.4,-12},{58.4,-12},{64,
            -12}}, color={0,0,127}));
    connect(and3.y, boiOn)
      annotation (Line(points={{56.6,-40},{56.6,-40},{80,-40},{80,-60},{106,-60}},
                                                      color={255,0,255}));
    connect(TAmb, greaterThreshold.u)
      annotation (Line(points={{-110,-40},{-58.8,-40}}, color={0,0,127}));
    connect(tab.u, greaterThreshold.u) annotation (Line(points={{-56.8,-28},{
            -70,-28},{-70,-40},{-58.8,-40}},
                                    color={0,0,127}));
    connect(tab.y, switch.u3) annotation (Line(points={{-47.6,-28},{-47.6,-28},{64,
            -28}},              color={0,0,127}));
    connect(greaterThreshold1.y, T2.conditionPort) annotation (Line(points={{-73.4,
            40},{-73.4,40},{-65,40}},
                                    color={255,0,255}));
    connect(greaterThreshold2.y, T1.conditionPort)
      annotation (Line(points={{-73.4,0},{-73.4,0},{-65,0}}, color={255,0,255}));
    connect(stateOn.activePort, and1.u1) annotation (Line(points={{-55.28,20},{-52,
            20},{-52,60},{8.8,60}}, color={255,0,255}));
    connect(and1.u2, greaterThreshold.y) annotation (Line(points={{8.8,55.2},{-38,
            55.2},{-38,56},{-38,56},{-38,-40},{-49.6,-40}},
                                              color={255,0,255}));
    connect(and1.y, hpOn)
      annotation (Line(points={{22.6,60},{106,60}}, color={255,0,255}));
    connect(and4.y, noBuffer) annotation (Line(points={{36.4,-80},{40,-80},{40,
            -106}}, color={255,0,255}));
    connect(and3.u1, greaterThreshold.y)
      annotation (Line(points={{42.8,-40},{-49.6,-40}}, color={255,0,255}));
    connect(and3.u2, switch.u2) annotation (Line(points={{42.8,-35.2},{0,-35.2},{0,
            -20},{64,-20}},    color={255,0,255}));
    connect(hpOrSolar, not1.u) annotation (Line(points={{0,-106},{0,-80},{9.2,-80}},
                   color={255,0,255}));
    connect(and2.y, not1.u) annotation (Line(points={{-8.88178e-016,-72.8},{-8.88178e-016,
            -80},{9.2,-80}},               color={255,0,255}));
    connect(not2.u, switch.u2) annotation (Line(points={{8.88178e-016,-43.2},{8.88178e-016,
            -20},{64,-20}},
                   color={255,0,255}));
    connect(not1.y, and4.u1) annotation (Line(points={{18.4,-80},{27.2,-80},{27.2,
            -80}}, color={255,0,255}));
    connect(solarOff.activePort, and4.u2) annotation (Line(points={{18.72,20},{
            22,20},{22,-76.8},{27.2,-76.8}}, color={255,0,255}));

    connect(greaterThreshold.y, and2.u[1]) annotation (Line(points={{-49.6,-40},
            {-20,-40},{-20,-58},{1.86667,-58},{1.86667,-64}},
                                                         color={255,0,255}));
    connect(not2.y, and2.u[2]) annotation (Line(points={{0,-52.4},{0,-64},{8.88178e-016,
            -64}}, color={255,0,255}));
    connect(bufferHp.activePort, and2.u[3]) annotation (Line(points={{-21.28,20},
            {-16,20},{-16,-56},{-1.86667,-56},{-1.86667,-64}},color={255,0,255}));
    connect(T1.outPort, stateOff.inPort[1]) annotation (Line(points={{-60,-5},{-60,
            -10},{-46,-10},{-46,16}}, color={0,0,0}));
    connect(stateOn.outPort[1], T1.inPort)
      annotation (Line(points={{-60,15.4},{-60,9.7},{-60,4}}, color={0,0,0}));
    connect(T2.outPort, stateOn.inPort[1])
      annotation (Line(points={{-60,35},{-60,29.5},{-60,24}}, color={0,0,0}));
    connect(T2.inPort, stateOff.outPort[1]) annotation (Line(points={{-60,44},{-60,
            48},{-46,48},{-46,24.6}}, color={0,0,0}));
    connect(T4.outPort, bufferHp.inPort[1])
      annotation (Line(points={{-26,35},{-26,29.5},{-26,24}}, color={0,0,0}));
    connect(bufferHp.outPort[1], T3.inPort)
      annotation (Line(points={{-26,15.4},{-26,9.7},{-26,4}}, color={0,0,0}));
    connect(T3.outPort, bufferSolar.inPort[1]) annotation (Line(points={{-26,-5},{
            -26,-10},{-10,-10},{-10,14}}, color={0,0,0}));
    connect(T4.inPort, bufferSolar.outPort[1]) annotation (Line(points={{-26,44},{
            -26,48},{-10,48},{-10,22.6}}, color={0,0,0}));
    connect(T6.outPort, solarOff.inPort[1])
      annotation (Line(points={{14,35},{14,24}}, color={0,0,0}));
    connect(solarOff.outPort[1], T5.inPort)
      annotation (Line(points={{14,15.4},{14,4}}, color={0,0,0}));
    connect(T5.outPort, solarOn.inPort[1]) annotation (Line(points={{14,-5},{14,
            -10},{32,-10},{32,16}}, color={0,0,0}));
    connect(T6.inPort, solarOn.outPort[1]) annotation (Line(points={{14,44},{14,
            48},{32,48},{32,24.6}}, color={0,0,0}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-94,-94},{-8,-100}},
            lineColor={28,108,200},
            textString="Use HP if TbufHP > TBufSun and Tamb < 15"), Text(
            extent={{50,-84},{100,-106}},
            lineColor={28,108,200},
            horizontalAlignment=TextAlignment.Left,
            textString="Use solar buffer if we don't use 
the HP and TbufSun > Tret")}),    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end ControlS3;

  model ControlS4
    import DeSchipjes;

    extends PartialControls;

    parameter Modelica.SIunits.Temperature TEco=273.15+15;
    parameter Modelica.SIunits.Temperature THigh=273.15+70;
    parameter Modelica.SIunits.Temperature TSetHp=273.15+50;

    Modelica.Blocks.Interfaces.RealInput TstoTop
      annotation (Placement(transformation(extent={{-130,20},{-90,60}})));
    Modelica.Blocks.Interfaces.RealInput TstoBot
      annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
    Modelica.Blocks.Interfaces.BooleanOutput hpOn
      annotation (Placement(transformation(extent={{96,50},{116,70}})));
    Modelica.Blocks.Logical.LessThreshold greaterThreshold(threshold=TEco)
      annotation (Placement(transformation(extent={{-56,-44},{-48,-36}})));
    Modelica.Blocks.Logical.And and1
      annotation (Placement(transformation(extent={{10,54},{22,66}})));
    Modelica_StateGraph2.Step stateOn(
      nOut=1,
      nIn=1,
      use_activePort=true,
      initialStep=true)
      annotation (Placement(transformation(extent={{-64,16},{-56,24}})));
    Modelica_StateGraph2.Step stateOff(
      nIn=1,
      nOut=1,
      initialStep=false)
      annotation (Placement(transformation(extent={{-64,-16},{-56,-8}})));
    Modelica_StateGraph2.Transition T1(
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false,
      waitTime=180)
      annotation (Placement(transformation(extent={{-64,-4},{-56,4}})));
    Modelica_StateGraph2.Transition T2(
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-60,40})));
    Modelica.Blocks.Logical.LessThreshold greaterThreshold1(threshold=TSetHp)
      annotation (Placement(transformation(extent={{-80,34},{-68,46}})));
    Modelica.Blocks.Logical.GreaterThreshold greaterThreshold2(threshold=TSetHp)
      annotation (Placement(transformation(extent={{-80,-6},{-68,6}})));
    Modelica.Blocks.Interfaces.RealOutput hp
      annotation (Placement(transformation(extent={{96,10},{116,30}})));
    Modelica.Blocks.Interfaces.RealOutput boi
      annotation (Placement(transformation(extent={{96,-30},{116,-10}})));
    Modelica.Blocks.Sources.Constant const(k=TSetHp + 2)
      annotation (Placement(transformation(extent={{60,10},{80,30}})));
    Modelica.Blocks.Interfaces.BooleanOutput boiOn
      annotation (Placement(transformation(extent={{96,-70},{116,-50}})));
    Modelica.Blocks.Interfaces.RealInput TAmb
      annotation (Placement(transformation(extent={{-130,-60},{-90,-20}})));
    Modelica.Blocks.Interfaces.BooleanOutput noBuffer annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={40,-106})));
    Buildings.Controls.SetPoints.Table tab(table=[263.15,273.15 + 50; 273.15 + 20,
          273.15 + 20])
      annotation (Placement(transformation(extent={{-56,-32},{-48,-24}})));
    Modelica.Blocks.Interfaces.BooleanOutput hpOrSolar "If true, use hp buffer"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,-106})));
    Modelica.Blocks.Interfaces.RealInput TstoTopSun
      annotation (Placement(transformation(extent={{-130,60},{-90,100}})));
    Modelica.Blocks.Interfaces.RealInput Tret
      annotation (Placement(transformation(extent={{-130,-100},{-90,-60}})));
    Modelica.Blocks.Logical.Not not1
      annotation (Placement(transformation(extent={{10,-84},{18,-76}})));
    Modelica.Blocks.Logical.And and4
      annotation (Placement(transformation(extent={{28,-76},{36,-84}})));
    Modelica_StateGraph2.Step bufferHp(
      nOut=1,
      nIn=1,
      use_activePort=true,
      initialStep=true)
      annotation (Placement(transformation(extent={{-30,16},{-22,24}})));
    Modelica_StateGraph2.Step bufferSolar(
      nIn=1,
      nOut=1,
      initialStep=false)
      annotation (Placement(transformation(extent={{-30,-16},{-22,-8}})));
    Modelica_StateGraph2.Transition T3(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTopSun > TstoTop + 5,
      waitTime=180)
      annotation (Placement(transformation(extent={{-30,-4},{-22,4}})));
    Modelica_StateGraph2.Transition T4(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTop > TstoTopSun + 5,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-26,40})));
    Modelica_StateGraph2.Blocks.MathBoolean.And
                                and2(nu=2)
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},
          rotation=270,
          origin={0,-64})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant
      annotation (Placement(transformation(extent={{60,-66},{72,-54}})));
    Modelica_StateGraph2.Step solarOff(
      use_activePort=true,
      initialStep=true,
      nIn=1,
      nOut=1) annotation (Placement(transformation(extent={{10,14},{18,22}})));
    Modelica_StateGraph2.Transition T5(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TstoTopSun > Tret + 2,
      waitTime=180)
      annotation (Placement(transformation(extent={{10,-6},{18,2}})));
    Modelica_StateGraph2.Transition T6(
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=Tret > TstoTopSun + 2,
      waitTime=180) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={14,38})));
    Modelica_StateGraph2.Step solarOn(
      initialStep=false,
      nIn=1,
      nOut=1) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={32,18})));
  equation
    connect(stateOn.outPort[1], T1.inPort)
      annotation (Line(points={{-60,15.4},{-60,4}}, color={0,0,0}));
    connect(T1.outPort, stateOff.inPort[1])
      annotation (Line(points={{-60,-5},{-60,-8}},           color={0,0,0}));
    connect(TstoTop, greaterThreshold1.u)
      annotation (Line(points={{-110,40},{-110,40},{-81.2,40}},
                                                      color={0,0,127}));
    connect(TstoBot, greaterThreshold2.u)
      annotation (Line(points={{-110,0},{-110,0},{-81.2,0}},
                                                    color={0,0,127}));
    connect(T2.outPort, stateOn.inPort[1])
      annotation (Line(points={{-60,35},{-60,24}}, color={0,0,0}));
    connect(T2.inPort, stateOff.outPort[1]) annotation (Line(points={{-60,44},{
            -60,48},{-44,48},{-44,-20},{-60,-20},{-60,-16.6}},
                                                           color={0,0,0}));
    connect(const.y, hp)
      annotation (Line(points={{81,20},{94,20},{106,20}}, color={0,0,127}));
    connect(TAmb, greaterThreshold.u)
      annotation (Line(points={{-110,-40},{-56.8,-40}}, color={0,0,127}));
    connect(tab.u, greaterThreshold.u) annotation (Line(points={{-56.8,-28},{
            -70,-28},{-70,-40},{-56.8,-40}},
                                    color={0,0,127}));
    connect(greaterThreshold1.y, T2.conditionPort) annotation (Line(points={{-67.4,
            40},{-67.4,40},{-65,40}},
                                    color={255,0,255}));
    connect(greaterThreshold2.y, T1.conditionPort)
      annotation (Line(points={{-67.4,0},{-67.4,0},{-65,0}}, color={255,0,255}));
    connect(stateOn.activePort, and1.u1) annotation (Line(points={{-55.28,20},{
            -50,20},{-50,60},{8.8,60}},
                                    color={255,0,255}));
    connect(and1.u2, greaterThreshold.y) annotation (Line(points={{8.8,55.2},{
            -40,55.2},{-40,-40},{-47.6,-40}}, color={255,0,255}));
    connect(and1.y, hpOn)
      annotation (Line(points={{22.6,60},{106,60}}, color={255,0,255}));
    connect(and4.y, noBuffer) annotation (Line(points={{36.4,-80},{40,-80},{40,
            -106}}, color={255,0,255}));
    connect(hpOrSolar, not1.u) annotation (Line(points={{0,-106},{0,-80},{9.2,
            -80}}, color={255,0,255}));
    connect(bufferHp.outPort[1], T3.inPort)
      annotation (Line(points={{-26,15.4},{-26,4}}, color={0,0,0}));
    connect(T3.outPort, bufferSolar.inPort[1])
      annotation (Line(points={{-26,-5},{-26,-8}}, color={0,0,0}));
    connect(T4.outPort, bufferHp.inPort[1])
      annotation (Line(points={{-26,35},{-26,24}}, color={0,0,0}));
    connect(T4.inPort, bufferSolar.outPort[1]) annotation (Line(points={{-26,44},
            {-26,48},{-10,48},{-10,-20},{-26,-20},{-26,-16.6}}, color={0,0,0}));
    connect(and2.y, not1.u) annotation (Line(points={{-8.88178e-016,-68.8},{
            -8.88178e-016,-80},{9.2,-80}}, color={255,0,255}));
    connect(bufferHp.activePort, and2.u[1]) annotation (Line(points={{-21.28,20},
            {-16,20},{-16,-56},{2,-56},{2,-60},{1.4,-60}}, color={255,0,255}));
    connect(greaterThreshold.y, and2.u[2]) annotation (Line(points={{-47.6,-40},
            {-20,-40},{-20,-58},{-1.4,-58},{-1.4,-60}}, color={255,0,255}));
    connect(tab.y, boi) annotation (Line(points={{-47.6,-28},{80,-28},{80,-20},
            {106,-20}}, color={0,0,127}));
    connect(boiOn, booleanConstant.y) annotation (Line(points={{106,-60},{92,
            -60},{72.6,-60}}, color={255,0,255}));
    connect(not1.y, and4.u1) annotation (Line(points={{18.4,-80},{27.2,-80},{
            27.2,-80}}, color={255,0,255}));
    connect(solarOff.activePort, and4.u2) annotation (Line(points={{18.72,18},{
            22,18},{22,-76.8},{27.2,-76.8}}, color={255,0,255}));
    connect(T5.outPort, solarOn.inPort[1]) annotation (Line(points={{14,-7},{14,
            -12},{32,-12},{32,14}}, color={0,0,0}));
    connect(T6.inPort, solarOn.outPort[1]) annotation (Line(points={{14,42},{14,
            46},{32,46},{32,22.6}}, color={0,0,0}));
    connect(T6.outPort, solarOff.inPort[1])
      annotation (Line(points={{14,33},{14,27.5},{14,22}}, color={0,0,0}));
    connect(solarOff.outPort[1], T5.inPort)
      annotation (Line(points={{14,13.4},{14,7.7},{14,2}}, color={0,0,0}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Text(
            extent={{-94,-94},{-8,-100}},
            lineColor={28,108,200},
            textString="Use HPbuffer if TbufHP > TBufSun and Tamb < 15"), Text(
            extent={{50,-84},{100,-106}},
            lineColor={28,108,200},
            horizontalAlignment=TextAlignment.Left,
            textString="Use solar buffer if we don't use 
the HP and TbufSun > Tret")}),    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end ControlS4;

  model SolarControls

    Modelica.Blocks.Interfaces.RealInput TSuno
      annotation (Placement(transformation(extent={{-130,40},{-90,80}})));
    Modelica.Blocks.Interfaces.RealInput Tret
      annotation (Placement(transformation(extent={{-130,-80},{-90,-40}})));
    Modelica_StateGraph2.Step stateOn(
      nOut=1,
      nIn=1,
      use_activePort=true,
      initialStep=true)
      annotation (Placement(transformation(extent={{-34,-4},{-26,4}})));
    Modelica_StateGraph2.Step stateOff(
      nIn=1,
      nOut=1,
      initialStep=false)
      annotation (Placement(transformation(extent={{-34,-76},{-26,-68}})));
    Modelica_StateGraph2.Transition T1(
      waitTime=900,
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TSuno < TStoBot + 2)
      annotation (Placement(transformation(extent={{-34,-64},{-26,-56}})));
    Modelica_StateGraph2.Transition T2(
      waitTime=900,
      delayedTransition=true,
      use_firePort=false,
      use_conditionPort=false,
      condition=TSuno > TStoBot)
                    annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-30,60})));
    Modelica.Blocks.Interfaces.RealInput TStoBot
      annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
    Modelica.Blocks.Interfaces.BooleanOutput on
      annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  equation
    connect(stateOn.outPort[1],T1. inPort)
      annotation (Line(points={{-30,-4.6},{-30,-4.6},{-30,-56}},
                                                    color={0,0,0}));
    connect(T1.outPort,stateOff. inPort[1])
      annotation (Line(points={{-30,-65},{-30,-68}},         color={0,0,0}));
    connect(T2.outPort,stateOn. inPort[1])
      annotation (Line(points={{-30,55},{-30,4}},  color={0,0,0}));
    connect(T2.inPort,stateOff. outPort[1]) annotation (Line(points={{-30,64},{
            -30,70},{0,70},{0,-80},{-30,-80},{-30,-76.6}}, color={0,0,0}));
    connect(stateOn.activePort, on)
      annotation (Line(points={{-25.28,0},{106,0}}, color={255,0,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}})));
  end SolarControls;

  model PartialControls

    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Line(
          origin={-51.25,6},
          points={{21.25,-35.0},{-13.75,-35.0},{-13.75,35.0},{6.25,35.0}}),
        Polygon(
          origin={-40,41},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{10.0,0.0},{-5.0,5.0},{-5.0,-5.0}}),
        Rectangle(
          origin={0,41.1488},
          fillColor={255,255,255},
          extent={{-30.0,-20.1488},{30.0,20.1488}}),
        Rectangle(
          origin={0,-28.8512},
          fillColor={255,255,255},
          extent={{-30.0,-20.1488},{30.0,20.1488}}),
        Line(
          origin={51.25,6},
          points={{-21.25,35.0},{13.75,35.0},{13.75,-35.0},{-6.25,-35.0}}),
        Polygon(
          origin={40,-29},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-10.0,0.0},{5.0,5.0},{5.0,-5.0}})}));
  end PartialControls;
end Controls;
