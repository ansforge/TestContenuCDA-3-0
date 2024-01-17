<?xml version="1.0" encoding="UTF-8"?>

<!--  E_DICOM_TechniqueImagerie_fr.sch -
      Schématron de l'entrée DICOM Part 20 - Procedure Technique (1.2.840.10008.9.14)
    
    15/01/2024 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOM_TechniqueImagerie_fr">
    
    <title> DICOM Part 20 - Procedure Technique </title>
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.14"]'>
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='self::cda:procedure[@classCode="PROC" and @moodCode]'>
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", l'attribut "classCode" est fixé à la valeur "PROC" et l'attribut "moodCode" doit etre présent.</assert>
        
        <assert test="$count_templateId=2">
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir deux templateIds.
        </assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.153'">
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir le templateID 1.2.250.1.213.1.1.3.153
        </assert>
        
        <assert test='cda:id'>
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir un seul identifiant "id".</assert>
        
        <assert test='count(cda:code)=1'>
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", il doit y avoir un élément "code" [1..1].
        </assert>
        
        <assert test="count(cda:methodCode)&gt;=1">
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", l'élément 'methodCode' doit être présent une ou plusieurs fois [1..*].
        </assert>
        
        <assert test="count(cda:targetSiteCode)=1">
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", l'élément 'targetSiteCode' doit être présent [1..1].
        </assert>
        
        <assert test="count(cda:participant)&lt;=1">
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Dans l'entrée "Procedure Technique", l'élément 'participant' peut être présent maximum une fois [0..1].
        </assert>
    </rule>
    
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.14"]/cda:targetSiteCode'>
        <assert test="not(cda:originalText) or (cda:originalText/cda:reference)">
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Si l'originalText existe dans l'élément targetSiteCode, il doit avoir un élément 'reference'.
        </assert>
        <assert test="not(cda:qualifier) or (cda:qualifier/cda:name and cda:qualifier/cda:value)">
            [E_DICOM_TechniqueImagerie_fr] Erreur de conformité DICOM : Si le qualifier existe dans l'élément targetSiteCode, il doit avoir les deux éléments 'name' ayant comme attribut @code="106233006" et 'value' pour préciser le modificateur topographique
        </assert>
    </rule>
</pattern>
