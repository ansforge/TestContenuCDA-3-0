<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................    
  E_TechniqueImagerie_IMG-CR-IMG.sh
   Schématron de vérification de la conformité au modèle du CI-SIS l'entrée FR-DICOM-Technique-imagerie(1.2.250.1.213.1.1.3.153) dans le document IMG-CR-IMG qui décrit 
   les techniques d'imagerie.
   
   IMG-CR-IMG : Compte rendu d'imagerie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    06/04/2021 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TechniqueImagerie_IMG-CR-IMG">
    
    
    <rule context="cda:procedure[cda:templateId/@root='1.2.250.1.213.1.1.3.153']"> 

        <!-- Vérifier le code de l'entrée 'FR-DICOM-Technique-imagerie' [1..1] -->
        <assert test=".//cda:code">
            [E_TechniqueImagerie_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : l'entrée FR-DICOM-Technique-imagerie (1.2.250.1.213.1.1.3.153) doit obligatoirement contenir l'élément code [1..1].
        </assert>
        
        <!-- Vérifier le code CCAM de l'acte dans l'entrée 'FR-DICOM-Technique-imagerie' [0..1] -->
        <assert test="count(.//cda:code/cda:translation)&lt;=1">
            [E_TechniqueImagerie_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : l'entrée FR-DICOM-Technique-imagerie (1.2.250.1.213.1.1.3.153) peut contenir au maximum un code CCAM de l'acte [0..1].
        </assert>
        
        <!-- Vérifier l'élement methodCode de l'entrée 'FR-DICOM-Technique-imagerie' [1..*] -->
        <assert test="count(.//cda:methodCode) &gt;=1">
            [E_TechniqueImagerie_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : l'entrée FR-DICOM-Technique-imagerie (1.2.250.1.213.1.1.3.153) doit obligatoirement contenir un ou plusieurs élément(s) methodCode [1..*] pour décrire les modalités d'acquisitions.
        </assert>
        
        <!-- Vérifier l'élement targetSiteCode de l'entrée 'FR-DICOM-Technique-imagerie' [1..*] -->
        <assert test="count(.//cda:targetSiteCode) &gt;=1">
            [E_TechniqueImagerie_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : l'entrée FR-DICOM-Technique-imagerie (1.2.250.1.213.1.1.3.153) doit obligatoirement contenir un ou plusieurs élément(s) targetSiteCode [1..*] pour décrire la localisation anatomique.
        </assert>
        
        <!-- Vérifier l'existence du modificateur topographique dans l'élément targetSiteCode de l'entrée 'FR-DICOM-Technique-imagerie' [0..*] -->
        <assert test="(.//cda:targetSiteCode/cda:qualifier and .//cda:targetSiteCode/cda:qualifier/cda:name/@code='106233006') or
            not(.//cda:targetSiteCode/cda:qualifier)">
            [E_TechniqueImagerie_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : Si l'élement targetSiteCode/qualifier existe dans l'entrée FR-DICOM-Technique-imagerie (1.2.250.1.213.1.1.3.153), il doit obligatoirement contenir un modificateur topographique ayant comme code name/@code='106233006' pour préciser la topographie.
        </assert>
    </rule>
        
</pattern>