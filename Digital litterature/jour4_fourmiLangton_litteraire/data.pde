import java.util.Arrays;

// Listes simples
String[] first = {"Bonjour,", "Bonsoir,"};
String[] second = {""};
String[] debutPhrase = {"Votre offre est mon", "Vous êtes ma"};

// Listes d'adjectifs (Tableau 2D : [index][genre])
  // Liste des adjectifs masculins
  ArrayList<String> adjectives_m = new ArrayList<String>(Arrays.asList(
    "motivé", "passionné", "cruel", "sérieux", "pervers",
    "adaptable", "confiant", "enthousiaste", "pédagogue", "sociable",
    "haineux", "disponible", "intéressé", "impliqué", "professionnel",
    "compétent", "expérimenté", "coquin", "technique", "académique",
    "affreux", "raté", "pertinent", "féroce", "concret", "généré par ChatGPT"
  ));
  
  // Liste des adjectifs féminins
  ArrayList<String> adjectives_f = new ArrayList<String>(Arrays.asList(
    "motivée", "passionnée", "cruelle", "sérieuse", "perverse",
    "adaptable", "confiante", "enthousiaste", "pédagogue", "sociable",
    "haineuse", "disponible", "intéressée", "impliquée", "professionnelle",
    "compétente", "expérimentée", "coquine", "technique", "académique",
    "affreuse", "ratée", "pertinente", "féroce", "concrète", "générée par ChatGPT"
  ));

// Adverbes
ArrayList<String> adverbs = new ArrayList<>(Arrays.asList(
    "actuellement", "récemment", "déjà", "toujours", "bientôt",
    "rapidement", "quotidiennement", "pleinement", "particulièrement",
    "vivement", "fortement", "sincèrement", "cordialement",
    "naturellement", "activement", "concrètement", "jamais",
    "directement", "davantage", "efficacement", "professionnellement",
    "rigoureusement", "précisément", "également", "notamment",
    "ainsi", "clairement"
));

// Noms avec genre (Tableau d'objets ou structure mixte)
// Note : En Java, on utilise souvent une classe pour ça, 



ArrayList<String> nouns = new ArrayList<>(Arrays.asList(
    "candidature", "lettre", "motivation", "cv", "objet", "offre", "poste",
    "emploi", "job", "stage", "contrat", "violence", "harcèlement",
    "coordonnée", "téléphone", "mail", "adresse", "signature", "nul",
    "expression", "attention", "disposition", "entreprise", "société",
    "secteur", "domaine", "moche", "équipe", "service", "direction",
    "recruteur", "tuteur", "collaboration", "vie", "compétence",
    "expertise", "tâche", "objectif", "résultat", "succès", "défi",
    "challenge", "nullité", "valeur", "impact", "conception", "design",
    "art", "chiantisme", "intérêt", "passion", "curiosité", "dynamisme",
    "professionnalisme"
));

ArrayList<Integer> nounsType = new ArrayList<>(Arrays.asList(
    1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0,
    0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0,
    0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0
));



// Verbes
ArrayList<String> verbs = new ArrayList<>(Arrays.asList(
    "adresse", "contacte", "rencontre", "haït", "échange",
    "exprime", "explique", "remercie", "prie", "agrée",
    "sollicite", "propose", "assure", "confirme", "travaille",
    "effectue", "réalise", "mène", "gère", "organise",
    "mett en place", "applique", "déteste", "utilise", "maîtrise",
    "souhaite", "veut", "désire", "espère", "aime",
    "admire", "intèresse", "motive", "crève", "convainc"
));




// retranscription de la fonction choice Python mais en java, ici pour un tableau de données
String choice(ArrayList<String> liste) {
  int index = int(antX+antY)%liste.size();
  return liste.get(index);
}

// retranscription de la fonction choice Python mais en java, ici pour un tableau de tableaux
String[] choice2D(ArrayList<String[]> liste) {
  int index = int(antX+antY)%liste.size();
  return liste.get(index);
}
