<?xml version="1.0" encoding="UTF-8"?>

<!--  E_DICOM_SOPInstanceObservation_fr.sch -
      Schématron de l'entrée DICOM Part 20 - FR-DICOM-SOP-instance-observation (1.2.840.10008.9.18)
    
    15/01/2024 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOM_SOPInstanceObservation_fr">
    
    <title> DICOM Part 20 - FR-DICOM-SOP-instance-observation </title>
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.18"]'>
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='self::cda:observation[@classCode="DGIMG" and @moodCode="EVN"]'>
            [E_DICOM_SOPInstanceObservation_fr] Erreur de conformité DICOM : Dans l'entrée "FR-DICOM-SOP-instance-observation", l'attribut "classCode" est fixé à la valeur "DGIMG" et l'attribut "moodCode" est fixé à la valeur "EVN".</assert>
        
        <assert test="$count_templateId=2">
            [E_DICOM_SOPInstanceObservation_fr] Erreur de conformité DICOM : Dans l'entrée "FR-DICOM-SOP-instance-observation", il doit y avoir deux templateIds.
        </assert>
        
        <assert test="cda:templateId/@root='1.2.840.10008.9.18' and cda:templateId/@root='1.2.250.1.213.1.1.3.157'">
            [E_DICOM_SOPInstanceObservation_fr] Erreur de conformité DICOM : Dans l'entrée "FR-DICOM-SOP-instance-observation", il doit y avoir deux templateIds :
            - Le premier 1.2.840.10008.9.18 
            - Le deuxième 1.2.250.1.213.1.1.3.157
        </assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_DICOM_SOPInstanceObservation_fr] Erreur de conformité DICOM : Dans l'entrée "FR-DICOM-SOP-instance-observation", il doit y avoir au moins un identifiant "id".</assert>
        
        <assert test='count(cda:code)=1'>
            [E_DICOM_SOPInstanceObservation_fr] Erreur de conformité DICOM : Dans l'entrée "FR-DICOM-SOP-instance-observation", il doit y avoir un élément "code" [1..1].
        </assert>
    </rule>
</pattern>
