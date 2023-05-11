<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_OBP-SCM.sch
    Teste la conformité de l'entete du volet OBP-SCM au CI-SIS
    
    Historique :
    07/02/2018 : ANS : Création
    03/11/2022 : ANS : Mise à jour suite à la migration
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_OBP-SCM">
    
    <rule context='cda:ClinicalDocument'>
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.4']"> 
            [Entete_OBP-SCM] Le template "Synthèse Suites de Couches Mère (SCM)" (1.2.250.1.213.1.1.1.12.4) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='15508-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_OBP-SCM] L'élément code doit avoir @code ="15508-5" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
        <assert test="cda:participant">
            [Entete_OBP-SCM] Le médecin traitant est un élément obligatoire du modèle OBP-SCM
        </assert>
        
        <assert test="cda:participant[@typeCode='INF'] or cda:participant[@typeCode='CON']">
            [Entete_OBP-SCM] L'attribut typeCode de l'élément participant prend la valeur typeCode='INF' s'il s'agit du médecin traitant et typeCode='CON' s'il s'agit d'un correspondant.
        </assert>
        <assert test="cda:participant/cda:associatedEntity/cda:telecom">
            [Entete_OBP-SCM] L'adresse de télécomunication telecom est obligatoire et a une cardinalité [1..*]
        </assert>
        
    </rule>
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
        
        <assert test="cda:code[@code='63893-2']">
            [Entete_OBP-SCM] L'attribut code de documentationOf/serviceEvent/Code est fixé à '63893-2' pour le SCM
        </assert>
        
    </rule>
    
    
</pattern>