within DeSchipjes.Dwellings.Structures.Old;
model House140 "Old house 140"

  //Extensions
  extends PartialStructure(
    woonruimte(n50=14.7),
    keuken(n50=6),
    wc(n50=6.78),
    slaapkamer(n50=7.02),
    badkamer(n50=6.96),
    nachthal(n50=10.73),
    woonruimteKoer(redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType,
      insulationThickness=isolatieTest),
    woonruimteVloer(redeclare Data.Constructions.Old.Vloer
        constructionType,
      insulationThickness=isolatieTest),
    woonruimteAchtergevel(redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType,
      insulationThickness=isolatieTest),
    woonruimteVoorgevel(redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType,
      insulationThickness=isolatieTest),
    keukenAchtergevel(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType),
    woonruimteWindow(
      frac=0.12,
      redeclare Data.Glass.VoorzetRaam                                 glazing,
      redeclare Data.Frames.LoofHout                                 fraType,
      redeclare IDEAS.Buildings.Components.Shading.None shaType),
    keukenWindowLarge(
      frac=0.15,
      redeclare Data.Frames.LoofHout                                 fraType,
      redeclare IDEAS.Buildings.Components.Shading.None shaType,
      redeclare Data.Glass.DubbelGlas                                 glazing),
    keukenWindowSmall(
      frac=0.25,
      redeclare Data.Glass.DubbelGlas                                 glazing,
      redeclare Data.Frames.LoofHout                                 fraType),
    keukenVloer(
      insulationThickness=0, redeclare Data.Constructions.Old.Vloer
        constructionType),
    WCKoer(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDun
        constructionType),
    raamwc(
      frac=0.89,
      redeclare Data.Glass.EnkelGlass                                 glazing,
      redeclare Data.Frames.LoofHout                                 fraType),
    WCVoorgevel(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType),
    WCVloer(
      insulationThickness=0, redeclare Data.Constructions.Old.Vloer
        constructionType),
    slaapkamerZijgevel(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType),
    slaapkamerVoorgevel(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType),
    slaapkamerRaam(
      frac=0.21,
      redeclare Data.Glass.VoorzetRaam                                 glazing,
      redeclare Data.Frames.LoofHout                                 fraType),
    badkamerAchtergevel(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType),
    badkamerZijgevel(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType),
    halAchtergevel(
      insulationThickness=0, redeclare Data.Constructions.Old.BuitenMuurDik
        constructionType));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -100},{220,200}}), graphics));
end House140;
