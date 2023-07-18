<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_professionLaPlusLongue_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Profession-la-plus-longue (1.2.250.1.213.1.1.3.125) aux spécifications du CI-SIS
    
    Historique :
    05/07/2023 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_professionLaPlusLongue_fr">
    <title>Vérification de la conformité de l'entrée FR-Profession-la-plus-longue </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.125"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_professionLaPlusLongue_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Profession-la-plus-longue (1.2.250.1.213.1.1.3.125), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Profession-la-plus-longue " -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.125'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.24.20']">
            
            [E_professionLaPlusLongue_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Profession-la-plus-longue " doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.24.20"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.125" 
        </assert>
        
        <!-- Test présence de l'élément 'id' -->
        <assert test='count(cda:id)&gt;=1'>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une ou plusieurs fois.
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1 and cda:code/@code="21843-8" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='21843-8' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode[@code='completed']"> 
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. 
        </assert>
        <!-- Test présence de l'élément 'effectiveTime' -->
        <assert test='count(cda:effectiveTime)=1'>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "effectiveTime" doit être présent une fois [1..1].
        </assert>
        
        <assert test='cda:effectiveTime/cda:low'>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "effectiveTime" doit contenir l'élément "low"[1..1].
        </assert>
        <!-- Test présence de l'élément 'value' -->
        <assert test='count(cda:value)=1'>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent une fois [1..1].
        </assert>
    </rule>
        <!-- Test présence de l'élément 'author' -->
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.125']/cda:author">
        <assert test='count(cda:author)&gt;=1'>
            [E_professionLaPlusLongue_fr] : Erreur de conformité CI-SIS : L'élément "author" est présent une ou plusieurs fois.
        </assert>
    </rule>
    
</pattern>
