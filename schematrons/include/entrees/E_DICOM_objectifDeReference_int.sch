<?xml version="1.0" encoding="UTF-8"?>

<!--  E_DICOM_objectifDeReference_int.sch -
      Schématron de l'entrée FR-DICOM-Objectifs-de-reference
    
    10/07/2023 : SBM : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOM_objectifDeReference_int">
    
    <title> DICOM Part 20 - objectif de référence </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.163"]'>
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='self::cda:observation[@classCode="OBS" and @moodCode="EVN"]'>
            [E_DICOM_objectifDeReference_int] Erreur de conformité DICOM : Dans l'entrée "objectif de référence", l'attribut "classCode" est fixé à la valeur "OBS" et l'attribut "moodCode" est fixé à la valeur "EVN".</assert>
        
        <assert test="$count_templateId=1">
            [E_DICOM_objectifDeReference_int] Erreur de conformité DICOM : Dans l'entrée "objectif de référence", il doit y avoir un templateId.
        </assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.163'">
            [E_DICOM_objectifDeReference_int] Erreur de conformité DICOM : Dans l'entrée "objectif de référence", il doit y avoir le templateId : 1.2.250.1.213.1.1.3.163 
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@code="ASSERTION"'>
            [E_DICOM_objectifDeReference_int] Erreur de conformité DICOM : Dans l'entrée "objectif de référence", il doit y avoir un élément "code" [1..1] ayant comme attribut @code="ASSERTION".
        </assert>
        
        <assert test='count(cda:value)=1'>
            [E_DICOM_objectifDeReference_int] Erreur de conformité DICOM : Dans l'entrée "objectif de référence", il doit y avoir un élément "value" [1..1].
        </assert>
        
    </rule>
</pattern>
