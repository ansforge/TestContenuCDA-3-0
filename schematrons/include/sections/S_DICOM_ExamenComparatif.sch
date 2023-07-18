<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_ExamenComparatif.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-DICOM-Examen-comparatif(1.2.250.1.213.1.1.2.207) qui décrit 
   la documentation d’un acte d’imagerie antérieur à lequel les images actuelles ont été comparées.
   ......................................................................................................................................................    
    Historique :
    17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_ExamenComparatif">
    <title>CI-SIS IMG-CR-IMG Section Examen Comparatif</title>
    
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.4"]'>
        
        
        <!-- Vérifier le templateId de la section 'FR-DICOM-Examen-comparatif' -->
        <assert test="cda:templateId[@root='1.2.840.10008.9.4'] and cda:templateId[@root='1.2.250.1.213.1.1.2.207']">
            [S_DICOM_ExamenComparatif] Erreur de conformité : La section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.207) doit obligatoirement avoir les templateIds : "1.2.840.10008.9.4" et "1.2.250.1.213.1.1.2.207". 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Examen-comparatif' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_ExamenComparatif] Erreur de conformité : une section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.207) doit obligatoirement contenir l'élément title
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Examen-comparatif' -->
        <assert test="cda:code[@code='18834-2' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_ExamenComparatif] Erreur de conformité: Si elle existe, la section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.207) doit obligatoirement avoir comme code : @code='18834-2' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        
        <!-- Vérifier le titre de la section 'FR-DICOM-Examen-comparatif' -->
        <assert test="cda:title">
            [S_DICOM_ExamenComparatif] Erreur de conformité : une section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.207) doit obligatoirement contenir l'élément title
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Examen-comparatif' -->
        <assert test="cda:text">
            [S_DICOM_ExamenComparatif] Erreur de conformité: Si elle existe, une section FR-DICOM-Examen-comparatif (1.2.250.1.213.1.1.2.207) doit obligatoirement contenir l'élément texte
        </assert>
        
    </rule>
    
</pattern>