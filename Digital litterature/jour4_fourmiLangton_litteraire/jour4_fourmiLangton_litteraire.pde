int X = 600; // taille x fenêtre
int Y = 600; // taille y fenêtre
int longueur = 20;
// On déclare ces variables en dehors pour qu'elles survivent entre deux "draw"
float antX;
float antY;
float antAngle = PI; // La fourmi est orienté vers la gauche ←


void settings() {
  // J'ai utilisé Gemini pour cette fonction settings, car j'essayais d'utiliser size(X, Y) dans setup, et ça ne marchait pas.
  // son explication : Processing construit la fenêtre avant de lire tes variables, donc size() dans le setup() n'accepte que des nombres fixes, pas de variables.
  size(X, Y);
}


void setup(){
    // couleur de fond : blanc
    background(255);
    // On initialise la fourmi au centre
    antX = width / 2;
    antY = height / 2;
}



void draw(){
  regle(); // que fais ton ? La règle à exécuter
  delay(100); // latence


}


// algo de la fourmi de Lanton
void regle(){
  if (estUneCaseBlanche()){
    dessinerUnCarre("rouge");
    strachey("rouge");
    tournerADroite();
  }
  else if(estUneCaseNoir()) {;
    dessinerUnCarre("blanc");
    strachey("blanc");
    tournerAGauche();
  }
  else if (estUneCaseRouge()){
    dessinerUnCarre("bleu");
    strachey("bleu");
    reculer();
  }
  else {
    dessinerUnCarre("noir");
    strachey("noir");
    avancer();
  }
}


/**
Tourne de 90° vers la gauche
Donc si la fourmi pointe vers le haut, le prochain carré sera dessiné pile à la gauche du carré précédemment dessiné
code généré par Gemini car j'étais bloqué à cause des limitations de Processing
*/
void tournerAGauche(){
  antAngle -= HALF_PI; // on tourne
  antX += cos(antAngle) * longueur; // on se déplace en X
  antY += sin(antAngle) * longueur; // on se déplace en Y
}

/**
Tourne de 90° vers la droite
Donc si la fourmi pointe vers le haut, le prochain carré sera dessiné pile à la droite du carré précédemment dessiné
code généré par Gemini car j'étais bloqué à cause des limitations de Processing
*/
void tournerADroite(){
  antAngle += HALF_PI; // on tourne
  antX += cos(antAngle) * longueur; // on se déplace en X
  antY += sin(antAngle) * longueur; // on se déplace en Y
}

void reculer(){
  antX += cos(antAngle) * longueur; // on se déplace en X
  antY += sin(antAngle) * longueur; // on se déplace en Y
}

void avancer(){
  antX -= cos(antAngle) * longueur; // on se déplace en X
  antY -= sin(antAngle) * longueur; // on se déplace en Y
}

/**
Principe : Dessine un carré
Entrée :
  - int couleur : quel nuance de gris on souhaite affiché (0 = noir, 255 = blanc) 
*/
void dessinerUnCarre(String couleur){

  if (couleur == "noir"){
    fill(#000000);
  }
  else if (couleur == "blanc"){
    fill(#FFFFFF);
  }
  else if (couleur == "rouge"){
    fill(#FF0000);
  }
  else if (couleur == "bleu"){
    fill(#0000FF);
  }
  square(antX, antY, longueur);
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
  int couleur = get((int) antX+5,(int) antY+5);
  return couleur == #FFFFFF || couleur == -1;
}

boolean estUneCaseNoir(){
  int couleur = get((int) antX+5,(int) antY+5);
  return couleur == #000000;
}

boolean estUneCaseRouge(){
  int couleur = get((int) antX+5,(int) antY+5);
  return couleur == #FF0000;
}
