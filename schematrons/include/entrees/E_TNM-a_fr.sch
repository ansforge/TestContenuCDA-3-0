<?xml version="1.0" encoding="UTF-8"?>
<!--  E_TNM-a_fr.sch
    
      Vérification de la conformité de l'entrée FR-TNM-a (1.2.250.1.213.1.1.3.136)
    
    Historique : 
   06/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TNM-a_fr">
    <title>Vérification de la conformité de l'entrée FR-TNM-a (1.2.250.1.213.1.1.3.136) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.136"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.136' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.30'">
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.136’) et ('1.3.6.1.4.1.19376.1.3.10.9.30')
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='85699-7'">
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-a" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='85699-7'
        </assert>            
        
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:effectiveTime">
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_TNM-a_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-a, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>