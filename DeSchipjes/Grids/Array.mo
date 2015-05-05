within DeSchipjes.Grids;
package Array

  model HTGrid
    //Extensions
    extends PartialArrayGrid(buildings(redeclare each
          DeSchipjes.Dwellings.HeatingSystems.HTHeatingSystem heatingSystem));

  end HTGrid;

  model ITGrid
    //Extensions
    extends PartialArrayGrid(buildings(redeclare each
          DeSchipjes.Dwellings.HeatingSystems.ITHeatingSystem heatingSystem));

  end ITGrid;

  model LTGrid
    //Extensions
    extends PartialArrayGrid(haarhakkerBuildings(redeclare each
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem),
        petersleiBuildings(redeclare each
          DeSchipjes.Dwellings.HeatingSystems.LTHeatingSystem heatingSystem));

  end LTGrid;

  partial model PartialArrayGrid
    //Extensions
    extends DeSchipjes.Interfaces.BaseClasses.Grid(final dp_nominal=
      sum(haarhakkerBuildings.heatingSystem.dp_nominal) +
      sum(petersleiBuildings.heatingSystem.dp_nominal) +
      sum(dHConnections.dp_nominal));

    //Parameters
    parameter Integer nBuildingsHor(min=2)=2
      "Number of buildings in the Haarhakkerstraat";
    parameter Integer nBuildingsVer(min=2)=0
      "Number of buildings in the Petersleistraat";

    parameter Modelica.SIunits.Length[nBuildingsHor+nBuildingsVer] lengths = fill(15, nBuildingsHor+nBuildingsVer)
      "Lengths of the DH connections";

    //Components
    IDEAS.Interfaces.Building[nBuildingsHor] haarhakkerBuildings(
      each standAlone=true,
      redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
            heatLosses=false)),
      each isDH=true,
      redeclare each package Medium = Medium,
      redeclare each IDEAS.Occupants.Standards.None occupant(TSet_val=fill(273.15 + 21,
            6)),
      redeclare each replaceable
        DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
         heatingSystem(
          QNom=QNom,
          TSupply=TSupplyRad,
          TReturn=TReturnRad),
      redeclare each replaceable
        DeSchipjes.Dwellings.Structures.Renovated.HaarhakkerStraatHouse building
        constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
      redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
        ventilationSystem)
      annotation (Placement(transformation(extent={{-60,40},{-80,60}})));

    IDEAS.Interfaces.Building[nBuildingsVer] petersleiBuildings(
      each standAlone=true,
      redeclare each IDEAS.Interfaces.BaseClasses.CausalInhomeFeeder inHomeGrid(branch(
            heatLosses=false)),
      each isDH=true,
      redeclare each package Medium = Medium,
      redeclare each IDEAS.Occupants.Standards.None occupant(TSet_val=fill(273.15 + 21,
            6)),
      redeclare each replaceable
        DeSchipjes.Dwellings.HeatingSystems.BaseClasses.PartialRadiators
         heatingSystem(
          QNom=QNom,
          TSupply=TSupplyRad,
          TReturn=TReturnRad),
      redeclare each replaceable
        DeSchipjes.Dwellings.Structures.Renovated.PetersLeiStraatHouse building
        constrainedby DeSchipjes.Dwellings.Structures.PartialStructure,
      redeclare IDEAS.Buildings.Validation.BaseClasses.VentilationSystem.None
        ventilationSystem)
      annotation (Placement(transformation(extent={{-20,40},{-40,60}})));

    DistrictHeating.Interfaces.DHConnection[nBuildingsHor+nBuildingsVer] dHConnections(
      length=lengths,
      m_flow_nominal=1,
      redeclare each package Medium = Medium,
      redeclare each DistrictHeating.Pipes.DoublePipes.TwinPipeGround
        districtHeatingPipe(dp_nominal=100))
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=90,
          origin={30,30})));

  equation
    for i in 1:nBuildingsHor loop
      connect(dHConnections[i].flowPortOut, haarhakkerBuildings[i].flowPort_supply) annotation (
        Line(
        points={{20,28},{-72,28},{-72,40}},
        color={0,0,0},
        smooth=Smooth.None));
      connect(dHConnections[i].flowPortIn, haarhakkerBuildings[i].flowPort_return) annotation (Line(
        points={{20,32},{-68,32},{-68,40}},
        color={0,0,0},
        smooth=Smooth.None,
          pattern=LinePattern.Dash));
    end for;

    for j in nBuildingsHor+1:nBuildingsHor+nBuildingsVer loop
      connect(dHConnections[j].flowPortOut, petersleiBuildings[j].flowPort_supply) annotation (
        Line(
        points={{20,28},{-32,28},{-32,40}},
        color={0,0,0},
        smooth=Smooth.None));
      connect(dHConnections[j].flowPortIn, petersleiBuildings[j].flowPort_return) annotation (Line(
        points={{20,32},{-28,32},{-28,40}},
        color={0,0,0},
        smooth=Smooth.None,
          pattern=LinePattern.Dash));
    end for;

    for i in 1:nBuildingsHor+nBuildingsVer-1 loop
      connect(dHConnections[i].port_a1, dHConnections[i+1].port_b1);
      connect(dHConnections[i].port_b2, dHConnections[i+1].port_a2);
    end for;
    connect(port_a, dHConnections[1].port_b1) annotation (Line(
        points={{-100,0},{24,0},{24,20}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(port_b, dHConnections[1].port_a2) annotation (Line(
        points={{100,0},{36,0},{36,20}},
        color={0,127,255},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics));
  end PartialArrayGrid;
end Array;
