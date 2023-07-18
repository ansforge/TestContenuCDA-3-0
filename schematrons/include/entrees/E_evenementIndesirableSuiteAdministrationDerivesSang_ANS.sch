<?xml version="1.0" encoding="UTF-8"?>
<!--  E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch
    
      Vérification de la conformité de l'entrée FR-Evenement-indesirable-suite-administration-derives-sang (1.2.250.1.213.1.1.3.48.4) créée par l'ANS
    
    Historique : 
   03/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_evenementIndesirableSuiteAdministrationDerivesSang_ANS">
    <title>Vérification de la conformité de l'entrée FR-Evenement-indesirable-suite-administration-derives-sang (1.2.250.1.213.1.1.3.48.4) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.4"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, il doit y avoir le template Id de la simple observation (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.48'">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, Il doit y avoir le templateId/@root='1.2.250.1.213.1.1.3.48'
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.48.4'">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, Il doit y avoir le templateId/@root='1.2.250.1.213.1.1.3.48.4'
        </assert>
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='MED-148'][@codeSystem='1.2.250.1.213.1.1.4.322'])=1)">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Evenement-indesirable-suite-administration-derives-sang" doit comporter un élément 'code' avec les attributs :
            - @code="MED-148" (cardinalité [1..1])
            - @codeSystem="1.2.250.1.213.1.1.4.322" (cardinalité [1..1])
        </assert> 
        <assert test="cda:statusCode/@code='completed'">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:effectiveTime">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, un élément effectiveTime doit être présent 
        </assert>
        <assert test="count(cda:value)=1">
            [E_evenementIndesirableSuiteAdministrationDerivesSang_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-suite-administration-derives-sang, il doit y avoir un élément value (cardinalité [1..1])
        </assert>
    </rule>
    
</pattern>