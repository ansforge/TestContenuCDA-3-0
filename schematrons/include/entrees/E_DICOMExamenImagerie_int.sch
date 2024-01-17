<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_DICOMExamenImagerie_int
   Teste la conformité de l'entrée Study Act aux spécifications DICOM
   
   10/07/2023 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOMExamenImagerie_int">
    <title>Vérification de la conformité de l'entrée Study Act aux spécifications DICOM</title>
    <rule context="*[cda:templateId/@root = '1.2.840.10008.9.16']">
        
        <assert test="self::cda:act[count(@classCode and @moodCode)=1] ">
            [E_DICOMExamenImagerie_int] Erreur de conformité : L'élément "observation"
            doit contenir les attributs @classCode et @moodCode.
        </assert>
        
        <assert test="count(cda:id)&gt;=1"> 
            [E_DICOMExamenImagerie_int] Erreur de conformité DICOM : L'entrée 'FR-DICOM-Examen-imagerie' doit contenir un ou plusieurs élement(s) "id" [1..*].
        </assert>
        
        <assert test="cda:code/@code='113014' and cda:code/@codeSystem='1.2.840.10008.2.16.4'"> 
            [E_DICOMExamenImagerie_int] Erreur de conformité DICOM : L'entrée 'FR-DICOM-Examen-imagerie' doit contenir un élement "code" 
            avec les attributs suivants : @code='113014' and @codeSystem='1.2.840.10008.2.16.4'. 
        </assert>
        
        <assert test="cda:entryRelationship[@typeCode='COMP']/cda:act[cda:templateId/@root='1.2.840.10008.9.17']">
            [E_DICOMExamenImagerie_int] Erreur de conformité CI-SIS : L'entrée 'Series Act' doit être présente, l'attribut @typeCode doit avoir la valeur suivante 'COMP'.
        </assert>
        
    </rule>
</pattern>
