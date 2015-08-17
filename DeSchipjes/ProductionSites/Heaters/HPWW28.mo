within DeSchipjes.ProductionSites.Heaters;
model HPWW28 "28.8 kW HP"
  import DeSchipjes;

  //Extensions
  extends DeSchipjes.ProductionSites.Heaters.BaseClasses.HPWW(
    COPTable(table=[0,-5,0,2,10,15; 35,3.7,4.83,5.06,6,7.01; 45,3.13,3.6,3.82,4.69,5.36;
        55,0,2.68,2.68,3.59,4.06; 60,0,0,2.34,3.11,3.54]),
    powerTable(table=[0,-5,0,2,10,15; 35,6764.9,5962.7,6019.8,6183.3,6302.4; 45,
          7840.3,7788.9,7748.7,7724.9,7688.4; 55,0,9735.1,9685.3,9501.4,9374.4;
          60,0,0,8576.9,10549.8,10389.8]),
    QNomRef=28800);
end HPWW28;
