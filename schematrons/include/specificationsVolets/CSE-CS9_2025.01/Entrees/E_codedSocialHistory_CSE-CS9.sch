<?xml version="1.0" encoding="UTF-8"?>

<!-- E_codedSocialHistory_CSE-CS9.sch 
    
    Vérification des entrées Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.4.13.4)
    de la section Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) du CSE-CS9.
    
    Historique :
    24/06/2011 : Création
    25/07/2011 : Compatbilité du schematron aux trois volets CS8, CS9, CS24
    06/03/2012 : Supression des références à SNOMED CT
    11/10/2017 : Suppression du teste sur la garde à temps complet et du type de garde
    21/11/2017 : Mise à jour des codes TA_CS ==> TA_ASIP
    15/05/2018 : MAJ par rapport aux modifications du volet
    23/02/2021 : Renommage et vérification des contrôles par rapport au volet
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_codedSocialHistory_CSE-CS9">
    <title>Vérification des entrées Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.4.13.4) du CSE-CS9</title>
    
    <!-- ****** Contexte : Section Habitus, Mode de vie ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'>
        
        <!-- Vérification de la présence de l'entrée 'Faites-vous actuellement garder votre enfant ?' --> 
        <assert test='.//cda:entry/cda:observation/cda:code[@code="11345-6"]/cda:qualifier/cda:value/@code="PAT-058"'> 
            [E_codedSocialHistory_CSE-CS9] Erreur de conformité : 
            L'entrée "Faites-vous actuellement garder votre enfant ?" de code PAT-058 est obligatoire.
        </assert>
        
        <!-- Vérification de la présence de la 'Date de naissance de la mère' --> 
        <assert test='.//cda:entry/cda:observation/cda:subject/cda:relatedSubject/cda:subject/cda:birthTime/@value'> 
            [E_codedSocialHistory_CSE-CS9] Erreur de conformité : 
            La date de naissance de la mère est obligatoire.
        </assert>
        
    </rule>
</pattern>


