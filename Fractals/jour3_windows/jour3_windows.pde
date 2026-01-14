int X = 610; // taille x fenêtre
int Y = 610; // taille y fenêtre
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
  quatreCarre(12.5, 12.5, 12.5, 280, 1);
}

void quatreCarre(float x, float y, float x1, float l, int i){
  if (l < 0.1){
    return;
  }
  square(x*1.5, y*1.5, l);
  quatreCarre(x + x1/2 , y + x1/2, x1/2, l/2 - x1, i++);
  
  square(x*1.5 + l + x1, y*1.5, l);
  // quatreCarre(x + l, y, l/2 );
  quatreCarre(x + 195 + x1/2 , y + x1/2, x1/2, l/2 - x1, i++);
 
  
  square(x*1.5, y*1.5+l + x1, l);
  quatreCarre(x + x1/2 , y + 195 + x1/2, x1/2, l/2 - x1, i++);
    
  square(x*1.5+l + x1, y*1.5+l + x1, l);
  quatreCarre(x + 195 + x1/2 , y + 195 + x1/2, x1/2, l/2 - x1, i++);
}
