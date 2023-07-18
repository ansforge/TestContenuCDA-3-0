<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_HistoriqueMedical.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-DICOM-Historique-medical(2.16.840.1.113883.10.20.22.2.39) qui décrit 
   la documentation d’une demande d'acte d’imagerie.
   
   ......................................................................................................................................................    
    Historique :
     17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_HistoriqueMedical">
    <title>CI-SIS Section Historique médical</title>
    
    <rule context='*[cda:templateId/@root="2.16.840.1.113883.10.20.22.2.39"]'>
        
        <!-- Vérifier le templateId de la section 'FFR-DICOM-Historique-medical' -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.22.2.39'] and cda:templateId[@root='1.2.250.1.213.1.1.2.213']">
            [S_DICOM_HistoriqueMedical] Erreur de conformité : La section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.213) doit obligatoirement avoir les templateIds : "2.16.840.1.113883.10.20.22.2.39" et "1.2.250.1.213.1.1.2.213". 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Historique-medical' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_HistoriqueMedical] Erreur de conformité : une section FR-DICOM-Historique-medical(2.16.840.1.113883.10.20.22.2.39) doit obligatoirement contenir un ou plusieurs élément id.
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Historique-medical' -->
        <assert test="cda:code[@code='11329-0' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_HistoriqueMedical] Erreur de conformité: la section FR-DICOM-Historique-medical(2.16.840.1.113883.10.20.22.2.39) doit obligatoirement avoir comme code : @code='11329-0' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Historique-medical' -->
        <assert test="cda:text">
            [S_DICOM_HistoriqueMedical] Erreur de conformité: la section FR-DICOM-Historique-medical(2.16.840.1.113883.10.20.22.2.39) doit obligatoirement contenir l'élément texte
        </assert>
        
        <!-- Vérifier l'existence de l'entrée 'FR-DICOM-Observation'[1..*]-->
        <assert test="count(.//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.150'])&gt;=1">
            [S_DICOM_HistoriqueMedical] Erreur de conformité: l'entrée 'FR-DICOM-Observation' (1.2.250.1.213.1.1.3.150) doit etre obligatoirement présente [1..*].
        </assert>
        
    </rule>
    
</pattern>