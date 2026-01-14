int X = 600; // taille x fenêtre
int Y = 600; // taille y fenêtre
int longueur = 280;



void settings() {
  size(X, Y);
}


void setup(){
    // couleur de fond : blanc
    background(255);
    // bezier(150, 200, 220, 235, 250, 235, 350, 200);
    
    
    // bezier(200, 200, 220, 200, 250, 200, 400, 200);
    // bezier(200, 400, 220, 400, 250, 400, 400, 400);
    /*
  square(10, 10, longueur);

  square(310, 10, longueur);
  square(10, 310, longueur);
  square(310, 310, longueur);
  */
  quatreCarre(10, 10, 280);
}

void quatreCarre(int x, int y, int l){
  if (l < 2){
    return;
  }
  square(x, y, l);
  quatreCarre(10, 10, l/2);
  square(x*3 + l, y, l);
  square(y, y*3 + l, l);
  square(x*3+l, x*3+l, l);
}
