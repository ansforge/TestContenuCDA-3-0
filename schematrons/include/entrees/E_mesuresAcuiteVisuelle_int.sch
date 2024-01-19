<?xml version="1.0" encoding="UTF-8"?>

<!--                 
   E_mesuresAcuiteVisuelle_int
   Teste la conformité de l'entrée FR-Liste-des-mesures-acuite-visuelle aux spécifications IHE EYE CARE GEE.
   
   27/05/2021 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_mesuresAcuiteVisuelle_int">
    <title>Vérification de la conformité de l'entrée FR-Liste-des-mesures-acuite-visuelle</title>
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.12.1.3.2']">
                
        <assert test="self::cda:organizer[@classCode='CLUSTER' and @moodCode='EVN']">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) :
            L'élément "organizer" doit contenir les attributs @classCode="CLUSTER" et @moodCode="EVN".
        </assert>
        
        <!-- Verifier que le templateId parent de l'observation est présent. -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.12.1.3.2']">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) :
            L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenir l'élément "templateId" avec l'attribut @root fixé à "1.3.6.1.4.1.19376.1.12.1.3.2".
        </assert>
        
        <!-- Verifier que l'élément id est présent. -->        
        <assert test="count(cda:id)=1">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) :
            L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenur un élement "id" [1..1].
        </assert>
        
        <assert
            test="cda:code[@code = '28631-0' and @codeSystem = '2.16.840.1.113883.6.1']">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) : L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenir l'élément "code" 
            avec les attributs @code="28631-0" et @codeSystem="2.16.840.1.113883.6.1".
        </assert>
        
        <assert
            test="cda:code/cda:qualifier[cda:name/@code='MED-1049' and cda:name/@codeSystem='1.2.250.1.213.1.1.4.322'][cda:value/@code='MED-1048' and cda:value/@codeSystem='1.2.250.1.213.1.1.4.322']">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) : L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenir l'élément "qualifier" dans l'élément "code" (pour préciser l'acuité visuelle observée)
            ayant comme sous éléments :
            - "name" avec les attributs @code="MED-1049" et @codeSystem="1.2.250.1.213.1.1.4.322"
            - "value" avec les attributs @code="MED-1048" et @codeSystem="1.2.250.1.213.1.1.4.322".
        </assert>
        
        <assert
            test="cda:code/cda:qualifier[cda:name/@code='MED-1054' and cda:name/@codeSystem='1.2.250.1.213.1.1.4.322'][cda:value/@nullFlavor='NA']">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) : L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenir l'élément "qualifier" dans l'élément "code"  (pour préciser la distance de mesure de l'acuité visuelle)
            ayant comme sous éléments :
            - "name" avec les attributs @code="MED-1054" et @codeSystem="1.2.250.1.213.1.1.4.322"
            - "value" fixé à nullFlavor="NA".
        </assert>
        
        <assert test="cda:statusCode[@code = 'completed']">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) :
            L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenir l'élément "statusCode" avec l'attribut @code fixé à 'completed'.
        </assert>
        
        <assert test="cda:effectiveTime[@value]">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) :
            L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenir un élément "effectiveTime" avec l'attribut @value.
        </assert>
               
        <assert test="count(.//cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.12.1.3.6'])&gt;=1">
            [E_mesuresAcuiteVisuelle_int] Erreur de conformité IHE EYE CARE (GEE) :
            L'entrée FR-Liste-des-mesures-acuite-visuelle doit contenir au minimum une entrée FR-Mesure-acuite-visuelle (1.3.6.1.4.1.19376.1.12.1.3.6).
        </assert>
                
    </rule>    
</pattern>

