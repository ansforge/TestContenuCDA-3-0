<?xml version="1.0" encoding="UTF-8"?>
<!--  E_scoreBradenComposant_fr.sch
    
      Vérification de la conformité de l'entrée FR-Score-Braden-Composant (1.2.250.1.213.1.1.3.111)
    
    Historique : 
   04/07/2023 : ANS :  Création
   11/01/2024 : MAJ du schematron
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_scoreBradenComposant_fr">
    <title>Vérification de la conformité de l'entrée FR-Score-Braden-Composant (1.2.250.1.213.1.1.3.111) </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.111"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.1.31'">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CCD : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.31’)
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.3'">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité IHE : Dans l'entrée FR-Score-Braden-Composant, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.1.12.3.3’)
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Score-Braden-Composant" doit comporter un élément 'code' (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed'">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, "le statusCode" doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, un élément "text" doit être présent 
        </assert>
        <assert test="cda:text/cda:reference">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, l'élément "text/reference" doit être présent. 
        </assert>
        <assert test="cda:effectiveTime">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, un élément "effectiveTime" doit être présent 
        </assert>
        <assert test="cda:value">
            [E_scoreBradenComposant_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Score-Braden-Composant, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>