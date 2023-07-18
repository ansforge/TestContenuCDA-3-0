<?xml version="1.0" encoding="UTF-8"?>
<!--  E_TNM-M_fr.sch
    
      Vérification de la conformité de l'entrée FR-TNM-M (1.2.250.1.213.1.1.3.140)
    
    Historique : 
   06/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TNM-M_fr">
    <title>Vérification de la conformité de l'entrée FR-TNM-M (1.2.250.1.213.1.1.3.140) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.140"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.140' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.27'">
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.140’) et ('1.3.6.1.4.1.19376.1.3.10.9.27')
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='21901-4'">
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-M" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='21901-4'
        </assert>            
        
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:effectiveTime">
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_TNM-M_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-M, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>