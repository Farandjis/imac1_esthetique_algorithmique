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
  if (l < 0.1){
    return;
  }
  square(x, y, l);
  quatreCarre(x, y, l/2 );
  
  square(x + l, y, l);
  quatreCarre(x+l, y, l/2 );
  
  square(y, y+ l, l);
    quatreCarre(x, y+l, l/2 );
    
  square(x+l, y+l, l);
    quatreCarre(x+l, y+l, l/2 );
}
