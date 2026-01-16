class FenetreVide extends PApplet {
  PImage imgJoueur;
  PImage imgFourmi;
  PApplet parent; 

  // Variable pour le mouvement
  float salamecheX = 20; // Position de départ à gauche

  FenetreVide(PApplet _p) {
    super();
    parent = _p;
  }

  void settings() {
    size(400, 400); 
  }

  void setup() {
    surface.setTitle("Statut du Combat");
    // Chargement via le sketch principal pour trouver le dossier data
    imgJoueur = parent.loadImage("derriere/salameche.png");
    imgFourmi = parent.loadImage("devant/pikachu.png");
  }

  void draw() {
    background(240); 
    
    // Décor
    stroke(200);
    line(0, height/2 + 50, width, height/2 + 50); 

    // On affiche Salamèche à la position variable salamecheX
    image(imgJoueur, salamecheX, height - 130, 120, 120);
    /*
    // --- MOUVEMENT DE SALAMÈCHE ---
    if (imgJoueur != null) {
      // On affiche Salamèche à la position variable salamecheX
      image(imgJoueur, salamecheX, height - 130, 120, 120);
      
      // On augmente X pour le déplacer vers la droite
      salamecheX = salamecheX + 2; 
      
      // Optionnel : Revenir à gauche s'il sort de l'écran
      if (salamecheX > width) {
        salamecheX = -120; 
      }
    }
    */

    // Pikachu reste fixe en haut à droite
    image(imgFourmi, width - 150, 30, 120, 120);
    
    
    fill(0);
    text("Salamèche avance !", 20, 30);
  }
}
