int X = 640; // taille x fenêtre
int Y = 640; // taille y fenêtre
int DXY = 0; // position de départ XY
int l = 100; // longueur de référence
void settings() {
  // J'ai utilisé Gemini pour cette fonction settings, car j'essayais d'utiliser size(X, Y) dans setup, et ça ne marchait pas.
  // son explication : Processing construit la fenêtre avant de lire tes variables, donc size() dans le setup() n'accepte que des nombres fixes, pas de variables.
  size(X, Y);
}


void setup(){
  
  // couleur de fond : blanc
  background(255);
  //fill(255,0,0);
  translate(0,400); // on va un peu en bas histoire de laisser de la place pour le dessin des triangles 

  
  for (int i = 0; i < 4; i++){
  trapeze(); // on dessine un premier trapèze
  translate(l, 0); // on se place pour dessiner le trapèze suivant
  trapeze2();
  translate(-l/2, 0);
  trapeze3();
  translate(0,-l);
  trapeze5();
  translate(l/4,l/2);
  trapeze();
  translate(-l/4, l/2); // on revient à la position initiale (là où on était avant l'exécution de trapeze()
  translate(l,0); // on avance pour faire le triangle suivant dans la boucle (un peu plus loin)
  }
  
  translate(-l*6 - l/2, l/2); // on retourne à la position d'origine avant la boucle juste avant
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
  int r = (int) random(0, 255); // on choisit une valeur aléatoire entre 0 et 255
  fill(r,r,255); // on choisit une teinte de bleu
  
  // on dessine notre trapèze
  quad(DXY+l/4, DXY+l/2, // point en haut à gauche (x,y)
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
