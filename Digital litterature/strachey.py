#!/usr/bin/python
# -*- coding: utf-8 -*-

# Love Letters
# copyright (c) 2014, 2024 Nick Montfort <nickm@nickm.com>
# based on a program by Christopher Strachey, 1953
# intended to work in Python 2 (>= 2.5) as well as 3, however:
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved. This file is offered as-is,
# without any warranty.
#
# Updated 10 March 2015 to correct the word lists. Sources are photographs
# of Christoper Stachey’s notes in the Bodleian Library from J.R. Carpenter
# and table 14.1 in Noah Wardrip-Fruin’s article “Digital Media Archaeology.”
# Updated 31 May 2018 for compatibility with Python 2 (2.5+) and 3.
# Updated 1 January 2024 for Memory Slam 2.0.

from sys import argv
from random import choice
import textwrap
from time import sleep

first = ['Bonjour,', 'Bonsoir,']
second = ['']
adjectives = [
    ['motivé', 'motivée'],
    ['passionné', 'passionnée'],
    ['cruel', 'cruelle'],
    ['sérieux', 'sérieuse'],
    ['pervers', 'pervers'],
    ['adaptable', 'adaptable'],
    ['confiant', 'confiante'],
    ['enthousiaste', 'enthousiaste'],
    ['pédagogue', 'pédagogue'],
    ['sociable', 'sociable'],
    ['haineux', 'haineuse'],
    ['disponible', 'disponible'],
    ['intéressé', 'intéressée'],
    ['impliqué', 'impliquée'],
    ['professionnel', 'professionnelle'],
    ['compétent', 'compétente'],
    ['expérimenté', 'expérimentée'],
    ['coquin', 'coquine'],
    ['technique', 'technique'],
    ['académique', 'académique'],
    ['affreux', 'affreuse'],
    ['raté', 'ratée'],
    ['pertinent', 'pertinente'],
    ['féroce', 'féroce'],
    ['concret', 'concrète'],
    ['généré par ChatGPT', 'généré par ChatGPT'],

]

adverbs = [
    'actuellement',
    'récemment',
    'déjà',
    'toujours',
    'bientôt',
    'rapidement',
    'quotidiennement',
    'pleinement',
    'particulièrement',
    'vivement',
    'fortement',
    'sincèrement',
    'cordialement',
    'naturellement',
    'activement',
    'concrètement',
    'jamais',
    'directement',
    'davantage',
    'efficacement',
    'professionnellement',
    'rigoureusement',
    'précisément',
    'également',
    'notamment',
    'ainsi',
    'clairement'
]

nouns = [
    ['candidature', 1], ['lettre', 1], ['motivation', 1], ['cv', 0],
    ['objet', 0], ['offre', 0], ['poste', 0], ['emploi', 0],
    ['job', 0], ['stage', 0], ['contrat', 0], ['violence', 1],
    ['harcèlement', 0], ['coordonnée', 1], ['téléphone', 0], ['mail', 0],
    ['adresse', 0], ['signature', 1], ['truc', 0], ['expression', 0],
    ['attention', 0], ['disposition', 1], ['entreprise', 0], ['société', 1],
    ['secteur', 0], ['domaine', 0], ['enfer', 0], ['équipe', 0],
    ['service', 0], ['direction', 1], ['recruteur', 0], ['tuteur', 0],
    ['collaboration', 1], ['vie', 1], ['compétence', 1], ['expertise', 0],
    ['tâche', 1], ['objectif', 0], ['résultat', 0], ['succès', 0],
    ['défi', 0], ['challenge', 0], ['nullité', 1], ['valeur', 1],
    ['impact', 0], ['conception', 1], ['design', 0], ['art', 0],
    ['chiantisme', 0], ['intérêt', 0], ['passion', 1], ['curiosité', 1],
    ['dynamisme', 0], ['professionnalisme', 0]
]

verbs = [
    'adresse', 'contacte', 'rencontre', 'haït', 'échange',
    'exprime', 'explique', 'remercie', 'prie', 'agrée',
    'sollicite', 'propose', 'assure', 'confirme', 'travaille',
    'effectue', 'réalise', 'mène', 'gère', 'organise',
    'met en place', 'applique', 'déteste', 'utilise', 'maîtrise',
    'souhaite', 'veut', 'désire', 'espère', 'aime',
    'admire', 'intéresse', 'motive', 'crève', 'convainc'
]

def maybe(words):
    if choice([False, True]):
        return choice(words)
    return ''

def longer():
    nom_list1 = choice(nouns)

    possessif1 = " Mon " if nom_list1[1] == 0 else " Ma "

    adj_mot1 = maybe(adjectives)
    adj_mot1 = adj_mot1 if adj_mot1 == "" else " " + adj_mot1[nom_list1[1]]

    adv_mot1 = maybe(adverbs)
    adv_mot1 = adv_mot1 if adv_mot1 == "" else " " + adv_mot1

    nom_list2 = choice(nouns)

    possessif2 = " ton " if nom_list2[1] == 0 else " ta "

    adj_mot2 = maybe(adjectives)
    adj_mot2 = adj_mot2 if adj_mot2 == "" else " " + adj_mot2[nom_list2[1]]

    return (
        possessif1
        + nom_list1[0]
        + adj_mot1
        + ' '
        + choice(verbs)
        + possessif2
        + nom_list2[0]
        + adv_mot1
        + adj_mot2
        + '. '
    )

def shorter():
    nom_list = choice(nouns)
    adj_mot = choice(adjectives)[nom_list[1]] # on sélectionne l'adjectif au masculin/féminin en fonction du nom
    return [' ' + nom_list[0] + ' ' + adj_mot + '', nom_list[1]]

def body():
    text = ''
    you_are = False
    for i in range(0, 5):
        type = choice(['shorter', 'longer'])
        if type == 'longer':
            text = text + longer() + " "
            you_are = False
        else:
            if you_are:
                s = shorter()
                if s[1] == 0: # si le nom commun est masculin
                    text = text + ': mon' + s[0] + ". " # on utilise mon
                else :
                    text = text + ': ma' + s[0] + ". " # sinon ma
                you_are = False
            else:
                s = shorter()
                if s[1] == 0:
                    text = text + 'Votre offre est mon' + s[0]
                else :
                    text = text + 'Vous êtes ma' + s[0]
                you_are = True
    return text

def letter():
    text = choice(first) + ' ' + choice(second) + '\n\n' + \
           textwrap.fill(body(), 80) + '\n\n' + \
           '                            Votre candidat ' + choice(adjectives)[0] + '\n\n' + \
           '                                  M.U.C.' + '\n'
    return text.upper() if (len(argv) > 1 and argv[1] == '-c') else text

print('')
while True:
    print(letter())
    sleep(12.0)