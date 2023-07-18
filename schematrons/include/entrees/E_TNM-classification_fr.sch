<?xml version="1.0" encoding="UTF-8"?>
<!--  E_TNM-classification_fr.sch
    
      Vérification de la conformité de l'entrée FR-TNM-classification (1.2.250.1.213.1.1.3.145)
    
    Historique : 
   06/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TNM-classification_fr">
    <title>Vérification de la conformité de l'entrée FR-TNM-classification (1.2.250.1.213.1.1.3.145)</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.145"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.145' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.28'">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.145’) et ('1.3.6.1.4.1.19376.1.3.10.9.28')
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='59541-3'">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-classification" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='59541-3'
        </assert>            
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:value">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, un élément value doit être présent 
        </assert>
        <assert test="count(cda:specimen[@typeCode='SPC'])&gt;=1">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </assert>
        <assert test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id">
            [E_TNM-classification_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-classification, un élément specimenRole/id doit être présent 
        </assert>
    </rule>
    
</pattern>