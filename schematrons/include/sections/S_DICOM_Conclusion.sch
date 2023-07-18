<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DICOM_Conclusion.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-DICOM-Conclusion (1.2.250.1.213.1.1.2.209) qui décrit 
   les conclusions cliniques
   
   ......................................................................................................................................................    
    Historique :
    17/07/2023 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_Conclusion">
    <title>CI-SIS Section Conclusion </title>
    
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.5"]'>
        
       
        <!-- Vérifier le templateId de la section 'FR-DICOM-Conclusion' -->
        <assert test="cda:templateId[@root='1.2.840.10008.9.5'] and cda:templateId[@root='1.2.250.1.213.1.1.2.209']">
            [S_DICOM_Conclusion] Erreur de conformité : La section FR-DICOM-Conclusion (1.2.250.1.213.1.1.2.209) doit obligatoirement avoir les templateIds : "1.2.840.10008.9.5" et "1.2.250.1.213.1.1.2.209". 
        </assert>
        
        <!-- Vérifier l'identifiant de la section 'FR-DICOM-Conclusion' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_Conclusion] Erreur de conformité : une section FR-DICOM-Conclusion (1.2.250.1.213.1.1.2.209) doit obligatoirement avoir un ou plusieurs identifiant [1..*]. 
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Conclusion' -->
        <assert test="cda:code[@code='19005-8' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_Conclusion] Erreur de conformité : La section FR-DICOM-Conclusion (1.2.250.1.213.1.1.2.209) doit obligatoirement avoir comme code : @code='19005-8' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
               
        <!-- Vérifier le titre de la section 'FR-DICOM-Conclusion' -->
        <assert test="cda:title">
            [S_DICOM_Conclusion] Erreur de conformité : une section FR-DICOM-Conclusion (1.2.250.1.213.1.1.2.209) doit obligatoirement contenir l'élément title
        </assert>
               
        <!-- Vérifier le texte de la section 'FR-DICOM-Conclusion' -->
        <assert test="cda:text">
            [S_DICOM_Conclusion] Erreur de conformité : une section FR-DICOM-Conclusion (1.2.250.1.213.1.1.2.209) doit obligatoirement contenir l'élément texte
        </assert>
        
    </rule>
    
</pattern>