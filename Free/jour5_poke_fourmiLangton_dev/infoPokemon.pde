class Attaque{
  String nom;
  int pv;
  
  Attaque(String nom, int pv){
    this.nom = nom;
    this.pv = pv;
  }
}

class Pokemon{
  String nom;
  
  String cheminImageDevant; // pokémon vu de face
  String cheminImageDerriere; // pokémon vu de derrière
  
  float positionImageX = 0; // la position de l'image sur l'axe x sur la fenêtre
  float positionImageY = 0;
  
  int pv; // point de vie du pokémon
  
  Attaque[] attaques;
};

Pokemon getPikachu(){
  Pokemon pikachu = new Pokemon();
  
  pikachu.nom = "pikachu";
  pikachu.cheminImageDevant = "devant/pikachu.png"; // pokémon vu de face
  pikachu.cheminImageDerriere = "derriere/pikachu.png"; // pokémon vu de derrière
  pikachu.pv = 63; // point de vie du pokémon
  pikachu.attaques = new Attaque[]{
    new Attaque("Tonnerre", -32), // nom de l'attaque et elle fait 32 dégâts
    new Attaque("Souplesse", -18),
    new Attaque("Vive_Attaque", -14),
    new Attaque("Soin", 31) // là c'est positif car le pokémon se soigne
  };
  
  return pikachu;
}


Pokemon getSalameche(){
  Pokemon salameche = new Pokemon();
  
  salameche.nom = "Salamèche";
  salameche.cheminImageDevant = "devant/salameche.png"; // pokémon vu de face
  salameche.cheminImageDerriere = "derriere/salameche.png"; // pokémon vu de derrière
  salameche.pv = 64; // point de vie du pokémon
  salameche.attaques = new Attaque[]{
    new Attaque("Tranche", -38),
    new Attaque("Flammèche", -16),
    new Attaque("Griffe", -12),
    new Attaque("Soin", 31)
  };
  
  return salameche;
}
