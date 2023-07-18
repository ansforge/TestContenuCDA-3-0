<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_DemandeExamen.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-DICOM-Demande-examen (1.2.250.1.213.1.1.2.211) qui décrit 
   les conclusions cliniques
   
   ......................................................................................................................................................    
    Historique :
    17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_DemandeExamen">
    <title>CI-SIS Section Demande d'examen </title>
    
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.7"]'>
        
        
        <!-- Vérifier le templateId de la section 'FR-DICOM-Demande-examen' -->
        <assert test="cda:templateId[@root='1.2.840.10008.9.7'] and cda:templateId[@root='1.2.250.1.213.1.1.2.211']">
            [S_DICOM_DemandeExamen] Erreur de conformité : La section FR-DICOM-Demande-examen (1.2.250.1.213.1.1.2.211) doit obligatoirement avoir un ou plusieurs identifiant [1..*]. 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Demande-examen' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_DemandeExamen] Erreur de conformité : une section FR-DICOM-Demande-examen (1.2.250.1.213.1.1.2.211) doit obligatoirement contenir l'élément title
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Demande-examen' -->
        <assert test="cda:code[@code='55115-0' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_DemandeExamen] Erreur de conformité : La section FR-DICOM-Demande-examen (1.2.250.1.213.1.1.2.211) doit obligatoirement avoir comme code : @code='55115-0' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Demande-examen' -->
        <assert test="cda:text">
            [S_DICOM_DemandeExamen] Erreur de conformité : une section FR-DICOM-Demande-examen (1.2.250.1.213.1.1.2.211) doit obligatoirement contenir l'élément texte
        </assert>
        
    </rule>
    
</pattern>