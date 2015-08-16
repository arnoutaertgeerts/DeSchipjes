within DeSchipjes.Dwellings.HeatingSystems;
package Controls

  model ControlBooster

    Modelica_StateGraph2.Step stateOn(
      nOut=1,
      nIn=1,
      use_activePort=true,
      initialStep=true)
      annotation (Placement(transformation(extent={{-16,8},{-8,16}})));
    Modelica_StateGraph2.Step stateOff(
      nIn=1,
      nOut=1,
      initialStep=false)
      annotation (Placement(transformation(extent={{-16,-26},{-8,-18}})));
    Modelica_StateGraph2.Transition T1(
      waitTime=900,
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false)
      annotation (Placement(transformation(extent={{-16,-12},{-8,-4}})));
    Modelica_StateGraph2.Transition T2(
      waitTime=900,
      delayedTransition=true,
      use_conditionPort=true,
      use_firePort=false)
                    annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=0,
          origin={-12,32})));
  equation
    connect(stateOn.outPort[1],T1. inPort)
      annotation (Line(points={{-12,7.4},{-12,4},{-12,0},{-12,-4}},
                                                    color={0,0,0}));
    connect(T1.outPort,stateOff. inPort[1])
      annotation (Line(points={{-12,-13},{-12,-18}},         color={0,0,0}));
    connect(T2.outPort,stateOn. inPort[1])
      annotation (Line(points={{-12,27},{-12,24},{-12,20},{-12,16}},
                                                   color={0,0,0}));
    connect(T2.inPort,stateOff. outPort[1]) annotation (Line(points={{-12,36},{
            -12,40},{8,40},{8,-30},{-12,-30},{-12,-26.6}}, color={0,0,0}));
  end ControlBooster;
end Controls;
