<?xml version="1.0" encoding="UTF-8"?>
<!-- [ E_directiveAnticipee_fr.sch ]
    
    Teste la conformité de l'entrée FR-Directive-anticipee (1.2.250.1.213.1.1.3.54)
    aux spécifications du CI-SIS
    
    Historique :
    30/06/2023 : ANS : Création
    05/03/2024 : ANS : remplacement du code SNOMED CT "Autre directive" par le code LOINC et ajout du code "Directives anticipées"
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_directiveAnticipee_fr">
    <title>CI-SIS directives anticipées</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.54"]'>
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.54']">            
            [E_directiveAnticipee_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Directive-anticipee" doit comporter le 'templateId' avec l'attribut @root="1.2.250.1.213.1.1.3.54"            
        </assert>
        
        <assert test='(not(cda:value) and cda:code/@code="75793-0") or (not(cda:value) and cda:code/@code="42348-3") or(cda:value/@xsi:type="BL" and cda:text/cda:reference)'>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : La valeur de la directive est un booléen (xsi:type="BL") qui permet d’indiquer l’autorisation ou la non autorisation, 
            sauf si l’élément "code" est @code="75793-0" [LOINC]("Autre directive") : dans ce cas, l'élément "value" n'est pas présent et la précision est fournie dans la partie narrative ("text/reference") 
            ou si l'élément "code" est @code="42348-3" [LOINC]("Directives anticipées") : dans ce cas, l'élément "value" n'est pas présent et un document encodé en B64 est encapsulé dans l'élément 'component/observationMedia'.
        </assert>
        
        <assert test='count(cda:entryRelationship/cda:observationMedia)&lt;=1'>
            [E_directiveAnticipee_fr] : Erreur de conformité CI-SIS : L'élément 'entryRelationship/observationMedia' ne peut être présent qu'une seule fois [0..1] et doit avoir les attributs @classCode="OBS" et @moodCode="EVN".
        </assert>        
        
    </rule>
    
</pattern>
