within DeSchipjes.ProductionSites.Heaters;
model Booster "2 kW booster HP"
  import DeSchipjes;

  //Extensions
  extends DeSchipjes.ProductionSites.Heaters.BaseClasses.HPWW(COPTable(table=[0,
          20,25,30,35,40; 55,3.5,3.9,4.4,4.7,5.3; 65,2.6,2.9,3.3,3.5,3.8; 70,2.2,
          2.5,2.8,3,3.2], smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments),
                           powerTable(table=[0,20,25,30,35,40; 55,485.7,494.9,504.5,
          510.6,509.4; 65,576.9,572.4,606.1,605.7,657.9; 70,636.4,628,646.4,660,
          675], smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments),
       QNomRef=2000,
       m1=5,
       m2=5);
end Booster;
