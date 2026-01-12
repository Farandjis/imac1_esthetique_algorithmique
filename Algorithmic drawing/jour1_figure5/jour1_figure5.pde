float X = 800;
float Y = 450;
float A = X / 2;
float B = Y / 2;

void settings() {
  // J'ai utilisé Gemini pour cette fonction settings, car j'essayais d'utiliser size(X, Y) dans setup, et ça ne marchait pas.
  // son explication : Processing construit la fenêtre avant de lire tes variables, donc size() dans le setup() n'accepte que des chiffres fixes, pas de variables.
  size((int) X,(int) Y);
}


void setup(){
  
  // Dimensions de l'écran
  // 640 car c'est la haute résolution de l'Atari ST (beaucoup de pixels donc noir et blanc niveau couleur)
  background(255);
  monDessin();
}


void monDessin(){
  // s'exécute plusieurs fois (répétition de l'affichage)
  for (int i = 0; i < 1; i++){
    float R = Y*0.7;
    
    for (float W = 3.14/4; W <3.6; W+=0.05){
      X = R*cos(W);
      Y = R*sin(W);
      line (A+X, B-Y, A-Y, B-X);
      line (A-Y, B-Y, A-Y, B-X);
      line (A-X, B-X, A+X, B-Y);
      line (A-X, B+Y, A+Y, B+X);
      line (A+X, B+X, A+X, B-Y);
      R = R / 0.94;
    }
  }
}



/*
Cls
Graphmode 3
A=Xrsl%/2
B=Yrsl%/2
'
For I=1 To 11
  R=Yrsl%*0.7
  For W=Pi/4 To 3.6 Step 0.05
    X=R*Cos(W)
    Y=R*Sin(W)
    Line A+X,B-Y,A-Y,B-X
    Line A-Y,B-X,A-X,B+X
    Line A-X,B+Y,A+X,B-Y
    Line A-X,B+Y,A+Y,B+X
    Line A+X,B+X,A+X,B-Y
    R=R*0.94
  Next W
  ' et l'on revient
  R=R/0.94
  For W=3.6 To Pi/4 Step -0.05
    X=R*Cos(W)
    Y=R*Sin(W)
    Line A+X,B-Y,A-Y,B-X
    Line A-Y,B-X,A-X,B+X
    Line A-X,B+Y,A+X,B-Y
    Line A-X,B+Y,A+Y,B+X
    Line A+X,B+X,A+X,B-Y
    R=R/0.94
  Next W
Next I
'
Pause 100
*/
