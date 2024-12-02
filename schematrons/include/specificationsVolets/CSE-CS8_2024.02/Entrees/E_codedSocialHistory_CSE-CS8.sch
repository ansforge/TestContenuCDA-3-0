<?xml version="1.0" encoding="UTF-8"?>

<!-- E_codedSocialHistory_CSE-CS8.sch 
    
    Vérification des entrées Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.4.13.4)
    de la section Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.3.16.1) du CSE-CS8.
    
    Historique :
    24/06/2011 : Création
    25/07/2011 : Compatbilité du schematron aux trois volets CS8, CS9, CS24
    06/03/2012 : Suppression des références à SNOMED CT
    11/10/2017 : Suppression du teste sur la garde à temps complet et du type de garde
    21/11/2017 : Mise à jour des codes TA_CS ==> TA_ASIP
    15/05/2018 : MAJ par rapport aux modifications du volet
    23/02/2021 : Renommage et vérification des contrôles par rapport au volet
    12/04/2022 : modifier les codes provenant du JDV 
    04/12/2023 : nouvelle version CSE-CS8_2024
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_codedSocialHistory_CSE-CS8">
    <title>Vérification des entrées Habitus, Mode de vie (1.3.6.1.4.1.19376.1.5.3.1.4.13.4) du CSE-CS8</title>
    
    <!-- ****** Contexte : Section Habitus, Mode de vie ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'>               
        
        <!-- Vérification de la présence de l'entrée 'Consommation d'alcool' (mère) -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="MTH"]/cda:code/@code="74013-4"'>             
            [E_codedSocialHistory_CSE-CS8] Erreur de Conformité : L'entrée "Consommation d'alcool" de code 74013-4 est obligatoire pour la mère.
        </assert>
        
        <!-- Vérification de la présence de l'entrée 'Consommation de tabac et exposition durant la grossesse' (mère) -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="MTH"]/cda:code/@code="74011-8"'>             
            [E_codedSocialHistory_CSE-CS8] Erreur de conformité : L'entrée "Consommation de tabac et exposition durant la grossesse" de code 74011-8 est obligatoire pour la mère.
        </assert>
        
        <!-- Vérification de la présence de l'entrée 'Addiction autres substances' (mère) -->
        <assert test='.//cda:entry/cda:observation[cda:subject/cda:relatedSubject/cda:code/@code="MTH"]/cda:code[@code="11345-6"]/cda:qualifier/cda:value/@code="GEN-092.01.04"'>             
            [E_codedSocialHistory_CSE-CS8] Erreur de conformité : L'entrée "Addiction autres substances" de code GEN-092.01.04 est obligatoire pour la mère.
        </assert>
        
        <!-- Vérification de la présence de l'entrée 'Nombre d'enfants vivant au foyer' (mère) -->
        <assert test='.//cda:entry/cda:observation/cda:code[@code="11345-6"]/cda:qualifier/cda:value/@code="85722-7"'>             
            [E_codedSocialHistory_CSE-CS8] Erreur de conformité : L'entrée "Nombre d'enfants vivant au foyer" de code 85722-7 est obligatoire.
        </assert>
        
        <!-- Vérification de la présence de l'entrée 'Type d'alimentation' -->
        <assert test='.//cda:entry/cda:observation/cda:code[@code="11345-6"]/cda:qualifier/cda:value/@code="67704-7"'>             
            [E_codedSocialHistory_CSE-CS8] Erreur de conformité : L'entrée "Type d'alimentation" de code 67704-7 est obligatoire.
        </assert>     
        
        <!-- Vérification de la présence de l'entrée 'Facteurs de risque familiaux de tuberculose' -->
        <assert test='.//cda:code[@code ="11345-6"]/cda:qualifier/cda:value/@code="MED-183"'>
            [E_codedSocialHistory-CSE-CS8] Erreur de conformité : La donnée "Facteurs de risque familiaux de tuberculose" de code MED-183 est obligatoire.
        </assert>
        
    </rule>
</pattern>


