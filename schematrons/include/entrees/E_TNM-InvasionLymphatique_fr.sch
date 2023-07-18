<?xml version="1.0" encoding="UTF-8"?>
<!--  E_TNM-InvasionLymphatique_fr.sch
    
      Vérification de la conformité de l'entrée FR-TNM-Invasion-lymphatique (1.2.250.1.213.1.1.3.142)
    
    Historique : 
   06/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TNM-InvasionLymphatique_fr">
    <title>Vérification de la conformité de l'entrée FR-TNM-Invasion-lymphatique (1.2.250.1.213.1.1.3.142)</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.142"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.142' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.34'">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.142’) et ('1.3.6.1.4.1.19376.1.3.10.9.34')
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='33739-4'">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-Invasion-lymphatique" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='33739-4'
        </assert>            
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:value">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, un élément value doit être présent 
        </assert>
        <assert test="count(cda:specimen[@typeCode='SPC'])&gt;=1">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </assert>
        <assert test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id">
            [E_TNM-InvasionLymphatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-Invasion-lymphatique, un élément specimenRole/id doit être présent 
        </assert>
    </rule>
    
</pattern>