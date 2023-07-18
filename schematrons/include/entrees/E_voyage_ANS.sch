<?xml version="1.0" encoding="UTF-8"?>
<!--  E_voyage_ANS.sch
    
      Vérification de la conformité de l'entrée FR-Voyage (1.2.250.1.213.1.1.3.174) créée par l'ANS
    
    Historique : 
   04/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_voyage_ANS">
    <title>Vérification de la conformité de l'entrée FR-Voyage (1.2.250.1.213.1.1.3.174) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.174"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Voyage, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Voyage, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.174'">
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Voyage, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.174’)
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='94651-7'][@codeSystem='2.16.840.1.113883.6.1'])=1 and cda:code/@code='94651-7' and cda:code/@codeSystem='2.16.840.1.113883.6.1')">
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Voyage" doit comporter un élément 'code' avec les attributs :
            - @code="94651-7" (cardinalité [1..1])
            - @codeSystem="2.16.840.1.113883.6.1" (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed'">
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Voyage, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Voyage, un élément text doit être présent 
        </assert>
        <assert test="cda:effectiveTime">
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Voyage, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_voyage_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Voyage, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>