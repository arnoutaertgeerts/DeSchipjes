within DeSchipjes.ProductionSites.Heaters;
model Booster "2 kW booster HP"
  import DeSchipjes;

  //Extensions
  extends DeSchipjes.ProductionSites.Heaters.BaseClasses.HPWW(COPTable(
                          smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
          20,25,30,35,40,50; 15,3.6,4,4.5,4.8,5.4,5.5; 55,3.5,3.9,4.4,4.7,5.3,5.4;
          65,2.6,2.9,3.3,3.5,3.8,3.9; 70,2.2,2.5,2.8,3,3.3,3.3]),
                           powerTable(
                smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
          20,25,30,35,40,50; 15,480,490,500,510,509,509; 55,485.7,494.9,504.5,
          510.6,509.4,510; 65,576.9,572.4,606.1,605.7,657.9,660; 70,636.4,628,
          646.4,660,675,680]),
       QNomRef=2000,
       m1=5,
       m2=5,
    realExpression3(y=vol1.T - 273.15));
end Booster;
