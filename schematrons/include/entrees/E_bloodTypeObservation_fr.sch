<?xml version="1.0" encoding="UTF-8"?>

<!--                 
   E_bloodTypeObservation_fr
   Teste la conformité de l'entrée Blood Type Observation en fonctionn de la conformité IHE-PCC
   
   20/06/2017 : LBE :Création
   12/12/2023 : ANS Mise à jour
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_bloodTypeObservation_fr">
    <title>IHE PCC v3.0 vital signs Organizer</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.6']">
        <let name="count_id" value="count(cda:id)"/>
        <let name="count_value" value="count(cda:value)"/>
        <assert test="$count_id=1">
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un seul élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.57']">
            [E_bloodTypeObservation_fr.sch] :  Erreur de conformité PCC :  L'élément blood Type Observation doit contenir un templateId avec la l'attribut @root fixé à '1.2.250.1.213.1.1.3.57'
        </assert>
        <assert test="cda:code[@code='882-1' and @codeSystem='2.16.840.1.113883.6.1']">
            [E_bloodTypeObservation_FR.sch] :  Erreur de conformité PCC : L'élément blood Type Observation doit contenir un élément code avec les attributs suivant : 
            @code='882-1' 
            @displayName='ABO+RH' 
            @codeSystem='2.16.840.1.113883.6.1' 
            @codeSystemName='LOINC'      
        </assert>
        <assert test="cda:text/cda:reference">
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un élément text, lui même contenant un élément référence
        </assert>
        <assert test="cda:statusCode[@code='completed']">
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un élément statusCode fixé à la valeur @code='completed'
        </assert>
        <!-- Pas besoin de tester l'effectiveTime car cela est déja testé dans le schématron de Simple Observation -->
        <assert test="$count_value=1">
            [E_bloodTypeObservation_fr.sch] Erreur de conformité CI-SIS : L'élément bloodTypeObservation doit contenir un seul élément value (cardinalité [1..1])
        </assert>
    </rule>    
</pattern>

