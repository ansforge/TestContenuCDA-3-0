<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_laboratoireExecutant_fr.sch :
    
    Vérification de la conformité d'une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7)
    
    Historique :
    02/01/2024 : Création
        
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_laboratoireExecutant_fr">
    <p>Vérification de la conformité d'une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7)</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.3.3.1.7']">
        
        <assert test="self::cda:performer">
            [E_laboratoireExecutant_fr] Erreur de conformité :
            Un exécutant dans une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7) doit être un performer. 
        </assert> 
        
        <assert test="cda:time"> 
            [E_FR-Laboratoire-executant] Erreur de conformité :
            Dans une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7), l'élément time est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:id"> 
            [E_laboratoireExecutant_fr] Erreur de conformité :
            Dans une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7), les éléments assignedEntity et assignedEntity/id sont obligatoires. 
        </assert>
        
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:id and
            cda:assignedEntity/cda:representedOrganization/cda:name and count(cda:assignedEntity/cda:representedOrganization/cda:telecom)&gt;=1 and cda:assignedEntity/cda:representedOrganization/cda:standardIndustryClassCode and count(cda:assignedEntity/cda:representedOrganization/cda:addr)&gt;=1"> 
            [E_FR-Laboratoire-executant] Erreur de conformité :
            Dans une entrée FR-Laboratoire-executant (1.3.6.1.4.1.19376.1.3.3.1.7), les éléments assignedEntity/representedOrganization/id,
            assignedEntity/representedOrganization/name, assignedEntity/representedOrganization/telecom, assignedEntity/representedOrganization/addr et assignedEntity/representedOrganization/standardIndustryClassCode  sont obligatoires. 
        </assert>
        
    </rule>
</pattern>
