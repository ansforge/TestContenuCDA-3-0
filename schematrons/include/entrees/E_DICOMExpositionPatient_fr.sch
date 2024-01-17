<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_DICOMExpositionPatient_fr
   Teste la conformité de l'entrée FR-DICOM-Exposition-patient aux spécifications DICOM
   
   10/07/2023 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOMExpositionPatient_fr">
    <title>Vérification de la conformité de l'entrée FR-DICOM-Exposition-patient aux spécifications DICOM</title>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.165']">
        
        <assert test="self::cda:procedure[@classCode ='PROC' and @moodCode = 'EVN'] ">
            [E_DICOMExpositionPatient_fr] Erreur de conformité : L'élément "observation"
            doit contenir les attributs @classCode="PROC" et @moodCode = 'EVN'
        </assert>
        
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.3.165']">
            [E_DICOMExpositionPatient_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Exposition-patient 
            doit contenir l'élément "templateId" avec l'attribut @root fixé à "1.2.250.1.213.1.1.3.165". 
        </assert>
        
        <assert test="cda:code/@code='121290' and cda:code/@codeSystem='1.2.840.10008.2.16.4'"> 
            [E_DICOMExpositionPatient_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Exposition-patient doit contenur un élement "code" 
            avec les attributs suivants : @code='1121290' and @codeSystem='1.2.840.10008.2.16.4'. 
        </assert>
        
        <assert test="count(cda:participant)=1"> 
            [E_DICOMExpositionPatient_fr] Erreur de conformité DICOM : L'entrée FR-DICOM-Exposition-patient doit contenir un élément "participant".
        </assert>
        
    </rule>
</pattern>
