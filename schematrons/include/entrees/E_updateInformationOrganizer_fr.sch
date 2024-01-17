<?xml version="1.0" encoding="UTF-8"?>

<!--                   
     [ updateInformationOrganizer.sch ]>>=-
    
    Vérification de la conformité de l'entrée FR-Informations-sur-la-mise-a-jour (1.2.250.1.213.1.1.3.76) aux spécifications au spécifications du CI-SIS
    
    Historique :
    28/12/2023 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_updateInformationOrganizer_fr">
    
    <title>CI-SIS Entrée FR-Informations-sur-la-mise-a-jour </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.76"]'>
        
        <let name="count_statusCode" value="count(cda:statusCode)"/>
        
        <assert test="@classCode='BATTERY' and @moodCode='EVN'">
            [E_updateInformationOrganizer_fr.sch] Erreur de conformité CI-SIS : L'élément "organizer" de l'entrée "FR-Informations-sur-la-mise-a-jour" doit avoir les attributs @classCode et @moodCode fixés respectivement aux valeurs suivante 'BATTERY' et 'EVN'
        </assert>
        
        <assert test="$count_statusCode = 1">
            [E_updateInformationOrganizer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Informations-sur-la-mise-a-jour" doit contenir obligatoirement un élément statusCode (cardinalité [1..1])
        </assert>
        
        <assert test="cda:statusCode[@code='completed']">
            [E_updateInformationOrganizer_fr.sch] Erreur de conformité CI-SIS : L'attribut "code" de l'élément "statusCode" doit prendre la valeur 'completed'.
        </assert>
        
        <assert test="cda:component[@typeCode='COMP']/cda:observation[@classCode='OBS'][@moodCode='EVN']">
            [E_updateInformationOrganizer_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Informations-sur-la-mise-a-jour" doit contenir obligatoirement un élément component [1..1].
        </assert> 
        <assert test="cda:component[@typeCode='COMP']/cda:observation[@classCode='OBS'][@moodCode='EVN']/cda:code[@code='90004-3' and @codeSystem='2.16.840.1.113883.6.1']">
            [E_updateInformationOrganizer_fr.sch] Erreur de conformité CI-SIS : L'élément "code" de l'élément "component" est obligatoire et doit prendre les valeurs : [@code='90004-3' and @codeSystem='2.16.840.1.113883.6.1'].
        </assert> 
        <assert test="count(cda:component[@typeCode='COMP']/cda:observation[@classCode='OBS'][@moodCode='EVN']/cda:value)=1">
            [E_updateInformationOrganizer_fr.sch] Erreur de conformité CI-SIS : L'élément "value" de l'élément "component" est obligatoire.
        </assert> 
    </rule>
    
</pattern>
