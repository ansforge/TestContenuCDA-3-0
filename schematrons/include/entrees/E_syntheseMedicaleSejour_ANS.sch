<?xml version="1.0" encoding="UTF-8"?>
<!--  E_syntheseMedicaleSejour_ANS.sch
    
      Vérification de la conformité de l'entrée FR-Synthese-medicale-sejour (1.2.250.1.213.1.1.3.48.9) créée par l'ANS
    
    Historique : 
   04/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_syntheseMedicaleSejour_ANS">
    <title>Vérification de la conformité de l'entrée FR-Synthese-medicale-sejour (1.2.250.1.213.1.1.3.48.9) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.9"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Synthese-medicale-sejour, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Synthese-medicale-sejour, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Synthese-medicale-sejour, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='MED-142'][@codeSystem='1.2.250.1.213.1.1.4.322'])=1 and cda:code/@code='MED-142' and cda:code/@codeSystem='1.2.250.1.213.1.1.4.322')">
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Synthese-medicale-sejour" doit comporter un élément 'code' avec les attributs :
            - @code="MED-142" (cardinalité [1..1])
            - @codeSystem="1.2.250.1.213.1.1.4.322" (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed'">
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Synthese-medicale-sejour, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Synthese-medicale-sejour, un élément text doit être présent 
        </assert>
        <assert test="cda:effectiveTime">
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Synthese-medicale-sejour, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_syntheseMedicaleSejour_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Synthese-medicale-sejour, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>