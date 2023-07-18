<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_Resultat.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-DICOM-Resultats (1.2.250.1.213.1.1.2.208)
   
   ......................................................................................................................................................    
    Historique :
    17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_Resultat">
    <title>CI-SIS Section Résultat</title>
    
    <rule context='*[cda:templateId/@root="2.16.840.1.113883.10.20.6.1.2"]'>
        
        <!-- Vérifier le templateId de la section 'FR-DICOM-Resultats' -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.6.1.2'] and cda:templateId[@root='1.2.250.1.213.1.1.2.208']">
            [S_DICOM_Resultat] Erreur de conformité : La section FR-DICOM-Resultats (1.2.250.1.213.1.1.2.208) doit obligatoirement avoir les templateIds : "2.16.840.1.113883.10.20.6.1.2" et "1.2.250.1.213.1.1.2.208". 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Resultats' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_Resultat] Erreur de conformité : une section FR-DICOM-Resultats (1.2.250.1.213.1.1.2.208) doit obligatoirement contenir un ou plusieurs élément id.
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Resultats' -->
        <assert test="cda:code[@code='59776-5' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_Resultat] Erreur de conformité : la section FR-DICOM-Resultats (1.2.250.1.213.1.1.2.208) doit obligatoirement avoir comme code : @code='59776-5' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Resultats' -->
        <assert test="cda:text">
            [S_DICOM_Resultat] Erreur de conformité : une section FR-DICOM-Resultats (1.2.250.1.213.1.1.2.208) doit obligatoirement contenir l'élément texte
        </assert>
        
        <!-- Vérifier le titre de la section 'FR-DICOM-Resultats' -->
        <assert test="cda:title">
            [S_DICOM_Resultat] Erreur de conformité :une section FR-DICOM-Resultats (1.2.250.1.213.1.1.2.208) doit obligatoirement contenir l'élément title
        </assert>
        
    </rule>
    
</pattern>