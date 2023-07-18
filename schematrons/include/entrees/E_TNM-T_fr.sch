<?xml version="1.0" encoding="UTF-8"?>
<!--  E_TNM-T_fr.sch
    
      Vérification de la conformité de l'entrée FR-TNM-T (1.2.250.1.213.1.1.3.138)
    
    Historique : 
   05/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TNM-T_fr">
    <title>Vérification de la conformité de l'entrée FR-TNM-T (1.2.250.1.213.1.1.3.138) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.138"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.138' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.25'">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.138’) et ('1.3.6.1.4.1.19376.1.3.10.9.25')
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='21899-0'">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-T" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='21899-0'
        </assert>            
        
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:effectiveTime">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>