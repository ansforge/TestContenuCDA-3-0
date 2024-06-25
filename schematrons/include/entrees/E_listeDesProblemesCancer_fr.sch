<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ E_listeDesProblemesCancer_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée  "FR-Liste-des-problemes-cancer" (1.2.250.1.213.1.1.3.39.1) aux spécifications CI-SIS
    
    Historique :
   24/06/24 : Création
 
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_listeDesProblemesCancer_fr">
    <title>CI-SIS FR-Liste-des-problemes-cancer</title>
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.39.1']">
        
        <assert
            test="self::cda:act[@classCode='ACT' and @moodCode='EVN']">
            [E_listeDesProblemesCancer_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Liste-des-problemes-cancer(1.2.250.1.213.1.1.3.39.1), 
            les attributs de l'élément CDA 'act' sont classCode='ACT' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Liste-des-problemes-cancer" -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.27'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.1']
            and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.5.2'] and cda:templateId[@root='1.2.250.1.213.1.1.3.39']">
            
            [E_listeDesProblemesCancer_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Liste-des-problemes-cancer" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.27"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.5.1"
            - Un troisième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.5.2"
            - Un quatrième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.39"
        </assert>
        
        <assert test='count(cda:id)=1'>
            [E_listeDesProblemesCancer_fr.sch] Erreur de Conformité CI-SIS : 
            Une entrée "FR-Liste-des-problemes-cancer" ne peut avoir qu'un seul identifiant (id).
        </assert>
        
        <assert test='cda:code[@nullFlavor="NA"]'>
            [E_listeDesProblemesCancer_fr.sch] Ereur CI-SIS: L’élément code prend la valeur nullFlavor='NA' car l'identification du problème est faite à partir des éléments entryRelationship.</assert>
        
        <assert test='cda:statusCode[@code="active" or 
            @code="suspended" or
            @code="aborted" or
            @code="completed"]'>
            
            [E_listeDesProblemesCancer_fr.sch] Erreur de conformité CI-SIS : L'élément "statusCode" doit prendre l'une des valeurs suivantes: 
            "active", "suspended", "aborted" ou "completed".</assert>
        
        <assert test='cda:effectiveTime'>
            [E_listeDesProblemesCancer_fr.sch]  Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </assert>
        
        <assert test='cda:effectiveTime/cda:low'>
            [E_listeDesProblemesCancer_fr.sch]  Erreur de conformité CI-SIS : l'élément "low" doit être présent une fois.</assert>
        
        <assert test='(cda:statusCode[@code="completed" or @code="aborted"] and cda:effectiveTime/cda:high) or
            (not(cda:statusCode[@code="completed" or @code="aborted"]) and not(cda:effectiveTime/cda:high))'>
            [E_listeDesProblemesCancer_fr.sch]  Erreur de conformité CI-SIS : l'élément "effectiveTime" indique le début et la fin de l'élément décrit.
            Son composant "high" est obligatoire si le statutCode est "completed" ou "aborted" et absent dans les autres cas.
        </assert>
        
        <assert test='cda:entryRelationship[@typeCode="SUBJ" and @inversionInd="false"]/*/cda:templateId[@root="1.3.6.1.4.1.19376.1.7.3.1.4.14.1"]'>
            [E_listeDesProblemesCancer_fr.sch]   Erreur de conformité CI-SIS :
            Cette entrée contient une ou plusieurs entrées qui se conforment aux spécifications de "Cancer Diagnosis" de type entryRelationship 
            d'attribut typeCode='SUBJ' et inversionInd='false'</assert>
        
    </rule>
</pattern>