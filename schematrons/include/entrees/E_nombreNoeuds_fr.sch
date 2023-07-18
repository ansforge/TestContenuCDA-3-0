<?xml version="1.0" encoding="UTF-8"?>
<!--  E_nombreNoeuds_fr.sch
    
      Vérification de la conformité de l'entrée FR-TNM-nombre-noeuds (1.2.250.1.213.1.1.3.159)
    
    Historique : 
   06/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_nombreNoeuds_fr">
    <title>Vérification de la conformité de l'entrée FR-TNM-nombre-noeuds (1.2.250.1.213.1.1.3.159)</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.159"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.159' and cda:templateId/@root='1.3.6.1.4.1.19376.1.3.10.9.37'">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.159’) et ('1.3.6.1.4.1.19376.1.3.10.9.37')
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='21893-3'">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-TNM-nombre-noeuds" doit comporter un élément 'code'(cardinalité [1..1]) ayant comme attribut @code='21893-3'
        </assert>            
        <assert test="not(cda:code/cda:qualifier) or (cda:code/cda:qualifier and cda:code/cda:qualifier/cda:name/@code='85342-4')">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, si l'élément code/qualifier/name existe, il est fixé à la valeur @code='85342-4'
        </assert>
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, le statusCode est fixé à la valeur @code='completed' ou  @code='aborted'
        </assert>
        <assert test="count(cda:text)&lt;=1">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, un élément text doit être présent maximum une fois [0..1] 
        </assert>
        <assert test="cda:effectiveTime">
            [E_TNM-T_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-T, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, un élément value doit être présent 
        </assert>
        <assert test="count(cda:specimen[@typeCode='SPC'])&gt;=1">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, une ou plusieurs entrée FR-Echantillon-identifiant(1.2.250.1.213.1.1.3.104) doit être présente (s). 
        </assert>
        <assert test="cda:specimen[@typeCode='SPC']/cda:specimenRole[@classCode='SPEC']/cda:id">
            [E_nombreNoeuds_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-TNM-nombre-noeuds, un élément specimenRole/id doit être présent 
        </assert>
    </rule>
    
</pattern>