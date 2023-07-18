<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_ExpositionsAuxRadiations.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la sous section FR-DICOM-Exposition-aux-radiations(1.2.250.1.213.1.1.2.215) qui décrit 
   l'exposition aux radiations du patient.
   
   ......................................................................................................................................................    
    Historique :
      17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_ExpositionsAuxRadiations">
    <title>CI-SIS Section FR-DICOM-Exposition-aux-radiations</title>
    
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.8"]'>
        
        <!-- Vérifier le templateId de la section 'FR-DICOM-Exposition-aux-radiations' -->
        <assert test="cda:templateId[@root='1.2.840.10008.9.8'] and cda:templateId[@root='1.2.250.1.213.1.1.2.215']">
            [S_DICOM_ExpositionsAuxRadiations] Erreur de conformité : La section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.215) doit obligatoirement avoir les templateIds : "1.2.840.10008.9.8" et "1.2.250.1.213.1.1.2.215". 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Exposition-aux-radiations' -->
        <assert test="cda:id">
            [S_DICOM_ExpositionsAuxRadiations] Erreur de conformité : la section FR-DICOM-Exposition-aux-radiations (1.2.250.1.213.1.1.2.215) doit obligatoirement contenir l'élément id
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Exposition-aux-radiations' -->
        <assert test="cda:code[@code='73569-6' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_ExpositionsAuxRadiations] Erreur de conformité : la section FR-DICOM-Exposition-aux-radiations (1.2.250.1.213.1.1.2.215) doit obligatoirement avoir comme code : @code='73569-6' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        
        <!-- Vérifier le titre de la section 'FR-DICOM-Exposition-aux-radiations' -->
        <assert test="cda:title">
            [S_DICOM_ExpositionsAuxRadiations] Erreur de conformité : la section FR-DICOM-Exposition-aux-radiations (1.2.250.1.213.1.1.2.215) doit obligatoirement contenir l'élément title.
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Exposition-aux-radiations' -->
        <assert test="cda:text">
            [S_DICOM_ExpositionsAuxRadiations] Erreur de conformité : la section FR-DICOM-Exposition-aux-radiations (1.2.250.1.213.1.1.2.215) doit obligatoirement contenir l'élément text
        </assert>
        
        <!-- Vérifier les contraintes au niveau de l'entrée FR-DICOM-Exposition-patient [0..1]-->
        <assert test="count(.//cda:procedure[cda:templateId/@root='1.2.250.1.213.1.1.3.165'])=1">
            [S_DICOM_ExpositionsAuxRadiations] Erreur de conformité : l'entrée FR-DICOM-Exposition-patient (1.2.250.1.213.1.1.3.165) doit obligatoirement être présente.
        </assert>
        
        <!-- Vérifier les contraintes au niveau de l'entrée FR-DICOM-Observation : grossesse [0..1]-->
        <assert test="count(.//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.150'])=1">
            [S_DICOM_ExpositionsAuxRadiations] Erreur de conformité : l'entrée FR-DICOM-Observation : grossesse (1.2.250.1.213.1.1.3.150) doit obligatoirement être présente.
        </assert>
        
    </rule>
    
</pattern>