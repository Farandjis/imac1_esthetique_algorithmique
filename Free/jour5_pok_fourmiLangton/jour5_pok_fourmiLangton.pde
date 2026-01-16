// --- VARIABLES DE LA FOURMI ---
int X = 300; 
int Y = 300; 
int longueur = 10;
float antX, antY;
float antAngle = PI; 

void settings() {
  size(X, Y);
}

void setup() {
  background(255);
  // Initialisation au centre
  antX = width / 2;
  antY = height / 2;

  // LANCEMENT DE LA DEUXIÈME FENÊTRE
  // On passe "this" pour que la 2ème fenêtre puisse accéder aux images du dossier data
  String[] args = {"Ma Fenêtre de Combat"};
  FenetreVide fv = new FenetreVide(this); 
  PApplet.runSketch(args, fv);
}

void draw() {
  regle(); 
}

// --- LOGIQUE DE LA FOURMI ---
void regle() {
  if (estUneCaseBlanche()) {
    dessinerUnCarre("rouge");
    tournerADroite();
  } else if (estUneCaseNoir()) {
    dessinerUnCarre("blanc");
    tournerAGauche();
  } else if (estUneCaseRouge()) {
    dessinerUnCarre("bleu");
    reculer();
  } else {
    dessinerUnCarre("noir");
    avancer();
  }
}

void tournerAGauche() {
  antAngle -= HALF_PI;
  antX += cos(antAngle) * longueur;
  antY += sin(antAngle) * longueur;
}

void tournerADroite() {
  antAngle += HALF_PI;
  antX += cos(antAngle) * longueur;
  antY += sin(antAngle) * longueur;
}

void reculer() {
  antX += cos(antAngle) * longueur;
  antY += sin(antAngle) * longueur;
}

void avancer() {
  antX -= cos(antAngle) * longueur;
  antY -= sin(antAngle) * longueur;
}

void dessinerUnCarre(String couleur) {
  if (couleur == "noir") fill(#000000);
  else if (couleur == "blanc") fill(#FFFFFF);
  else if (couleur == "rouge") fill(#FF0000);
  else if (couleur == "bleu") fill(#0000FF);
  square(antX, antY, longueur);
}

boolean estUneCaseBlanche() {
  int couleur = get((int) antX+5, (int) antY+5);
  return couleur == #FFFFFF || couleur == -1;
}

boolean estUneCaseNoir() {
  int couleur = get((int) antX+5, (int) antY+5);
  return couleur == #000000;
}

boolean estUneCaseRouge() {
  int couleur = get((int) antX+5, (int) antY+5);
  return couleur == #FF0000;
}
