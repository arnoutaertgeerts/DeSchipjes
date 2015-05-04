within DeSchipjes.Dwellings.Structures.Renovated.Examples.BaseClasses;
model SSM
  extends IDEAS.Buildings.Linearization.BaseClasses.StateSpace(fileName="ssm.mat",nWin=5, x_start = 293.15*ones(states));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SSM;
