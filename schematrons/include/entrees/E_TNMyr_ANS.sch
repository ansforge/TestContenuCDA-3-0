<?xml version="1.0" encoding="UTF-8"?>
<!--  E_TNMyr_ANS.sch
    
      Vérification de la conformité de l'entrée FR-TNM-yr (1.2.250.1.213.1.1.3.162)
    
    Historique : 
   05/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TNMyr_ANS">
    <title>Vérification de la conformité de l'entrée FR-TNM-yr (1.2.250.1.213.1.1.3.162) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.162"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_TNMyr_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-yr, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.162'">
            [E_TNMyr_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-yr, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.162’)
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_TNMyr_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-yr" doit comporter un élément 'code' (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_TNMyr_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-yr, le statusCode doit présent et fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_TNMyr_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-yr, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:value">
            [E_TNMyr_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-yr, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>