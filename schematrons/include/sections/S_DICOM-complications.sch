<?xml version="1.0" encoding="UTF-8"?>
<!--  S_DICOM-complications.sch
    
     Vérification de la conformité de la section FR-DICOM-complications (2.16.840.1.113883.10.20.22.2.37) aux spécifications DICOM
        
    Historique :
    17/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM_complications">
    <title>Vérification de la conformité de la section FR-DICOM-complications aux spécifications DICOM </title>
    
    <rule context='*[cda:templateId/@root="2.16.840.1.113883.10.20.22.2.37"]'>
        
        <!-- Vérifier l'id de la section 'FR-DICOM-Complications' -->
        <assert test="count(cda:id)&gt;=1">
            [S_DICOM_complications] Erreur de conformité au modèle CI-SIS : Si elle existe, une section FR-DICOM-Complications (2.16.840.1.113883.10.20.22.2.37) doit obligatoirement contenir l'élément "id"
        </assert>
        <!-- Vérifier le code de la section 'FR-DICOM-Complications' -->
        <assert test="cda:code[@code='55109-3' and @codeSystem='2.16.840.1.113883.6.1']">
            [S_DICOM_complications] Erreur de conformité au modèle CI-SIS : Si elle existe, la section FR-DICOM-Complications (2.16.840.1.113883.10.20.22.2.37) doit obligatoirement avoir comme code : @code='55109-3' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        <!-- Vérifier le title de la section 'FR-DICOM-Complications' -->
        <assert test="count(cda:title)=1">
            [S_DICOM_complications] Erreur de conformité au modèle CI-SIS : Si elle existe, une section FR-DICOM-Complications (2.16.840.1.113883.10.20.22.2.37) doit obligatoirement contenir l'élément "title"
        </assert>
        <!-- Vérifier le texte de la section 'FR-DICOM-Complications' -->
        <assert test="count(cda:text)=1">
            [S_DICOM_complications] Erreur de conformité au modèle CI-SIS : Si elle existe, une section FR-DICOM-Complications (2.16.840.1.113883.10.20.22.2.37) doit obligatoirement contenir l'élément "texte"
        </assert>
        
    </rule>
    
</pattern>