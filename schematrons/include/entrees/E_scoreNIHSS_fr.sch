<?xml version="1.0" encoding="UTF-8"?>
<!--  E_scoreNIHSS_fr.sch
    
      Vérification de la conformité de l'entrée FR-Score-NIHSS (1.2.250.1.213.1.1.3.6)
    
    Historique : 
   03/01/2024 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_scoreNIHSS_fr">
    <title>Vérification de la conformité de l'entrée FR-Score-NIHSS (1.2.250.1.213.1.1.3.6) </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.6"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_scoreNIHSS_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-NIHSS, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Score-NIHSS, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </assert>
        <assert test='count(cda:id)=1'>
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='72089-6'][@codeSystem='2.16.840.1.113883.6.1'])=1 and cda:code/@code='72089-6' and cda:code/@codeSystem='2.16.840.1.113883.6.1')">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Score-NIHSS" doit comporter un élément 'code' avec les attributs :
            - @code="72089-6" (cardinalité [1..1])
            - @codeSystem="2.16.840.1.113883.6.1" (cardinalité [1..1])
        </assert>           
        <assert test="cda:statusCode/@code='completed'">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, un élément text doit être présent 
        </assert>
        <assert test="cda:text/cda:reference">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, un élément text/reference doit être présent 
        </assert>
        <assert test="cda:effectiveTime">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, un élément value doit être présent 
        </assert>
        <assert test="not(cda:entryRelationship[cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.8']]) or (cda:entryRelationship/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.8'])">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-NIHSS, si l'entryRelationship FR-Composant-score-NIHSS existe, elle doit avoir le templateId '1.2.250.1.213.1.1.3.8'.
        </assert>
    </rule>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.8"]'>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_scoreNIHSS_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Composant-score-NIHSS, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Composant-score-NIHSS, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </assert>
        <assert test='count(cda:id)=1'>
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test='count(cda:code)=1'>
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, il doit y avoir un élément code (cardinalité [1..1])
        </assert>
        <assert test="cda:statusCode/@code='completed'">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, un élément text doit être présent 
        </assert>
        <assert test="cda:text/cda:reference">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, un élément text/reference doit être présent 
        </assert>
        <assert test="cda:effectiveTime">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, un élément value doit être présent 
        </assert>
        <assert test="count(cda:interpretationCode)&lt;2">
            [E_scoreNIHSS_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Composant-score-NIHSS, un élément interpretationCode peut être présent maximum une fois (cardinalité [0..1]).
        </assert>
    </rule>
    
</pattern>