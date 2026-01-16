import java.util.Arrays;

boolean menuAttaqueVisible = false; // par défaut on voit les boutons
int idAttaqueChoisit = -1;
int nbTour = 0;
int momentDerniereAction = 0; // Pour mémoriser quand l'attaque a eu lieu
boolean clignotement = false;  // si true, on fait clignoté le pokémon qui a subi l'attaque (hors soin), cela revient à la période d'attente après une attaque (aide de Gemini)
boolean gameover = false;
ArrayList<String> couleurs = new ArrayList(Arrays.asList("rouge", "bleu", "blanc", "noir"));

class FenetreVide extends PApplet {
  PImage imgJoueur;
  PImage imgFourmi;
  PApplet parent; 
  
  String texteAfficher = "La fourmi de Langton vous défie !";

  
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
    surface.setTitle("Combat contre la fourmi de Langton");
    
    pokemonDuJoueur = listePokemon[1];
    pokemonDeLaFourmi = listePokemon[0];
    
    
    // Chargement via le sketch principal pour trouver le dossier data
    imgJoueur = parent.loadImage(pokemonDuJoueur.cheminImageDerriere);
    imgFourmi = parent.loadImage(pokemonDeLaFourmi.cheminImageDevant);
    
      // Variable pour le mouvement
      pokemonDuJoueur.positionImageX = -120; // Position de départ à gauche
      pokemonDuJoueur.positionImageY = height-127; 
      
      pokemonDeLaFourmi.positionImageX =  520; // Position de départ à gauche
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


void attaquer(Pokemon attaquant, Pokemon cible){
  int pdd = attaquant.attaques[idAttaqueChoisit].pointsDeDegats;
  if (pdd > 0){
    // si les dégâts sont positif, alors c'est pour soigner le pokémon attaquant
    
    // afin d'éviter de dépasser la barre de points de vie si on risque de la dépasser avec le soin
    if (attaquant.pv + attaquant.attaques[idAttaqueChoisit].pointsDeDegats > attaquant.pvInitial){
      attaquant.pv = attaquant.pvInitial; 
    }
    else {
      attaquant.pv += attaquant.attaques[idAttaqueChoisit].pointsDeDegats; // on se soigne
    }
  }
  else {
    cible.pv += attaquant.attaques[idAttaqueChoisit].pointsDeDegats; // on attaque (remarque : ici, les pdd sont négatifs donc on fait +=)
    clignotement = true;
    
    // si le pokémon cible est KO
    if (cible.pv <= 0){
      gameover = true;
    }
    
  }
  idAttaqueChoisit = -1; // on reset
  nbTour++; // on passe au tour suivant
  momentDerniereAction = millis(); 

}


void mousePressed(){
    // Aide de Gemini et de https://processing.org/examples/button.html
        
   if (menuAttaqueVisible){
      // Vérifie le bouton Haut Gauche
      if (surRect(160, 285, 100, 40)) {
        menuAttaqueVisible = false;
        idAttaqueChoisit = 0;
        texteAfficher = "Votre " + pokemonDuJoueur.nom + " attaque avec " + pokemonDuJoueur.attaques[idAttaqueChoisit].nom + " !";
         attaquer(pokemonDuJoueur, pokemonDeLaFourmi);
      }
      
      // Vérifie le bouton Haut Droite
      else if (surRect(280, 285, 100, 40)) {
        menuAttaqueVisible = false;
        idAttaqueChoisit = 1;
        texteAfficher = "Votre " + pokemonDuJoueur.nom + " attaque avec " + pokemonDuJoueur.attaques[idAttaqueChoisit].nom + " !";
        attaquer(pokemonDuJoueur, pokemonDeLaFourmi);
      }
      
      // Vérifie le bouton Bas Gauche
      else if (surRect(160, 335, 100, 40)) {
        menuAttaqueVisible = false;
        idAttaqueChoisit = 2;
        texteAfficher = "Votre " + pokemonDuJoueur.nom + " attaque avec " + pokemonDuJoueur.attaques[idAttaqueChoisit].nom + " !";
        attaquer(pokemonDuJoueur, pokemonDeLaFourmi);
      }
      
      // Vérifie le bouton Bas Droite
      else if (surRect(280, 335, 100, 40)) {
        menuAttaqueVisible = false;
        idAttaqueChoisit = 3;
        texteAfficher = "Votre " + pokemonDuJoueur.nom + " se soigne avec " + pokemonDuJoueur.attaques[idAttaqueChoisit].nom + " !";
        attaquer(pokemonDuJoueur, pokemonDeLaFourmi);
      }
   }
    
}

  void afficherLesAttaques(Pokemon pokemonDuJoueur){
    // le grand rectangle
    fill(200,210,210);
    rect(150, 265, 240, 110, 5);
    
    // les boutons
    fill(0,0,0);
    rect(160, 275, 100, 40, 5); // haut gauche
    rect(280, 275, 100, 40, 5); // haut droite
    rect(160, 325, 100, 40, 5); // bas gauche
    rect(280, 325, 100, 40, 5); // bas gauche
    
    // Configuration commune pour le texte des boutons
    textAlign(CENTER, CENTER);
    textSize(16);
    
    fill(255); // Texte en blanc
    text(pokemonDuJoueur.attaques[0].nom, 210, 295); // Haut Gauche on affiche le nom de l'attaque 1
    text(pokemonDuJoueur.attaques[1].nom, 330, 295); // HD
    text(pokemonDuJoueur.attaques[2].nom, 210, 345); // BG
    text(pokemonDuJoueur.attaques[3].nom, 330, 345); // BD
  }
  
  
  void pvJoueur(Pokemon pokemonDuJoueur){
    // fond rouge
    fill(255,0,0);
    rect(0, 380, 400, 20, 0);

    // on prend les pv du pokémon pour adapter la barre verte de vie
    double taille = (400.0f/pokemonDuJoueur.pvInitial)*pokemonDuJoueur.pv; 
    fill(0,255,0);
    rect(0, 380, ((float) taille), 20, 0);
  }
  
