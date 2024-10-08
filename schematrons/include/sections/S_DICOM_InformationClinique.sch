<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_InformationClinique.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section  FR-DICOM-informations-cliniques (1.2.250.1.213.1.1.2.205) qui décrit 
   les informations cliniques.
   ......................................................................................................................................................    
    Historique :
    17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_InformationClinique">
    <title>CI-SIS Section informations cliniques</title>
    
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.2"]'>
        
        <!-- Vérifier le templateId de la section 'FR-DICOM-informations-cliniques' -->
        <assert test="cda:templateId[@root='1.2.840.10008.9.2'] and cda:templateId[@root='1.2.250.1.213.1.1.2.205']">
            [S_DICOM_InformationClinique] Erreur de conformité : La section FR-DICOM-informations-cliniques (1.2.250.1.213.1.1.2.205) doit obligatoirement avoir les templateIds : "1.2.840.10008.9.2" et "1.2.250.1.213.1.1.2.205". 
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-informations-cliniques' -->
        <assert test="cda:code[@code='55752-0' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_InformationClinique] Erreur de conformité: La section FR-DICOM-informations-cliniques (1.2.250.1.213.1.1.2.205) doit obligatoirement avoir comme code : @code='55752-0' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        <!-- Vérifier le texte de la section 'FR-DICOM-informations-cliniques ' -->
        <assert test="cda:text">
            [S_DICOM_InformationClinique] Erreur de conformité: La section FR-DICOM-informations-cliniques (1.2.250.1.213.1.1.2.205) doit obligatoirement contenir l'élément texte
        </assert>
        
        <!-- présence de la sous-section FR-DICOM-Demande-examen(1.2.840.10008.9.7) --> 
        <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.840.10008.9.7'])=1"> 
            [S_DICOM_InformationClinique] Erreur de conformité: La section "FR-DICOM-Demande-examen" (1.2.840.10008.9.7) doit être présente dans la section FR-DICOM-informations-cliniques (1.2.250.1.213.1.1.2.205).
        </assert>
        
        <!-- présence de la sous-section FR-DICOM-Historique-medical(2.16.840.1.113883.10.20.22.2.39) --> 
        <assert test="count(cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.39'])=1"> 
            [S_DICOM_InformationClinique] Erreur de conformité: La section "FR-DICOM-Historique-medical" (2.16.840.1.113883.10.20.22.2.39) doit être présente dans la section FR-DICOM-informations-cliniques (1.2.250.1.213.1.1.2.205).
        </assert>
    </rule>
    
</pattern>