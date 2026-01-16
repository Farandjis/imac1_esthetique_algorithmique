boolean menuAttaqueVisible = true; // par défaut on voit les boutons

class FenetreVide extends PApplet {
  PImage imgJoueur;
  PImage imgFourmi;
  PApplet parent; 

  
  Pokemon[] listePokemon = {getPikachu(), getSalameche()};
    Pokemon pokemonDuJoueur;
    Pokemon pokemonDeLaFourmi;

  FenetreVide(PApplet _p) {
    super();
    parent = _p;
  }

  void settings() {
    size(400, 400); 
  }

  void setup() {
    surface.setTitle("Statut du Combat");
    
    pokemonDuJoueur = listePokemon[1];
    pokemonDeLaFourmi = listePokemon[0];
    
    
    // Chargement via le sketch principal pour trouver le dossier data
    imgJoueur = parent.loadImage(pokemonDuJoueur.cheminImageDerriere);
    imgFourmi = parent.loadImage(pokemonDeLaFourmi.cheminImageDevant);
    
      // Variable pour le mouvement
      pokemonDuJoueur.positionImageX = 20; // Position de départ à gauche
      pokemonDuJoueur.positionImageY = height-130; 
      
      pokemonDeLaFourmi.positionImageX =  width - 150; // Position de départ à gauche
      pokemonDeLaFourmi.positionImageY = 30; 
  }

boolean surRect(int x, int y, int width, int height)  {
  // source : https://processing.org/examples/button.html 
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

  void mousePressed(){
    // Aide de Gemini et de https://processing.org/examples/button.html
        
   if (menuAttaqueVisible){
      // Vérifie le bouton Haut Gauche
      if (surRect(160, 285, 100, 40)) {
        menuAttaqueVisible = false;
        println("Souris sur : Tranche");
      }
      
      // Vérifie le bouton Haut Droite
      else if (surRect(280, 285, 100, 40)) {
        println("Souris sur : Flammèche");
      }
      
      // Vérifie le bouton Bas Gauche
      else if (surRect(160, 335, 100, 40)) {
        println("Souris sur : Griffe");
      }
      
      // Vérifie le bouton Bas Droite
      else if (surRect(280, 335, 100, 40)) {
        println("Souris sur : Repos");
      }
   }
    
  }

  void afficherLesAttaques(){
    fill(210,210,210);
    rect(150, 275, 240, 110, 5);
    fill(0,0,0);
    rect(160, 285, 100, 40, 5); // haut gauche
    rect(280, 285, 100, 40, 5); // haut droite
    rect(160, 335, 100, 40, 5); // bas gauche
    rect(280, 335, 100, 40, 5); // bas gauche
    
    // Configuration commune pour le texte des boutons
    textAlign(CENTER, CENTER);
    textSize(16);
    
    fill(255); // Texte en blanc
    text("Tranche", 210, 305);
    text("Flammèche", 330, 305);
    text("Griffe", 210, 355);
    text("Repos", 330, 355);
  }


  void draw() {
    background(240); 
    
    // Décor
    stroke(200);
    line(0, height/2 + 50, width, height/2 + 50); 

    // On affiche Salamèche à la position variable salamecheX
    image(imgJoueur, pokemonDuJoueur.positionImageX, pokemonDuJoueur.positionImageY, 120, 120);
    image(imgFourmi, pokemonDeLaFourmi.positionImageX, pokemonDeLaFourmi.positionImageY, 120, 120);

    /*
    // --- MOUVEMENT DE SALAMÈCHE ---
    if (imgJoueur != null) {
      // On affiche Salamèche à la position variable salamecheX
      
      // On augmente X pour le déplacer vers la droite
      pokemonDuJoueur.positionImageX += 2; 
      
      // Optionnel : Revenir à gauche s'il sort de l'écran
      if (pokemonDuJoueur.positionImageX > width) {
        pokemonDuJoueur.positionImageX = -120; 
      }
    }
    */
     

    // fourmi reste fixe en haut à droite

    
    // On n'affiche les attaques que si la variable est vraie
    if (menuAttaqueVisible) {
      afficherLesAttaques();
    }
    fill(0);
    text("Salamèche avance !", 20, 30);
  }
}
