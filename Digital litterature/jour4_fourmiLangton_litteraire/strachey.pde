String mot = "";
String typeMot = "";
String derniereCouleur = "";
ArrayList<String> phraseLesMots = new ArrayList<String>();;
ArrayList<String> phraseLesTypes = new ArrayList<String>();;

/**
PRINCIPE :
  Si on veut rajouter un TYPE DE MOT à la phrase, on regarde d'abord si...
*/
boolean reglesDAjout(String typeMot){
  if (typeMot == "adjectif"){
    // si c'est le premier mot
    if (phraseLesTypes.size() == 0){
      return true;
    }
    
    // s'il est précédé par un verbe
    else if (phraseLesTypes.get(phraseLesTypes.size() - 1) == "verbe"){
      return true;
    }
    
    // Aucune condition de valide, on ne peut pas ajouter d'ADJECTIF.
    return false;
  }
  
  else if (typeMot == "nom"){
    // si c'est le premier mot
    if (phraseLesTypes.size() == 0){
      return true;
    }
    
    // s'il est précédé par un verbe
    else if (phraseLesTypes.get(phraseLesTypes.size() - 1) == "verbe"){
      return true;
    }
    
    // s'il est précédé par un adjectif
    else if (phraseLesTypes.get(phraseLesTypes.size() - 1) == "adjectif"){
      return true;
    }
    
    // Aucune condition de valide, on ne peut pas ajouter de NOM.
    return false;
  }
  
  
  else if (typeMot == "adverbe"){
    // s'il est précédé par un nom
    if (phraseLesTypes.get(phraseLesTypes.size() - 1) == "nom"){
      return true;
    }
    
    // Aucune condition de valide, on ne peut pas ajouter de ADVERBE.
    return false;
  }
  
  else if (typeMot == "verbe"){
    // s'il est précédé par un nom
    if (phraseLesTypes.get(phraseLesTypes.size() - 1) == "nom"){
      return true;
    }
    
    // s'il est précédé par un adverbe
    else if (phraseLesTypes.get(phraseLesTypes.size() - 1) == "adverbe"){
      return true;
    }
    
    // Aucune condition de valide, on ne peut pas ajouter de ADVERBE.
    return false;
  }
  
  return true;
  
}


void strachey(String couleur){
  
  if (derniereCouleur != couleur){
    print(mot, "  ");
    if (mot != ""){
      phraseLesMots.add(mot);
      phraseLesTypes.add(typeMot);
    }
    mot = "";
  }
  
  
  if (couleur=="rouge"){
    if (derniereCouleur==couleur && mot!=""){
      // si on avait déjà sélectionné un adjectif mais que l'on doit en reprendre un de suite
      // vu que l'adjectif est optionnel (sa présence est aléatoire)
      // on dit qu'on ne le retient pas finalement, on vire l'adjectif
      mot = "";
    }
    else {
      if (reglesDAjout("adjectif")){
        mot = choice2D(adjectives)[0];
        typeMot = "adjectif";
      }
    }
  }
  else if(couleur=="blanc") {
    if (reglesDAjout("verbe")){
     mot = choice(verbs);
     typeMot="verbe";
    }
  }
  else if (couleur=="bleu"){
    if (reglesDAjout("nom")){
     mot = choice2D(nouns)[0];
     typeMot="nom";
    }
  }
  else if (couleur=="noir"){
    if (derniereCouleur==couleur && mot!=""){
      // même explication
      mot = "";
    }
    else {
      if (reglesDAjout("adverbe")){
         mot = choice(adverbs);
         typeMot="adverbe";
      }
    }
  }
  
  derniereCouleur = couleur;
}
