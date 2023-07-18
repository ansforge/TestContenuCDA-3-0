<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_DICOMCadresAafficher_int
   Teste la conformité de l'entrée FR-DICOM-Cadres-a-afficher  aux spécifications DICOM
   
   10/07/2023 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOMCadresAafficher_int">
    <title>Vérification de la conformité de l'entrée FR-DICOM-Cadres-a-afficher aux spécifications DICOM</title>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.166']">
        
        <assert test="self::cda:observation[@classCode ='OBS' and @moodCode = 'EVN'] ">
            [E_DICOMCadresAafficher_int] Erreur de conformité : L'élément "observation"
            doit contenir les attributs @classCode="OBS" et @moodCode = 'EVN'
        </assert>
        
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.3.166']">
            [E_DICOMCadresAafficher_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Cadres-a-afficher 
            doit contenir l'élément "templateId" avec l'attribut @root fixé à "1.2.840.10008.9.13". 
        </assert>
        
        <assert test="cda:code/@code='113036' and cda:code/@codeSystem='1.2.840.10008.2.16.4'"> 
            [E_DICOMCadresAafficher_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Cadres-a-afficher doit contenur un élement "code" 
            avec les attributs suivants : @code='113036' and @codeSystem='1.2.840.10008.2.16.4'. 
        </assert>
        
        <assert test="cda:value[@xsi:type='IVL_INT']"> 
            [E_DICOMCadresAafficher_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Cadres-a-afficher doit contenir un élément "value" avec l'attribut suivant : "@xsi:type='IVL_INT'".
        </assert>
        
    </rule>
</pattern>
