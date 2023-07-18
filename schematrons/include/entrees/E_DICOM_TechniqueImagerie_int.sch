<?xml version="1.0" encoding="UTF-8"?>

<!--  E_DICOM_TechniqueImagerie_int.sch -
      Schématron de l'entrée DICOM Part 20 - Procedure Technique (1.2.840.10008.9.14)
    
    10/07/2023 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOM_TechniqueImagerie_int">
    
    <title> DICOM Part 20 - Procedure Technique </title>
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.14"]'>
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='self::cda:procedure[@classCode="PROC" and @moodCode]'>
            [E_DICOM_TechniqueImagerie_int] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", l'attribut "classCode" est fixé à la valeur "PROC" et l'attribut "moodCode" doit etre présent.</assert>
        
        <assert test="$count_templateId=2">
            [E_DICOM_TechniqueImagerie_int] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir deux templateIds.
        </assert>
        
        <assert test="cda:templateId/@root='1.2.840.10008.9.14' and cda:templateId/@root='1.2.250.1.213.1.1.3.153'">
            [E_DICOM_TechniqueImagerie_int] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir deux templateIds :
            - Le premier 1.2.840.10008.9.14 
            - Le deuxième 1.2.250.1.213.1.1.3.153
        </assert>
        
        <assert test='cda:id'>
            [E_DICOM_TechniqueImagerie_int] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir un seul identifiant "id".</assert>
        
        <assert test='count(cda:code)=1'>
            [E_DICOM_TechniqueImagerie_int] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir un élément "code" [1..1].
        </assert>
        
        <assert test="count(cda:methodCode)&gt;=1">
            [E_DICOM_TechniqueImagerie_int] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", l'élément 'methodCode' doit être présent une ou plusieurs fois.
        </assert>
    </rule>
</pattern>
