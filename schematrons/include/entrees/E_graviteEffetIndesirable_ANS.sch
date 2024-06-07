<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    [E_graviteEffetIndesirable_ANS]
   Teste la conformité de l'entrée FR-Gravite-effet-indesirable (1.2.250.1.213.1.1.3.212) en fonctionn de la conformité CI-SIS
   
   06/06/2024 : HTR : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_graviteEffetIndesirable_ANS">
    <title>FR-Gravite-effet-indesirable</title>
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.212']">
        <let name="count_templateId" value="count(cda:templateId)"/>
        
        <assert test='self::cda:observation[@classCode="OBS" and @moodCode]'>
            [E_graviteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Gravite-effet-indesirable doit contenir les attributs @classCode et @moodCode fixés respectivement aux valeurs 'OBS' et 'EVN'
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@code="94030-4" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_graviteEffetIndesirable_ANS] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='94030-4' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <assert test="cda:text">
            [E_graviteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Gravite-effet-indesirable doit contenir un élément "text"
        </assert>
        
        <assert test="cda:statusCode[@code='completed']">
            [E_graviteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Gravite-effet-indesirable doit contenir un élément "statusCode" avec l'attribut @code='completed'
        </assert>
        
        <assert test="cda:value">
            [E_graviteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Gravite-effet-indesirable doit contenir un élément "value"
        </assert>
        
    </rule>    
    
</pattern>

