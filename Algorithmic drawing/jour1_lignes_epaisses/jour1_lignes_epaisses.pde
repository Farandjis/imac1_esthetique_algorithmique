int X = 800; // taille x fenêtre
int Y = 450; // taille y fenêtre
int D = 1; // épaisseur qui séparent les lignes (influent sur le nombre de rectangle affichés)
int N = 0; // positionnement je dirais, plus c'est grand, plus c'est décalé à en bas à droite

void settings() {
  // J'ai utilisé Gemini pour cette fonction settings, car j'essayais d'utiliser size(X, Y) dans setup, et ça ne marchait pas.
  // son explication : Processing construit la fenêtre avant de lire tes variables, donc size() dans le setup() n'accepte que des chiffres fixes, pas de variables.
  size(X, Y);
}


void setup(){
  
  // couleur de fond : blanc
  background(255);
}


void draw(){
  // s'exécute plusieurs fois (répétition de l'affichage)
  D += 1;
  N = N+D+1;
  X=X-D-10;
  Y=Y-D-10;
  if (N < Y){
    int red = (int) random(0, 255);
    int blue = (int) random(0, 255);
    int green = (int) random(0, 255);
    color c = color(red, blue, green); // on créer une couleur
    stroke(c); // on dit qu'on va utiliser la couleur c lorsque l'on va tracer nos lignes
    strokeWeight(D);
    line (N, N, N, Y);
    line (N, Y, X, Y);
    line (X, Y, X, N);
    line (X, N, N, N);
    delay(100); // on attend 100ms
  }
}
