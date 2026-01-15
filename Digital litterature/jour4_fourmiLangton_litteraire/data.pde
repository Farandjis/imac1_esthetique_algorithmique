// Listes simples
String[] first = {"Bonjour,", "Bonsoir,"};
String[] second = {""};

// Listes d'adjectifs (Tableau 2D : [index][genre])
String[][] adjectives = {
    {"motivé", "motivée"},
    {"passionné", "passionnée"},
    {"cruel", "cruelle"},
    {"sérieux", "sérieuse"},
    {"pervers", "pervers"},
    {"adaptable", "adaptable"},
    {"confiant", "confiante"},
    {"enthousiaste", "enthousiaste"},
    {"pédagogue", "pédagogue"},
    {"sociable", "sociable"},
    {"haineux", "haineuse"},
    {"disponible", "disponible"},
    {"intéressé", "intéressée"},
    {"impliqué", "impliquée"},
    {"professionnel", "professionnelle"},
    {"compétent", "compétente"},
    {"expérimenté", "expérimentée"},
    {"coquin", "coquine"},
    {"technique", "technique"},
    {"académique", "académique"},
    {"affreux", "affreuse"},
    {"raté", "ratée"},
    {"pertinent", "pertinente"},
    {"féroce", "féroce"},
    {"concret", "concrète"},
    {"généré par ChatGPT", "généré par ChatGPT"}
};

// Adverbes
String[] adverbs = {
    "actuellement", "récemment", "déjà", "toujours", "bientôt",
    "rapidement", "quotidiennement", "pleinement", "particulièrement",
    "vivement", "fortement", "sincèrement", "cordialement",
    "naturellement", "activement", "concrètement", "jamais",
    "directement", "davantage", "efficacement", "professionnellement",
    "rigoureusement", "précisément", "également", "notamment",
    "ainsi", "clairement"
};

// Noms avec genre (Tableau d'objets ou structure mixte)
// Note : En Java, on utilise souvent une classe pour ça, 
// mais ici je garde un format simple proche du tien.
Object[][] nouns = {
    {"candidature", 1}, {"lettre", 1}, {"motivation", 1}, {"cv", 0},
    {"objet", 0}, {"offre", 1}, {"poste", 0}, {"emploi", 0},
    {"job", 0}, {"stage", 0}, {"contrat", 0}, {"violence", 1},
    {"harcèlement", 0}, {"coordonnée", 1}, {"téléphone", 0}, {"mail", 0},
    {"adresse", 0}, {"signature", 1}, {"nul", 0}, {"expression", 0},
    {"attention", 0}, {"disposition", 1}, {"entreprise", 0}, {"société", 1},
    {"secteur", 0}, {"domaine", 0}, {"moche", 0}, {"équipe", 0},
    {"service", 0}, {"direction", 1}, {"recruteur", 0}, {"tuteur", 0},
    {"collaboration", 1}, {"vie", 1}, {"compétence", 1}, {"expertise", 0},
    {"tâche", 1}, {"objectif", 0}, {"résultat", 0}, {"succès", 0},
    {"défi", 0}, {"challenge", 0}, {"nullité", 1}, {"valeur", 1},
    {"impact", 0}, {"conception", 1}, {"design", 0}, {"art", 0},
    {"chiantisme", 0}, {"intérêt", 0}, {"passion", 1}, {"curiosité", 1},
    {"dynamisme", 0}, {"professionnalisme", 0}
};

// Verbes
String[] verbs = {
    "adresser", "contacter", "rencontrer", "hair", "échanger",
    "exprimer", "expliquer", "remercier", "prier", "agréer",
    "solliciter", "proposer", "assurer", "confirmer", "travailler",
    "effectuer", "réaliser", "mener", "gérer", "organiser",
    "mettre en place", "appliquer", "détester", "utiliser", "maîtriser",
    "souhaiter", "vouloir", "désirer", "espérer", "aimer",
    "admirer", "intéresser", "motiver", "crever", "convaincre"
};

void setup() {
  // Exemple pour accéder à une donnée (ex: nom de la 1ère entrée)
  String nomExemple = (String) nouns[0][0];
  int genreExemple = (int) nouns[0][1];
  
  println("Nom : " + nomExemple + " | Genre : " + genreExemple);
  noLoop();
}
