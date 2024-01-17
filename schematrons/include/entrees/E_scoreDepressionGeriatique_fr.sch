<?xml version="1.0" encoding="UTF-8"?>
<!--  E_scoreDepressionGeriatique_fr.sch
    
      Vérification de la conformité de l'entrée FR-Score-Depression-Geriatrique (1.2.250.1.213.1.1.3.110) 
    
    Historique : 
   04/07/2023 : ANS :  Création
   11/01/2024 : MAJ du schematron
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_scoreDepressionGeriatique_fr">
    <title>Vérification de la conformité de l'entrée FR-Score-Depression-Geriatrique (1.2.250.1.213.1.1.3.110) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.110"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.4'">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Depression-Geriatrique, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.1.12.3.4’)
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='48544-1'">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Score-Depression-Geriatrique" doit comporter un élément 'code' avec les attributs :
            - @code="48544-1" (cardinalité [1..1])
            - @codeSystem="2.16.840.1.113883.6.1" (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:text">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, un élément text doit être présent 
        </assert>
        <assert test="cda:text/cda:reference">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, un élément "text/reference" doit être présent 
        </assert>
        
        <assert test="cda:statusCode/@code='completed'">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        
        <assert test="cda:effectiveTime">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, l'effectiveTime doit être présent.
        </assert>
        
        <assert test="cda:value">
            [E_scoreDepressionGeriatique_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Depression-Geriatrique, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>