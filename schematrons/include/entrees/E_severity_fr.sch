<?xml version="1.0" encoding="UTF-8"?>

<!-- E_severity_fr.sch
    
    Teste la conformité de l'entrée FR-Severite (1.2.250.1.213.1.1.3.29) aux spécifications du CI-SIS 
    
    Historique :
    27/06/2017 : Création
    01/12/2020 : Renommé
    02/01/2024 : MAJ du schematron
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_severity_fr">

    <title>CI-SIS Severity</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.29"]'>
        
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.1'">
            [E_severity_fr] Erreur de conformité IHE : Dans l'entrée FR-Severite, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.1’)
        </assert>
        
        <assert test="cda:templateId/@root='2.16.840.1.113883.10.20.1.55'">
            [E_severity_fr] Erreur de conformité IHE : Dans l'entrée FR-Severite, il doit y avoir le templateId  (’2.16.840.1.113883.10.20.1.55’)
        </assert>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_severity_int] Erreur de conformité PCC : Dans l'entrée "FR-Severite", le format de base utilisé pour 
            représenter un problème utilise l'élément CDA 'observation' d'attribut classCode='OBS' pour
            signifier qu'il s'agit l'observation d'un problème, et moodCode='EVN', pour exprimer 
            que l'événement a déjà eu lieu.
            
        </assert>
          <assert test='cda:code[@code="SEV"]'>
            [E_severity_fr] Erreur de Conformité CI-SIS: L'élément 'code' de l'entrée 'severity' indique la 
            sévérité de l'allergie provoquée.
            L'attribut code de l'élément 'code' est fixé à 'SEV'.</assert>
        
        <assert test='cda:text'>
            [E_severity_fr] Erreur de Conformité CI-SIS: L'élément 'text' de l'entrée 'severity' est obligatoire. 
            </assert>
        
        <assert test='cda:statusCode'>
            [E_severity_fr] Erreur de Conformité CI-SIS: L'élément 'statusCode' de l'entrée 'severity' est obligatoire. 
        </assert>
        
        <assert test='cda:value'>
            [E_severity_fr] Erreur de Conformité CI-SIS: L'élément 'value' de l'entrée 'severity' est obligatoire. 
        </assert>
        
    </rule>
</pattern>
