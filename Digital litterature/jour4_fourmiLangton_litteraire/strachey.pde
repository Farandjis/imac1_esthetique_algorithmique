String mot = "";
String typeMot = "";
String derniereCouleur = "";

// pour rappeler sur l'organisation des cases : 
// nom -> (adj) -> verbe -> nom -> (adv) -> (adj)
String[] phraseLongueLesMots = {"", "", "", "", "", ""};
String[]  phraseLongueLesTypes = {"", "", "", "", "", ""};
boolean phraseLongueEstVide = true;

/**
PRINCIPE :
  Si on veut rajouter un TYPE DE MOT à la phrase, on regarde d'abord si...
  
RENVOI :
  -1 : si pas possible
  int : l'id de la case de où on pourrait le mettre
*/
int reglesDAjout(String typeMot){
  
  if (typeMot == "adjectif"){
    // la première condition pour ajouter un adjectif c'est est ce qu'on a déjà un premier nom
    // dans notre phrase
    if (phraseLongueLesTypes[0] != ""){
      // si la première case d'adj est libre
      if (phraseLongueLesTypes[1] == ""){
        return 1;
      }
      
      // sinon, si la 2e case d'aj est libre et qu'il y a le 2e nom juste avant
      else if (phraseLongueLesTypes[3] != "" && phraseLongueLesTypes[5] == ""){
        return 5;
      }
      
      //
    // Aucune condition de valide, on ne peut pas ajouter d'ADJECTIF.
    }
    return -1;
  }
  
  else if (typeMot == "nom"){
    // si c'est le premier mot
    if (phraseLongueLesTypes[0] == ""){
      return 0;
    }
    
    // sinon si c'est le deuxième et que nous avons un verbe juste avant.
    else if (phraseLongueLesTypes[2] != "" && phraseLongueLesTypes[3] == ""){
      return 3;
    }
    
    // sinon, on regarde si c'est parce que les deux cases noms sont déjà prise
    else if (phraseLongueLesTypes[0] != "" && phraseLongueLesTypes[3] != ""){
       phraseTerminer(); // on estime qu'elle est terminé
       return 0; // et que ce sera le premier nom de notre nouvelle phrase
    }

    // Aucune condition de valide, on ne peut pas ajouter de NOM.
    return -1;
  }
  
  
  else if (typeMot == "adverbe"){
    // si c'est précédé par le deuxième nom et qu'il n'y a pas d'adv
    if (phraseLongueLesTypes[3] != "" && phraseLongueLesTypes[4] == ""){
      return 4;
    }
    
    // Aucune condition de valide, on ne peut pas ajouter de ADVERBE.
    return -1;
  }
  
  else if (typeMot == "verbe"){

    // si c'est précédé par le premier nom et qu'il n'y a pas de verbe
    if (phraseLongueLesTypes[0] != "" && phraseLongueLesTypes[2] == ""){
      return 2;
    }
    
    // Aucune condition de valide, on ne peut pas ajouter de ADVERBE.
    return -1;
  }
  
  return -1;
  
}

/**
  PRINCIPE :
    Si nous avons déjà deux noms dans notre phrase, et que cette fonction est appelé,
    nous considérons que la phrase est terminé.
    
    Cette fonction doit être appelé juste avant l'ajout d'un nom car si nous avons déjà deux noms,
    alors ce nouveau nom est pour la nouvelle phrase.
*/
void phraseTerminer(){
  
  
  if (phraseLongueLesTypes[0] != "" && phraseLongueLesTypes[3] != ""){
    phraseLongue(phraseLongueLesMots);
    phraseLongueLesMots = new String[]{"", "", "", "", "", ""}; 
    phraseLongueLesTypes = new String[]{"", "", "", "", "", ""}; 
  }
  
}