 void pvFourmi(Pokemon pokemonDeLaFourmi){
    // fond rouge
    fill(255,0,0);
    rect(0, 0, 400, 20, 0);

    // on prend les pv du pokémon pour adapter la barre verte de vie
    double taille = (400.0f/pokemonDeLaFourmi.pvInitial)*pokemonDeLaFourmi.pv; 
    fill(0,255,0);
    rect(0, 0, ((float) taille), 20, 0);
  }


  void draw() {
    // ======================= MISE EN PLACE
    background(240); 
    
    // Décor
    stroke(200);
    line(0, height/2 + 50, width, height/2 + 50); 

    // On affiche Salamèche à la position variable salamecheX
    image(imgJoueur, pokemonDuJoueur.positionImageX, pokemonDuJoueur.positionImageY, 120, 120);
    image(imgFourmi, pokemonDeLaFourmi.positionImageX, pokemonDeLaFourmi.positionImageY, 120, 120);

    
    fill(0);
    textSize(16);
    textAlign(LEFT, BASELINE);
    text(texteAfficher, 5, 245);
    if (nbTour == 0){
      // --- MOUVEMENT DES POKEMONS ---
      // On augmente X pour le déplacer vers la droite
      pokemonDuJoueur.positionImageX += 2; 
      pokemonDeLaFourmi.positionImageX -= 2;
        
      // faire glisser poké joueur jusqu'à
      if (pokemonDuJoueur.positionImageX > 15) {
          pokemonDuJoueur.positionImageX = 15; 
      }
      
      if (pokemonDeLaFourmi.positionImageX < 265) {
          pokemonDeLaFourmi.positionImageX = 265; 
          texteAfficher = "La fourmi de Langton vous défie ! Choisissez une attaque.";
          menuAttaqueVisible = true;
      }

    }
    
    // si 3 secondes (3000ms) se sont écoulées
    if (millis() - momentDerniereAction > 3000) {
      clignotement = false;
      
      // si la partie est en cours (non GAME OVER)
      if (!gameover){
        // si pair, c'est que c'est au joueur de jouer
        // dans le cas du tour 0, on attend déjà la fin de l'animation d'entrée
        if (nbTour%2 == 0 && nbTour != 0){
    
          menuAttaqueVisible = true; 
          texteAfficher = "Que dois faire " + pokemonDuJoueur.nom + " ?";
        }
        // sinon, c'est à la fourmi
        else if (nbTour != 0) {
          idAttaqueChoisit = couleurs.indexOf(couleurDeLaCaseOuLaFourmiVientDArriver);
          if (pokemonDeLaFourmi.attaques[idAttaqueChoisit].pointsDeDegats < 0){
            texteAfficher = "Le " + pokemonDeLaFourmi.nom + " adverse attaque avec " + pokemonDeLaFourmi.attaques[idAttaqueChoisit].nom + " !";
          }
          else {
            texteAfficher = "Le " + pokemonDeLaFourmi.nom + " adverse se soigne avec " + pokemonDeLaFourmi.attaques[idAttaqueChoisit].nom + " !";
          }
  
          attaquer(pokemonDeLaFourmi, pokemonDuJoueur);
          
          
        }
      }
      // si GAME OVER
      else {
        if (nbTour%2 == 0){
          imgJoueur.filter(GRAY); 
          texteAfficher = pokemonDuJoueur.nom + " n'est plus capable de se battre, la fourmi de Langton a gagné !";
        }
        else {
          imgFourmi.filter(GRAY); 
          texteAfficher = pokemonDeLaFourmi.nom + " n'est plus capable de se battre, VOUS AVEZ GAGNÉ !!";
        }
 
      }
    }
    
    // sinon, on fait clignoté le pokémon attaqué, si on autorise le clignotement (on n'autorise pas dans le cas d'un soin)
    if (clignotement){
      if (frameCount % 20 < 10) { // aide de Gemini
        if (nbTour%2 == 0){
          // si pair, c'est que c'est au joueur de jouer ---> donc c'est le joueur qui vient de se faire attaquer
          
          noStroke(); // sans contour pour les rectangles
          fill(240); 
          rect(pokemonDuJoueur.positionImageX, pokemonDuJoueur.positionImageY, 120, 120, 0);
          stroke(200); // on les remet
        }
        else{
          // sinon c'est l'adversaire

          // sans contour pour les rectangles
          noStroke();
          fill(240); 
          rect(pokemonDeLaFourmi.positionImageX, pokemonDeLaFourmi.positionImageY, 120, 120, 0);
          stroke(200);
        }
      }
    }
    
    pvJoueur(pokemonDuJoueur);
    pvFourmi(pokemonDeLaFourmi);
    
    // On n'affiche les attaques que si la variable est vraie
    if (menuAttaqueVisible) {
      afficherLesAttaques(pokemonDuJoueur);
    }
  

  }
}
