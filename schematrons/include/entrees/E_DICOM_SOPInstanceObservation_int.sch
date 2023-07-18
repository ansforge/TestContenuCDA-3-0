<?xml version="1.0" encoding="UTF-8"?>

<!--  E_DICOM_SOPInstanceObservation_int.sch -
      Schématron de l'entrée DICOM Part 20 - SOP Instance Observation (1.2.840.10008.9.18)
    
    10/07/2023 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOM_SOPInstanceObservation_int">
    
    <title> DICOM Part 20 - SOP Instance Observation </title>
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.18"]'>
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='self::cda:observation[@classCode="DGIMG" and @moodCode="EVN"]'>
            [E_DICOM_SOPInstanceObservation_int] Erreur de conformité DICOM : Dans l'entrée "SOP Instance Observation", l'attribut "classCode" est fixé à la valeur "DGIMG" et l'attribut "moodCode" est fixé à la valeur "EVN".</assert>
        
        <assert test="$count_templateId=2">
            [E_DICOM_SOPInstanceObservation_int] Erreur de conformité DICOM : Dans l'entrée "SOP Instance Observation", il doit y avoir deux templateIds.
        </assert>
        
        <assert test="cda:templateId/@root='1.2.840.10008.9.18' and cda:templateId/@root='1.2.250.1.213.1.1.3.157'">
            [E_DICOM_SOPInstanceObservation_int] Erreur de conformité DICOM : Dans l'entrée "SOP Instance Observation", il doit y avoir deux templateIds :
            - Le premier 1.2.840.10008.9.18 
            - Le deuxième 1.2.250.1.213.1.1.3.157
        </assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_DICOM_SOPInstanceObservation_int] Erreur de conformité DICOM : Dans l'entrée "SOP Instance Observation", il doit y avoir au moins un identifiant "id".</assert>
        
        <assert test='count(cda:code)=1'>
            [E_DICOM_SOPInstanceObservation_int] Erreur de conformité DICOM : Dans l'entrée "SOP Instance Observation", il doit y avoir un élément "code" [1..1].
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='RSON']) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.163'])&lt;=1 and cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.163']/cda:code)">
            [E_procedureEntry_int] Erreur de conformité CI-SIS : Si l'entrée 'FR-DICOM-Objectifs-de-reference' est présente, l'attribut @typeCode doit avoir la valeur suivante 'RSON'.
            L'élément code de l'entrée est obligatoire [1..1].
            Le templateId doit avoir l'attribut @rootCode='1.2.250.1.213.1.1.3.163'.
        </assert>
        <assert test="not(cda:entryRelationship[@typeCode='COMP']) or (count(cda:entryRelationship[@typeCode='COMP']/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.164'])&lt;=1 and cda:entryRelationship[@typeCode='COMP']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.164']/cda:code)">
            [E_procedureEntry_int] Erreur de conformité CI-SIS : Si l'entrée 'FR-DICOM-Objectifs-de-reference' est présente, l'attribut @typeCode doit avoir la valeur suivante 'COMP'.
            L'élément code de l'entrée est obligatoire [1..1]
            Le templateId doit avoir l'attribut @rootCode='1.2.250.1.213.1.1.3.164'.
        </assert>
    </rule>
</pattern>
