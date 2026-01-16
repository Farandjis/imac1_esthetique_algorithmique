class Attaque{
  String nom;
  int pv;
  
  Attaque(String nom, int pv){
    this.nom = nom;
    this.pv = pv;
  }
}

class Pikachu{
  String nom = "Pikachu";
  
  String cheminImageDevant = "devant/pikachu.png";
  String cheminImageDerriere = "derriere/pikachu.png";
  
  int pv = 63;
  
  Attaque[] attaques = {
    new Attaque("Tonnerre", -32),
    new Attaque("Souplesse", -18),
    new Attaque("Vive_Attaque", -14),
    new Attaque("Soin", 31)
  };
};

class Salameche{
  String nom = "Salamèche";
  
  String cheminImageDevant = "devant/salameche.png";
  String cheminImageDerriere = "derriere/salameche.png";
  
  int pv = 64;
  
  Attaque[] attaques = {
    new Attaque("Tranche", -38),
    new Attaque("Flammèche", -16),
    new Attaque("Griffe", -12),
    new Attaque("Soin", 31)
  };
};
