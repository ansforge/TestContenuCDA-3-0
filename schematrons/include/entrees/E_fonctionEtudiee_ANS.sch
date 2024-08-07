<?xml version="1.0" encoding="UTF-8"?>
<!--  E_fonctionEtudiee_ANS.sch
    
      Vérification de la conformité de l'entrée FR-Fonction-etudiee (1.2.250.1.213.1.1.3.48.36) créée par l'ANS
    
    Historique : 
   03/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_fonctionEtudiee_ANS">
    <title>Vérification de la conformité de l'entrée FR-Fonction-etudiee (1.2.250.1.213.1.1.3.48.36) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.36"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, il doit y avoir le template Id de la simple observation (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="count(cda:templateId/@root='1.2.250.1.213.1.1.3.48')&lt;=1">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, Il peut y avoir le templateId/@root='1.2.250.1.213.1.1.3.48'
        </assert>
        <assert test="count(cda:templateId/@root='1.2.250.1.213.1.1.3.48.36')&lt;=1">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, Il peut y avoir le templateId/@root='1.2.250.1.213.1.1.3.48.36'
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='MED-1133'][@codeSystem='1.2.250.1.213.1.1.4.322'])=1)">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Fonction-etudiee" doit comporter un élément 'code' avec les attributs :
            - @code="MED-1133" (cardinalité [1..1])
            - @codeSystem="1.2.250.1.213.1.1.4.322" (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed'">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, un élément text doit être présent 
        </assert>
        <assert test="cda:text/cda:reference">
            [E_fonctionEtudiee_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Fonction-etudiee, un élément text/reference doit être présent 
        </assert>
    </rule>
    
</pattern>