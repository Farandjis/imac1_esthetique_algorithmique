int X = 640; // taille x fenêtre
int Y = 640; // taille y fenêtre
int longueur = 25;
boolean premiereIterationDuProg = true;
void settings() {
  // J'ai utilisé Gemini pour cette fonction settings, car j'essayais d'utiliser size(X, Y) dans setup, et ça ne marchait pas.
  // son explication : Processing construit la fenêtre avant de lire tes variables, donc size() dans le setup() n'accepte que des nombres fixes, pas de variables.
  size(X, Y);
}


void setup(){
  // couleur de fond : blanc
    background(255);
    translate(X/2, Y/2); // on va au milieu
    rotate(PI); // comme ça la fourmi pointe vers le haut dès le départ
    execution();
}

void execution(){
  while(true){
    print("aaa");
      regle();
      regle();
      delay(300);
  }
}


/*
void draw(){
  if (premiereIterationDuProg){
    background(255);
    translate(X/2, Y/2); // on va au milieu
    rotate(PI); // comme ça la fourmi pointe vers le haut dès le départ
    premiereIterationDuProg = false;
  }


}
*/


void regle(){
  boolean estUneCaseBlancheVariable = estUneCaseBlanche();
  if (estUneCaseBlancheVariable){
    dessinerUnCarre(0);
    tournerADroite();
  }
  else {
    dessinerUnCarre(255);
    tournerAGauche();
  }
  regle();
  
}


/**
Tourne de 90° vers la gauche
Donc si la fourmi pointe vers le haut, le prochain carré sera dessiné pile à la gauche du carré précédemment dessiné
*/
void tournerAGauche(){
  translate(longueur, longueur);
  rotate(-PI/2);
}

/**
Tourne de 90° vers la droite
Donc si la fourmi pointe vers le haut, le prochain carré sera dessiné pile à la droite du carré précédemment dessiné
*/
void tournerADroite(){
  rotate(PI/2);
}

/**
Principe : Dessine un carré
Entrée :
  - int couleur : quel nuance de gris on souhaite affiché (0 = noir, 255 = blanc) 
*/
void dessinerUnCarre(int couleur){
  fill(couleur);
  square(0, 0, longueur);
}

/**
Principe : vérifie quel est la couleur de la case
Renvoie :
  - true : si blanc ou incolore (elle n'a pas été colorié)
  - false : si colorié en noir par exemple
  
REMARQUE : je me suis aidé de Gemini pour cette fonction, voici ses explications
Processing possède deux fonctions conçues exactement pour ça. Elles convertissent une coordonnée "locale" (celle de votre dessin) en coordonnée "écran" (la vraie position du pixel).
C'est la méthode la plus robuste car elle fonctionne même si vous faites plusieurs translate à la suite ou même des rotate.
*/
boolean estUneCaseBlanche(){
  int realX = int(screenX(1, 1));
  int realY = int(screenY(1, 1));
  int couleur = get(realX,realY);
  
  return couleur == 255 || couleur == -1;
}
