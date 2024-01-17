<?xml version="1.0" encoding="UTF-8"?>
<!--  E_rechercheMicroOrganismes_fr.sch
    
      Vérification de la conformité de l'entrée FR-Recherche-de-micro-organismes (1.2.250.1.213.1.1.3.48.8) aux spécifications du CI-SIS
    Historique : 
   04/07/2023 : ANS :  Création
   12/01/2024 : MAJ du schematron 
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_rechercheMicroOrganismes_fr">
    <title>Vérification de la conformité de l'entrée FR-Recherche-de-micro-organismes (1.2.250.1.213.1.1.3.48.8)</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.48.8"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Recherche-de-micro-organismes, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Recherche-de-micro-organismes, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.48'">
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Recherche-de-micro-organismes, il doit y avoir le templateId  (’1.2.250.1.213.1.1.3.48’)
        </assert>
        
        <assert test='count(cda:id)=1'>
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Recherche-de-micro-organismes, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        
        <assert test="(count(cda:code[@code='MED-309'][@codeSystem='1.2.250.1.213.1.1.4.322'])=1 and cda:code/@code='MED-309' and cda:code/@codeSystem='1.2.250.1.213.1.1.4.322')">
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Recherche-de-micro-organismes" doit comporter un élément 'code' avec les attributs :
            - @code="MED-309" (cardinalité [1..1])
            - @codeSystem="1.2.250.1.213.1.1.4.322" (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed'">
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Recherche-de-micro-organismes, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Recherche-de-micro-organismes, un élément text doit être présent 
        </assert>
        <assert test="cda:value">
            [E_rechercheMicroOrganismes_fr.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Recherche-de-micro-organismes, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>