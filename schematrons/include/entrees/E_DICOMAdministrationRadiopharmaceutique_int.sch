<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_DICOMAdministrationRadiopharmaceutique_int
   Teste la conformité de l'entrée FR-DICOM-Administration-radiopharmaceutique aux spécifications DICOM
   
   10/07/2023 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOMAdministrationRadiopharmaceutique_int">
    <title>Vérification de la conformité de l'entrée FR-DICOM-Administration-radiopharmaceutique aux spécifications DICOM</title>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.173']">
        
        <assert test="self::cda:substanceAdministration[@classCode ='SBADM' and (@moodCode = 'EVN' or @moodCode='INT')] ">
            [E_DICOMAdministrationRadiopharmaceutique_int] Erreur de conformité : L'élément "substanceAdministration"
            doit contenir les attributs @classCode="SBADM" et 
            @moodCode = 'EVN' : Si le traitement a déjà été administré ou si information rapportée par le patient ou si aucun traitement. 
            or @moodCode='INT' : Si le traitement est en attente d'administration.
        </assert>
        
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.3.173']">
            [E_DICOMAdministrationRadiopharmaceutique_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-radiopharmaceutique
            doit contenir l'élément "templateId" avec l'attribut @root fixé à "1.2.840.10008.9.13". 
        </assert>
        
        <assert test="cda:code/@code='440252007' and cda:code/@codeSystem='2.16.840.1.113883.6.96'"> 
            [E_DICOMAdministrationRadiopharmaceutique_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-radiopharmaceutique doit contenur un élement "code" 
            avec les attributs suivants fixés à : @code='440252007' and @codeSystem='2.16.840.1.113883.6.96'. 
        </assert>
        
        <assert test="count(cda:consumable)&lt;=1"> 
            [E_DICOMAdministrationRadiopharmaceutique_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Administration-radiopharmaceutique doit contenir un élément "consumable".
        </assert>
        
        <assert test="cda:consumable/cda:manufacturedProduct"> 
            [E_DICOMAdministrationRadiopharmaceutique_int] Erreur de conformité DICOM : L'élément "consumable" doit contenir un élément "manufacturedProduct".
        </assert>
        <assert test="cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial"> 
            [E_DICOMAdministrationRadiopharmaceutique_int] Erreur de conformité DICOM : L'élément "manufacturedProduct" doit contenir un élément "manufacturedMaterial".
        </assert>
        
    </rule>
</pattern>
