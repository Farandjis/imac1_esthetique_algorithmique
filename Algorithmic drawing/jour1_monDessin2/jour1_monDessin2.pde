int X = 640; // taille x fenêtre
int Y = 640; // taille y fenêtre
int DXY = 0; // position de départ XY
int l = 100; // longuer
void settings() {
  // J'ai utilisé Gemini pour cette fonction settings, car j'essayais d'utiliser size(X, Y) dans setup, et ça ne marchait pas.
  // son explication : Processing construit la fenêtre avant de lire tes variables, donc size() dans le setup() n'accepte que des chiffres fixes, pas de variables.
  size(X, Y);
}


void setup(){
  
  // couleur de fond : blanc
  background(255);
  //fill(255,0,0);
  translate(0,400);

  
  for (int i = 0; i < 4; i++){
  trapeze();
  translate(l, 0);
  trapeze2();
  translate(-l/2, 0);
  trapeze3();
  translate(0,-l);
  trapeze5();
  translate(l/4,l/2);
  trapeze();
  translate(-l/4, l/2);
  translate(l,0);
  }
  
  translate(-l*6 - l/2, l/2);
  for (int i = 0; i < 5; i++){
    trapeze();
    translate(l, 0);
    trapeze2();
    translate(-l/2, 0);
    trapeze3();
    translate(0,-l);
    trapeze5();
    translate(l/4,l/2);
    trapeze();
    translate(-l/4, l/2);
    translate(l,0);
  }

  
  /*

  trapeze2();
  fill(0,0,255);
  trapeze3();
  fill(0,0,0);
  trapeze4();
  */
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
  );
}


void trapeze(){
  int r = (int) random(0, 255);
  fill(r,r,255);
  quad(DXY+l/4, DXY+l/2, // haut gauche (xy)
       DXY+l/2, DXY, // haut droit (xy)
       DXY+l, DXY+l, // bas droit (xy)
       DXY+l/2, DXY+l  // bas gauche (xy)
  );
}

void trapeze2(){
  int r = (int) random(0, 255);
  fill(r,r,255);
  quad(DXY+l/4, DXY+l/2, // haut gauche (xy)
       DXY+l/2+l/4, DXY+l/2, // haut droit (xy)
       DXY+l, DXY+l, // bas droit (xy)
       DXY, DXY+l  // bas gauche (xy)
  );
}

void trapeze3(){
  int r = (int) random(0, 255);
  fill(r,r,255);
  quad(DXY, DXY, // haut gauche (xy)
       DXY+l/2, DXY, // haut droit (xy)
       DXY+l/2+l/4, DXY+l/2, // bas droit (xy)
       DXY+l/2, DXY+l  // bas gauche (xy)
  );
}

void trapeze4(){
  int r = (int) random(0, 255);
  fill(r,r,255);
  quad(
         DXY, DXY,  // haut gauche (xy)
         DXY+l, DXY, // haut droit (xy)
         DXY+l/2+l/4, DXY+l/2, // bas droit (xy)
         DXY+l/4, DXY+l/2 // bas gauche (xy)

  );
}


void trapeze5(){
  int r = (int) random(0, 255);
  fill(r,r,255);
  quad(DXY+l/2, DXY, // haut gauche (xy)
       DXY+l-l/4, DXY + l/2, // haut droit (xy)
       DXY+l/2, DXY+l, // bas droit (xy)
       DXY, DXY+l  // bas gauche (xy)
  );
}



void draw(){
  }
