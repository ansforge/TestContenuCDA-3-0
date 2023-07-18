<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_observationTNM_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-ObservationTNM (1.2.250.1.213.1.1.3.134)
    aux spécifications du CI-SIS
    
    Historique :
    05/07/2023 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_observationTNM_fr">
    <title>Vérification de la conformité de l'entrée FR-ObservationTNM  </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.134"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_observationTNM_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-ObservationTNM(1.2.250.1.213.1.1.3.134), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-ObservationTNM" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.134']and cda:templateId[@root='1.3.6.1.4.1.19376.1.3.10.4.2']">
            
            [1] [E_observationTNM_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-ObservationTNM" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.3.10.4.2"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.134"
        </assert>
        <!-- Test présence de l'élément 'code' -->        
        <assert test='count(cda:code)=1 and cda:code/@code="21902-2" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_observationTNM_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='21902-2' et le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        <!-- Test présence de l'élément 'statusCode' --> 
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'"> 
            [E_observationTNM_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" est fixé à la valeur code='completed' or code='aborted' </assert>
        <!-- Test présence de l'élément 'effectiveTime' --> 
        <assert test='count(cda:effectiveTime)=1'>
            [E_observationTNM_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </assert>
        <!-- Vérifier la présence de l'élément specimen et la cohérence de ses attributs --> 
        <assert test="count(cda:specimen)&gt;=1">
            [E_observationTNM_fr] Erreur de Conformité CI-SIS :  L'élément "specimen" doit être présent une ou plusieurs fois.
        </assert> 
        <assert test="cda:specimen/cda:specimenRole">
            [E_observationTNM_fr] Erreur de Conformité CI-SIS : L'élément specimen doit contenir l'élément specimenRole
        </assert>
        <assert test="cda:specimenRole/@classCode='SPEC'">
            [E_observationTNM_fr]Erreur de Conformité CI-SIS : L'élément specimenRole doit contenir l'attribut @classCode 'SPEC'
        </assert>
        <assert test="cda:specimenRole/cda:id">
            [E_observationTNM_fr] Erreur de Conformité CI-SIS : L'élément specimenRole doit contenir l'élément id
        </assert>
        
        <assert test="cda:entryRelationship[@classCode='OBS' and @moodCode='EVN']/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.28']/cda:code[@code='59541-3']">
            [E_observationTNM_fr] Erreur de conformité CI-SIS : L'entrée ' FR-TNM-classification' doit être présente, les attributs @classCode et @moodCode doivent avoir les valeurs suivantes 'OBS' et 'EVN'.
            L'élément code de l'entrée 'FR-TNM-classification' est obligatoire [1..1] et doit avoir comme attribut @code='59541-3'.
        </assert>
    </rule>
    
</pattern>
