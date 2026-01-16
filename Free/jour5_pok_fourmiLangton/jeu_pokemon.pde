// --- LA DEUXIÈME FENÊTRE ---
class FenetreVide extends PApplet {
  PImage imgSalameche;
  PImage imgPikachu;
  PApplet parent; // Référence vers le sketch principal

  // Le constructeur permet de lier les deux fenêtres
  FenetreVide(PApplet _p) {
    super();
    parent = _p;
  }

  void settings() {
    size(400, 400); 
  }

  void setup() {
    surface.setTitle("Statut du Combat");
    
    // On utilise parent.loadImage pour chercher dans le bon dossier data
    imgSalameche = parent.loadImage("devant/salameche.png");
    imgPikachu = parent.loadImage("devant/pikachu.png");
  }

  void draw() {
    background(240); 
    
    // Décor : Ligne d'horizon
    stroke(200);
    line(0, height/2 + 50, width, height/2 + 50); 

    // Affichage Salamèche (Bas Gauche)
    if (imgSalameche != null) {
      image(imgSalameche, 30, height - 130, 120, 120);
    } else {
      fill(255, 0, 0);
      text("Erreur: salameche.png non trouvé", 30, height - 50);
    }

    // Affichage Pikachu (Haut Droite)
    if (imgPikachu != null) {
      image(imgPikachu, width - 150, 30, 120, 120);
    } else {
      fill(255, 0, 0);
      text("Erreur: pikachu.png non trouvé", width - 180, 160);
    }
    
    // Texte d'ambiance
    fill(0);
    textSize(14);
    text("Combat de la Fourmi de Langton", 20, 30);
  }
}
