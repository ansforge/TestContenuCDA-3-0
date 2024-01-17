<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_observationOculaireTestDeLaVision_fr
   Teste la conformité de l'entrée FR-Observation-oculaire-test-de-la-vision (1.2.250.1.213.1.1.3.114.9) aux spécifications CI-SIS
   
   15/01/2024 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_observationOculaireTestDeLaVision_fr">
    <title>Vérification de la conformité de l'entrée FR-Observation-oculaire-test-de-la-vision aux spécifications CI-SIS</title>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.114.9']">
        
        <assert test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']">
            [E_observationOculaireTestDeLaVision_fr] Erreur de conformité CI-SIS : L'élément "observation" doit
            contenir les attributs @classCode="OBS" et @moodCode="EVN". </assert>
        
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.12.1.3.1']">
            [E_observationOculaireTestDeLaVision_fr]  Erreur de conformité CI-SIS : 
            L'entrée FR-Observation-oculaire-test-de-la-vision doit comporter le 'templateId' IHE EYE CARE GEE  avec l'attribut suivant : @root=' 1.3.6.1.4.1.19376.1.12.1.3.1'.
        </assert>   
        
        <assert test="count(cda:id)&gt;1">
            [E_observationOculaireTestDeLaVision_fr] Erreur de conformité CI-SIS : L'entrée
            FR-Observation-oculaire-test-de-la-vision doit contenir au minimum un élément "id".</assert>
        
        <assert test="cda:code[(@code ='271726001'or @code='251686008' or @code='359750002' or @code='78513008') and @codeSystem ='2.16.840.1.113883.6.96']">
            [E_observationOculaireTestDeLaVision_fr] Erreur de conformité CI-SIS : L'entrée
            FR-Observation-oculaire-test-de-la-vision doit contenir l'élément "code" avec les attributs
            (@code ='271726001'or @code='251686008' or @code='359750002' or @code='78513008') et @codeSystem="2.16.840.1.113883.6.96".</assert>
        
        <assert test="cda:statusCode[@code ='completed']"> 
            [E_observationOculaireTestDeLaVision_fr] Erreur de conformité CI-SIS : L'entrée FR-Observation-oculaire-test-de-la-vision doit contenir
            l'élément "statusCode" avec l'attribut @code fixé à "completed".</assert>
        
        <assert test="cda:value"> 
            [E_observationOculaireTestDeLaVision_fr] Erreur de conformité CI-SIS : L'entrée FR-Observation-oculaire-test-de-la-vision doit contenir
            l'élément "value".</assert>
        
        <assert test="cda:effectiveTime[@value] or cda:effectiveTime[@nullFlavor]">
            [E_observationOculaireTestDeLaVision_fr] Erreur de conformité CI-SIS : 
            L'entrée FR-Observation-oculaire-test-de-la-vision doit contenir un élément "effectiveTime" avec
            l'attribut @value.</assert>
        
        <assert test="cda:targetSiteCode[(@code='362503005' or @code='362502000') and @codeSystem ='2.16.840.1.113883.6.96']">
            [E_observationOculaireTestDeLaVision_fr] Erreur de conformité CI-SIS : 
            L'entrée FR-Observation-oculaire-test-de-la-vision doit contenir un élément "targetSiteCode" avec les attributs 
            (@code='362503005' or  @code='362503005') et @codeSystem="2.16.840.1.113883.6.96"</assert>
        
    </rule>
</pattern>