void phraseLongue(String[] phrase){
  ArrayList<String> phraseFinale = new ArrayList<String>();
  
  int idDuNom1 = nouns.indexOf(phrase[0]); // on récupère l'id du nom 1
  
  String possessif1 = (nounsType.get(idDuNom1) == 0) ? " Mon " : " Ma ";
  phraseFinale.add(possessif1);                                                                                               // POSSESSIF 1
  
  phraseFinale.add(phrase[0]);                                                                                                // NOM 1
  
  int idDuAdj1 = adjectives_m.indexOf(phrase[1]);
  // s'il y a un adjectif à cet emplacement
  if (idDuAdj1 != -1){
    // explication pas à pas
    //  idDuNom1 est l'id du nom dans notre tableau des noms
    // nounsType.get(idDuNom1)) on récupère un 0 ou 1, 0 si le nom est masculin, 1 sinon
    //      -> remarque, ce n'est pas vraiment le cas, c'est plutôt adapté à si ça va avec "mon" (0) ou "ma" (1)
    // nounsType.get(idDuNom1))==0 ? adjectives.get(idDuAdj1)[0]  ---> si c'est masculin, on prend l'adjectif au masculin
    // : adjectives.get(idDuAdj1)[1]  ---> sinon au féminin
    // on ajoute l'adjectif à notre phrase
    phraseFinale.add( (nounsType.get(idDuNom1))==0 ? adjectives_m.get(idDuAdj1) : adjectives_f.get(idDuAdj1));                // ADJECTIF 1
  }
  
  
  phraseFinale.add(phrase[2]);                                                                                                // VERBE
  
  int idDuNom2 = nouns.indexOf(phrase[3]);
  String possessif2 = (nounsType.get(idDuNom2) == 0) ? " ton " : " ta ";
  phraseFinale.add(possessif2);                                                                                               // POSSESSIF 2
  
  
  phraseFinale.add(phrase[3]);                                                                                                // NOM 2
  

  // s'il y a un adverbe à cet emplacement
  if (phrase[4] != ""){
    phraseFinale.add(phrase[4]);                                                                                              // ADVERBE
  }
  
  int idDuAdj2 = adjectives_m.indexOf(phrase[5]);
  // s'il y a un adjectif à cet emplacement
  if (idDuAdj2 != -1){
    phraseFinale.add( (nounsType.get(idDuNom2))==0 ? adjectives_m.get(idDuAdj2) : adjectives_f.get(idDuAdj2));                // ADJECTIF 2
  }
  
  
  
  
  // print(phraseFinale);
  println(join(phraseFinale.toArray(new String[0]), " "));
  
  
  /*
  String phraseAPrint = debutPhrase[nounsType.get(idDuNom)];
  for (int i = 0; i < phrase.size(); i++){
    phraseAPrint += " " + phrase.get(i);
  }
  */
  
  // print(phraseAPrint, "\n");
}



void strachey(String couleur){
  if (derniereCouleur != couleur){
    // print(mot, "  ");
    if (mot != ""){
 
      int idDuMotAAjouter = reglesDAjout(typeMot);
      if (idDuMotAAjouter != -1){
        phraseLongueLesMots[idDuMotAAjouter] = mot;
        phraseLongueLesTypes[idDuMotAAjouter] = typeMot;
      }
      else {
         print("IL Y A UN PROBLEME : le mot a ajouté ne peut pas être ajouter...");
      }
      
      // effacer la console
      // print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
      // println(join(phraseLongueLesMots, ", "));
      // println(join(phraseLongueLesTypes, ", "));
      // print("\n", lesPhrases, "\n");
      // print(phraseLongueLesMots[0], "\n");
      // print(phraseLongueLesTypes[0], "\n");
    }
    mot = "";
    typeMot = "";
  }
  
  
  if (couleur=="rouge"){
    if (derniereCouleur==couleur && mot!=""){
      // si on avait déjà sélectionné un adjectif mais que l'on doit en reprendre un de suite
      // vu que l'adjectif est optionnel (sa présence est aléatoire)
      // on dit qu'on ne le retient pas finalement, on vire l'adjectif
      mot = "";
    }
    else {
      if (reglesDAjout("adjectif") != -1){
        mot = choice(adjectives_m); // on ne vas travailler qu'avec des adj masculin dans un premier temps
        typeMot = "adjectif";
      }
    }
  }
  else if(couleur=="blanc") {
    if (reglesDAjout("verbe") != -1){
     mot = choice(verbs);
     typeMot="verbe";
    }
  }
  else if (couleur=="bleu"){
    if (reglesDAjout("nom") != -1){
     mot = choice(nouns);
     typeMot="nom";
    }
  }
  else if (couleur=="noir"){
    if (derniereCouleur==couleur && mot!=""){
      // même explication
      mot = "";
    }
    else {
      if (reglesDAjout("adverbe") != -1){
         mot = choice(adverbs);
         typeMot="adverbe";
      }
    }
  }
  
  derniereCouleur = couleur;
}
