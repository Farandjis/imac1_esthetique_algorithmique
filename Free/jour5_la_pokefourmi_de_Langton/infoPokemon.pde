class Attaque{
  String nom;
  int pointsDeDegats;
  
  Attaque(String nom, int pointsDeDegats){
    this.nom = nom;
    this.pointsDeDegats = pointsDeDegats;
  }
}

class Pokemon{
  String nom;
  
  String cheminImageDevant; // pokémon vu de face
  String cheminImageDerriere; // pokémon vu de derrière
  
  float positionImageX = 0; // la position de l'image sur l'axe x sur la fenêtre
  float positionImageY = 0;
  
  int pvInitial; // point de vie de départ du pokémon
  int pv; // point de vie du pokémon durant la partie
  
  Attaque[] attaques;
};

Pokemon getPikachu(){
  Pokemon pikachu = new Pokemon();
  
  pikachu.nom = "Pikachu";
  pikachu.cheminImageDevant = "devant/pikachu.png"; // pokémon vu de face
  pikachu.cheminImageDerriere = "derriere/pikachu.png"; // pokémon vu de derrière
  pikachu.pvInitial = 63;
  pikachu.pv = 63; // point de vie du pokémon
  pikachu.attaques = new Attaque[]{
    new Attaque("TONNERRE", -22), // nom de l'attaque et elle fait 32 dégâts
    new Attaque("SOUPLESSE", -18),
    new Attaque("VIVE ATTAQUE", -14),
    new Attaque("SOIN", 31) // là c'est positif car le pokémon se soigne
  };
  
  return pikachu;
}


Pokemon getSalameche(){
  Pokemon salameche = new Pokemon();
  
  salameche.nom = "Salamèche";
  salameche.cheminImageDevant = "devant/salameche.png"; // pokémon vu de face
  salameche.cheminImageDerriere = "derriere/salameche.png"; // pokémon vu de derrière
  salameche.pvInitial = 64;
  salameche.pv = 64; // point de vie du pokémon
  salameche.attaques = new Attaque[]{
    new Attaque("TRANCHE", -20),
    new Attaque("FLAMMÈCHE", -16),
    new Attaque("GRIFFE", -12),
    new Attaque("SOIN", 31)
  };
  
  return salameche;
}

Pokemon getCarapuce(){
  Pokemon carapuce = new Pokemon();
  
  carapuce.nom = "Carapuce";
  carapuce.cheminImageDevant = "devant/carapuce.png";
  carapuce.cheminImageDerriere = "derriere/carapuce.png";
  carapuce.pvInitial = 69;
  carapuce.pv = 69;
  carapuce.attaques = new Attaque[]{
    new Attaque("BULLE D'O", -17),  
    new Attaque("MORSURE", -10),     
    new Attaque("PISTOLET À O", -13), 
    new Attaque("REPOS", 35)        
  };
  
  return carapuce;
}

Pokemon getBulbizarre(){
  Pokemon bulbizarre = new Pokemon();
  
  bulbizarre.nom = "Bulbizarre";
  bulbizarre.cheminImageDevant = "devant/bulbizarre.png";
  bulbizarre.cheminImageDerriere = "derriere/bulbizarre.png";
  bulbizarre.pvInitial = 70;
  bulbizarre.pv = 70;
  bulbizarre.attaques = new Attaque[]{
    new Attaque("TRANCH'HERBE", -40), 
    new Attaque("CHARGE", -11),      
    new Attaque("VAMPIGRAINE", 10),   
    new Attaque("MÉGA-SANGSUE", 16)  
  };
  
  return bulbizarre;
}
