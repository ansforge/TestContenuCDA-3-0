<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_OBP-SEM.sch
    Teste la conformité de l'entete du document OBP-SEM au CI-SIS
    
    Historique :
    30/11/2023 : Création    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_OBP-SEM">
    
    <rule context='cda:ClinicalDocument'>
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.5']"> 
            [Entete_OBP-SEM] Le template du modèle OBP-SEM (1.2.250.1.213.1.1.1.12.5) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='78489-2' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_OBP-SEM] L'élément code doit avoir @code ="78489-2" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
        
        <assert test="cda:participant">
            [Entete_OBP-SEM] Le médecin traitant est un élément obligatoire des modèles OBP
        </assert>
        
        <assert test="cda:participant[@typeCode='INF'] or cda:participant[@typeCode='CON']">
            [Entete_OBP-SEM] L'attribut typeCode de l'élément participant prend la valeur typeCode='INF' s'il s'agit du médecin traitant et typeCode='CON' s'il s'agit d'un correspondant.
        </assert>
        <assert test="cda:participant/cda:associatedEntity/cda:telecom">
            [Entete_OBP-SEM] L'adresse de télécomunication telecom est obligatoire et a une cardinalité [1..*]
        </assert>        
    </rule>
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
        <assert test="cda:code[@code='MED-1176']">
            [Entete_OBP-SEM] L'attribut code de documentationOf/serviceEvent/Code est fixé à 'MED-1176' pour le document OBP-SEM
        </assert>
        
    </rule>
    
    
</pattern>