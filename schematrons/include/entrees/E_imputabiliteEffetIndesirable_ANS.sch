<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    [E_imputabiliteEffetIndesirable_ANS]
   Teste la conformité de l'entrée FR-Imputabilite-effet-indesirable (1.2.250.1.213.1.1.3.211) en fonctionn de la conformité CI-SIS
   
   06/06/2024 : HTR : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_imputabiliteEffetIndesirable_ANS">
    <title>FR-Imputabilite-effet-indesirable</title>
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.211']">
        <let name="count_templateId" value="count(cda:templateId)"/>
        
        <assert test='self::cda:observation[@classCode="OBS" and @moodCode]'>
            [E_imputabiliteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Imputabilite-effet-indesirable doit contenir les attributs @classCode et @moodCode fixés respectivement aux valeurs 'OBS' et 'EVN'
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@code="GEN-318" and cda:code/@codeSystem="1.2.250.1.213.1.1.4.322"'>
            [E_imputabiliteEffetIndesirable_ANS] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='GEN-318' et
            le codeSystem='1.2.250.1.213.1.1.4.322'.
        </assert>
        
        <assert test="cda:text">
            [E_imputabiliteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Imputabilite-effet-indesirable doit contenir un élément "text"
        </assert>
        
        <assert test="cda:statusCode[@code='completed']">
            [E_imputabiliteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Imputabilite-effet-indesirable doit contenir un élément "statusCode" avec l'attribut @code='completed'
        </assert>
        
        <assert test="cda:value">
            [E_imputabiliteEffetIndesirable_ANS] Erreur de Conformité CI-SIS : l'entrée FR-Imputabilite-effet-indesirable doit contenir un élément "value"
        </assert>
        
    </rule>    
    
</pattern>

