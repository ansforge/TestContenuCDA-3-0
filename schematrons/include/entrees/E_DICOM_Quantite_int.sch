<?xml version="1.0" encoding="UTF-8"?>

<!--  E_DICOM_Quantite_int.sch -
      Schématron de l'entrée DICOM Part 20 - Quantity Measurement (2.16.840.1.113883.10.20.6.2.14)
    
    10/07/2023 : SBM : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DICOM_Quantite_int">
    
    <title> DICOM Part 20 - Quantity Measurement </title>
    <rule context='*[cda:templateId/@root="2.16.840.1.113883.10.20.6.2.14"]'>
        <let name="count_templateId" value="count(cda:templateId)"/>
        <assert test='self::cda:observation[@classCode="OBS" and @moodCode="EVN"]'>
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", l'attribut "classCode" est fixé à la valeur "OBS" et l'attribut "moodCode" est fixé à la valeur "EVN".</assert>
        
        <assert test="$count_templateId=2">
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", il doit y avoir deux templateIds.
        </assert>
        
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.6.2.14' and cda:templateId/@root='1.2.250.1.213.1.1.3.154'">
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", il doit y avoir deux templateIds :
            - Le premier 2.16.840.1.113883.10.20.6.2.14 
            - Le deuxième 1.2.250.1.213.1.1.3.154
        </assert>
        
        <assert test='count(cda:id)=1'>
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", il doit y avoir un seul identifiant "id".</assert>
        
        <assert test='count(cda:code)=1'>
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", il doit y avoir un élément "code" [1..1].
        </assert>
        
        <assert test='count(cda:statusCode)=1'>
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", il doit y avoir un élément "statusCode" [1..1].
        </assert>
        
        <assert test='count(cda:value[@xsi:type="PQ"])=1'>
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", il doit y avoir un élément "value" [1..1].
        </assert>
        
        <assert test='count(cda:targetSiteCode)=1'>
            [E_DICOM_Quantite_int] Erreur de conformité DICOM : Dans l'entrée "Quantity Measurement", il doit y avoir un élément "targetSiteCode" [1..1].
        </assert>
    </rule>
</pattern>
