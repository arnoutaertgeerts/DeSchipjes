within DeSchipjes.Dwellings.HeatingSystems;
package StorageTanks
  model uniSTOR "The Vaillant uniSTOR tank"

    //Extensions
    extends Buildings.Fluid.Storage.StratifiedEnhancedInternalHex(
      VTan=0.117,
      hTan=0.820,
      dIns=0.05,
      kIns=Modelica.Math.log((ri+dIns)/ri)/(2*Modelica.Constants.pi*R*hTan),
      m_flow_nominal=0.028,
      hHex_a=0.815,
      hHex_b=0.05,
      Q_flow_nominal=31000,
      TTan_nominal=273.15+20,
      THex_nominal=273.15+70,
      mHex_flow_nominal=0.167);

    parameter Modelica.SIunits.ThermalResistance R;
    final parameter Real ri = sqrt(VTan/(Modelica.Constants.pi*hTan));

  end uniSTOR;

  package Examples
    model uniSTOR
      import DeSchipjes;
      DeSchipjes.Dwellings.HeatingSystems.StorageTanks.uniSTOR uniSTOR(
        redeclare package Medium = IDEAS.Media.Water,
        R=1.4,
        redeclare package MediumHex = IDEAS.Media.Water)
        annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
      Annex60.Fluid.HeatExchangers.HeaterCooler_T hea(
        redeclare package Medium = Annex60.Media.Water,
        m_flow_nominal=0.5,
        dp_nominal=0)
        annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
      Modelica.Blocks.Sources.Constant const(k=273.15 + 60)
        annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
      IDEAS.Fluid.Sources.FixedBoundary bou(
        use_T=false,
        redeclare package Medium = Annex60.Media.Water,
        nPorts=1)                                       annotation (Placement(
            transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={-62,-30})));
      IDEAS.Fluid.Sources.FixedBoundary bou1(
        use_T=false,
        redeclare package Medium = Annex60.Media.Water,
        nPorts=1)                                       annotation (Placement(
            transformation(
            extent={{-4,-4},{4,4}},
            rotation=180,
            origin={88,-4})));
      IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpDHW(
        KvReturn=2,
        m_flow_nominal=0.5,
        measurePower=false,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        dynamicBalance=false,
        includePipes=false,
        filteredSpeed=true,
        riseTime=180,
        redeclare package Medium = IDEAS.Media.Water)
                            annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-36,-6})));
      Modelica.Blocks.Sources.Constant const1(k=0.1)
        annotation (Placement(transformation(extent={{-64,10},{-44,30}})));
      IDEAS.Fluid.FixedResistances.Pipe_Insulated pipe_Insulated(
        redeclare package Medium = IDEAS.Media.Water,
        dp_nominal=0,
        m=5,
        UA=1.5,
        m_flow_nominal=0.1)
        annotation (Placement(transformation(extent={{50,6},{70,-2}})));
      Buildings.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=273.15
             + 10)
        annotation (Placement(transformation(extent={{-32,42},{-12,62}})));
      IDEAS.Fluid.BaseCircuits.PumpSupply_m_flow pumpDHW1(
        KvReturn=2,
        m_flow_nominal=0.5,
        measurePower=false,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        dynamicBalance=false,
        includePipes=false,
        filteredSpeed=true,
        riseTime=180,
        redeclare package Medium = IDEAS.Media.Water)
                            annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={30,-4})));
    equation
      connect(hea.TSet, const.y) annotation (Line(
          points={{-74,6},{-78,6},{-78,30},{-79,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pumpDHW.port_a2, uniSTOR.portHex_b) annotation (Line(
          points={{-26,-12},{-20,-12},{-20,-6},{-10,-6}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(const1.y, pumpDHW.u) annotation (Line(
          points={{-43,20},{-36,20},{-36,4.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pumpDHW.port_b1, uniSTOR.portHex_a) annotation (Line(
          points={{-26,0},{-20,0},{-20,-1.8},{-10,-1.8}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(fixedTemperature.port, pipe_Insulated.heatPort) annotation (Line(
          points={{-12,52},{60,52},{60,6}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(hea.port_a, pumpDHW.port_b2) annotation (Line(
          points={{-72,0},{-80,0},{-80,-12},{-46,-12}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(hea.port_b, pumpDHW.port_a1) annotation (Line(
          points={{-52,0},{-46,0}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(bou.ports[1], pumpDHW.port_b2) annotation (Line(
          points={{-66,-30},{-70,-30},{-70,-28},{-72,-28},{-72,-12},{-46,-12}},
          color={0,127,255},
          smooth=Smooth.None));

      connect(uniSTOR.port_a, pumpDHW1.port_b2) annotation (Line(
          points={{-10,2},{-16,2},{-16,-10},{20,-10}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(uniSTOR.port_b, pumpDHW1.port_a1) annotation (Line(
          points={{10,2},{20,2}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pumpDHW1.port_b1, pipe_Insulated.port_a) annotation (Line(
          points={{40,2},{50,2}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(pumpDHW1.port_a2, pipe_Insulated.port_b) annotation (Line(
          points={{40,-10},{78,-10},{78,2},{70,2}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(bou1.ports[1], pipe_Insulated.port_b) annotation (Line(
          points={{84,-4},{78,-4},{78,2},{70,2}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(const.y, pumpDHW1.u) annotation (Line(
          points={{-79,30},{-70,30},{-70,34},{30,34},{30,6.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end uniSTOR;
  end Examples;
end StorageTanks;
