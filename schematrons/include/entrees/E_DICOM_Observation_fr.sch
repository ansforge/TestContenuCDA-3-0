<?xml version="1.0" encoding="UTF-8"?>

<!--  E_DICOM_Observation_fr.sch -
      Schématron de l'entrée DICOM Part 20 - Coded Observation (2.16.840.1.113883.10.20.6.2.13)
    
    10/07/2023 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOM_Observation_fr">
    
    <title> DICOM Part 20 - Coded Observation </title>
    <rule context='*[cda:templateId/@root="2.16.840.1.113883.10.20.6.2.13"]'>
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='self::cda:observation[@classCode="OBS" and @moodCode]'>
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", l'attribut "classCode" est fixé à la valeur "OBS" et l'attribut "moodCode" doit etre présent.</assert>
        
        <assert test="$count_templateId=2">
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", il doit y avoir deux templateIds.
        </assert>
        
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.6.2.13' and cda:templateId/@root='1.2.250.1.213.1.1.3.150'">
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", il doit y avoir deux templateIds :
            - Le premier 2.16.840.1.113883.10.20.6.2.13 
            - Le deuxième 1.2.250.1.213.1.1.3.150
        </assert>
        
        <assert test='count(cda:id)=1'>
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", il doit y avoir un seul identifiant "id".</assert>
        
        <assert test='count(cda:code)=1'>
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", il doit y avoir un élément "code" [1..1].
        </assert>
        
        <assert test='count(cda:statusCode)=1'>
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", il doit y avoir un élément "statusCode" [1..1].
        </assert>
        
        <assert test='count(cda:value)=1'>
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", il doit y avoir un élément "value" [1..1].
        </assert>
        
        <assert test='count(cda:targetSiteCode)=1'>
            [E_DICOM_Observation_fr] Erreur de conformité DICOM : Dans l'entrée "Coded Observation", il doit y avoir un élément "targetSiteCode" [1..1].
        </assert>
        
        <!-- entryRelationship SOP Instance Observation -->
        <assert test="not(cda:entryRelationship[@typeCode='SPRT']) or (cda:entryRelationship[@typeCode='SPRT']/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.157'] and cda:entryRelationship[@typeCode='SPRT']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.157']/cda:code)">
            [E_DICOM_Observation_fr] Erreur de conformité CI-SIS : Si l'entrée 'FR-DICOM-SOP-instance-observation' est présente, l'attribut @typeCode doit avoir la valeur suivante 'SPRT'.
            L'élément code de l'entrée est obligatoire [1..1].
            Le templateId doit avoir l'attribut @rootCode='1.2.250.1.213.1.1.3.157'.
        </assert>
        
        <!-- entryRelationship Quantity Measurement -->
        <assert test="not(cda:entryRelationship[@typeCode='SPRT']) or (cda:entryRelationship[@typeCode='SPRT']/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.154'] and cda:entryRelationship[@typeCode='SPRT']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.154']/cda:code)">
            [E_DICOM_Observation_fr] Erreur de conformité CI-SIS : Si l'entrée 'FR-DICOM-Quantite' est présente, l'attribut @typeCode doit avoir la valeur suivante 'SPRT'.
            L'élément code de l'entrée est obligatoire [1..1].
            Le templateId doit avoir l'attribut @rootCode='1.2.250.1.213.1.1.3.154'.
        </assert>
    </rule>
</pattern>
