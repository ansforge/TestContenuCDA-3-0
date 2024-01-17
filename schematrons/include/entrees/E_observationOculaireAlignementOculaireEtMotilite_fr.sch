<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_observationOculaireAlignementOculaireEtMotilite_fr
   Teste la conformité de l'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite (1.2.250.1.213.1.1.3.114.6) aux spécifications CI-SIS
   
   15/01/2024 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_observationOculaireAlignementOculaireEtMotilite_fr">
    <title>Vérification de la conformité de l'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite spécifications CI-SIS</title>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.114.6']">
        
        <assert test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']">
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : L'élément "observation" doit
            contenir les attributs @classCode="OBS" et @moodCode="EVN". </assert>
        
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.12.1.3.1']">
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : 
            L'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite doit comporter le 'templateId' IHE EYE CARE GEE  avec l'attribut suivant : @root=' 1.3.6.1.4.1.19376.1.12.1.3.1'.
        </assert>   
        
        <assert test="count(cda:id)&gt;1">
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : 
            L'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite doit contenir au minimum un élément "id".</assert>
        
        <assert test="cda:code[(@code ='251781009'or @code='313088003' or @code='31763002' or @code='400927000') and @codeSystem ='2.16.840.1.113883.6.96']">
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : L'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite doit contenir l'élément "code" avec les attributs suivants :
            (@code ='251781009'ou @code='313088003' ou @code='31763002' ou @code='400927000') et @codeSystem ='2.16.840.1.113883.6.96'.
        </assert>
        
        <assert test="cda:statusCode[@code ='completed']"> 
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : L'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite doit contenir
            l'élément "statusCode" avec l'attribut @code fixé à "completed".</assert>
        
        <assert test="cda:effectiveTime[@value] or cda:effectiveTime[@nullFlavor]">
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : 
            L'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite doit contenir un élément "effectiveTime" avec
            l'attribut @value.</assert>
        
        <assert test="cda:value"> 
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : L'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite doit contenir
            l'élément "value".</assert>
        
        <assert test="cda:targetSiteCode[(@code='362503005' or @code='362502000') and @codeSystem ='2.16.840.1.113883.6.96']">
            [E_observationOculaireAlignementOculaireEtMotilite_fr] Erreur de conformité CI-SIS : 
            L'entrée FFR-Observation-oculaire-alignement-oculaire-et-motilite doit contenir un élément "targetSiteCode" avec les attributs 
            (@code='362503005' or  @code='362503005'or @code='362508001') et @codeSystem="2.16.840.1.113883.6.96"</assert>
        
    </rule>
</pattern>
