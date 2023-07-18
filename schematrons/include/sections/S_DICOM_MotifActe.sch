<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_MotifActe.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-DICOM-Motif-acte(1.2.250.1.213.1.1.2.212).
   
   ......................................................................................................................................................    
    Historique :
     17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_MotifActe">
    <title>CI-SIS Section Motif acte</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.212"]'>
        
        <!-- Vérifier le templateId de la section 'FFR-DICOM-Motif-acte' -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.2.212'] and cda:templateId[@root='2.16.840.1.113883.10.20.22.2.29']">
            [S_DICOM_MotifActe] Erreur de conformité : La section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.212) doit obligatoirement avoir les templateIds : "1.2.250.1.213.1.1.2.212" et "2.16.840.1.113883.10.20.22.2.29". 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Motif-acte' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_MotifActe] Erreur de conformité : une section FR-DICOM-Motif-acte(1.2.250.1.213.1.1.2.212) doit obligatoirement contenir un ou plusieurs élément id.
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Motif-acte' -->
        <assert test="cda:code[@code='59768-2' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_MotifActe] Erreur de conformité: la section FR-DICOM-Motif-acte(1.2.250.1.213.1.1.2.212) doit obligatoirement avoir comme code : @code='59768-2' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Motif-acte' -->
        <assert test="cda:text">
            [S_DICOM_MotifActe] Erreur de conformité: la section FR-DICOM-Motif-acte(1.2.250.1.213.1.1.2.212) doit obligatoirement contenir l'élément texte
        </assert>
        
    </rule>
    
</pattern>