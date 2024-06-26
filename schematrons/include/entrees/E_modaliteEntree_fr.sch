<?xml version="1.0" encoding="UTF-8"?>
<!--  E_modaliteEntree_fr.sch
    
      Vérification de la conformité de l'entrée FR-Modalite-entree (1.2.250.1.213.1.1.3.48.6)
    
    Historique : 
   05/07/2023 : ANS :  Création
   12/01/2024 : MAJ du schematron
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_modaliteEntree_fr">
    <title>Vérification de la conformité de l'entrée FR-Modalite-entree (1.2.250.1.213.1.1.3.48.6) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.6"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-entree, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Modalite-entree" -->
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.48'">
            [E_modaliteSortie_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-sortie, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.48’)
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-entree, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        
        <!-- Test présence et format de l'élément 'id' -->
        <assert test='count(cda:id)=1'>
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-entree, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='ORG-070'">
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Modalite-entree" doit comporter un élément 'code' ayant comme attribut @code='ORG-070' (cardinalité [1..1])
        </assert>            
        <!-- Test présence et format de l'élément 'statusCode' -->
        <assert test="cda:statusCode/@code='completed'">
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-entree, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <!-- Test présence et format de l'élément 'text' -->
        <assert test="cda:text">
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-entree, un élément text doit être présent 
        </assert>
        <!-- Test présence et format de l'élément 'effectiveTime' -->
        <assert test="cda:effectiveTime">
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-entree, un élément effectiveTime doit être présent 
        </assert>
        <!-- Test présence et format de l'élément 'value' -->
        <assert test="cda:value">
            [E_modaliteEntree_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Modalite-entree, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>