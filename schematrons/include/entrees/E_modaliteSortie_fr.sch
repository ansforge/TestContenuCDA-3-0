<?xml version="1.0" encoding="UTF-8"?>
<!--  E_modaliteSortie_fr.sch
    
      Vérification de la conformité de l'entrée FR-Modalite-sortie (1.2.250.1.213.1.1.3.48.7)
    
    Historique : 
   05/07/2023 : ANS :  Création
   12/01/2024 : MAJ du schematron
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_modaliteSortie_fr">
    <title>Vérification de la conformité de l'entrée FR-Modalite-sortie (1.2.250.1.213.1.1.3.48.7) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.7"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
       
        <!-- Test des templateId pour l'entrée "FR-Modalite-sortie" -->
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.48'">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.48’)
        </assert>
        
        <!-- Test présence et format de l'élément 'id' -->
        <assert test='count(cda:id)=1'>
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='ORG-074'">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Modalite-sortie" doit comporter un élément 'code' ayant comme attribut @code='ORG-074' (cardinalité [1..1])
        </assert>            
        <!-- Test présence et format de l'élément 'statusCode' -->
        <assert test="cda:statusCode/@code='completed'">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <!-- Test présence et format de l'élément 'text' -->
        <assert test="cda:text">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, un élément text doit être présent 
        </assert>
        <!-- Test présence et format de l'élément 'effectiveTime' -->
        <assert test="cda:effectiveTime">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, un élément effectiveTime doit être présent 
        </assert>
        <!-- Test présence et format de l'élément 'value' -->
        <assert test="cda:value">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>