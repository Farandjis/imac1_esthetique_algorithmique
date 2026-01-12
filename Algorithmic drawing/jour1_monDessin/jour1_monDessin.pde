int X = 640; // taille x fenêtre
int Y = 640; // taille y fenêtre
int DXY = 50; // position de départ XY
int l = 100; // longuer
void settings() {
  // J'ai utilisé Gemini pour cette fonction settings, car j'essayais d'utiliser size(X, Y) dans setup, et ça ne marchait pas.
  // son explication : Processing construit la fenêtre avant de lire tes variables, donc size() dans le setup() n'accepte que des chiffres fixes, pas de variables.
  size(X, Y);
}


void setup(){
  
  // couleur de fond : blanc
  background(255);
  trapeze();

  pushMatrix();
  translate(width/2, height/2); // centre écran
  rotate(PI);                   // 180°

  trapeze();
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2); // centre écran
  rotate(PI/3);                   // 90°

  trapeze();
  popMatrix();
}

void exemple(){
    // haut-gauche; haut-droit; bas-droit; bas-gauche
  // x y
  fill(150);
  quad(10, 10, // haut gauche (xy)
       250, 10, // haut droit (xy)
       250, 250, // bas droit (xy)
       10, 250  // bas gauche (xy)
  ); // carré
}


void trapezeDEF(){
  quad(DXY+l/4, DXY+l/2, // haut gauche (xy)
       DXY+l/2, DXY, // haut droit (xy)
       DXY+l, DXY+l, // bas droit (xy)
       DXY+l/2, DXY+l  // bas gauche (xy)
  ); // carré
}


void trapeze(){
  quad(DXY+l/4, DXY+l/2, // haut gauche (xy)
       DXY+l/2, DXY, // haut droit (xy)
       DXY+l, DXY+l, // bas droit (xy)
       DXY+l/2, DXY+l  // bas gauche (xy)
  ); // carré
}
void draw(){
  }
