<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_effetIndesirable_ANS.sch
   Teste la conformité de l'entrée FR-Effet-indesirable(1.2.250.1.213.1.1.3.210) en fonctionn de la conformité CI-SIS
   
   06/06/2024 : HTR : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_effetIndesirable_ANS">
    <title>FR-Effet-indesirable</title>
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.210']">
        <let name="count_templateId" value="count(cda:templateId)"/>
        
        <assert test='self::cda:observation[@classCode="OBS" and @moodCode]'>
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir les attributs @classCode et @moodCode fixés respectivement aux valeurs 'OBS' et 'EVN'
        </assert>
        <!-- Test des templateId pour l'entrée "FR-Effet-indesirable" -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.18'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.28']
            and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']">
            [E_effetIndesirable_ANS] Erreur de conformité CI-SIS : 
            L'entrée "FR-Effet-indesirable" doit comporter les 'templateId' suivants:
            - Un 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.28"
            - Un 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.18" 
            - Un 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.5"
        </assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable (1.2.250.1.213.1.1.3.210) doit contenir au minimun un élement "Id"
        </assert>
        
        <assert test="cda:code">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir un élément "code"
        </assert>
        
        <assert test="cda:text">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir un élément "text"
        </assert>
        
        <!-- Test de la présence de l'élément fils 'reference' -->
        <assert test="count(cda:text/cda:reference)=1">
            [E_effetIndesirable_ANS] Erreur de conformité CI-SIS : l'entrée FR-Effet-indesirabledoit comporter un élément 'text/reference'. 
        </assert>
        
        <assert test="cda:statusCode[@code='completed']">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir un élément "statusCode" avec l'attribut @code='completed'
        </assert>
        
        <assert test="cda:effectiveTime">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir un élément "effectiveTimee"
        </assert>
        
        <assert test="cda:effectiveTime/cda:low"> 
            [E_effetIndesirable_ANS] Erreur de conformité CI-SIS : La composante "low" de l'élément "effectiveTime" doit être exprimée dans l'entrée FR-Effet-indesirable.
        </assert>
        
        <assert test="cda:value">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir un élément "value"
        </assert>
        
        <assert test="count(cda:entryRelationship[@typeCode='COMP']/cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.42']/cda:routeCode)=1">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir une entrée FR-Traitement (templateId : 1.2.250.1.213.1.1.3.42) avec un élément "routeCode" [1..1.]
        </assert>

        <assert test="not(cda:entryRelationship[@typeCode='MFST']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37'])or cda:entryRelationship[@typeCode='MFST']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.37' and cda:templateId/@root='2.16.840.1.113883.10.20.1.54']">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable peut contenir une ou plusieurs entrée FR-Probleme (templateId : 1.2.250.1.213.1.1.3.37) avec un templateId supplémentaire (2.16.840.1.113883.10.20.1.54) 
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.211'])or (cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:observation[@classCode='OBS' and @moodCode='EVN' and cda:templateId/@root='1.2.250.1.213.1.1.3.211'])">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable peut contenir une entrée FR-Imputabilite-effet-indesirable (templateId : 1.2.250.1.213.1.1.3.211) 
        </assert>
        
        <assert test="count(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.212'])=1">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable doit contenir une entrée FR-Gravite-effet-indesirable (templateId : 1.2.250.1.213.1.1.3.212) 
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.213']) or (cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:observation[@classCode='OBS' and @moodCode='EVN' and cda:templateId/@root='1.2.250.1.213.1.1.3.213'])">
            [E_effetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Effet-indesirable peut contenir une ou plusieurs entrée FR-Evolution-effet-indesirable (templateId : 1.2.250.1.213.1.1.3.213) 
        </assert>
        
    </rule>    
    
</pattern>

