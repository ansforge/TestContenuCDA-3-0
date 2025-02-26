<?xml version="1.0" encoding="UTF-8"?>
<!--  E_evenementIndesirablePendantHospitalisation_ANS.sch
    
      Vérification de la conformité de l'entrée FR-Evenement-indesirable-pendant-hospitalisation (1.2.250.1.213.1.1.3.48.3) créée par l'ANS
    
    Historique : 
   03/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_evenementIndesirablePendantHospitalisation_ANS">
    <title>Vérification de la conformité de l'entrée FR-Evenement-indesirable-pendant-hospitalisation (1.2.250.1.213.1.1.3.48.3) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.3"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, il doit y avoir le template Id de la simple observation (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.48'">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, Il doit y avoir le templateId/@root='1.2.250.1.213.1.1.3.48'
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.48.3'">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, Il doit y avoir le templateId/@root='1.2.250.1.213.1.1.3.48.3'
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='MED-143'][@codeSystem='1.2.250.1.213.1.1.4.322'])=1)">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Evenement-indesirable-pendant-hospitalisation" doit comporter un élément 'code' avec les attributs :
            - @code="MED-143" (cardinalité [1..1])
            - @codeSystem="1.2.250.1.213.1.1.4.322" (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed'">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:effectiveTime">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, un élément effectiveTime doit être présent 
        </assert>
        <assert test="count(cda:value)=1">
            [E_evenementIndesirablePendantHospitalisation_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Evenement-indesirable-pendant-hospitalisation, il doit y avoir un élément value (cardinalité [1..1])
        </assert>
    </rule>
    
</pattern>