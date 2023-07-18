<?xml version="1.0" encoding="UTF-8"?>
<!--  E_TNMy_fr.sch
    
      Vérification de la conformité de l'entrée FR-TNM-y (1.2.250.1.213.1.1.3.135)
    
    Historique : 
   05/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TNMy_fr">
    <title>Vérification de la conformité de l'entrée FR-TNM-y (1.2.250.1.213.1.1.3.135) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.135"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.135' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.32'">
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.135’) et ('1.3.6.1.4.1.19376.1.3.10.9.32')
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='277649004'">
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-y" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='277649004'
        </assert>            
        
        <assert test="not(cda:statusCode) or (cda:statusCode/@code='completed' or cda:statusCode/@code='aborted')">
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, si le statusCode est présent, il est fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:value">
            [E_TNMy_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-y, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>