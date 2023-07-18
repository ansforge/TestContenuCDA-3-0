<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_DICOMCadresReferences_int
   Teste la conformité de l'entrée FR-DICOM-Cadres-references aux spécifications DICOM
   
   10/07/2023 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOMCadresReferences_int">
    <title>Vérification de la conformité de l'entrée FR-DICOM-Cadres-references aux spécifications DICOM</title>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.164']">
        
        <assert test="self::cda:observation[@classCode ='ROIBND' and (count(@moodCode)=1)] ">
            [E_DICOMCadresReferences_int] Erreur de conformité : L'élément "observation"
            doit contenir les attributs @classCode="ROIBND".
        </assert>
        
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.3.164']">
            [E_DICOMCadresReferences_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Cadres-references 
            doit contenir l'élément "templateId" avec l'attribut @root fixé à "1.2.250.1.213.1.1.3.164". 
        </assert>
        
        <assert test="cda:code/@code='121190' and cda:code/@codeSystem='1.2.840.10008.2.16.4'"> 
            [E_DICOMCadresReferences_int] Erreur de conformité DICOM : L'entrée FR-DICOM-Cadres-references doit contenir un élement "code" 
            avec les attributs suivants : @code='121190' and @codeSystem='1.2.840.10008.2.16.4'. 
        </assert>
        
        <assert test="cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.166']">
            [E_DICOMCadresReferences_int] Erreur de conformité CI-SIS : L'entrée 'FR-DICOM-Cadres-a-afficher' doit être présente, l'attribut @typeCode doit avoir la valeur suivante 'COMP'.
        </assert>
    </rule>
</pattern>
